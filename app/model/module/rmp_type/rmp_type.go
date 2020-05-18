// 云捷GO自动生成model扩展代码列表、增、删，改、查、导出，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-14 15:27:27
// 生成路径: app/model/module/rmp_type/rmp_type.go
// 生成人：张一
// ==========================================================================
package rmp_type

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"yj-app/app/utils/page"
)

//新增页面请求参数
type AddReq struct { 
	 
	 TypeName  string   `p:"typeName" v:"required#类型名称不能为空"`  
	 TypeExt  string   `p:"typeExt" `  
	 MetaDataField  string   `p:"metaDataField" `  
	 Status  string   `p:"status" v:"required#类型状态（0正常 1停用）不能为空"`  
	 
	 
	 
	 
	 
	 Remark  string   `p:"remark" `  
}

//修改页面请求参数
type EditReq struct {
      Id    int64  `p:"id" v:"required#主键ID不能为空"`    
      TypeName  string `p:"typeName" v:"required#类型名称不能为空"`   
      TypeExt  string `p:"typeExt" `   
      MetaDataField  string `p:"metaDataField" `   
      Status  string `p:"status" v:"required#类型状态（0正常 1停用）不能为空"`             
      Remark  string `p:"remark" `  
}

//分页请求参数 
type SelectPageReq struct {    
	TypeName  string `p:"typeName"` //类型名称   
	TypeExt  string `p:"typeExt"` //文件后缀名   
	MetaDataField  string `p:"metaDataField"` //metadata   
	Status  string `p:"status"` //类型状态（0正常 1停用）   
	DelFlag  string `p:"delFlag"` //删除标志（0代表存在 2代表删除）           
	Remark  string `p:"remark"` //备注  
	BeginTime  string `p:"beginTime"`  //开始时间
	EndTime    string `p:"endTime"`    //结束时间
	PageNum    int    `p:"pageNum"`    //当前页码
	PageSize   int    `p:"pageSize"`   //每页数
	OrderByColumn string `p:"orderByColumn"` //排序字段
	IsAsc         string `p:"isAsc"`         //排序方式
}

//根据条件分页查询数据
func SelectListByPage(param *SelectPageReq) ([]Entity, *page.Paging, error) {
	db, err := gdb.Instance()

	if err != nil {
		return nil, nil, gerror.New("获取数据库连接失败")
	}

	model := db.Table("rmp_type t")

	if param != nil {    
		
		if param.TypeName != "" {
			model.Where("t.type_name like ?", "%"+param.TypeName+"%")
		}    
		 
		if param.TypeExt != "" {
			model.Where("t.type_ext like ?", "%"+ param.TypeExt+"%")
		}     
		 
		if param.MetaDataField != "" {
			model.Where("t.meta_data_field = ?", param.MetaDataField)
		}     
		 
		if param.Status != "" {
			model.Where("t.status = ?", param.Status)
		}     
		 
		if param.DelFlag != "" {
			model.Where("t.del_flag = ?", param.DelFlag)
		}             
		 
		if param.Remark != "" {
			model.Where("t.remark like ?", "%"+param.Remark+"%")
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

	model := db.Table("rmp_type t")

	if param != nil {    
		
		if param.TypeName != "" {
			model.Where("t.type_name like ?", "%"+param.TypeName+"%")
		}    
		 
		if param.TypeExt != "" {
			model.Where("t.type_ext = ?", param.TypeExt)
		}     
		 
		if param.MetaDataField != "" {
			model.Where("t.meta_data_field = ?", param.MetaDataField)
		}     
		 
		if param.Status != "" {
			model.Where("t.status = ?", param.Status)
		}     
		 
		if param.DelFlag != "" {
			model.Where("t.del_flag = ?", param.DelFlag)
		}             
		 
		if param.Remark != "" {
			model.Where("t.remark = ?", param.Remark)
		}    
		if param.BeginTime != "" {
			model.Where("date_format(t.create_time,'%y%m%d') >= date_format(?,'%y%m%d') ", param.BeginTime)
		}

		if param.EndTime != "" {
			model.Where("date_format(t.create_time,'%y%m%d') <= date_format(?,'%y%m%d') ", param.EndTime)
		}
	}

	//"类型id","类型名称","文件后缀名","metadata","类型状态（0正常 1停用）","删除标志（0代表存在 2代表删除）","创建者","创建时间","更新者","更新时间","备注",
	model.Fields(" t.id ,t.type_name ,t.type_ext ,t.meta_data_field ,t.status ,t.del_flag ,t.create_by ,t.create_time ,t.update_by ,t.update_time ,t.remark")

	result, _ := model.All()
	return result, nil
}

//获取所有数据
func SelectListAll(param *SelectPageReq) ([]Entity,error) {
	db, err := gdb.Instance()

	if err != nil {
		return nil, gerror.New("获取数据库连接失败")
	}

	model := db.Table("rmp_type t")

	if param != nil {    
		
		if param.TypeName != "" {
			model.Where("t.type_name like ?", "%"+param.TypeName+"%")
		}    
		 
		if param.TypeExt != "" {
			model.Where("t.type_ext = ?", param.TypeExt)
		} 
		   
		 
		if param.MetaDataField != "" {
			model.Where("t.meta_data_field = ?", param.MetaDataField)
		} 
		   
		 
		if param.Status != "" {
			model.Where("t.status = ?", param.Status)
		} 
		   
		 
		if param.DelFlag != "" {
			model.Where("t.del_flag = ?", param.DelFlag)
		} 
		           
		 
		if param.Remark != "" {
			model.Where("t.remark = ?", param.Remark)
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