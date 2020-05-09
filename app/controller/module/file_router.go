// ==========================================================================
// 云捷GO自动生成路由代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-09 11:25:39
// 生成路径: app/controller/module/file_router.go
// 生成人：yunjie
// ==========================================================================
package module

import (
	"yj-app/app/controller/module/file"
	"yj-app/app/service/middleware/auth"
	"yj-app/app/service/middleware/router"
)

//加载路由
func init() {
	g1 := router.New("admin", "/module/file", auth.Auth)
	g1.GET("/", "module:file:view", file.List)
	g1.POST("/list", "module:file:list", file.ListAjax)
	g1.GET("/add", "module:file:add", file.Add)
	g1.POST("/add", "module:file:add", file.AddSave)
	g1.POST("/remove", "module:file:remove", file.Remove)
	g1.GET("/edit", "module:file:edit", file.Edit)
	g1.POST("/edit", "module:file:edit", file.EditSave)
	g1.POST("/export", "module:file:export", file.Export)
}
