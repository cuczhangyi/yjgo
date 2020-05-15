// 云捷GO自动生成model扩展代码列表、增、删，改、查、导出，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-13 11:25:57
// 生成路径: app/model/module/rmp_path/rmp_path.go
// 生成人：yunjie
// ==========================================================================
package rmp_path

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/util/gconv"
	"strings"
	"yj-app/app/utils/page"
)

type EntityExtend struct {
	Entity
	ParentName string `json:"parentName"` // 父菜单名称
}

//新增页面请求参数
type AddReq struct { 
	 
	 PathName  string   `p:"pathName" v:"required#路径名称不能为空"`  
	 ParentId  int64   `p:"parentId" `  
	 Ancestors  string   `p:"ancestors" `  
	 Status  string   `p:"status" v:"required#角色状态（0正常 1停用）不能为空"`  
	 
	 
	 
	 
	 
	 Remark  string   `p:"remark" `  
}

//修改页面请求参数
type EditReq struct {
      PathId    int64  `p:"pathId" v:"required#主键ID不能为空"`    
      PathName  string `p:"pathName" v:"required#路径名称不能为空"`   
      ParentId  int64 `p:"parentId" `   
      Ancestors  string `p:"ancestors" `   
      Status  string `p:"status" v:"required#角色状态（0正常 1停用）不能为空"`             
      Remark  string `p:"remark" `  
}

//分页请求参数 
type SelectPageReq struct {  
	PathId  int64 `p:"pathId"` //路径id   
	PathName  string `p:"pathName"` //路径名称   
	ParentId  int64 `p:"parentId"` //父级路径id   
	Ancestors  string `p:"ancestors"` //祖级列表   
	Status  string `p:"status"` //角色状态（0正常 1停用）   
	DelFlag  string `p:"delFlag"` //删除标志（0代表存在 2代表删除）            
	BeginTime  string `p:"beginTime"`  //开始时间
	EndTime    string `p:"endTime"`    //结束时间
	PageNum    int    `p:"pageNum"`    //当前页码
	PageSize   int    `p:"pageSize"`   //每页数
	OrderByColumn string `p:"orderByColumn"` //排序字段
	IsAsc         string `p:"isAsc"`         //排序方式
}

//检查路径名称请求参数
type CheckPathNameReq struct {
	DeptId   int64  `p:"deptId"  v:"required#部门ID不能为空"`
	ParentId int64  `p:"parentId"  v:"required#父部门ID不能为空"`
	DeptName string `p:"deptName"  v:"required#部门名称不能为空"`
}

//检查路径名称请求参数
type CheckDeptNameALLReq struct {
	ParentId int64  `p:"parentId"  v:"required#父部门ID不能为空"`
	DeptName string `p:"deptName"  v:"required#部门名称不能为空"`
}


//根据路径ID查询信息
func SelectPathById(id int64) (*EntityExtend, error) {
	db, err := gdb.Instance()
	if err != nil {
		return nil, gerror.New("获取数据库连接失败")
	}
	var result EntityExtend
	model := db.Table("rmp_path d")
	model.Fields("d.path_id, d.parent_id, d.ancestors, d.path_name, d.remark ,d.status,(select path_name from rmp_path where path_id = d.parent_id) parent_name")
	model.Where("d.path_id = ?", id)
	err = model.Struct(&result)
	return &result, err
}


//根据ID查询下一级子路径
func SelectChildrenPathById(pathId int64) []*Entity {
	rs, _ := FindAll("find_in_set(?, ancestors)", pathId)
	return rs
}

//根据路径查询下一级路径
func DeleteDeptById(pathId int64) int64 {
	rs, err := Update("del_flag = '2'", "path_id = ?", pathId)
	if err != nil {
		return 0
	}
	rows, _ := rs.RowsAffected()
	return rows
}


//修改子元素关系
func UpdatePathChildren(pathId int64, newAncestors, oldAncestors string) {
	deptList := SelectChildrenPathById(pathId)

	if deptList == nil || len(deptList) <= 0 {
		return
	}

	for _, tmp := range deptList {
		tmp.Ancestors = strings.ReplaceAll(tmp.Ancestors, oldAncestors, newAncestors)
	}
	ancestors := " case dept_id"
	idStr := ""
	for _, dept := range deptList {
		ancestors += " when " + gconv.String(dept.PathId) + " then " + dept.Ancestors
		if idStr == "" {
			idStr = gconv.String(dept.PathId)
		} else {
			idStr += "," + gconv.String(dept.PathId)
		}
	}
	ancestors += " end "
	Update("ancestors = ?", "dept_id in(?)", ancestors, idStr)
}

//查询路径数据
func SelectPathList(parentId int64, pathName, status string) ([]Entity, error) {
	var result []Entity
	db, err := gdb.Instance()
	if err != nil {
		return nil, gerror.New("获取数据库连接失败")
	}
	model := db.Table("rmp_path d").Where("d.del_flag = '0'")
	if parentId > 0 {
		model.Where("d.parent_id = ?", parentId)
	}
	if pathName != "" {
		model.Where("d.path_name like ?", "%"+pathName+"%")
	}
	if status != "" {
		model.Where("d.status = ?", status)
	}
	model.Order("d.parent_id, d.path_id")

	err = model.Structs(&result)
	return result, err
}


//校验部门名称是否唯一
func CheckPathNameUnique(pathName string, pathId, parentId int64) (*Entity, error) {
	if  pathId != 0 {
		return FindOne("path_id !=? and path_name=? and parent_id = ?", pathId, pathName, parentId)
	} else {
		return FindOne(" path_name=? and parent_id = ?", pathName, parentId)
	}
}


//根据条件分页查询数据
func SelectListByPage(param *SelectPageReq) ([]Entity, *page.Paging, error) {
	db, err := gdb.Instance()

	if err != nil {
		return nil, nil, gerror.New("获取数据库连接失败")
	}

	model := db.Table("rmp_path t")

	if param != nil {  
		     
		
		if param.PathName != "" {
			model.Where("t.path_name like ?", "%"+param.PathName+"%")
		}    
		     
		 
		if param.Ancestors != "" {
			model.Where("t.ancestors = ?", param.Ancestors)
		}     
		 
		if param.Status != "" {
			model.Where("t.status = ?", param.Status)
		}     
		 
		if param.DelFlag != "" {
			model.Where("t.del_flag = ?", param.DelFlag)
		}              
		if param.BeginTime != "" {
			model.Where("date_format(t.create_time,'%y%m%d') >= date_format(?,'%y%m%d') ", param.BeginTime)
		}

		if param.EndTime != "" {
			model.Where("date_format(t.create_time,'%y%m%d') <= date_format(?,'%y%m%d') ", param.EndTime)
		}
	}

	total, err := model.Count()

	if err != nil {
		return nil, nil, gerror.New("读取行数失败")
	}

	page := page.CreatePaging(param.PageNum, param.PageSize, total)

	model.Limit(page.StartNum, page.Pagesize)

	if param.OrderByColumn != "" {
		model.Order(param.OrderByColumn + " " + param.IsAsc)
	}

	var result []Entity
	model.Structs(&result)
	return result, page, nil
}

// 导出excel
func SelectListExport(param *SelectPageReq) (gdb.Result, error) {
	db, err := gdb.Instance()

	if err != nil {
		return nil, gerror.New("获取数据库连接失败")
	}

	model := db.Table("rmp_path t")

	if param != nil {  
		     
		
		if param.PathName != "" {
			model.Where("t.path_name like ?", "%"+param.PathName+"%")
		}    
		     
		 
		if param.Ancestors != "" {
			model.Where("t.ancestors = ?", param.Ancestors)
		}     
		 
		if param.Status != "" {
			model.Where("t.status = ?", param.Status)
		}     
		 
		if param.DelFlag != "" {
			model.Where("t.del_flag = ?", param.DelFlag)
		}              
		if param.BeginTime != "" {
			model.Where("date_format(t.create_time,'%y%m%d') >= date_format(?,'%y%m%d') ", param.BeginTime)
		}

		if param.EndTime != "" {
			model.Where("date_format(t.create_time,'%y%m%d') <= date_format(?,'%y%m%d') ", param.EndTime)
		}
	}

	//"路径id","路径名称","父级路径id","祖级列表","角色状态（0正常 1停用）","删除标志（0代表存在 2代表删除）","创建者","创建时间","更新者","更新时间","备注",
	model.Fields(" t.path_id ,t.path_name ,t.parent_id ,t.ancestors ,t.status ,t.del_flag ,t.create_by ,t.create_time ,t.update_by ,t.update_time ,t.remark")

	result, _ := model.All()
	return result, nil
}

//获取所有数据
func SelectListAll(param *SelectPageReq) ([]Entity,error) {
	db, err := gdb.Instance()

	if err != nil {
		return nil, gerror.New("获取数据库连接失败")
	}

	model := db.Table("rmp_path t")

	if param != nil {  
		if param.PathName != "" {
			model.Where("t.path_name like ?", "%"+param.PathName+"%")
		}

		if param.Ancestors != "" {
			model.Where("t.ancestors = ?", param.Ancestors)
		} 
		   
		 
		if param.Status != "" {
			model.Where("t.status = ?", param.Status)
		} 
		   
		 
		if param.DelFlag != "" {
			model.Where("t.del_flag = ?", param.DelFlag)
		} 
		            
		if param.BeginTime != "" {
			model.Where("date_format(t.create_time,'%y%m%d') >= date_format(?,'%y%m%d') ", param.BeginTime)
		}

		if param.EndTime != "" {
			model.Where("date_format(t.create_time,'%y%m%d') <= date_format(?,'%y%m%d') ", param.EndTime)
		}

	}

	var result []Entity
	model.Structs(&result)
	return result, nil
}