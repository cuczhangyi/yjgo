// ==========================================================================
// 云捷GO自动生成model扩展代码列表、增、删，改、查、导出，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-09 11:25:39
// 生成路径: app/model/module/file/file.go
// 生成人：yunjie
// ==========================================================================
package file

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"yj-app/app/utils/page"
)

//新增页面请求参数
type AddReq struct { 
	 
	 FileSha1  string   `p:"fileSha1" `  
	 FileName  string   `p:"fileName" v:"required#文件名不能为空"`  
	 FileSize  int64   `p:"fileSize" `  
	 FileAddr  string   `p:"fileAddr" `  
	 
	 
	 
	 
	 Remark  string   `p:"remark" `  
}

//修改页面请求参数
type EditReq struct {
      Id    int64  `p:"id" v:"required#主键ID不能为空"`  

      FileSha1  string `p:"fileSha1" `   
      FileName  string `p:"fileName" v:"required#文件名不能为空"`   
      FileSize  int64 `p:"fileSize" `   
      FileAddr  string `p:"fileAddr" `           
      Remark  string `p:"remark" `  
}

//分页请求参数 
type SelectPageReq struct {    
	FileSha1  string `p:"fileSha1"` //文件hash   
	FileName  string `p:"fileName"` //文件名   
	FileSize  int64 `p:"fileSize"` //文件大小   
	FileAddr  string `p:"fileAddr"` //文件存储位置            
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

	model := db.Table("tbl_file t")

	if param != nil {    
		 
		if param.FileSha1 != "" {
			model.Where("t.file_sha1 = ?", param.FileSha1)
		}     
		
		if param.FileName != "" {
			model.Where("t.file_name like ?", "%"+param.FileName+"%")
		}    
		     
		 
		if param.FileAddr != "" {
			model.Where("t.file_addr = ?", param.FileAddr)
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

	model := db.Table("tbl_file t")

	if param != nil {    
		 
		if param.FileSha1 != "" {
			model.Where("t.file_sha1 = ?", param.FileSha1)
		}     
		
		if param.FileName != "" {
			model.Where("t.file_name like ?", "%"+param.FileName+"%")
		}    
		     
		 
		if param.FileAddr != "" {
			model.Where("t.file_addr = ?", param.FileAddr)
		}              
		if param.BeginTime != "" {
			model.Where("date_format(t.create_time,'%y%m%d') >= date_format(?,'%y%m%d') ", param.BeginTime)
		}

		if param.EndTime != "" {
			model.Where("date_format(t.create_time,'%y%m%d') <= date_format(?,'%y%m%d') ", param.EndTime)
		}
	}

	//"文件id","文件hash","文件名","文件大小","文件存储位置","创建者","创建时间","更新者","更新时间","备注",
	model.Fields(" t.id ,t.file_sha1 ,t.file_name ,t.file_size ,t.file_addr ,t.create_by ,t.create_time ,t.update_by ,t.update_time ,t.remark")

	result, _ := model.All()
	return result, nil
}

//获取所有数据
func SelectListAll(param *SelectPageReq) ([]Entity,error) {
	db, err := gdb.Instance()

	if err != nil {
		return nil, gerror.New("获取数据库连接失败")
	}

	model := db.Table("tbl_file t")

	if param != nil {    
		 
		if param.FileSha1 != "" {
			model.Where("t.file_sha1 = ?", param.FileSha1)
		} 
		   
		
		if param.FileName != "" {
			model.Where("t.file_name like ?", "%"+param.FileName+"%")
		}    
		 
		   
		 
		if param.FileAddr != "" {
			model.Where("t.file_addr = ?", param.FileAddr)
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