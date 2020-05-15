// ==========================================================================
// 云捷GO自动生成控制器相关代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-14 15:27:27
// 生成路径: app/controller/module/rmp_type/rmp_type_controller.go
// 生成人：张一
// ==========================================================================
package rmp_type

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"yj-app/app/model"
	rmp_typeModel "yj-app/app/model/module/rmp_type"
	rmp_typeService "yj-app/app/service/module/rmp_type"
	"yj-app/app/utils/response"
)


//列表页
func List(r *ghttp.Request) {
	response.BuildTpl(r, "module/rmp_type/list.html").WriteTpl()
}

//列表分页数据
func ListAjax(r *ghttp.Request) {
	var req *rmp_typeModel.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).SetMsg(err.Error()).Log("rmp_type管理", req).WriteJsonExit()
	}
	req.DelFlag ="0"
	rows := make([]rmp_typeModel.Entity, 0)
	result, page, err := rmp_typeService.SelectListByPage(req)

	if err == nil && len(result)>0 {
		rows = result
	}
	response.BuildTable(r, page.Total, rows).WriteJsonExit()
}

//新增页面
func Add(r *ghttp.Request) {
	response.BuildTpl(r, "module/rmp_type/add.html").WriteTpl()
}

//新增页面保存
func AddSave(r *ghttp.Request) {
	var req *rmp_typeModel.AddReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Add).SetMsg(err.Error()).Log("资源类型新增数据", req).WriteJsonExit()
	}

	isExtExist := rmp_typeService.CheckExtIsExist(req.TypeExt,0)
	if  isExtExist {
		response.ErrorResp(r).SetBtype(model.Buniss_Add).SetMsg("资源类型重复").Log("资源类型新增数据", req).WriteJsonExit()
	}
	
	id, err := rmp_typeService.AddSave(req, r.Session)

	if err != nil || id <= 0 {
		response.ErrorResp(r).SetBtype(model.Buniss_Add).Log("资源类型新增数据", req).WriteJsonExit()
	}
	response.SucessResp(r).SetData(id).Log("资源类型新增数据", req).WriteJsonExit()
}

//修改页面
func Edit(r *ghttp.Request) {
	id := r.GetQueryInt64("id")

	if id <= 0 {
		response.ErrorTpl(r).WriteTpl(g.Map{
			"desc": "参数错误",
		})
		return
	}

	entity, err := rmp_typeService.SelectRecordById(id)

	if err != nil || entity == nil {
		response.ErrorTpl(r).WriteTpl(g.Map{
			"desc": "数据不存在",
		})
		return
	}

	response.BuildTpl(r, "module/rmp_type/edit.html").WriteTpl(g.Map{
		"rmp_type": entity,
	})
}

//修改页面保存
func EditSave(r *ghttp.Request) {
	var req rmp_typeModel.EditReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Edit).SetMsg(err.Error()).Log("资源类型修改数据", req).WriteJsonExit()
	}

	isExtExist := rmp_typeService.CheckExtIsExist(req.TypeExt,req.Id)
	if  isExtExist {
		response.ErrorResp(r).SetBtype(model.Buniss_Add).SetMsg("资源类型重复").Log("资源类型新增数据", req).WriteJsonExit()
	}

	rs, err := rmp_typeService.EditSave(&req, r.Session)

	if err != nil || rs <= 0 {
		response.ErrorResp(r).SetBtype(model.Buniss_Edit).Log("资源类型修改数据", req).WriteJsonExit()
	}
	response.SucessResp(r).SetBtype(model.Buniss_Edit).Log("资源类型修改数据", req).WriteJsonExit()
}

//删除数据
func Remove(r *ghttp.Request) {
	var req *model.RemoveReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Del).SetMsg(err.Error()).Log("资源类型删除数据", req).WriteJsonExit()
	}

	rs := rmp_typeService.DeleteRecordByIds(req.Ids)

	if rs > 0 {
		response.SucessResp(r).SetBtype(model.Buniss_Del).Log("资源类型删除数据", req).WriteJsonExit()
	} else {
		response.ErrorResp(r).SetBtype(model.Buniss_Del).Log("资源类型删除数据", req).WriteJsonExit()
	}
}

//导出
func Export(r *ghttp.Request) {
	var req *rmp_typeModel.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).Log("资源类型导出数据", req).WriteJsonExit()
	}
	url, err := rmp_typeService.Export(req)

	if err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Other).Log("资源类型导出数据", req).WriteJsonExit()
	}
	response.SucessResp(r).SetBtype(model.Buniss_Other).SetMsg(url).WriteJsonExit()
}


//metadataList
 func ListMetadata(r *ghttp.Request) {
 	id := r.GetQueryInt64("type_id");
 	if id <= 0 {
		 response.ErrorTpl(r).WriteTpl(g.Map{
			 "desc": "参数错误",
		 })
		 return
	 }
	 entity,err:= rmp_typeService.GetTypeInfoById(id)
	 if err != nil {
		 response.ErrorTpl(r).WriteTpl(g.Map{
			 "desc": "参数错误",
		 })
		 return
	 }
	 metadata:=entity.MetaDataField
	 response.BuildTpl(r, "module/rmp_type/listmetadata.html").WriteTpl(g.Map{"metadata":metadata,"type_id":id, "name":entity.TypeName})
}

func Getlistmetadata(r *ghttp.Request){
	id := r.GetQueryInt64("id");
	if id <= 0 {
		response.ErrorResp(r).SetMsg("参数错误").Log("rmp_type管理", g.Map{"id":id}).WriteJsonExit()
	}
	entity:= rmp_typeService.GetTypeMetadata(id)
	if entity== nil {
		response.ErrorResp(r).SetMsg("值不存在").Log("rmp_type管理", g.Map{"id":id}).WriteJsonExit()
	}
	response.BuildTable(r, len(*entity), entity).WriteJsonExit()
}

