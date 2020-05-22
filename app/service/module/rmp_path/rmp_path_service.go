// ==========================================================================
// 云捷GO自动生成业务逻辑层相关代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-13 11:25:57
// 生成路径: app/service/module/rmp_path/rmp_path_service.go
// 生成人：yunjie
// ==========================================================================
package rmp_path

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"strings"
	"yj-app/app/model"
	rmp_pathModel "yj-app/app/model/module/rmp_path"
	userService "yj-app/app/service/system/user"
	"yj-app/app/utils/convert"
	"yj-app/app/utils/excel"
	"yj-app/app/utils/page"
)

const rootId int64 = 100000

func checkParentIsAllEnable(parentId int64)(isOk bool, parentAncestors string ,err error){
	parentAncestors = ""
	pPath, err:= rmp_pathModel.FindOne("path_id=?",parentId);
	if err == nil && pPath != nil {
		parentAncestors = pPath.Ancestors + "," + gconv.String(pPath.PathId)
		if pPath.Status != "0" {
			return false,"",err
		} else {

			return true,parentAncestors,nil
		}
		count, err1:= rmp_pathModel.FindCount("ancestors like ? and del_flag = '2'", "%"+gconv.String(pPath.Ancestors)+"%")
		if err1 != nil || count > 0{
			return false,parentAncestors, err1
		} else {
			return true,parentAncestors, nil
		}
	} else {
		return false,parentAncestors,err
	}
}

func checkPathIsChildren(pathId , parent_id int64 ) (bool, error){
	pEnt, err:= rmp_pathModel.FindOne("ancestors like ?  and path_id = ?", "%"+gconv.String(pathId)+"%", parent_id )
	if  err != nil && pEnt != nil{
		return true,nil
	}
	return false,err
}

func SelectPathById(pathId int64) *rmp_pathModel.EntityExtend {
	deptEntity, err := rmp_pathModel.SelectPathById(pathId)
	if err != nil {
		return nil
	}
	return deptEntity
}


//根据主键查询数据
func SelectRecordById(id int64) (*rmp_pathModel.Entity, error) {
	return rmp_pathModel.FindOne("path_id", id)
}

//根据主键删除数据
func DeleteRecordById(id int64) bool {
	result, err := rmp_pathModel.Delete("path_id", id)
	if err == nil {
		affected, _ := result.RowsAffected()
		if affected > 0 {
			return true
		}
	}

	return false
}

//批量删除数据记录
func DeleteRecordByIds(ids string) int64 {
	idarr := convert.ToInt64Array(ids, ",")
	result, err := rmp_pathModel.Delete("path_id in (?)", idarr)
	if err != nil {
		return 0
	}

	nums, _ := result.RowsAffected()

	return nums
}

//添加数据
func AddSave(req *rmp_pathModel.AddReq, session *ghttp.Session) (int64, error) {
	var entity rmp_pathModel.Entity
	acc := "0"
	if req.ParentId != 0 {
		isOK,acc1, err:=checkParentIsAllEnable(req.ParentId)
		if err != nil || acc =="" || isOK != true{
			return 0, gerror.New("父级不能为空或禁用")
		}
		acc = acc1
	}

	pexist, err:= rmp_pathModel.CheckPathNameUnique(req.PathName,0, req.ParentId)
	if  err != nil || pexist != nil{
		return 0, gerror.New("父级名称与其他名称重复")
	}
	entity.PathName = req.PathName
	entity.ParentId = req.ParentId  
	entity.Ancestors = acc
	entity.Status = req.Status            
	entity.Remark = req.Remark 
	entity.CreateTime = gtime.Now()
	entity.CreateBy = ""

	user := userService.GetProfile(session)

	if user != nil {
		entity.CreateBy = user.LoginName
	}

	result, err := entity.OmitEmpty().Insert()
	if err != nil {
		return 0, err
	}

	id, err := result.LastInsertId()

	if err != nil || id <= 0 {
		return 0, err
	}
	return id, nil
}

//修改数据
func EditSave(req *rmp_pathModel.EditReq, session *ghttp.Session) (int64, error) {

	entity, err := rmp_pathModel.FindOne("path_id=?", req.PathId)

	if err != nil {
		return 0, err
	}

	if entity == nil {
		return 0, gerror.New("数据不存在")
	}

	if  entity.ParentId != req.ParentId{
		isChild, _ := checkPathIsChildren(entity.ParentId,req.ParentId)
		if  isChild {
			return 0, gerror.New("不能选择子目录作为父级")
		}
	}

	entity.PathName = req.PathName  
	entity.ParentId = req.ParentId  
	entity.Ancestors = req.Ancestors  
	entity.Status = req.Status            
	entity.Remark = req.Remark 
	entity.UpdateTime = gtime.Now()
	entity.UpdateBy = ""

	user := userService.GetProfile(session)

	if user == nil {
		entity.UpdateBy = user.LoginName
	}
	result, err := entity.Update()
	if err != nil {
		return 0, err
	}

	rs, err := result.RowsAffected()

	if err != nil {
		return 0, err
	}

	return rs, nil
}

//加载文件夹树列表
func SelectPathTree(parentId int64, PathName, status string) (*[]model.Ztree, error) {
	list, err := rmp_pathModel.SelectPathList(parentId, PathName, status)
	if err != nil {
		return nil, err
	}
	return InitZtree(list, nil), nil
}

//初始化树形结构
func InitZtree(deptList []rmp_pathModel.Entity, roleDeptList *[]string) *[]model.Ztree {
	var result []model.Ztree
	isCheck := false
	if roleDeptList != nil && len(*roleDeptList) > 0 {
		isCheck = true
	}

	for i := range deptList {
		if deptList[i].Status == "0" {
			var ztree model.Ztree
			ztree.Id = deptList[i].PathId
			ztree.Pid = deptList[i].ParentId
			ztree.Name = deptList[i].PathName
			ztree.Title = deptList[i].PathName
			if isCheck {
				tmp := gconv.String(deptList[i].PathId) + deptList[i].PathName
				tmpcheck := false
				for j := range *roleDeptList {
					if strings.Compare((*roleDeptList)[j], tmp) == 0 {
						tmpcheck = true
						break
					}
				}
				ztree.Checked = tmpcheck
			}
			result = append(result, ztree)
		}
	}
	return &result
}

//根据条件查询数据
func SelectListAll(params *rmp_pathModel.SelectPageReq) ([]rmp_pathModel.Entity, error) {
	return rmp_pathModel.SelectListAll(params)
}

//根据条件分页查询数据
func SelectListByPage(params *rmp_pathModel.SelectPageReq) ([]rmp_pathModel.Entity, *page.Paging, error) {
	return rmp_pathModel.SelectListByPage(params)
}

// 导出excel
func Export(param *rmp_pathModel.SelectPageReq) (string, error) {
	result, err := rmp_pathModel.SelectListExport(param)
	if err != nil {
		return "", err
	}

	head := []string{  "路径id" ,"路径名称" ,"父级路径id" ,"祖级列表" ,"角色状态（0正常 1停用）" ,"删除标志（0代表存在 2代表删除）" ,"创建者" ,"创建时间" ,"更新者" ,"更新时间" ,"备注"}
	key := []string{  "path_id" ,"path_name" ,"parent_id" ,"ancestors" ,"status" ,"del_flag" ,"create_by" ,"create_time" ,"update_by" ,"update_time" ,"remark"}
	url, err := excel.DownlaodExcel(head,key, result)

	if err != nil {
		return "", err
	}

	return url, nil
}

func DeletePathById(pathId int64)(int64, error){
	if pathId == rootId {
		return -1, gerror.New("根目录不能被删除")
	}

	tx, err := g.DB().Begin()
	if err == nil {
		rs, err:= rmp_pathModel.Update("del_flag = '2'","find_in_set(?, ancestors)",pathId)
		if err != nil {
			tx.Rollback()
			return 0,gerror.New("删除操作失败")
		}
		rows, _ := rs.RowsAffected()
		if rows == 0 {
			tx.Rollback()
			return 0,gerror.New("删除操作成功")
		}

		rs, err =rmp_pathModel.Update("del_flag = '2'","path_id=?",pathId)
		if err != nil {
			tx.Rollback()
			return 0,gerror.New("删除操作失败")
		}
		if rows == 0 {
			tx.Rollback()
			return 0,gerror.New("删除操作成功")
		}
		//todo 文件完成之后要对文件做标记
		tx.Commit();
		return rows, nil;
	}
	return 1, nil
}