// ==========================================================================
// 云捷GO自动生成控制器相关代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-09 11:25:39
// 生成路径: app/controller/module/file/file_controller.go
// 生成人：yunjie
// ==========================================================================
package file

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"yj-app/app/model"
	fileModel "yj-app/app/model/module/file"
	fileService "yj-app/app/service/module/file"
	"yj-app/app/utils/response"
)

//列表页
func List(r *ghttp.Request) {
	response.BuildTpl(r, "module/file/list.html").WriteTpl()
}

//列表分页数据
func ListAjax(r *ghttp.Request) {
	var req *fileModel.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).SetMsg(err.Error()).Log("file管理", req).WriteJsonExit()
	}
	rows := make([]fileModel.Entity, 0)
	result, page, err := fileService.SelectListByPage(req)

	if err == nil && len(result)>0 {
		rows = result
	}

	response.BuildTable(r, page.Total, rows).WriteJsonExit()
}

//新增页面
func Add(r *ghttp.Request) {
	response.BuildTpl(r, "module/file/add.html").WriteTpl()
}

//新增页面保存
func AddSave(r *ghttp.Request) {
	var req *fileModel.AddReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Add).SetMsg(err.Error()).Log("文件管理新增数据", req).WriteJsonExit()
	}

	id, err := fileService.AddSave(req, r.Session)

	if err != nil || id <= 0 {
		response.ErrorResp(r).SetBtype(model.Buniss_Add).Log("文件管理新增数据", req).WriteJsonExit()
	}
	response.SucessResp(r).SetData(id).Log("文件管理新增数据", req).WriteJsonExit()
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

	entity, err := fileService.SelectRecordById(id)

	if err != nil || entity == nil {
		response.ErrorTpl(r).WriteTpl(g.Map{
			"desc": "数据不存在",
		})
		return
	}

	response.BuildTpl(r, "module/file/edit.html").WriteTpl(g.Map{
		"file": entity,
	})
}

//修改页面保存
func EditSave(r *ghttp.Request) {
	var req fileModel.EditReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Edit).SetMsg(err.Error()).Log("文件管理修改数据", req).WriteJsonExit()
	}

	rs, err := fileService.EditSave(&req, r.Session)

	if err != nil || rs <= 0 {
		response.ErrorResp(r).SetBtype(model.Buniss_Edit).Log("文件管理修改数据", req).WriteJsonExit()
	}
	response.SucessResp(r).SetBtype(model.Buniss_Edit).Log("文件管理修改数据", req).WriteJsonExit()
}

//删除数据
func Remove(r *ghttp.Request) {
	var req *model.RemoveReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Del).SetMsg(err.Error()).Log("文件管理删除数据", req).WriteJsonExit()
	}

	rs := fileService.DeleteRecordByIds(req.Ids)

	if rs > 0 {
		response.SucessResp(r).SetBtype(model.Buniss_Del).Log("文件管理删除数据", req).WriteJsonExit()
	} else {
		response.ErrorResp(r).SetBtype(model.Buniss_Del).Log("文件管理删除数据", req).WriteJsonExit()
	}
}

//导出
func Export(r *ghttp.Request) {
	var req *fileModel.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).Log("文件管理导出数据", req).WriteJsonExit()
	}
	url, err := fileService.Export(req)

	if err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Other).Log("文件管理导出数据", req).WriteJsonExit()
	}
	response.SucessResp(r).SetBtype(model.Buniss_Other).SetMsg(url).WriteJsonExit()
}