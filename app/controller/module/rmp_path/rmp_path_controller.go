// ==========================================================================
// 云捷GO自动生成控制器相关代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-13 11:25:57
// 生成路径: app/controller/module/rmp_path/rmp_path_controller.go
// 生成人：yunjie
// ==========================================================================
package rmp_path

import (
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"yj-app/app/model"
	rmp_pathModel "yj-app/app/model/module/rmp_path"
	rmp_pathService "yj-app/app/service/module/rmp_path"
	"yj-app/app/utils/response"
)

//列表页
func List(r *ghttp.Request) {
	response.BuildTpl(r, "module/rmp_path/list.html").WriteTpl()
}

//列表分页数据
func ListAjax(r *ghttp.Request) {
	var req *rmp_pathModel.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).SetMsg(err.Error()).Log("rmp_path管理", req).WriteJsonExit()
	}
	req.DelFlag ="0"
	rows := make([]rmp_pathModel.Entity, 0)
	result, err := rmp_pathService.SelectListAll(req)

	if err == nil && len(result)>0 {
		rows = result
	}

	//response.BuildTable(r, page.Total, rows).WriteJsonExit()
	r.Response.WriteJsonExit(rows)
}

//新增页面
func Add(r *ghttp.Request) {
	parentid := r.GetQueryInt64("id")
	if parentid  == 0{
		parentid = 100000
	}
	tmp := rmp_pathService.SelectPathById(parentid)
	response.BuildTpl(r, "module/rmp_path/add.html").WriteTpl(g.Map{"parentinfo":tmp})
}

//新增页面保存
func AddSave(r *ghttp.Request) {
	var req *rmp_pathModel.AddReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Add).SetMsg(err.Error()).Log("文件夹结构新增数据", req).WriteJsonExit()
	}
	id, err := rmp_pathService.AddSave(req, r.Session)
	if err != nil || id <= 0 {
		response.ErrorResp(r).SetBtype(model.Buniss_Add).Log("文件夹结构新增数据", req).WriteJsonExit()
	}

	response.SucessResp(r).SetData(id).Log("文件夹结构新增数据", req).WriteJsonExit()
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

	entity := rmp_pathService.SelectPathById(id)

	if  entity == nil {
		response.ErrorTpl(r).WriteTpl(g.Map{
			"desc": "数据不存在",
		})
		return
	}

	if entity.ParentId == 0 {
		entity.ParentName = "顶级目录"
	}

	response.BuildTpl(r, "module/rmp_path/edit.html").WriteTpl(g.Map{
		"rmp_path": entity,
	})
}

//修改页面保存
func EditSave(r *ghttp.Request) {
	var req rmp_pathModel.EditReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Edit).SetMsg(err.Error()).Log("文件夹结构修改数据", req).WriteJsonExit()
	}
	rs, err := rmp_pathService.EditSave(&req, r.Session)
	if err != nil || rs <= 0 {
		response.ErrorResp(r).SetBtype(model.Buniss_Edit).Log("文件夹结构修改数据", req).WriteJsonExit()
	}
	response.SucessResp(r).SetBtype(model.Buniss_Edit).Log("文件夹结构修改数据", req).WriteJsonExit()
}

//删除数据
func Remove(r *ghttp.Request) {
	//var req *model.RemoveReq
	////获取参数
	//if err := r.Parse(&req); err != nil {
	//	response.ErrorResp(r).SetBtype(model.Buniss_Del).SetMsg(err.Error()).Log("文件夹结构删除数据", req).WriteJsonExit()
	//}

	id := r.GetQueryInt64("id")

	rs , err:= rmp_pathService.DeletePathById(id);
	if err == nil &&  rs > 0{
		response.SucessResp(r).SetBtype(model.Buniss_Del).Log("文件夹结构删除数据", g.Map{"id":id}).WriteJsonExit()
	} else
	{
		response.ErrorResp(r).SetBtype(model.Buniss_Del).Log("文件夹结构删除数据",  g.Map{"id":id}).WriteJsonExit()
	}

	//rs := rmp_pathService.DeleteRecordByIds(req.Ids)

	//if rs > 0 {
	//	response.SucessResp(r).SetBtype(model.Buniss_Del).Log("文件夹结构删除数据", req).WriteJsonExit()
	//} else {
	//	response.ErrorResp(r).SetBtype(model.Buniss_Del).Log("文件夹结构删除数据", req).WriteJsonExit()
	//}
}

//导出
func Export(r *ghttp.Request) {
	var req *rmp_pathModel.SelectPageReq
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.ErrorResp(r).Log("文件夹结构导出数据", req).WriteJsonExit()
	}
	url, err := rmp_pathService.Export(req)

	if err != nil {
		response.ErrorResp(r).SetBtype(model.Buniss_Other).Log("文件夹结构导出数据", req).WriteJsonExit()
	}
	response.SucessResp(r).SetBtype(model.Buniss_Other).SetMsg(url).WriteJsonExit()
}


//加载树状结构
func TreeData(r *ghttp.Request) {
	result, _ := rmp_pathService.SelectPathTree(0, "", "")
	r.Response.WriteJsonExit(result)
}


//加载部门列表树选择页面
func Selectrmp_pathTree(r *ghttp.Request) {
	pathId := r.GetQueryInt64("treeId")
	pathPoint := rmp_pathService.SelectPathById(pathId)

	if pathPoint != nil {
		response.BuildTpl(r, "module/rmp_path/tree.html").WriteTpl(g.Map{
			"path": *pathPoint,
		})
	} else {
			response.BuildTpl(r, "module/rmp_path/tree.html").WriteTpl()
	}
}
