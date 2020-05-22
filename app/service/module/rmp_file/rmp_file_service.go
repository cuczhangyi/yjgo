// ==========================================================================
// 云捷GO自动生成业务逻辑层相关代码，只生成一次，按需修改,再次生成不会覆盖.
// 生成日期：2020-05-18 17:22:57
// 生成路径: app/service/module/rmp_file/rmp_file_service.go
// 生成人：张大方
// ==========================================================================
package rmp_file

import (
	"github.com/gogf/gf/container/garray"
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gfile"
	"github.com/gogf/gf/os/gtime"
	"os"
	"strings"
	"sync"
	rmp_fileModel "yj-app/app/model/module/rmp_file"
	userService "yj-app/app/service/system/user"
	"yj-app/app/utils/convert"
	"yj-app/app/utils/excel"
	"yj-app/app/utils/page"
	"yj-app/app/utils/rmp_pathtools"
)


//根据主键查询数据
func SelectRecordById(id int64) (*rmp_fileModel.Entity, error) {
	return rmp_fileModel.FindOne("id", id)
}

//根据主键删除数据
func DeleteRecordById(id int64) bool {
	result, err := rmp_fileModel.Delete("id", id)
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
	result, err := rmp_fileModel.Delete("id in (?)", idarr)
	if err != nil {
		return 0
	}

	nums, _ := result.RowsAffected()

	return nums
}

//添加数据
func AddSave(req *rmp_fileModel.AddReq, session *ghttp.Session) (int64, error) {
	var entity rmp_fileModel.Entity
	 
	entity.FileName = req.FileName
	entity.FileExt = req.FileExt  
	entity.StoreList = req.StoreList  
	entity.PrevFilePic = req.PrevFilePic  
	entity.PrevFileVideo = req.PrevFileVideo  
	entity.RmpTypeId = req.RmpTypeId  
	entity.MetaData = req.MetaData  
	entity.PathId = req.PathId  
	entity.IsPackage = req.IsPackage  
	entity.ParentId = req.ParentId  
	entity.Status = req.Status  
	entity.DelFlag = req.DelFlag          
	entity.Remark = req.Remark 
	entity.CreateTime = gtime.Now()
	entity.CreateBy = ""

	user := userService.GetProfile(session)

	if user != nil {
		entity.CreateBy = user.LoginName
	}

	result, err := entity.Insert()
	if err != nil {
		return 0, err
	}

	id, err := result.LastInsertId()

	if err != nil || id <= 0 {
		return 0, err
	}
	return id, nil
}


func AddSaveExtend(req *rmp_fileModel.ExtendAddReq, session *ghttp.Session) (int64, error){
	filePath := req.Rmpfile
	fileSavePath := rmp_pathtools.GetFileSavePath()
	picSavePath := rmp_pathtools.GetPrevPicSavePath()
	videoSavePath := rmp_pathtools.GetPrevVideoSavePath()
	mapInfo:= gmap.NewStrAnyMap(true)
	filesavepath, err:= rmp_pathtools.CopyTmpFileToStorelist(filePath,fileSavePath,true)
	if  err != nil{
		return 0, err
	}
	prevPic, err:= rmp_pathtools.CopyTmpFileToStorelist(req.PrevFilePic,picSavePath,true)
	if  err != nil{
		return 0, err
	}
	prevVideo, err:= rmp_pathtools.CopyTmpFileToStorelist(req.PrevFileVideo,videoSavePath,true)
	if  err != nil{
		return 0, err
	}
	mapInfo.Set("file_name", req.FileName)
	mapInfo.Set("file_ext",gfile.Ext(filesavepath))
	mapInfo.Set("store_list",filesavepath)
	mapInfo.Set("prev_file_pic",prevPic)
	mapInfo.Set("prev_file_video",prevVideo)
	mapInfo.Set("rmp_type_id",req.RmpTypeId)
	mapInfo.Set("meta_data","[]")
	mapInfo.Set("path_id",req.PathId)
	mapInfo.Set("create_time",gtime.Datetime())
	user := userService.GetProfile(session)
	if user != nil {
		mapInfo.Set("create_by",user.UserId)
	}
	rs, err:=rmp_fileModel.Insert(mapInfo.Map())
	if err != nil {
		return 0,err
	}
	lastId ,err :=rs.LastInsertId()
	return lastId, nil
}

//修改数据
func EditSave(req *rmp_fileModel.EditReq, session *ghttp.Session) (int64, error) {

	entity, err := rmp_fileModel.FindOne("id=?", req.Id)

	if err != nil {
		return 0, err
	}

	if entity == nil {
		return 0, gerror.New("数据不存在")
	}
	   
	entity.FileName = req.FileName  
	entity.FileExt = req.FileExt  
	entity.StoreList = req.StoreList  
	entity.PrevFilePic = req.PrevFilePic  
	entity.PrevFileVideo = req.PrevFileVideo  
	entity.RmpTypeId = req.RmpTypeId  
	entity.MetaData = req.MetaData  
	entity.PathId = req.PathId  
	entity.IsPackage = req.IsPackage  
	entity.ParentId = req.ParentId  
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


func getPrevPath(path *string){
	array := rmp_pathtools.GetStoreList()
	picPath:= rmp_pathtools.GetPrevPicSavePath()
	picPath = strings.Trim(picPath,"/")
	prefix := g.Cfg().GetString("store.urlprev")
	prefix = strings.Trim(prefix,"/")
	finded := false
	if *path != "" {
		for i := 0; i < array.Len(); i++ {

			savePath :=  array.Get(i).(string);
			savePath = strings.Trim(savePath, "/")
			savePath += "/"+picPath+"/"+*path
			if _, err := os.Stat(savePath); err == nil {
				finded = true
				if i == 0 {
					*path = "/"+prefix+"/"+picPath+"/"+*path
				}else {
					*path = rmp_pathtools.GetOSSUrlFile(*path)
				}
				break
			}
		}
	}
	if !finded{
		*path = g.Cfg().GetString("defaultinfo.prevpic");
	}
}



func CollectPrev(wg *sync.WaitGroup,entity *rmp_fileModel.ExtendEntity, index int64, array *garray.Array) bool{
	defer wg.Done()
	getPrevPath(&entity.PrevFilePic)
	array.Append(entity)
	return true
}

//根据条件查询数据
func SelectListAll(params *rmp_fileModel.SelectPageReq) ([]rmp_fileModel.Entity, error) {
	result, err:= rmp_fileModel.SelectListAll(params)
	if err != nil{
		return nil, err
	}
	return result, err
}

//根据条件分页查询数据
func SelectListByPage(params *rmp_fileModel.SelectPageReq) ([]rmp_fileModel.ExtendEntity, *page.Paging, error) {
	items , page, err := rmp_fileModel.SelectListByPage(params)
	arReturn := garray.New(true)
	wg := new(sync.WaitGroup)
	for k, _ := range items {
			v:= k
			wg.Add(1)
			go CollectPrev(wg,&items[v],0, arReturn)
	}
	wg.Wait()
	return items, page, err
}

// 导出excel
func Export(param *rmp_fileModel.SelectPageReq) (string, error) {
	result, err := rmp_fileModel.SelectListExport(param)
	if err != nil {
		return "", err
	}
	head := []string{  "文件id" ,"文件名称" ,"文件后缀名" ,"存储位置" ,"预览图片" ,"预览视频" ,"资源类型" ,"meta_data" ,"路径id" ,"是否为文件包（0不是 1是）" ,"父级文件id(文件包专用)" ,"文件状态（0正常 00000001自身停用, 00000010父级停用, 00000100分类停用, 00001000路径停用）" ,"删除标志（0正常 00000001自身删除, 00000010父级删除, 00000100分类删除, 00001000路径删除）" ,"创建者" ,"创建时间" ,"更新者" ,"更新时间" ,"备注"}
	key := []string{  "id" ,"file_name" ,"file_ext" ,"store_list" ,"prev_file_pic" ,"prev_file_video" ,"rmp_type_id" ,"meta_data" ,"path_id" ,"is_package" ,"parent_id" ,"status" ,"del_flag" ,"create_by" ,"create_time" ,"update_by" ,"update_time" ,"remark"}
	url, err := excel.DownlaodExcel(head,key, result)
	if err != nil {
		return "", err
	}
	return url, nil
}

//type TestStruct struct {
//	nInfo int64
//	strTest string
//	item    []int
//}

//func testItem( wg *sync.WaitGroup,a *TestStruct, array *garray.Array, intId int64){
//	defer  wg.Done()
//	a.nInfo = intId+10
//	array.Append(a)
//}

//func TestgArray(){
//	array := garray.New(true)
//	wg := new(sync.WaitGroup)
//	for i := 0; i < 10; i++  {
//		v := i
//		entity := TestStruct{int64(v),"test", nil}
//		wg.Add(1)
//		go testItem(wg,&entity,array,int64(v))
//
//	}
//	wg.Wait();
//	len := array.Len()
//	returnData := make([]TestStruct,len,len)
//	array.Iterator(func(k int, v interface{}) bool  {
//		returnData[k] = *(v.(*TestStruct))
//		return true
//	})
//	fmt.Println(returnData)
//}