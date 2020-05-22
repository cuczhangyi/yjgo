// ==========================================================================
// 云捷GO自动生成数据库操作代码，无需手动修改，重新生成会自动覆盖.
// 生成日期：2020-05-18 17:22:57
// 生成路径: app/model/module/rmp_file/rmp_file_entity.go
// 生成人：张大方
// ==========================================================================

package rmp_file

import (
	"database/sql"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/os/gtime"
)

// Entity is the golang structure for table rmp_file.
type Entity struct { 
	 Id       int64         `orm:"id,primary" json:"id"`    // 文件id  
	 FileName    string         `orm:"file_name" json:"file_name"`    // 文件名称  
	 FileExt    string         `orm:"file_ext" json:"file_ext"`    // 文件后缀名  
	 StoreList    string         `orm:"store_list" json:"store_list"`    // 存储位置  
	 PrevFilePic    string         `orm:"prev_file_pic" json:"prev_file_pic"`    // 预览图片  
	 PrevFileVideo    string         `orm:"prev_file_video" json:"prev_file_video"`    // 预览视频  
	 RmpTypeId    int64         `orm:"rmp_type_id" json:"rmp_type_id"`    // 资源类型  
	 MetaData    string         `orm:"meta_data" json:"meta_data"`    // meta_data  
	 PathId    int64         `orm:"path_id" json:"path_id"`    // 路径id  
	 IsPackage    string         `orm:"is_package" json:"is_package"`    // 是否为文件包（0不是 1是）  
	 ParentId    int64         `orm:"parent_id" json:"parent_id"`    // 父级文件id(文件包专用)  
	 Status    int64         `orm:"status" json:"status"`    // 文件状态（0正常 00000001自身停用, 00000010父级停用, 00000100分类停用, 00001000路径停用）  
	 DelFlag    int64         `orm:"del_flag" json:"del_flag"`    // 删除标志（0正常 00000001自身删除, 00000010父级删除, 00000100分类删除, 00001000路径删除）  
	 CreateBy    string         `orm:"create_by" json:"create_by"`    // 创建者  
	 CreateTime    *gtime.Time         `orm:"create_time" json:"create_time"`    // 创建时间  
	 UpdateBy    string         `orm:"update_by" json:"update_by"`    // 更新者  
	 UpdateTime    *gtime.Time         `orm:"update_time" json:"update_time"`    // 更新时间  
	 Remark    string         `orm:"remark" json:"remark"`    // 备注
}



// OmitEmpty sets OPTION_OMITEMPTY option for the model, which automatically filers
// the data and where attributes for empty values.
func (r *Entity) OmitEmpty() *arModel {
	return Model.Data(r).OmitEmpty()
}

// Inserts does "INSERT...INTO..." statement for inserting current object into table.
func (r *Entity) Insert() (result sql.Result, err error) {
	return Model.Data(r).Insert()
}

// Replace does "REPLACE...INTO..." statement for inserting current object into table.
// If there's already another same record in the table (it checks using primary key or unique index),
// it deletes it and insert this one.
func (r *Entity) Replace() (result sql.Result, err error) {
	return Model.Data(r).Replace()
}

// Save does "INSERT...INTO..." statement for inserting/updating current object into table.
// It updates the record if there's already another same record in the table
// (it checks using primary key or unique index).
func (r *Entity) Save() (result sql.Result, err error) {
	return Model.Data(r).Save()
}

// Update does "UPDATE...WHERE..." statement for updating current object from table.
// It updates the record if there's already another same record in the table
// (it checks using primary key or unique index).
func (r *Entity) Update() (result sql.Result, err error) {
	return Model.Data(r).Where(gdb.GetWhereConditionOfStruct(r)).Update()
}

// Delete does "DELETE FROM...WHERE..." statement for deleting current object from table.
func (r *Entity) Delete() (result sql.Result, err error) {
	return Model.Where(gdb.GetWhereConditionOfStruct(r)).Delete()
}
