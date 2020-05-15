// ==========================================================================
// 云捷GO自动生成业务逻辑层相关代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-14 15:27:27
// 生成路径: app/service/module/rmp_type/rmp_type_service.go
// 生成人：张一
// ==========================================================================
package rmp_type

import (
	"encoding/json"
	"fmt"
	"github.com/gogf/gf/container/gvar"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/text/gstr"
	"sync"
	rmp_typeModel "yj-app/app/model/module/rmp_type"
	userService "yj-app/app/service/system/user"
	"yj-app/app/utils/convert"
	"yj-app/app/utils/excel"
	"yj-app/app/utils/page"
)

type MetadataEntity struct{
	Name string `json:"name"`
	Code string `json:"code"`
	Values string `json:"values"`
}


//根据主键查询数据
func SelectRecordById(id int64) (*rmp_typeModel.Entity, error) {
	return rmp_typeModel.FindOne("id", id)
}

//根据主键删除数据
func DeleteRecordById(id int64) bool {
	result, err := rmp_typeModel.Delete("id", id)
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
	result, err := rmp_typeModel.Delete("id in (?)", idarr)
	if err != nil {
		return 0
	}

	nums, _ := result.RowsAffected()

	return nums
}

//添加数据
func AddSave(req *rmp_typeModel.AddReq, session *ghttp.Session) (int64, error) {
	var entity rmp_typeModel.Entity
	   
	entity.TypeName = req.TypeName  
	entity.TypeExt = req.TypeExt  
	entity.MetaDataField = req.MetaDataField  
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
func EditSave(req *rmp_typeModel.EditReq, session *ghttp.Session) (int64, error) {

	entity, err := rmp_typeModel.FindOne("id=?", req.Id)

	if err != nil {
		return 0, err
	}

	if entity == nil {
		return 0, gerror.New("数据不存在")
	}
	   
	entity.TypeName = req.TypeName  
	entity.TypeExt = req.TypeExt  
	entity.MetaDataField = req.MetaDataField  
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

//根据条件查询数据
func SelectListAll(params *rmp_typeModel.SelectPageReq) ([]rmp_typeModel.Entity, error) {
	return rmp_typeModel.SelectListAll(params)
}

//根据条件分页查询数据
func SelectListByPage(params *rmp_typeModel.SelectPageReq) ([]rmp_typeModel.Entity, *page.Paging, error) {
	return rmp_typeModel.SelectListByPage(params)
}

// 导出excel
func Export(param *rmp_typeModel.SelectPageReq) (string, error) {
	result, err := rmp_typeModel.SelectListExport(param)
	if err != nil {
		return "", err
	}

	head := []string{  "类型id" ,"类型名称" ,"文件后缀名" ,"metadata" ,"类型状态（0正常 1停用）" ,"删除标志（0代表存在 2代表删除）" ,"创建者" ,"创建时间" ,"更新者" ,"更新时间" ,"备注"}
	key := []string{  "id" ,"type_name" ,"type_ext" ,"meta_data_field" ,"status" ,"del_flag" ,"create_by" ,"create_time" ,"update_by" ,"update_time" ,"remark"}
	url, err := excel.DownlaodExcel(head,key, result)
	if err != nil {
		return "", err
	}
	return url, nil
}

func checkExtIdDb(ext string,id int64, wg * sync.WaitGroup, p *gvar.Var){
	count := 0
	if id!=0{
		count,_ =rmp_typeModel.FindCount("find_in_set(?, type_ext) and id <> ?",ext,id)
	}else{
		count ,_ =rmp_typeModel.FindCount("find_in_set(?, type_ext)",ext)
	}
	fmt.Println("checkExt is "+ ext)
	if count > 0 {
		p.Set(true)
	}
	wg.Done()
}

func GetTypeInfoById(typeId int64) (*rmp_typeModel.Entity, error){
	entity, err := rmp_typeModel.FindOne("id=?", typeId)
	if err == nil  && entity != nil{
		return entity,nil
	}
	return nil,gerror.New("查找失败")
}


func CheckExtIsExist(exts string , type_id int64) bool{
	extsSlice := gstr.Explode(",",exts)
	wg :=new(sync.WaitGroup)
	p := g.NewVar(false, true)
	for _, tmp:= range extsSlice{
		wg.Add(1)
		tempData := tmp
		go checkExtIdDb(tempData,type_id,wg,p)
	}
	wg.Wait()
	return p.Bool()
}


func GetTypeMetadata(typeId int64) *[]MetadataEntity{
	entity, err := rmp_typeModel.FindOne("id=?", typeId)
	if err != nil {
		return nil
	}
	metaString := entity.MetaDataField
	var returnInfo []MetadataEntity
	json.Unmarshal([]byte(metaString),&returnInfo)
	return &returnInfo
}