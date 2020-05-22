// ==========================================================================
// 云捷GO自动生成控制器相关代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-18 17:22:57
// 生成路径: app/controller/module/rmp_file/rmp_file_controller.go
// 生成人：张大方
// ==========================================================================
package rmp_file

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"yj-app/app/model"
	rmp_fileModel "yj-app/app/model/module/rmp_file"
	rmp_typeModel "yj-app/app/model/module/rmp_type"
	rmp_fileService "yj-app/app/service/module/rmp_file"
	rmp_typeService "yj-app/app/service/module/rmp_type"


	"yj-app/app/utils/recvfile"
	"yj-app/app/utils/response"
	"yj-app/app/utils/rmp_pathtools"
)

//列表页
func List(r *ghttp.Request) {
	response.BuildTpl(r, "module/rmp_file/list.html").WriteTpl()
}

//列表分页数据
func ListAjax(r *ghttp.Request) {

	var req *rmp_fileModel.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).SetMsg(err.Error()).Log("rmp_file管理", req).WriteJsonExit()
	}
	rows := make([]rmp_fileModel.ExtendEntity, 0)
	result, page, err := rmp_fileService.SelectListByPage(req)

	if err == nil && len(result)>0 {
		rows = result
	}
	response.BuildTable(r, page.Total, rows).WriteJsonExit()
}

//新增页面
func Add(r *ghttp.Request) {
	req:= new (rmp_typeModel.SelectPageReq)
	req.DelFlag = "0"
	req.Status = "0"
	rs, err := rmp_typeService.SelectListAll(req)
	if err != nil {
		response.ErrorTpl(r).WriteTpl(g.Map{
			"desc": "文件类型获取失败",
		})
		return
	}

	if len(rs) == 0{
		response.ErrorTpl(r).WriteTpl(g.Map{
			"desc": "文件类型不存在",
		})
		return
	}
	response.BuildTpl(r, "module/rmp_file/add.html").WriteTpl(g.Map{"types":rs})
}



//新增页面保存
func AddSave(r *ghttp.Request) {

	var reqExtend *rmp_fileModel.ExtendAddReq

	//获取参数
	if err := r.Parse(&reqExtend); err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Add).SetMsg(err.Error()).Log("资源文件新增数据", reqExtend).WriteJsonExit()
	}

	id, err := rmp_fileService.AddSaveExtend(reqExtend,r.Session)
	if err != nil || id <= 0 {
		response.ErrorResp(r).SetBtype(model.Buniss_Add).Log("资源文件新增数据", reqExtend).WriteJsonExit()
	}
	response.SucessResp(r).SetData(id).Log("资源文件新增数据", reqExtend).WriteJsonExit()

	//var req *rmp_fileModel.AddReq
	////获取参数
	//if err := r.Parse(&req); err != nil {
	//	response.ErrorResp(r).SetBtype(model.Buniss_Add).SetMsg(err.Error()).Log("资源文件新增数据", req).WriteJsonExit()
	//}
	//
	//id, err := rmp_fileService.AddSave(req, r.Session)
	//
	//if err != nil || id <= 0 {
	//	response.ErrorResp(r).SetBtype(model.Buniss_Add).Log("资源文件新增数据", req).WriteJsonExit()
	//}
	//response.SucessResp(r).SetData(id).Log("资源文件新增数据", req).WriteJsonExit()
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
	entity, err := rmp_fileService.SelectRecordById(id)

	if err != nil || entity == nil {
		response.ErrorTpl(r).WriteTpl(g.Map{
			"desc": "数据不存在",
		})
		return
	}

	response.BuildTpl(r, "module/rmp_file/edit.html").WriteTpl(g.Map{
		"rmp_file": entity,
	})
}

//修改页面保存
func EditSave(r *ghttp.Request) {
	var req rmp_fileModel.EditReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Edit).SetMsg(err.Error()).Log("资源文件修改数据", req).WriteJsonExit()
	}

	rs, err := rmp_fileService.EditSave(&req, r.Session)

	if err != nil || rs <= 0 {
		response.ErrorResp(r).SetBtype(model.Buniss_Edit).Log("资源文件修改数据", req).WriteJsonExit()
	}
	response.SucessResp(r).SetBtype(model.Buniss_Edit).Log("资源文件修改数据", req).WriteJsonExit()
}

//删除数据
func Remove(r *ghttp.Request) {
	var req *model.RemoveReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Del).SetMsg(err.Error()).Log("资源文件删除数据", req).WriteJsonExit()
	}

	rs := rmp_fileService.DeleteRecordByIds(req.Ids)

	if rs > 0 {
		response.SucessResp(r).SetBtype(model.Buniss_Del).Log("资源文件删除数据", req).WriteJsonExit()
	} else {
		response.ErrorResp(r).SetBtype(model.Buniss_Del).Log("资源文件删除数据", req).WriteJsonExit()
	}
}

//导出
func Export(r *ghttp.Request) {
	var req *rmp_fileModel.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).Log("资源文件导出数据", req).WriteJsonExit()
	}
	url, err := rmp_fileService.Export(req)

	if err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Other).Log("资源文件导出数据", req).WriteJsonExit()
	}
	response.SucessResp(r).SetBtype(model.Buniss_Other).SetMsg(url).WriteJsonExit()
}


//上传单个文件
func UploadFile(r *ghttp.Request, fileName string){
	files := recvfile.GetUploadFile(r,fileName)
	savedir:= rmp_pathtools.GetTmpPath()
	names, err := files.Save(savedir,true)
	if err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Other).Log("上传文件失败","" ).WriteJsonExit()
	}
	response.SucessResp(r).SetBtype(model.Buniss_Other).Log("上传文件成功","" ).SetData(g.Map{"name":names}).WriteJsonExit()
}


func UploadPrevPic(r *ghttp.Request){
		UploadFile(r, "pic_upload")
}

func UploadPrevVideo(r *ghttp.Request){
	UploadFile(r, "prev_upload")
}

func UploadRmpFile(r *ghttp.Request){
	UploadFile(r, "resfile")
}
