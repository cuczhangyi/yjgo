// ==========================================================================
// 云捷GO自动生成路由代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-14 15:27:27
// 生成路径: app/controller/module/rmp_type_router.go
// 生成人：张一
// ==========================================================================
package module

import (
	"yj-app/app/controller/module/rmp_type"
	"yj-app/app/service/middleware/auth"
	"yj-app/app/service/middleware/router"
)

//加载路由
func init() {
	g1 := router.New("admin", "/module/rmp_type", auth.Auth)
	g1.GET("/", "module:rmp_type:view", rmp_type.List)
	g1.POST("/list", "module:rmp_type:list", rmp_type.ListAjax)
	g1.GET("/add", "module:rmp_type:add", rmp_type.Add)
	g1.POST("/add", "module:rmp_type:add", rmp_type.AddSave)
	g1.GET("/remove", "module:rmp_type:remove", rmp_type.Remove)
	g1.GET("/edit", "module:rmp_type:edit", rmp_type.Edit)
	g1.POST("/edit", "module:rmp_type:edit", rmp_type.EditSave)
	g1.POST("/export", "module:rmp_type:export", rmp_type.Export)
	g1.GET("/listMetadata", "module:rmp_type:edit", rmp_type.ListMetadata)
	g1.POST("/getlistmetadata","module:rmp_type:edit",rmp_type.Getlistmetadata)
}
