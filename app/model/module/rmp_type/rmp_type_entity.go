// ==========================================================================
// 云捷GO自动生成数据库操作代码，无需手动修改，重新生成会自动覆盖.
// 生成日期：2020-05-14 15:27:27
// 生成路径: app/model/module/rmp_type/rmp_type_entity.go
// 生成人：张一
// ==========================================================================

package rmp_type

import (
	"database/sql"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/os/gtime"
)

// Entity is the golang structure for table rmp_type.
type Entity struct { 
	 Id       int64         `orm:"id,primary" json:"id"`    // 类型id  
	 TypeName    string         `orm:"type_name" json:"type_name"`    // 类型名称  
	 TypeExt    string         `orm:"type_ext" json:"type_ext"`    // 文件后缀名  
	 MetaDataField    string         `orm:"meta_data_field" json:"meta_data_field"`    // metadata  
	 Status    string         `orm:"status" json:"status"`    // 类型状态（0正常 1停用）  
	 DelFlag    string         `orm:"del_flag" json:"del_flag"`    // 删除标志（0代表存在 2代表删除）  
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
