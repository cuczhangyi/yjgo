// ==========================================================================
// 云捷GO自动生成业务逻辑层相关代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-09 11:25:39
// 生成路径: app/service/module/file/file_service.go
// 生成人：yunjie
// ==========================================================================
package file

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gtime"
	fileModel "yj-app/app/model/module/file"
	userService "yj-app/app/service/system/user"
	"yj-app/app/utils/convert"
	"yj-app/app/utils/excel"
	"yj-app/app/utils/page"
)

//根据主键查询数据
func SelectRecordById(id int64) (*fileModel.Entity, error) {
	return fileModel.FindOne("id", id)
}

//根据主键删除数据
func DeleteRecordById(id int64) bool {
	result, err := fileModel.Delete("id", id)
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
	result, err := fileModel.Delete("id in (?)", idarr)
	if err != nil {
		return 0
	}

	nums, _ := result.RowsAffected()

	return nums
}

//添加数据
func AddSave(req *fileModel.AddReq, session *ghttp.Session) (int64, error) {
	var entity fileModel.Entity
	   
	entity.FileSha1 = req.FileSha1  
	entity.FileName = req.FileName  
	entity.FileSize = req.FileSize  
	entity.FileAddr = req.FileAddr          
	entity.Remark = req.Remark 
	entity.CreateTime = gtime.Now()
	entity.CreateBy = ""

	user := userService.GetProfile(session)

	if user != nil {
		entity.CreateBy = user.LoginName
	}

	result, err := entity.Insert()
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
func EditSave(req *fileModel.EditReq, session *ghttp.Session) (int64, error) {

	entity, err := fileModel.FindOne("id=?", req.Id)

	if err != nil {
		return 0, err
	}

	if entity == nil {
		return 0, gerror.New("数据不存在")
	}
	 
	entity.Id = req.Id  
	entity.FileSha1 = req.FileSha1  
	entity.FileName = req.FileName  
	entity.FileSize = req.FileSize  
	entity.FileAddr = req.FileAddr          
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

//根据条件查询数据
func SelectListAll(params *fileModel.SelectPageReq) ([]fileModel.Entity, error) {
	return fileModel.SelectListAll(params)
}

//根据条件分页查询数据
func SelectListByPage(params *fileModel.SelectPageReq) ([]fileModel.Entity, *page.Paging, error) {
	return fileModel.SelectListByPage(params)
}

// 导出excel
func Export(param *fileModel.SelectPageReq) (string, error) {
	result, err := fileModel.SelectListExport(param)
	if err != nil {
		return "", err
	}

	head := []string{  "文件id" ,"文件hash" ,"文件名" ,"文件大小" ,"文件存储位置" ,"创建者" ,"创建时间" ,"更新者" ,"更新时间" ,"备注"}
	key := []string{  "id" ,"file_sha1" ,"file_name" ,"file_size" ,"file_addr" ,"create_by" ,"create_time" ,"update_by" ,"update_time" ,"remark"}
	url, err := excel.DownlaodExcel(head,key, result)

	if err != nil {
		return "", err
	}

	return url, nil
}