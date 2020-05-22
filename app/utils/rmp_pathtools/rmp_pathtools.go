package rmp_pathtools

import (
	"github.com/gogf/gf/container/garray"
	"github.com/gogf/gf/container/gvar"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gcache"
	"github.com/gogf/gf/os/gfile"
	"github.com/gogf/gf/os/gtime"
	"io"
	"os"
	"strconv"
	"strings"
)


func GetTmpPath()string{

	cachePath := gcache.Get("tmpsavepath")
	if  cachePath != nil{
		return cachePath.(string)
	} else {
		configPath := g.Cfg("").GetString("store.tmpsavepath")
		gcache.Set("tmpsavepath",configPath,0)
		return configPath
	}
}

func GetStoreList() *garray.Array {
	ar:= gcache.Get("storeList")
	if ar == nil {
		storeCount := int(g.Cfg().GetInt64("store.count"));
		array:= garray.NewArray(true)
		for i:=0 ; i< int(storeCount); i++  {
			strConfig := "store.store"+strconv.Itoa(i+1)
			store1  := g.Cfg().GetString(strConfig)
			array.Append(store1)
		}
		gcache.Set("storeList",array,0)
		return array
	} else{
		return ar.(*garray.Array)
	}
}

func CopyFile(dstName, srcName string) (written int64, err error) {
	src, err := os.Open(srcName)
	if err != nil {
		return
	}
	defer src.Close()
	dst, err := os.OpenFile(dstName, os.O_WRONLY|os.O_CREATE, 0644)
	if err != nil {
		return
	}
	defer dst.Close()
	return io.Copy(dst, src)
}

func GetPrevPicSavePath()string{
	pic := gcache.Get("picSave")
	if pic == nil {
		storeCount := g.Cfg().GetString("store.prevpic");
		gcache.Set("picSave",storeCount,0)
		return storeCount
	}
	return pic.(string)
}


func GetPrevVideoSavePath()string{
	pic := gcache.Get("videoSave")
	if pic == nil {
		storeCount := g.Cfg().GetString("store.prevvideo");
		gcache.Set("videoSave",storeCount,0)
		return storeCount
	}
	return pic.(string)
}

func GetFileSavePath()string{
	pic := gcache.Get("fileSave")
	if pic == nil {
		storeCount := g.Cfg().GetString("store.filesave");
		gcache.Set("fileSave",storeCount,0)
		return storeCount
	}
	return pic.(string)
}

func CopyTmpFileToStorelist(filePath string, dir string, isDataFolder bool) (string,error){
	tmpPath := GetTmpPath()
	filesavePath := strings.Trim( dir,"/")
	destFilePath := strings.Trim( filePath,"/")
	returnStr := destFilePath;

	if isDataFolder == true {
		destFilePath =filesavePath+"/"+gtime.Date()
		returnStr = gtime.Date()+"/"+returnStr;
	} else {
		destFilePath = filesavePath
	}

	srcFile := tmpPath+filePath
	_, err:=os.Stat(srcFile)
	if err != nil {
		return "",err;
	}
	isOk :=gvar.New(true,true);
	storeList:= GetStoreList()
	storeList.Iterator(func(k int, v interface{}) bool {
		dstfile := v.(string)
		dstfile= strings.Trim(dstfile, "/")
		destFilePathnew := dstfile+"/"+destFilePath
		if !gfile.Exists(destFilePathnew) {
			err:= gfile.Mkdir(destFilePathnew)
			if err != nil {
				isOk.Set(false)
				return false
			}
		}
		destfilePath := destFilePathnew+"/"+filePath
		_,err := CopyFile(destfilePath,srcFile)
		if  err != nil{
			isOk.Set(false)
			return false
		}
		return true
	})
	if !isOk.Bool() {
		return "" ,gerror.New("拷贝失败")
	}
	return returnStr ,nil
}


func GetOSSUrlFile(filePath string) string{
	ossUrl := gcache.Get("urloss").(string)
	if ossUrl == "" {
		ossUrl = g.Cfg().GetString("store.urloss");
		gcache.Set("urloss",ossUrl,0);
	}
	ossUrl = strings.Trim("ossUrl","/")
	ossUrl+="/"+filePath
	return ossUrl
}