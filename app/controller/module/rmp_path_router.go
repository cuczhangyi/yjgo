// ==========================================================================
// 云捷GO自动生成路由代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-13 11:25:57
// 生成路径: app/controller/module/rmp_path_router.go
// 生成人：yunjie
// ==========================================================================
package module

import (
	"yj-app/app/controller/module/rmp_path"
	"yj-app/app/service/middleware/auth"
	"yj-app/app/service/middleware/router"
)

//加载路由
func init() {
	g1 := router.New("admin", "/module/rmp_path", auth.Auth)
	g1.GET("/", "module:rmp_path:view", rmp_path.List)
	g1.POST("/list", "module:rmp_path:list", rmp_path.ListAjax)
	g1.GET("/add", "module:rmp_path:add", rmp_path.Add)
	g1.GET("/selectrmp_pathTree", "module:rmp_path:view", rmp_path.Selectrmp_pathTree)
	g1.POST("/add", "module:rmp_path:add", rmp_path.AddSave)
	g1.GET("/remove", "module:rmp_path:remove", rmp_path.Remove)
	g1.GET("/edit", "module:rmp_path:edit", rmp_path.Edit)
	g1.POST("/edit", "module:rmp_path:edit", rmp_path.EditSave)
	g1.POST("/export", "module:rmp_path:export", rmp_path.Export)
	g1.GET("/treeData", "module:rmp_path:view", rmp_path.TreeData)
}
