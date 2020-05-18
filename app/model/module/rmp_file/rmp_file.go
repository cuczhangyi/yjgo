// 云捷GO自动生成model扩展代码列表、增、删，改、查、导出，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-18 17:22:57
// 生成路径: app/model/module/rmp_file/rmp_file.go
// 生成人：张大方
// ==========================================================================
package rmp_file

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"yj-app/app/utils/page"
)

//新增页面请求参数
type AddReq struct {

	 FileName  string   `p:"fileName" v:"required#文件名称不能为空"`
	 FileExt  string   `p:"fileExt" `  
	 StoreList  string   `p:"storeList" `  
	 PrevFilePic  string   `p:"prevFilePic" `  
	 PrevFileVideo  string   `p:"prevFileVideo" `  
	 RmpTypeId  int64   `p:"rmpTypeId" `  
	 MetaData  string   `p:"metaData" `  
	 PathId  int64   `p:"pathId" `  
	 IsPackage  string   `p:"isPackage" `  
	 ParentId  int64   `p:"parentId" `  
	 Status  int64   `p:"status" v:"required#文件状态（0正常 00000001自身停用, 00000010父级停用, 00000100分类停用, 00001000路径停用）不能为空"`  
	 DelFlag  int64   `p:"delFlag" `  
	 
	 
	 
	 
	 Remark  string   `p:"remark" `  
}

//修改页面请求参数
type EditReq struct {
      Id    int64  `p:"id" v:"required#主键ID不能为空"`    
      FileName  string `p:"fileName" v:"required#文件名称不能为空"`   
      FileExt  string `p:"fileExt" `   
      StoreList  string `p:"storeList" `   
      PrevFilePic  string `p:"prevFilePic" `   
      PrevFileVideo  string `p:"prevFileVideo" `   
      RmpTypeId  int64 `p:"rmpTypeId" `   
      MetaData  string `p:"metaData" `   
      PathId  int64 `p:"pathId" `   
      IsPackage  string `p:"isPackage" `   
      ParentId  int64 `p:"parentId" `   
      Status  int64 `p:"status" v:"required#文件状态（0正常 00000001自身停用, 00000010父级停用, 00000100分类停用, 00001000路径停用）不能为空"`             
      Remark  string `p:"remark" `  
}

//分页请求参数 
type SelectPageReq struct {    
	FileName  string `p:"fileName"` //文件名称   
	FileExt  string `p:"fileExt"` //文件后缀名   
	StoreList  string `p:"storeList"` //存储位置   
	PrevFilePic  string `p:"prevFilePic"` //预览图片   
	PrevFileVideo  string `p:"prevFileVideo"` //预览视频   
	RmpTypeId  int64 `p:"rmpTypeId"` //资源类型   
	MetaData  string `p:"metaData"` //meta_data   
	PathId  int64 `p:"pathId"` //路径id   
	IsPackage  string `p:"isPackage"` //是否为文件包（0不是 1是）   
	ParentId  int64 `p:"parentId"` //父级文件id(文件包专用)   
	Status  int64 `p:"status"` //文件状态（0正常 00000001自身停用, 00000010父级停用, 00000100分类停用, 00001000路径停用）              
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

	model := db.Table("rmp_file t")

	if param != nil {    
		
		if param.FileName != "" {
			model.Where("t.file_name like ?", "%"+param.FileName+"%")
		}    
		 
		if param.FileExt != "" {
			model.Where("t.file_ext = ?", param.FileExt)
		}     
		 
		if param.StoreList != "" {
			model.Where("t.store_list = ?", param.StoreList)
		}     
		 
		if param.PrevFilePic != "" {
			model.Where("t.prev_file_pic = ?", param.PrevFilePic)
		}     
		 
		if param.PrevFileVideo != "" {
			model.Where("t.prev_file_video = ?", param.PrevFileVideo)
		}     
		     
		 
		if param.MetaData != "" {
			model.Where("t.meta_data = ?", param.MetaData)
		}     
		     
		 
		if param.IsPackage != "" {
			model.Where("t.is_package = ?", param.IsPackage)
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

	model := db.Table("rmp_file t")

	if param != nil {    
		
		if param.FileName != "" {
			model.Where("t.file_name like ?", "%"+param.FileName+"%")
		}    
		 
		if param.FileExt != "" {
			model.Where("t.file_ext = ?", param.FileExt)
		}     
		 
		if param.StoreList != "" {
			model.Where("t.store_list = ?", param.StoreList)
		}     
		 
		if param.PrevFilePic != "" {
			model.Where("t.prev_file_pic = ?", param.PrevFilePic)
		}     
		 
		if param.PrevFileVideo != "" {
			model.Where("t.prev_file_video = ?", param.PrevFileVideo)
		}     
		     
		 
		if param.MetaData != "" {
			model.Where("t.meta_data = ?", param.MetaData)
		}     
		     
		 
		if param.IsPackage != "" {
			model.Where("t.is_package = ?", param.IsPackage)
		}     
		     
		                
		if param.BeginTime != "" {
			model.Where("date_format(t.create_time,'%y%m%d') >= date_format(?,'%y%m%d') ", param.BeginTime)
		}

		if param.EndTime != "" {
			model.Where("date_format(t.create_time,'%y%m%d') <= date_format(?,'%y%m%d') ", param.EndTime)
		}
	}

	//"文件id","文件名称","文件后缀名","存储位置","预览图片","预览视频","资源类型","meta_data","路径id","是否为文件包（0不是 1是）","父级文件id(文件包专用)","文件状态（0正常 00000001自身停用, 00000010父级停用, 00000100分类停用, 00001000路径停用）","删除标志（0正常 00000001自身删除, 00000010父级删除, 00000100分类删除, 00001000路径删除）","创建者","创建时间","更新者","更新时间","备注",
	model.Fields(" t.id ,t.file_name ,t.file_ext ,t.store_list ,t.prev_file_pic ,t.prev_file_video ,t.rmp_type_id ,t.meta_data ,t.path_id ,t.is_package ,t.parent_id ,t.status ,t.del_flag ,t.create_by ,t.create_time ,t.update_by ,t.update_time ,t.remark")

	result, _ := model.All()
	return result, nil
}

//获取所有数据
func SelectListAll(param *SelectPageReq) ([]Entity,error) {
	db, err := gdb.Instance()

	if err != nil {
		return nil, gerror.New("获取数据库连接失败")
	}

	model := db.Table("rmp_file t")

	if param != nil {    
		
		if param.FileName != "" {
			model.Where("t.file_name like ?", "%"+param.FileName+"%")
		}    
		 
		if param.FileExt != "" {
			model.Where("t.file_ext = ?", param.FileExt)
		} 
		   
		 
		if param.StoreList != "" {
			model.Where("t.store_list = ?", param.StoreList)
		} 
		   
		 
		if param.PrevFilePic != "" {
			model.Where("t.prev_file_pic = ?", param.PrevFilePic)
		} 
		   
		 
		if param.PrevFileVideo != "" {
			model.Where("t.prev_file_video = ?", param.PrevFileVideo)
		} 
		   
		 
		   
		 
		if param.MetaData != "" {
			model.Where("t.meta_data = ?", param.MetaData)
		} 
		   
		 
		   
		 
		if param.IsPackage != "" {
			model.Where("t.is_package = ?", param.IsPackage)
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