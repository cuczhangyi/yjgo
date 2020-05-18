// ==========================================================================
// 云捷GO自动生成路由代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-18 17:22:57
// 生成路径: app/controller/module/rmp_file_router.go
// 生成人：张大方
// ==========================================================================
package module

import (
	"yj-app/app/controller/module/rmp_file"
	"yj-app/app/service/middleware/auth"
	"yj-app/app/service/middleware/router"
)

//加载路由
func init() {
	g1 := router.New("admin", "/module/rmp_file", auth.Auth)
	g1.GET("/", "module:rmp_file:view", rmp_file.List)
	g1.POST("/list", "module:rmp_file:list", rmp_file.ListAjax)
	g1.GET("/add", "module:rmp_file:add", rmp_file.Add)
	g1.POST("/add", "module:rmp_file:add", rmp_file.AddSave)
	g1.GET("/remove", "module:rmp_file:remove", rmp_file.Remove)
	g1.GET("/edit", "module:rmp_file:edit", rmp_file.Edit)
	g1.POST("/edit", "module:rmp_file:edit", rmp_file.EditSave)
	g1.POST("/export", "module:rmp_file:export", rmp_file.Export)
}
