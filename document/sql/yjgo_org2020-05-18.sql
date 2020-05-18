/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50726
Source Host           : 127.0.0.1:3306
Source Database       : idprmp

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-05-18 16:51:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('53', 't_answer', '回复表', 'answer', 'crud', 'yj-app', 'module', 'answer', '回复', 'yunjie', '', 'admin', '2020-03-12 18:05:41', 'admin', '2020-05-09 11:22:45', '');
INSERT INTO `gen_table` VALUES ('54', 'tbl_file', '文件表', 'tbl_file', 'crud', 'yj-app', 'module', 'file', '文件管理', 'yunjie', '', 'admin', '2020-05-09 11:25:39', 'admin', '2020-05-09 11:26:34', '');
INSERT INTO `gen_table` VALUES ('58', 'rmp_path', '文件夹结构', 'rmp_path', 'crud', 'yj-app', 'module', 'rmp_path', '文件夹结构', 'yunjie', '{\"treeCode\":\"path_id\",\"treeParentCode\":\"parent_id\",\"treeName\":\"path_name\"}', 'admin', '2020-05-13 11:25:57', 'admin', '2020-05-13 11:46:41', '');
INSERT INTO `gen_table` VALUES ('59', 'rmp_type', '资源类型', 'rmp_type', 'crud', 'yj-app', 'module', 'rmp_type', '资源类型', '张一', '', 'admin', '2020-05-14 15:27:27', 'admin', '2020-05-14 16:08:09', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `go_type` varchar(500) DEFAULT NULL COMMENT 'Go类型',
  `go_field` varchar(200) DEFAULT NULL COMMENT 'Go字段名',
  `html_field` varchar(200) DEFAULT NULL COMMENT 'html字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=632 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('557', '53', 'id', '主键', 'bigint(20)', 'int64', 'Id', 'id', '1', '1', '0', '1', '0', '0', '0', 'EQ', 'input', '', '1', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('558', '53', 'pid', '问题ID', 'bigint(20)', 'int64', 'Pid', 'pid', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('559', '53', 'atype', '回复人类别', 'tinyint(1)', 'int', 'Atype', 'atype', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', '3', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('560', '53', 'user_id', '回复人ID', 'bigint(20)', 'int64', 'UserId', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('561', '53', 'nick_name', '回复人名称', 'varchar(50)', 'string', 'NickName', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '5', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('562', '53', 'avatar', '回复人头像', 'varchar(50)', 'string', 'Avatar', 'avatar', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '6', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('563', '53', 'remark', '回复内容', 'tinytext', 'string', 'Remark', 'remark', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', '7', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('564', '53', 'img1', '回复图片1', 'varchar(100)', 'string', 'Img1', 'img1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('565', '53', 'img2', '回复图片2', 'varchar(100)', 'string', 'Img2', 'img2', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('566', '53', 'img3', '回复图片3', 'varchar(100)', 'string', 'Img3', 'img3', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '10', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('567', '53', 'status', '状态', 'tinyint(1)', 'int', 'Status', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', '11', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('568', '53', 'create_time', '创建时间', 'datetime', 'Time', 'CreateTime', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '12', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('569', '53', 'update_time', '更新时间', 'datetime', 'Time', 'UpdateTime', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '13', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('570', '54', 'id', '文件id', 'int(11)', 'int64', 'Id', 'id', '1', '1', '0', '0', '1', '1', '0', 'EQ', 'input', '', '1', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('571', '54', 'file_sha1', '文件hash', 'char(40)', 'string', 'FileSha1', 'fileSha1', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '2', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('572', '54', 'file_name', '文件名', 'varchar(256)', 'string', 'FileName', 'fileName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '3', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('573', '54', 'file_size', '文件大小', 'bigint(20)', 'int64', 'FileSize', 'fileSize', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('574', '54', 'file_addr', '文件存储位置', 'varchar(1024)', 'string', 'FileAddr', 'fileAddr', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('575', '54', 'create_by', '创建者', 'varchar(64)', 'string', 'CreateBy', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '6', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('576', '54', 'create_time', '创建时间', 'datetime', 'Time', 'CreateTime', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '7', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('577', '54', 'update_by', '更新者', 'varchar(64)', 'string', 'UpdateBy', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '8', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('578', '54', 'update_time', '更新时间', 'datetime', 'Time', 'UpdateTime', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '9', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('579', '54', 'remark', '备注', 'varchar(255)', 'string', 'Remark', 'remark', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', '10', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('610', '58', 'path_id', '路径id', 'int(11)', 'int64', 'PathId', 'pathId', '1', '1', '0', '0', '0', '1', '1', 'EQ', 'input', '', '1', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('611', '58', 'path_name', '路径名称', 'varchar(256)', 'string', 'PathName', 'pathName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('612', '58', 'parent_id', '父级路径id', 'int(11)', 'int64', 'ParentId', 'parentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('613', '58', 'ancestors', '祖级列表', 'varchar(256)', 'string', 'Ancestors', 'ancestors', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('614', '58', 'status', '角色状态（0正常 1停用）', 'char(1)', 'string', 'Status', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_common_status', '5', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('615', '58', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'string', 'DelFlag', 'delFlag', '0', '0', '0', '0', '0', '0', '1', 'EQ', 'radio', 'sys_yes_no', '6', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('616', '58', 'create_by', '创建者', 'varchar(64)', 'string', 'CreateBy', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '7', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('617', '58', 'create_time', '创建时间', 'datetime', 'Time', 'CreateTime', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '8', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('618', '58', 'update_by', '更新者', 'varchar(64)', 'string', 'UpdateBy', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '9', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('619', '58', 'update_time', '更新时间', 'datetime', 'Time', 'UpdateTime', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '10', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('620', '58', 'remark', '备注', 'varchar(255)', 'string', 'Remark', 'remark', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', '11', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('621', '59', 'id', '类型id', 'int(11)', 'int64', 'Id', 'id', '1', '1', '0', '0', '0', '0', '0', 'EQ', 'input', '', '1', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('622', '59', 'type_name', '类型名称', 'char(40)', 'string', 'TypeName', 'typeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('623', '59', 'type_ext', '文件后缀名', 'varchar(256)', 'string', 'TypeExt', 'typeExt', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('624', '59', 'meta_data_field', 'metadata', 'longtext', 'string', 'MetaDataField', 'metaDataField', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', '4', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('625', '59', 'status', '类型状态（0正常 1停用）', 'char(1)', 'string', 'Status', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', '5', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('626', '59', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'string', 'DelFlag', 'delFlag', '0', '0', '0', '0', '0', '0', '1', 'EQ', 'input', '', '6', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('627', '59', 'create_by', '创建者', 'varchar(64)', 'string', 'CreateBy', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '7', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('628', '59', 'create_time', '创建时间', 'datetime', 'Time', 'CreateTime', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '8', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('629', '59', 'update_by', '更新者', 'varchar(64)', 'string', 'UpdateBy', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '9', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('630', '59', 'update_time', '更新时间', 'datetime', 'Time', 'UpdateTime', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', '10', 'admin', null, '', null);
INSERT INTO `gen_table_column` VALUES ('631', '59', 'remark', '备注', 'varchar(255)', 'string', 'Remark', 'remark', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', '11', 'admin', null, '', null);

-- ----------------------------
-- Table structure for rmp_file
-- ----------------------------
DROP TABLE IF EXISTS `rmp_file`;
CREATE TABLE `rmp_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `file_name` char(40) NOT NULL DEFAULT '' COMMENT '文件名称',
  `file_ext` varchar(256) NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `store_list` longtext COMMENT '存储位置',
  `prev_file_pic` varchar(256) NOT NULL DEFAULT '' COMMENT '预览图片',
  `prev_file_video` varchar(256) NOT NULL DEFAULT '' COMMENT '预览视频',
  `rmp_type_id` int(11) NOT NULL COMMENT '资源类型',
  `meta_data` text NOT NULL COMMENT 'meta_data',
  `path_id` int(11) NOT NULL DEFAULT '0' COMMENT '路径id',
  `is_package` char(1) NOT NULL COMMENT '是否为文件包（0不是 1是）',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级文件id(文件包专用)',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源文件';

-- ----------------------------
-- Records of rmp_file
-- ----------------------------

-- ----------------------------
-- Table structure for rmp_path
-- ----------------------------
DROP TABLE IF EXISTS `rmp_path`;
CREATE TABLE `rmp_path` (
  `path_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路径id',
  `path_name` varchar(256) NOT NULL DEFAULT '' COMMENT '路径名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级路径id',
  `ancestors` varchar(256) NOT NULL DEFAULT '0' COMMENT '祖级列表',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`path_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100007 DEFAULT CHARSET=utf8 COMMENT='文件夹结构';

-- ----------------------------
-- Records of rmp_path
-- ----------------------------
INSERT INTO `rmp_path` VALUES ('100000', '根目录', '0', '0', '0', '0', 'admin', '2020-05-13 17:18:59', '', null, '12');
INSERT INTO `rmp_path` VALUES ('100001', '222', '0', '0', '0', '', 'admin', '2020-05-13 18:39:00', '', null, '3232');
INSERT INTO `rmp_path` VALUES ('100003', '222', '100000', '', '0', '2', 'admin', '2020-05-13 18:48:57', '', '2020-05-14 11:47:28', '2222');
INSERT INTO `rmp_path` VALUES ('100004', '测试编辑', '100003', '0,100000,100003', '0', '2', 'admin', '2020-05-14 11:41:28', '', null, '测试编辑备注');
INSERT INTO `rmp_path` VALUES ('100005', '你们好', '100004', '', '0', '0', 'admin', '2020-05-14 11:44:43', '', '2020-05-14 12:12:56', '你们好');
INSERT INTO `rmp_path` VALUES ('100006', '22222', '100000', '0,100000', '0', '0', 'admin', '2020-05-14 14:38:08', '', null, '2232121');

-- ----------------------------
-- Table structure for rmp_type
-- ----------------------------
DROP TABLE IF EXISTS `rmp_type`;
CREATE TABLE `rmp_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `type_name` char(40) NOT NULL DEFAULT '' COMMENT '类型名称',
  `type_ext` varchar(256) NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `meta_data_field` longtext COMMENT 'metadata',
  `status` char(1) NOT NULL COMMENT '类型状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='资源类型';

-- ----------------------------
-- Records of rmp_type
-- ----------------------------
INSERT INTO `rmp_type` VALUES ('1', '图片', 'bmp,png,jpg,jpeg', '[{\"name\":\"城市\",\"code\":\"city\",\"values\":\"1,343\"},{\"name\":\"学校\",\"code\":\"school\",\"values\":\"\"}]', '1', '0', '', '2020-05-13 18:39:00', '', null, null);
INSERT INTO `rmp_type` VALUES ('2', '测试文件', 'clp,pkg,new', '222', '0', '0', '', '2020-05-13 18:39:00', '', '2020-05-15 14:21:57', '000');
INSERT INTO `rmp_type` VALUES ('3', '32', 'as,www,万维网', '111', '1', '0', 'admin', '2020-05-14 16:53:13', '', '2020-05-15 14:21:36', '33');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', '', '2020-02-12 15:32:15', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', '', '2020-02-05 10:46:28', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES ('4', '静态资源网盘存储', 'sys.resource.url', '', 'Y', 'admin', '2020-02-18 20:10:33', '', '2020-02-19 10:36:22', 'public目录下的静态资源存储到OSS/COS等网盘，如果不存储设为null，设置网址即开始');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '云捷网络', '0', 'admin', '15888888888', '110@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('110', '100', '0,100', '运维部门', '1', '', '', '', '1', '0', 'admin', '2019-12-02 17:07:02', 'admin', '2020-05-13 14:35:30');
INSERT INTO `sys_dept` VALUES ('111', '110', ' case dept_id when 111 then 0,100,110 end ', '2', '2', '2', '15342050992', 'zy@ideapool.tv', '0', '0', 'admin', '2020-05-13 14:23:15', '', null);
INSERT INTO `sys_dept` VALUES ('112', '100', ' case dept_id when 111 then 0,100,110 end ,111', '3', '2', '22', '13810446192', '12@qq.com', '0', '0', 'admin', '2020-05-13 14:35:52', 'admin', '2020-05-14 11:53:23');
INSERT INTO `sys_dept` VALUES ('113', '100', '0,100', '2', '22', '22', '13500871010', '122@11.com', '0', '0', 'admin', '2020-05-13 19:12:37', '', null);
INSERT INTO `sys_dept` VALUES ('114', '111', ' case dept_id when 111 then 0,100,110 end ,111', '2', '2', '2', '13098202222', '2@22.com', '0', '0', 'admin', '2020-05-13 19:13:32', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('29', '0', '免费用户', '0', 'zjuser_type', null, 'default', 'Y', '0', 'admin', '2019-12-02 16:56:16', 'admin', null, null);
INSERT INTO `sys_dict_data` VALUES ('30', '1', '付费用户', '1', 'zjuser_type', null, 'primary', 'Y', '0', 'admin', '2019-12-02 16:56:40', 'admin', null, null);
INSERT INTO `sys_dict_data` VALUES ('31', '0', '微信用户', '0', 'zxuser_type', null, 'default', 'Y', '0', 'admin', '2019-12-02 17:14:32', 'admin', null, null);
INSERT INTO `sys_dict_data` VALUES ('32', '1', 'QQ用户', '1', 'zxuser_type', null, 'primary', 'N', '0', 'admin', '2019-12-02 17:14:55', 'admin', null, null);
INSERT INTO `sys_dict_data` VALUES ('33', '2', '抖音用户', '2', 'zxuser_type', null, 'primary', 'N', '0', 'admin', '2019-12-02 17:15:21', 'admin', null, null);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('11', '专家用户类别', 'zjuser_type', '0', 'admin', '2019-12-02 16:55:42', 'admin', null, null);
INSERT INTO `sys_dict_type` VALUES ('12', '咨询用户类别', 'zxuser_type', '0', 'admin', '2019-12-02 17:14:07', 'admin', null, null);
INSERT INTO `sys_dict_type` VALUES ('13', '测试', 'test3dddd', '0', 'admin', '2020-02-05 16:23:06', '', null, '');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_params` varchar(200) DEFAULT '' COMMENT '参数',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '1' COMMENT '计划执行策略（1多次执行 2执行一次）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('10', 'test1', '', 'DEFAULT', 'test1', '* * * * * *', '1', '1', '1', 'admin', '2020-02-26 15:30:27', '', '2020-02-26 16:51:46', '');
INSERT INTO `sys_job` VALUES ('12', 'test2', 'helloworld|yjgo', 'DEFAULT', 'test2', '* * * * * *', '1', '1', '1', 'admin', '2020-02-27 10:20:26', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('22', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-01-24 22:19:09');
INSERT INTO `sys_logininfor` VALUES ('23', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-01-24 22:26:54');
INSERT INTO `sys_logininfor` VALUES ('24', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-01-26 08:40:56');
INSERT INTO `sys_logininfor` VALUES ('25', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-01-27 08:47:37');
INSERT INTO `sys_logininfor` VALUES ('26', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-01-27 08:59:04');
INSERT INTO `sys_logininfor` VALUES ('27', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-01-27 09:00:29');
INSERT INTO `sys_logininfor` VALUES ('28', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-01-27 17:00:10');
INSERT INTO `sys_logininfor` VALUES ('29', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-01-27 18:26:56');
INSERT INTO `sys_logininfor` VALUES ('30', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-01-29 10:05:36');
INSERT INTO `sys_logininfor` VALUES ('31', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-01-30 14:51:57');
INSERT INTO `sys_logininfor` VALUES ('32', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-01-31 12:38:31');
INSERT INTO `sys_logininfor` VALUES ('33', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-01 15:25:36');
INSERT INTO `sys_logininfor` VALUES ('34', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-01 15:25:58');
INSERT INTO `sys_logininfor` VALUES ('35', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-01 16:24:10');
INSERT INTO `sys_logininfor` VALUES ('36', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-01 19:25:02');
INSERT INTO `sys_logininfor` VALUES ('37', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-02 10:49:19');
INSERT INTO `sys_logininfor` VALUES ('38', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-02 15:33:37');
INSERT INTO `sys_logininfor` VALUES ('39', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-03 12:23:41');
INSERT INTO `sys_logininfor` VALUES ('40', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-03 12:39:47');
INSERT INTO `sys_logininfor` VALUES ('41', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-03 13:25:39');
INSERT INTO `sys_logininfor` VALUES ('42', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-04 13:44:06');
INSERT INTO `sys_logininfor` VALUES ('43', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-04 19:23:52');
INSERT INTO `sys_logininfor` VALUES ('44', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-05 10:44:57');
INSERT INTO `sys_logininfor` VALUES ('45', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-05 16:14:00');
INSERT INTO `sys_logininfor` VALUES ('46', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-06 14:05:33');
INSERT INTO `sys_logininfor` VALUES ('47', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-06 14:17:41');
INSERT INTO `sys_logininfor` VALUES ('48', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-06 14:22:26');
INSERT INTO `sys_logininfor` VALUES ('49', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-10 13:16:32');
INSERT INTO `sys_logininfor` VALUES ('50', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-10 17:17:56');
INSERT INTO `sys_logininfor` VALUES ('51', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-11 16:53:45');
INSERT INTO `sys_logininfor` VALUES ('52', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-14 17:23:20');
INSERT INTO `sys_logininfor` VALUES ('53', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-16 18:48:24');
INSERT INTO `sys_logininfor` VALUES ('54', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-17 15:47:25');
INSERT INTO `sys_logininfor` VALUES ('55', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-17 15:48:37');
INSERT INTO `sys_logininfor` VALUES ('56', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-17 15:55:01');
INSERT INTO `sys_logininfor` VALUES ('57', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-17 16:00:12');
INSERT INTO `sys_logininfor` VALUES ('58', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-18 09:17:26');
INSERT INTO `sys_logininfor` VALUES ('59', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-18 09:18:20');
INSERT INTO `sys_logininfor` VALUES ('60', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-18 11:07:14');
INSERT INTO `sys_logininfor` VALUES ('61', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-18 11:07:36');
INSERT INTO `sys_logininfor` VALUES ('62', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-18 11:08:12');
INSERT INTO `sys_logininfor` VALUES ('63', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-18 11:09:08');
INSERT INTO `sys_logininfor` VALUES ('64', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-18 11:17:34');
INSERT INTO `sys_logininfor` VALUES ('65', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-18 11:17:57');
INSERT INTO `sys_logininfor` VALUES ('66', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-18 15:41:46');
INSERT INTO `sys_logininfor` VALUES ('67', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-19 09:38:32');
INSERT INTO `sys_logininfor` VALUES ('68', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-19 09:41:08');
INSERT INTO `sys_logininfor` VALUES ('69', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-19 14:21:37');
INSERT INTO `sys_logininfor` VALUES ('70', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-19 14:27:47');
INSERT INTO `sys_logininfor` VALUES ('71', 'admin', '175.0.212.81', '深圳', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '账号或密码不正确', '2020-02-19 20:22:51');
INSERT INTO `sys_logininfor` VALUES ('72', 'admin', '175.0.212.81', '深圳', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-19 20:23:11');
INSERT INTO `sys_logininfor` VALUES ('73', 'admin', '175.0.212.81', '', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '账号或密码不正确', '2020-02-20 08:47:33');
INSERT INTO `sys_logininfor` VALUES ('74', 'admin', '175.0.212.81', '深圳', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-20 08:47:54');
INSERT INTO `sys_logininfor` VALUES ('75', 'admin', '175.0.212.81', '深圳', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '账号或密码不正确', '2020-02-20 09:04:52');
INSERT INTO `sys_logininfor` VALUES ('76', 'admin', '175.0.212.81', '深圳', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-20 09:05:02');
INSERT INTO `sys_logininfor` VALUES ('77', 'admin', '175.0.212.81', '深圳', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '账号或密码不正确', '2020-02-20 09:06:30');
INSERT INTO `sys_logininfor` VALUES ('78', 'admin', '175.0.212.81', '深圳', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-20 09:06:39');
INSERT INTO `sys_logininfor` VALUES ('79', 'admin', '175.0.212.81', '深圳', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '账号或密码不正确', '2020-02-20 09:09:21');
INSERT INTO `sys_logininfor` VALUES ('80', 'admin', '175.0.212.81', '深圳', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-20 09:09:34');
INSERT INTO `sys_logininfor` VALUES ('81', 'admin', '175.0.212.81', '深圳', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '账号或密码不正确', '2020-02-20 09:13:07');
INSERT INTO `sys_logininfor` VALUES ('82', 'admin', '175.0.212.81', '', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-20 09:13:15');
INSERT INTO `sys_logininfor` VALUES ('83', 'admin', '175.0.212.81', '深圳', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '账号或密码不正确', '2020-02-20 09:17:29');
INSERT INTO `sys_logininfor` VALUES ('84', 'admin', '175.0.212.81', '深圳', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '账号或密码不正确', '2020-02-20 09:17:40');
INSERT INTO `sys_logininfor` VALUES ('85', 'admin', '175.0.212.81', '深圳', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-20 09:18:46');
INSERT INTO `sys_logininfor` VALUES ('86', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '账号或密码不正确', '2020-02-20 10:51:36');
INSERT INTO `sys_logininfor` VALUES ('87', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-20 10:51:48');
INSERT INTO `sys_logininfor` VALUES ('88', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-20 15:31:34');
INSERT INTO `sys_logininfor` VALUES ('89', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-20 15:34:24');
INSERT INTO `sys_logininfor` VALUES ('90', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-26 14:54:49');
INSERT INTO `sys_logininfor` VALUES ('91', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-26 15:21:37');
INSERT INTO `sys_logininfor` VALUES ('92', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-02-27 11:08:34');
INSERT INTO `sys_logininfor` VALUES ('93', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-09 09:07:10');
INSERT INTO `sys_logininfor` VALUES ('94', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-09 09:26:35');
INSERT INTO `sys_logininfor` VALUES ('95', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-10 20:59:14');
INSERT INTO `sys_logininfor` VALUES ('96', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-10 21:49:57');
INSERT INTO `sys_logininfor` VALUES ('97', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-10 21:51:15');
INSERT INTO `sys_logininfor` VALUES ('98', 'admin111', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-11 11:23:47');
INSERT INTO `sys_logininfor` VALUES ('99', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-11 11:24:54');
INSERT INTO `sys_logininfor` VALUES ('100', 'admin111', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-11 11:25:06');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin111', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-11 11:26:35');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-12 14:54:58');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-12 18:00:55');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-13 08:26:59');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-14 09:46:34');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-14 09:53:19');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-24 21:16:15');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-29 20:01:12');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', '0', '登陆成功', '2020-03-29 20:15:58');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '[::1]', '内网IP', 'Chrome', 'Windows 10', '0', '登陆成功', '2020-05-09 11:51:10');
INSERT INTO `sys_logininfor` VALUES ('111', 'zy-admin', '[::1]', '内网IP', 'Chrome', 'Windows 10', '0', '登陆成功', '2020-05-09 11:53:03');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '[::1]', '内网IP', 'Chrome', 'Windows 10', '0', '登陆成功', '2020-05-09 11:53:28');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '[::1]', '内网IP', 'Chrome', 'Windows 10', '0', '登陆成功', '2020-05-09 11:57:13');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '[::1]', '内网IP', 'Chrome', 'Windows 10', '0', '登陆成功', '2020-05-09 11:58:34');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '[::1]', '内网IP', 'Chrome', 'Windows 10', '0', '登陆成功', '2020-05-13 10:46:35');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '[::1]', '内网IP', 'Chrome', 'Windows 10', '0', '登陆成功', '2020-05-13 11:31:04');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '[::1]', '内网IP', 'Chrome', 'Windows 10', '0', '登陆成功', '2020-05-14 10:22:23');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '[::1]', '内网IP', 'Chrome', 'Windows 10', '0', '登陆成功', '2020-05-14 11:03:13');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '[::1]', '内网IP', 'Chrome', 'Windows 10', '0', '登陆成功', '2020-05-14 11:08:45');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '[::1]', '内网IP', 'Firefox', 'Windows 10', '0', '登陆成功', '2020-05-15 17:23:43');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1098 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '业务管理', '0', '1', '#', 'menuItem', 'M', '0', null, 'fa fa-newspaper-o', 'admin', '2019-12-02 16:39:09', 'admin', null, '');
INSERT INTO `sys_menu` VALUES ('5', '实例演示', '0', '5', '#', '', 'M', '0', '', 'fa fa-desktop', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('6', '表单演示', '5', '1', '#', '', 'M', '0', '', '', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '表单演示');
INSERT INTO `sys_menu` VALUES ('7', '表格演示', '5', '2', '#', '', 'M', '0', '', '', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '表格演示');
INSERT INTO `sys_menu` VALUES ('8', '弹框演示', '5', '3', '#', '', 'M', '0', '', '', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '弹框演示');
INSERT INTO `sys_menu` VALUES ('9', '操作演示', '5', '4', '#', '', 'M', '0', '', '', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '操作演示');
INSERT INTO `sys_menu` VALUES ('10', '报表演示', '5', '5', '#', '', 'M', '0', '', '', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '报表演示');
INSERT INTO `sys_menu` VALUES ('11', '图标演示', '5', '6', '#', '', 'M', '0', '', '', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '图标演示');
INSERT INTO `sys_menu` VALUES ('12', '栅格演示', '6', '2', '/demo/form/grid', '', 'C', '0', 'demo:grid:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('13', '下拉框', '6', '3', '/demo/form/select', '', 'C', '0', 'demo:select:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('14', '时间轴', '6', '4', '/demo/form/timeline', '', 'C', '0', 'demo:timeline:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('15', '基本表单', '6', '5', '/demo/form/basic', '', 'C', '0', 'demo:basic:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('16', '卡片列表', '6', '6', '/demo/form/cards', '', 'C', '0', 'demo:cards:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('17', '功能扩展', '6', '7', '/demo/form/jasny', '', 'C', '0', 'demo:jasny:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('18', '拖动排序', '6', '8', '/demo/form/sortable', '', 'C', '0', 'demo:sortable:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('19', '选项卡&面板', '6', '9', '/demo/form/tabs_panels', '', 'C', '0', 'demo:tabs_panels:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('20', '表单校验', '6', '10', '/demo/form/validate', '', 'C', '0', 'demo:validate:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('21', '表单向导', '6', '11', '/demo/form/wizard', '', 'C', '0', 'demo:wizard:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('22', '文件上传', '6', '12', '/demo/form/upload', '', 'C', '0', 'demo:upload:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('23', '日期和时间', '6', '13', '/demo/form/datetime', '', 'C', '0', 'demo:datetime:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('24', '富文本编辑器', '6', '14', '/demo/form/summernote', '', 'C', '0', 'demo:summernote:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('25', '左右互选', '6', '15', '/demo/form/duallistbox', '', 'C', '0', 'demo:duallistbox:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('27', '按钮演示', '6', '1', '/demo/form/button', 'menuItem', 'C', '0', 'demo:button:view', '#', 'admin', '2018-03-16 11:33:00', '', '2020-02-04 08:46:48', '');
INSERT INTO `sys_menu` VALUES ('28', '数据汇总', '7', '2', '/demo/table/footer', '', 'C', '0', 'demo:footer:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('29', '组合表头', '7', '3', '/demo/table/groupHeader', '', 'C', '0', 'demo:groupHeader:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('31', '记住翻页', '7', '5', '/demo/table/remember', '', 'C', '0', 'demo:remember:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('32', '跳转指定页', '7', '6', '/demo/table/pageGo', '', 'C', '0', 'demo:pageGo:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('33', '查询参数', '7', '7', '/demo/table/params', '', 'C', '0', 'demo:params:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('35', '点击加载表格', '7', '9', '/demo/table/button', '', 'C', '0', 'demo:button:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('36', '表格冻结列', '7', '10', '/demo/table/fixedColumns', '', 'C', '0', 'demo:fixedColumns:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('37', '触发事件', '7', '11', '/demo/table/event', '', 'C', '0', 'demo:event:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('38', '细节视图', '7', '12', '/demo/table/detail', '', 'C', '0', 'demo:detail:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('39', '父子视图', '7', '13', '/demo/table/child', '', 'C', '0', 'demo:child:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('40', '图片预览', '7', '14', '/demo/table/image', '', 'C', '0', 'demo:image:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('41', '动态增删改查', '7', '15', '/demo/table/curd', '', 'C', '0', 'demo:curd:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('42', '表格拖曳', '7', '16', '/demo/table/recorder', '', 'C', '0', 'demo:recorder:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('43', '行内编辑', '7', '17', '/demo/table/editable', '', 'C', '0', 'demo:editable:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('44', '其它操作', '7', '18', '/demo/table/other', '', 'C', '0', 'demo:other:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('45', '查询条件', '7', '1', '/demo/table/search', '', 'C', '0', 'demo:search:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('46', '弹层组件', '8', '2', '/demo/modal/layer', '', 'C', '0', 'demo:layer:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('47', '弹层表格', '8', '3', '/demo/modal/table', '', 'C', '0', 'demo:table:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('48', '模态窗口', '8', '1', '/demo/modal/dialog', '', 'C', '0', 'demo:dialog:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('49', '其他操作', '9', '2', '/demo/operate/other', '', 'C', '0', 'demo:other:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('50', '表格操作', '9', '1', '/demo/operate/table', '', 'C', '0', 'demo:table:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('51', 'Peity', '10', '2', '/demo/report/metrics', '', 'C', '0', 'demo:metrics:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('52', 'SparkLine', '10', '3', '/demo/report/peity', '', 'C', '0', 'demo:peity:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('53', '图表组合', '10', '4', '/demo/report/sparkline', '', 'C', '0', 'demo:sparkline:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('54', '百度Echarts', '10', '1', '/demo/report/echarts', '', 'C', '0', 'demo:echarts:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('55', 'Glyphicons', '11', '2', '/demo/icon/glyphicons', '', 'C', '0', 'demo:glyphicons:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('56', 'Font Awesome', '11', '1', '/demo/icon/fontawesome', '', 'C', '0', 'demo:fontawesome:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', '', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', '', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', '', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', '', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '3', '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '3', '2', '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '2', '4', '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '2', '5', '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '账户解锁', '501', '4', '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '在线查询', '109', '1', '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '批量强退', '109', '2', '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '单条强退', '109', '3', '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务查询', '110', '1', '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务新增', '110', '2', '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务修改', '110', '3', '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '任务删除', '110', '4', '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '状态修改', '110', '5', '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '任务详细', '110', '6', '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '任务导出', '110', '7', '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成查询', '114', '1', '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1058', '生成修改', '114', '2', '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1059', '生成删除', '114', '3', '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1060', '预览代码', '114', '4', '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1061', '生成代码', '114', '5', '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1086', '文件夹结构', '4', '1', '/module/rmp_path', '', 'C', '0', 'module:rmp_path:view', '#', 'admin', '2020-01-01 00:00:00', 'admin', '2020-01-01 00:00:00', '文件夹结构菜单');
INSERT INTO `sys_menu` VALUES ('1087', '文件夹结构查询', '1086', '1', '#', '', 'F', '0', 'module:rmp_path:list', '#', 'admin', '2020-01-01 00:00:00', 'admin', '2020-01-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1088', '文件夹结构新增', '1086', '2', '#', '', 'F', '0', 'module:rmp_path:add', '#', 'admin', '2020-01-01 00:00:00', 'admin', '2020-01-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1089', '文件夹结构修改', '1086', '3', '#', '', 'F', '0', 'module:rmp_path:edit', '#', 'admin', '2020-01-01 00:00:00', 'admin', '2020-01-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1090', '文件夹结构删除', '1086', '4', '#', '', 'F', '0', 'module:rmp_path:remove', '#', 'admin', '2020-01-01 00:00:00', 'admin', '2020-01-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1091', '文件夹结构导出', '1086', '5', '#', '', 'F', '0', 'module:rmp_path:export', '#', 'admin', '2020-01-01 00:00:00', 'admin', '2020-01-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1092', '资源类型', '4', '1', '/module/rmp_type', '', 'C', '0', 'module:rmp_type:view', '#', 'admin', '2020-01-01 00:00:00', 'admin', '2020-01-01 00:00:00', '资源类型菜单');
INSERT INTO `sys_menu` VALUES ('1093', '资源类型查询', '1092', '1', '#', '', 'F', '0', 'module:rmp_type:list', '#', 'admin', '2020-01-01 00:00:00', 'admin', '2020-01-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1094', '资源类型新增', '1092', '2', '#', '', 'F', '0', 'module:rmp_type:add', '#', 'admin', '2020-01-01 00:00:00', 'admin', '2020-01-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1095', '资源类型修改', '1092', '3', '#', '', 'F', '0', 'module:rmp_type:edit', '#', 'admin', '2020-01-01 00:00:00', 'admin', '2020-01-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1096', '资源类型删除', '1092', '4', '#', '', 'F', '0', 'module:rmp_type:remove', '#', 'admin', '2020-01-01 00:00:00', 'admin', '2020-01-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1097', '资源类型导出', '1092', '5', '#', '', 'F', '0', 'module:rmp_type:export', '#', 'admin', '2020-01-01 00:00:00', 'admin', '2020-01-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('10', '清空操作日志', '3', '/monitor/operlog/clean', 'POST', '1', 'admin', '运维部门', '/monitor/operlog/clean', '[::1]', '内网IP', '\"all\"', '{\"code\":0,\"msg\":\"操作成功\",\"data\":9,\"otype\":3}', '0', '', '2020-01-27 08:55:31');
INSERT INTO `sys_oper_log` VALUES ('11', '菜单树', '0', '/system/menu/roleMenuTreeData', 'GET', '1', 'admin', '运维部门', '/system/menu/roleMenuTreeData', '[::1]', '内网IP', '{\"roleId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":0}', '1', '', '2020-01-31 12:38:38');
INSERT INTO `sys_oper_log` VALUES ('12', '菜单树', '0', '/system/menu/roleMenuTreeData', 'GET', '1', 'admin', '运维部门', '/system/menu/roleMenuTreeData', '[::1]', '内网IP', '{\"roleId\":0}', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":0}', '1', '', '2020-01-31 12:38:51');
INSERT INTO `sys_oper_log` VALUES ('13', '菜单树', '0', '/system/menu/roleMenuTreeData', 'GET', '1', 'admin', '运维部门', '/system/menu/roleMenuTreeData', '[::1]', '内网IP', '{\"roleId\":0}', '{\"code\":500,\"msg\":\"登陆超时\",\"data\":null,\"otype\":0}', '1', '', '2020-01-31 12:40:32');
INSERT INTO `sys_oper_log` VALUES ('14', '菜单树', '0', '/system/menu/roleMenuTreeData', 'GET', '1', 'admin', '运维部门', '/system/menu/roleMenuTreeData', '[::1]', '内网IP', '{\"roleId\":0}', '{\"code\":500,\"msg\":\"登陆超时\",\"data\":null,\"otype\":0}', '1', '', '2020-01-31 12:40:45');
INSERT INTO `sys_oper_log` VALUES ('15', '菜单树', '0', '/system/menu/roleMenuTreeData', 'GET', '1', 'admin', '运维部门', '/system/menu/roleMenuTreeData', '[::1]', '内网IP', '{\"roleId\":0}', '{\"code\":500,\"msg\":\"登陆超时\",\"data\":null,\"otype\":0}', '1', '', '2020-01-31 12:40:59');
INSERT INTO `sys_oper_log` VALUES ('16', '新增角色', '1', '/system/role/add', 'POST', '1', 'admin', '运维部门', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"普通角色1\",\"RoleKey\":\"common1\",\"RoleSort\":\"3\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"1086,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1087,1088,1089,1090,1091,1092\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-01 18:36:47');
INSERT INTO `sys_oper_log` VALUES ('17', '新增角色', '1', '/system/role/add', 'POST', '1', 'admin', '运维部门', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"普通角色1\",\"RoleKey\":\"common1\",\"RoleSort\":\"3\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"1086,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1087,1088,1089,1090,1091,1092\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-01 18:37:50');
INSERT INTO `sys_oper_log` VALUES ('18', '新增角色', '1', '/system/role/add', 'POST', '1', 'admin', '运维部门', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"普通角色1\",\"RoleKey\":\"common1\",\"RoleSort\":\"3\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"1086,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1087,1088,1089,1090,1091,1092\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-01 18:40:27');
INSERT INTO `sys_oper_log` VALUES ('19', '新增角色', '1', '/system/role/add', 'POST', '1', 'admin', '运维部门', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"普通角色1\",\"RoleKey\":\"common1\",\"RoleSort\":\"3\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"1086,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1087,1088,1089,1090,1091,1092\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-01 18:40:35');
INSERT INTO `sys_oper_log` VALUES ('20', '新增角色', '1', '/system/role/add', 'POST', '1', 'admin', '运维部门', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"普通角色1\",\"RoleKey\":\"common1\",\"RoleSort\":\"3\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"1086,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1087,1088,1089,1090,1091,1092\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-01 18:45:47');
INSERT INTO `sys_oper_log` VALUES ('21', '新增角色', '1', '/system/role/add', 'POST', '1', 'admin', '运维部门', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"普通角色1\",\"RoleKey\":\"common1\",\"RoleSort\":\"3\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"1086,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1087,1088,1089,1090,1091,1092\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-01 18:45:56');
INSERT INTO `sys_oper_log` VALUES ('22', '新增角色', '1', '/system/role/add', 'POST', '1', 'admin', '运维部门', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"普通角色1\",\"RoleKey\":\"common1\",\"RoleSort\":\"3\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"1086,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1087,1088,1089,1090,1091,1092\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-01 18:55:55');
INSERT INTO `sys_oper_log` VALUES ('23', '新增角色', '1', '/system/role/add', 'POST', '1', 'admin', '运维部门', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"普通角色1\",\"RoleKey\":\"common1\",\"RoleSort\":\"3\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"1086,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1087,1088,1089,1090,1091,1092\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-01 19:01:39');
INSERT INTO `sys_oper_log` VALUES ('24', '新增角色', '1', '/system/role/add', 'POST', '1', 'admin', '运维部门', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"普通角色1\",\"RoleKey\":\"common1\",\"RoleSort\":\"3\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"1086,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1087,1088,1089,1090,1091,1092\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-01 19:01:42');
INSERT INTO `sys_oper_log` VALUES ('25', '新增角色', '1', '/system/role/add', 'POST', '1', 'admin', '运维部门', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"普通角色1\",\"RoleKey\":\"common1\",\"RoleSort\":\"3\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"1086,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1087,1088,1089,1090,1091,1092\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":3,\"otype\":1}', '0', '', '2020-02-01 19:05:42');
INSERT INTO `sys_oper_log` VALUES ('26', '删除角色', '3', '/system/role/remove', 'POST', '1', 'admin', '运维部门', '/system/role/remove', '[::1]', '内网IP', '{\"Ids\":\"3\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-01 19:10:00');
INSERT INTO `sys_oper_log` VALUES ('27', '数据权限保存', '0', '/system/role/authDataScope', 'POST', '1', 'admin', '运维部门', '/system/role/authDataScope', '[::1]', '内网IP', '{\"RoleId\":2,\"RoleName\":\"普通角色\",\"RoleKey\":\"common\",\"DataScope\":\"2\",\"DeptIds\":\"100,110\"}', '{\"code\":500,\"msg\":\"不允许操作超级管理员角色\",\"data\":null,\"otype\":0}', '1', '', '2020-02-02 13:04:32');
INSERT INTO `sys_oper_log` VALUES ('28', '数据权限保存', '0', '/system/role/authDataScope', 'POST', '1', 'admin', '运维部门', '/system/role/authDataScope', '[::1]', '内网IP', '{\"RoleId\":2,\"RoleName\":\"普通角色\",\"RoleKey\":\"common\",\"DataScope\":\"2\",\"DeptIds\":\"100,110\"}', '{\"code\":500,\"msg\":\"不允许操作超级管理员角色\",\"data\":null,\"otype\":0}', '1', '', '2020-02-02 13:05:40');
INSERT INTO `sys_oper_log` VALUES ('29', '数据权限保存', '0', '/system/role/authDataScope', 'POST', '1', 'admin', '运维部门', '/system/role/authDataScope', '[::1]', '内网IP', '{\"RoleId\":2,\"RoleName\":\"普通角色\",\"RoleKey\":\"common\",\"DataScope\":\"2\",\"DeptIds\":\"100,110\"}', '{\"code\":500,\"msg\":\"保存数据失败\",\"data\":null,\"otype\":0}', '1', '', '2020-02-02 13:06:11');
INSERT INTO `sys_oper_log` VALUES ('30', '数据权限保存', '0', '/system/role/authDataScope', 'POST', '1', 'admin', '运维部门', '/system/role/authDataScope', '[::1]', '内网IP', '{\"RoleId\":2,\"RoleName\":\"普通角色\",\"RoleKey\":\"common\",\"DataScope\":\"2\",\"DeptIds\":\"100,110\"}', '{\"code\":500,\"msg\":\"保存数据失败\",\"data\":null,\"otype\":0}', '1', '', '2020-02-02 13:20:01');
INSERT INTO `sys_oper_log` VALUES ('31', '数据权限保存', '0', '/system/role/authDataScope', 'POST', '1', 'admin', '运维部门', '/system/role/authDataScope', '[::1]', '内网IP', '{\"RoleId\":2,\"RoleName\":\"普通角色\",\"RoleKey\":\"common\",\"DataScope\":\"2\",\"DeptIds\":\"100,110\"}', '{\"code\":500,\"msg\":\"保存数据失败\",\"data\":null,\"otype\":0}', '1', '', '2020-02-02 13:20:07');
INSERT INTO `sys_oper_log` VALUES ('32', '数据权限保存', '0', '/system/role/authDataScope', 'POST', '1', 'admin', '运维部门', '/system/role/authDataScope', '[::1]', '内网IP', '{\"RoleId\":2,\"RoleName\":\"普通角色\",\"RoleKey\":\"common\",\"DataScope\":\"2\",\"DeptIds\":\"100,110\"}', '{\"code\":500,\"msg\":\"保存数据失败\",\"data\":null,\"otype\":0}', '1', '', '2020-02-02 13:27:44');
INSERT INTO `sys_oper_log` VALUES ('33', '数据权限保存', '0', '/system/role/authDataScope', 'POST', '1', 'admin', '运维部门', '/system/role/authDataScope', '[::1]', '内网IP', '{\"RoleId\":2,\"RoleName\":\"普通角色\",\"RoleKey\":\"common\",\"DataScope\":\"2\",\"DeptIds\":\"100,110\"}', '{\"code\":500,\"msg\":\"保存数据失败\",\"data\":null,\"otype\":0}', '1', '', '2020-02-02 13:27:49');
INSERT INTO `sys_oper_log` VALUES ('34', '数据权限保存', '0', '/system/role/authDataScope', 'POST', '1', 'admin', '运维部门', '/system/role/authDataScope', '[::1]', '内网IP', '{\"RoleId\":2,\"RoleName\":\"普通角色\",\"RoleKey\":\"common\",\"DataScope\":\"2\",\"DeptIds\":\"100,110\"}', '{\"code\":500,\"msg\":\"保存数据失败\",\"data\":null,\"otype\":0}', '1', '', '2020-02-02 13:27:59');
INSERT INTO `sys_oper_log` VALUES ('35', '数据权限保存', '0', '/system/role/authDataScope', 'POST', '1', 'admin', '运维部门', '/system/role/authDataScope', '[::1]', '内网IP', '{\"RoleId\":2,\"RoleName\":\"普通角色\",\"RoleKey\":\"common\",\"DataScope\":\"2\",\"DeptIds\":\"100,110\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-02 13:29:15');
INSERT INTO `sys_oper_log` VALUES ('36', '修改角色', '1', '/system/role/edit', 'POST', '1', 'admin', '运维部门', '/system/role/edit', '[::1]', '内网IP', '{\"RoleId\":2,\"RoleName\":\"普通角色\",\"RoleKey\":\"common\",\"RoleSort\":\"2\",\"Status\":\"0\",\"Remark\":\"普通角色\",\"MenuIds\":\"1,100,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,113,114,1057,1058,1059,1060,1061,115,4,5,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,6,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,7,45,46,47,8,48,49,9,50,51,52,53,10,54,55\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-02 13:32:39');
INSERT INTO `sys_oper_log` VALUES ('37', '新增用户', '1', '/system/user/add', 'POST', '1', 'admin', '运维部门', '/system/user/add', '[::1]', '内网IP', '{\"UserName\":\"test\",\"Phonenumber\":\"18788996255\",\"Email\":\"ddd@163.com\",\"LoginName\":\"admin111\",\"Password\":\"1qaz2wsx\",\"DeptId\":110,\"Sex\":\"0\",\"Status\":\"0\",\"RoleIds\":\"\",\"PostIds\":\"\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"用户名称长度为5到30位\",\"data\":null,\"otype\":1}', '1', '', '2020-02-02 16:03:33');
INSERT INTO `sys_oper_log` VALUES ('38', '新增用户', '1', '/system/user/add', 'POST', '1', 'admin', '运维部门', '/system/user/add', '[::1]', '内网IP', '{\"UserName\":\"test11\",\"Phonenumber\":\"18788996255\",\"Email\":\"ddd@163.com\",\"LoginName\":\"admin111\",\"Password\":\"1qaz2wsx\",\"DeptId\":110,\"Sex\":\"0\",\"Status\":\"0\",\"RoleIds\":\"\",\"PostIds\":\"\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":2,\"otype\":1}', '0', '', '2020-02-02 16:03:43');
INSERT INTO `sys_oper_log` VALUES ('39', '保存分配用户', '1', '/system/role/selectAll', 'POST', '1', 'admin', '运维部门', '/system/role/selectAll', '[::1]', '内网IP', '{\"roleId\":2,\"userIds\":\"2\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-02 16:36:58');
INSERT INTO `sys_oper_log` VALUES ('40', '取消用户角色授权', '3', '/system/role/cancel', 'POST', '1', 'admin', '运维部门', '/system/role/cancel', '[::1]', '内网IP', '{\"roleId\":2,\"userId\":2}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-02-02 16:56:42');
INSERT INTO `sys_oper_log` VALUES ('41', '保存分配用户', '1', '/system/role/selectAll', 'POST', '1', 'admin', '运维部门', '/system/role/selectAll', '[::1]', '内网IP', '{\"roleId\":2,\"userIds\":\"2\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-02 16:56:47');
INSERT INTO `sys_oper_log` VALUES ('42', '取消用户角色授权', '3', '/system/role/cancelAll', 'POST', '1', 'admin', '运维部门', '/system/role/cancelAll', '[::1]', '内网IP', '{\"roleId\":2,\"userIds\":\"1,2\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-02-02 16:56:51');
INSERT INTO `sys_oper_log` VALUES ('43', '保存分配用户', '1', '/system/role/selectAll', 'POST', '1', 'admin', '运维部门', '/system/role/selectAll', '[::1]', '内网IP', '{\"roleId\":2,\"userIds\":\"1,2\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-02 16:56:55');
INSERT INTO `sys_oper_log` VALUES ('44', '导出Excel', '0', '/system/role/export', 'POST', '1', 'admin', '运维部门', '/system/role/export', '[::1]', '内网IP', '{\"RoleName\":\"\",\"Status\":\"\",\"RoleKey\":\"\",\"DataScope\":\"\",\"BeginTime\":\"\",\"EndTime\":\"\",\"PageNum\":0,\"PageSize\":0,\"SortName\":\"\",\"SortOrder\":\"\"}', '{\"code\":500,\"msg\":\"Error 1054: Unknown column \'r.role_id\' in \'field list\', SELECT r.role_id,r.role_name,r.role_key,r.role_sort,r.data_scope,r.status FROM `sys_role` WHERE r.del_flag = \'0\'\\n\",\"data\":null,\"otype\":0}', '1', '', '2020-02-02 16:57:03');
INSERT INTO `sys_oper_log` VALUES ('45', '导出Excel', '0', '/system/role/export', 'POST', '1', 'admin', '运维部门', '/system/role/export', '[::1]', '内网IP', '{\"RoleName\":\"\",\"Status\":\"\",\"RoleKey\":\"\",\"DataScope\":\"\",\"BeginTime\":\"\",\"EndTime\":\"\",\"PageNum\":0,\"PageSize\":0,\"SortName\":\"\",\"SortOrder\":\"\"}', '{\"code\":0,\"msg\":\"1580633899644102000.xls\",\"data\":null,\"otype\":0}', '0', '', '2020-02-02 16:58:19');
INSERT INTO `sys_oper_log` VALUES ('46', '删除角色', '3', '/system/role/remove', 'POST', '1', 'admin', '运维部门', '/system/role/remove', '[::1]', '内网IP', '{\"Ids\":\"2\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-02 16:59:09');
INSERT INTO `sys_oper_log` VALUES ('47', '取消用户角色授权', '3', '/system/role/cancel', 'POST', '1', 'admin', '运维部门', '/system/role/cancel', '[::1]', '内网IP', '{\"roleId\":1,\"userId\":1}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-02-02 16:59:23');
INSERT INTO `sys_oper_log` VALUES ('48', '保存分配用户', '1', '/system/role/selectAll', 'POST', '1', 'admin', '运维部门', '/system/role/selectAll', '[::1]', '内网IP', '{\"roleId\":1,\"userIds\":\"1,2\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-02 16:59:32');
INSERT INTO `sys_oper_log` VALUES ('49', '新增菜单', '1', '/system/menu/add', 'POST', '1', 'admin', '运维部门', '/system/menu/add', '[::1]', '内网IP', '{\"ParentId\":0,\"MenuType\":\"M\",\"MenuName\":\"业务管理1\",\"OrderNum\":5,\"Url\":\"\",\"Icon\":\"fa fa-anchor\",\"Target\":\"menuItem\",\"Perms\":\"\",\"Visible\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1128,\"otype\":1}', '0', '', '2020-02-04 08:40:44');
INSERT INTO `sys_oper_log` VALUES ('50', '删除菜单', '2', '/system/menu/remove?id=1128', 'GET', '1', 'admin', '运维部门', '/system/menu/remove?id=1128', '[::1]', '内网IP', '{\"Ids\":\"\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":2}', '1', '', '2020-02-04 08:42:51');
INSERT INTO `sys_oper_log` VALUES ('51', '删除菜单', '2', '/system/menu/remove?id=1128', 'GET', '1', 'admin', '运维部门', '/system/menu/remove?id=1128', '[::1]', '内网IP', '{\"Ids\":\"\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":2}', '1', '', '2020-02-04 08:43:01');
INSERT INTO `sys_oper_log` VALUES ('52', '删除菜单', '3', '/system/menu/remove?id=1128', 'GET', '1', 'admin', '运维部门', '/system/menu/remove?id=1128', '[::1]', '内网IP', '{\"id\":1128}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":true,\"otype\":3}', '0', '', '2020-02-04 08:46:14');
INSERT INTO `sys_oper_log` VALUES ('53', '修改菜单', '1', '/system/menu/edit', 'POST', '1', 'admin', '运维部门', '/system/menu/edit', '[::1]', '内网IP', '{\"MenuId\":11,\"ParentId\":5,\"MenuType\":\"C\",\"MenuName\":\"按钮演示11111\",\"OrderNum\":1,\"Url\":\"/demo/form/button\",\"Icon\":\"#\",\"Target\":\"menuItem\",\"Perms\":\"demo:button:view\",\"Visible\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-04 08:46:35');
INSERT INTO `sys_oper_log` VALUES ('54', '修改菜单', '1', '/system/menu/edit', 'POST', '1', 'admin', '运维部门', '/system/menu/edit', '[::1]', '内网IP', '{\"MenuId\":11,\"ParentId\":5,\"MenuType\":\"C\",\"MenuName\":\"按钮演示\",\"OrderNum\":1,\"Url\":\"/demo/form/button\",\"Icon\":\"#\",\"Target\":\"menuItem\",\"Perms\":\"demo:button:view\",\"Visible\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-04 08:46:48');
INSERT INTO `sys_oper_log` VALUES ('55', '新增部门', '1', '/system/dept/add', 'POST', '1', 'admin', '运维部门', '/system/dept/add', '[::1]', '内网IP', '{\"ParentId\":100,\"DeptName\":\"运维部门1\",\"OrderNum\":2,\"Leader\":\"曾尚兵\",\"Phone\":\"18788996255\",\"Email\":\"ddd@163.com\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":111,\"otype\":1}', '0', '', '2020-02-04 16:15:40');
INSERT INTO `sys_oper_log` VALUES ('56', '修改部门', '1', '/system/dept/edit', 'POST', '1', 'admin', '运维部门', '/system/dept/edit', '[::1]', '内网IP', '{\"DeptId\":111,\"ParentId\":100,\"DeptName\":\"运维部门1\",\"OrderNum\":3,\"Leader\":\"曾尚兵\",\"Phone\":\"18788996255\",\"Email\":\"ddd@163.com\",\"Status\":\"0\"}', '{\"code\":500,\"msg\":\"部门名称已存在\",\"data\":null,\"otype\":1}', '1', '', '2020-02-04 16:15:49');
INSERT INTO `sys_oper_log` VALUES ('57', '修改部门', '1', '/system/dept/edit', 'POST', '1', 'admin', '运维部门', '/system/dept/edit', '[::1]', '内网IP', '{\"DeptId\":111,\"ParentId\":100,\"DeptName\":\"运维部门1\",\"OrderNum\":3,\"Leader\":\"曾尚兵\",\"Phone\":\"18788996255\",\"Email\":\"ddd@163.com\",\"Status\":\"0\"}', '{\"code\":500,\"msg\":\"部门名称已存在\",\"data\":null,\"otype\":1}', '1', '', '2020-02-04 16:18:37');
INSERT INTO `sys_oper_log` VALUES ('58', '修改部门', '1', '/system/dept/edit', 'POST', '1', 'admin', '运维部门', '/system/dept/edit', '[::1]', '内网IP', '{\"DeptId\":111,\"ParentId\":100,\"DeptName\":\"运维部门1\",\"OrderNum\":3,\"Leader\":\"曾尚兵\",\"Phone\":\"18788996255\",\"Email\":\"ddd@163.com\",\"Status\":\"0\"}', '{\"code\":500,\"msg\":\"部门名称已存在\",\"data\":null,\"otype\":1}', '1', '', '2020-02-04 16:19:44');
INSERT INTO `sys_oper_log` VALUES ('59', '修改部门', '1', '/system/dept/edit', 'POST', '1', 'admin', '运维部门', '/system/dept/edit', '[::1]', '内网IP', '{\"DeptId\":111,\"ParentId\":100,\"DeptName\":\"运维部门1\",\"OrderNum\":0,\"Leader\":\"曾尚兵\",\"Phone\":\"18788996255\",\"Email\":\"ddd@163.com\",\"Status\":\"0\"}', '{\"code\":500,\"msg\":\"部门名称已存在\",\"data\":null,\"otype\":1}', '1', '', '2020-02-04 16:21:26');
INSERT INTO `sys_oper_log` VALUES ('60', '修改部门', '1', '/system/dept/edit', 'POST', '1', 'admin', '运维部门', '/system/dept/edit', '[::1]', '内网IP', '{\"DeptId\":111,\"ParentId\":100,\"DeptName\":\"运维部门1\",\"OrderNum\":0,\"Leader\":\"曾尚兵\",\"Phone\":\"18788996255\",\"Email\":\"ddd@163.com\",\"Status\":\"0\"}', '{\"code\":500,\"msg\":\"部门名称已存在\",\"data\":null,\"otype\":1}', '1', '', '2020-02-04 16:21:28');
INSERT INTO `sys_oper_log` VALUES ('61', '修改部门', '1', '/system/dept/edit', 'POST', '1', 'admin', '运维部门', '/system/dept/edit', '[::1]', '内网IP', '{\"DeptId\":111,\"ParentId\":100,\"DeptName\":\"运维部门1\",\"OrderNum\":3,\"Leader\":\"曾尚兵\",\"Phone\":\"18788996255\",\"Email\":\"ddd@163.com\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-04 16:22:41');
INSERT INTO `sys_oper_log` VALUES ('62', '修改部门', '1', '/system/dept/edit', 'POST', '1', 'admin', '运维部门', '/system/dept/edit', '[::1]', '内网IP', '{\"DeptId\":111,\"ParentId\":100,\"DeptName\":\"运维部门1\",\"OrderNum\":3,\"Leader\":\"曾尚兵\",\"Phone\":\"18788996255\",\"Email\":\"ddd@163.com\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-04 16:23:31');
INSERT INTO `sys_oper_log` VALUES ('63', '修改部门', '1', '/system/dept/edit', 'POST', '1', 'admin', '运维部门', '/system/dept/edit', '[::1]', '内网IP', '{\"DeptId\":111,\"ParentId\":100,\"DeptName\":\"运维部门2\",\"OrderNum\":3,\"Leader\":\"曾尚兵1\",\"Phone\":\"18788996252\",\"Email\":\"ddd111@163.com\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-04 16:24:56');
INSERT INTO `sys_oper_log` VALUES ('64', '修改部门', '1', '/system/dept/edit', 'POST', '1', 'admin', '运维部门', '/system/dept/edit', '[::1]', '内网IP', '{\"DeptId\":111,\"ParentId\":100,\"DeptName\":\"运维部门2\",\"OrderNum\":3,\"Leader\":\"曾尚兵1\",\"Phone\":\"18788996252\",\"Email\":\"ddd111@163.com\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-04 16:33:12');
INSERT INTO `sys_oper_log` VALUES ('65', '删除部门', '3', '/system/dept/remove?id=111', 'GET', '1', 'admin', '运维部门', '/system/dept/remove?id=111', '[::1]', '内网IP', '{\"id\":111}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-04 16:33:28');
INSERT INTO `sys_oper_log` VALUES ('66', '新增部门', '1', '/system/dept/add', 'POST', '1', 'admin', '运维部门', '/system/dept/add', '[::1]', '内网IP', '{\"ParentId\":100,\"DeptName\":\"运维部门1\",\"OrderNum\":5,\"Leader\":\"曾尚兵\",\"Phone\":\"18788996255\",\"Email\":\"ddd@163.com\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":112,\"otype\":1}', '0', '', '2020-02-04 16:33:41');
INSERT INTO `sys_oper_log` VALUES ('67', '新增部门', '1', '/system/dept/add', 'POST', '1', 'admin', '运维部门', '/system/dept/add', '[::1]', '内网IP', '{\"ParentId\":100,\"DeptName\":\"运维部门1\",\"OrderNum\":2,\"Leader\":\"曾尚兵\",\"Phone\":\"18788996255\",\"Email\":\"ddd@163.com\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":113,\"otype\":1}', '0', '', '2020-02-04 16:36:57');
INSERT INTO `sys_oper_log` VALUES ('68', '修改岗位', '1', '/system/post/edit', 'POST', '1', 'admin', '运维部门', '/system/post/edit', '[::1]', '内网IP', '{\"PostId\":1,\"PostName\":\"董事长\",\"PostCode\":\"ceo\",\"PostSort\":1,\"Status\":\"0\",\"Remark\":\"4223434\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-04 19:36:13');
INSERT INTO `sys_oper_log` VALUES ('69', '新增岗位', '1', '/system/post/add', 'POST', '1', 'admin', '运维部门', '/system/post/add', '[::1]', '内网IP', '{\"PostName\":\"董事长1\",\"PostCode\":\"ceo1\",\"PostSort\":3,\"Status\":\"0\",\"Remark\":\"wqwqe\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":3,\"otype\":1}', '0', '', '2020-02-04 19:41:31');
INSERT INTO `sys_oper_log` VALUES ('70', '删除岗位', '3', '/system/post/remove', 'POST', '1', 'admin', '运维部门', '/system/post/remove', '[::1]', '内网IP', '{\"Ids\":\"3\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-04 19:41:36');
INSERT INTO `sys_oper_log` VALUES ('71', '导出Excel', '0', '/system/post/export', 'POST', '1', 'admin', '运维部门', '/system/post/export', '[::1]', '内网IP', '{\"PostCode\":\"\",\"Status\":\"\",\"PostName\":\"\",\"BeginTime\":\"\",\"EndTime\":\"\",\"PageNum\":0,\"PageSize\":0}', '{\"code\":0,\"msg\":\"1580816498917507000.xls\",\"data\":null,\"otype\":0}', '0', '', '2020-02-04 19:41:38');
INSERT INTO `sys_oper_log` VALUES ('72', '修改参数', '1', '/system/config/edit', 'POST', '1', 'admin', '运维部门', '/system/config/edit', '[::1]', '内网IP', '{\"ConfigId\":3,\"ConfigName\":\"主框架页-侧边栏主题11\",\"ConfigKey\":\"sys.index.sideTheme\",\"ConfigValue\":\"theme-dark\",\"ConfigType\":\"Y\",\"Remark\":\"深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-05 10:46:24');
INSERT INTO `sys_oper_log` VALUES ('73', '修改参数', '1', '/system/config/edit', 'POST', '1', 'admin', '运维部门', '/system/config/edit', '[::1]', '内网IP', '{\"ConfigId\":3,\"ConfigName\":\"主框架页-侧边栏主题\",\"ConfigKey\":\"sys.index.sideTheme\",\"ConfigValue\":\"theme-dark\",\"ConfigType\":\"Y\",\"Remark\":\"深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-05 10:46:28');
INSERT INTO `sys_oper_log` VALUES ('74', '新增参数', '1', '/system/config/add', 'POST', '1', 'admin', '运维部门', '/system/config/add', '[::1]', '内网IP', '{\"ConfigName\":\"dfsf\",\"ConfigKey\":\"sdfsdfds\",\"ConfigValue\":\"sdfsdfsd\",\"ConfigType\":\"Y\",\"Remark\":\"sdfsdf\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":5,\"otype\":1}', '0', '', '2020-02-05 10:46:36');
INSERT INTO `sys_oper_log` VALUES ('75', '删除参数', '3', '/system/config/remove', 'POST', '1', 'admin', '运维部门', '/system/config/remove', '[::1]', '内网IP', '{\"Ids\":\"5\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-05 10:46:39');
INSERT INTO `sys_oper_log` VALUES ('76', '导出Excel', '0', '/system/config/export', 'POST', '1', 'admin', '运维部门', '/system/config/export', '[::1]', '内网IP', '{\"ConfigName\":\"\",\"ConfigKey\":\"\",\"ConfigType\":\"\",\"BeginTime\":\"\",\"EndTime\":\"\",\"PageNum\":0,\"PageSize\":0}', '{\"code\":0,\"msg\":\"1580870801582669000.xls\",\"data\":null,\"otype\":0}', '0', '', '2020-02-05 10:46:41');
INSERT INTO `sys_oper_log` VALUES ('77', '导出Excel', '0', '/system/role/export', 'POST', '1', 'admin', '运维部门', '/system/role/export', '[::1]', '内网IP', '{\"RoleName\":\"\",\"Status\":\"\",\"RoleKey\":\"\",\"DataScope\":\"\",\"BeginTime\":\"\",\"EndTime\":\"\",\"PageNum\":0,\"PageSize\":0,\"SortName\":\"\",\"SortOrder\":\"\"}', '{\"code\":0,\"msg\":\"1580870904125084000.xls\",\"data\":null,\"otype\":0}', '0', '', '2020-02-05 10:48:24');
INSERT INTO `sys_oper_log` VALUES ('78', '新增字典类型', '1', '/system/dict/add', 'POST', '1', 'admin', '运维部门', '/system/dict/add', '[::1]', '内网IP', '{\"DictName\":\"测试\",\"DictType\":\"test3dddd\",\"Status\":\"0\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":13,\"otype\":1}', '0', '', '2020-02-05 16:23:06');
INSERT INTO `sys_oper_log` VALUES ('79', '删除字典数据', '3', '/system/dict/data/remove', 'POST', '1', 'admin', '运维部门', '/system/dict/data/remove', '[::1]', '内网IP', '{\"Ids\":\"3\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-05 16:24:41');
INSERT INTO `sys_oper_log` VALUES ('80', '新增字典数据', '1', '/system/dict/data/add', 'POST', '1', 'admin', '运维部门', '/system/dict/data/add', '[::1]', '内网IP', '{\"DictLabel\":\"测试\",\"DictValue\":\"2\",\"DictType\":\"sys_user_sex\",\"DictSort\":3,\"CssClass\":\"\",\"ListClass\":\"primary\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"样式属性不能为空\",\"data\":null,\"otype\":1}', '1', '', '2020-02-05 16:53:24');
INSERT INTO `sys_oper_log` VALUES ('81', '新增字典数据', '1', '/system/dict/data/add', 'POST', '1', 'admin', '运维部门', '/system/dict/data/add', '[::1]', '内网IP', '{\"DictLabel\":\"测试\",\"DictValue\":\"2\",\"DictType\":\"sys_user_sex\",\"DictSort\":3,\"CssClass\":\"\",\"ListClass\":\"primary\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":34,\"otype\":1}', '0', '', '2020-02-05 16:54:45');
INSERT INTO `sys_oper_log` VALUES ('82', '删除字典数据', '3', '/system/dict/data/remove', 'POST', '1', 'admin', '运维部门', '/system/dict/data/remove', '[::1]', '内网IP', '{\"Ids\":\"34\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-05 16:54:50');
INSERT INTO `sys_oper_log` VALUES ('83', '导出Excel', '0', '/system/dict/data/export', 'POST', '1', 'admin', '运维部门', '/system/dict/data/export', '[::1]', '内网IP', '{\"DictType\":\"sys_user_sex\",\"DictLabel\":\"\",\"Status\":\"\",\"BeginTime\":\"\",\"EndTime\":\"\",\"PageNum\":0,\"PageSize\":0}', '{\"code\":0,\"msg\":\"1580892894560263000.xls\",\"data\":null,\"otype\":0}', '0', '', '2020-02-05 16:54:54');
INSERT INTO `sys_oper_log` VALUES ('84', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept,sys_dict_data\"}', '{\"code\":500,\"msg\":\"sql: no rows in result set\",\"data\":null,\"otype\":1}', '1', '', '2020-02-07 11:08:42');
INSERT INTO `sys_oper_log` VALUES ('85', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept,sys_dict_data\"}', '{\"code\":500,\"msg\":\"sql: no rows in result set\",\"data\":null,\"otype\":1}', '1', '', '2020-02-07 15:43:46');
INSERT INTO `sys_oper_log` VALUES ('86', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept,sys_dict_data\"}', '{\"code\":500,\"msg\":\"sql: no rows in result set\",\"data\":null,\"otype\":1}', '1', '', '2020-02-07 15:44:00');
INSERT INTO `sys_oper_log` VALUES ('87', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept,sys_dict_data\"}', '{\"code\":500,\"msg\":\"sql: no rows in result set\",\"data\":null,\"otype\":1}', '1', '', '2020-02-07 15:46:30');
INSERT INTO `sys_oper_log` VALUES ('88', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept,sys_dict_data\"}', '{\"code\":500,\"msg\":\"sql: no rows in result set\",\"data\":null,\"otype\":1}', '1', '', '2020-02-07 15:48:52');
INSERT INTO `sys_oper_log` VALUES ('89', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept,sys_dict_data\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 16:38:48');
INSERT INTO `sys_oper_log` VALUES ('90', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"1\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-07 16:44:07');
INSERT INTO `sys_oper_log` VALUES ('91', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 16:46:35');
INSERT INTO `sys_oper_log` VALUES ('92', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"3\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-07 16:47:06');
INSERT INTO `sys_oper_log` VALUES ('93', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 16:47:56');
INSERT INTO `sys_oper_log` VALUES ('94', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"4\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-07 16:48:00');
INSERT INTO `sys_oper_log` VALUES ('95', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 16:51:34');
INSERT INTO `sys_oper_log` VALUES ('96', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 16:51:46');
INSERT INTO `sys_oper_log` VALUES ('97', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"5,6\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":2,\"otype\":3}', '0', '', '2020-02-07 16:51:52');
INSERT INTO `sys_oper_log` VALUES ('98', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 16:52:28');
INSERT INTO `sys_oper_log` VALUES ('99', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"7\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-07 17:01:57');
INSERT INTO `sys_oper_log` VALUES ('100', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 17:02:16');
INSERT INTO `sys_oper_log` VALUES ('101', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 17:02:40');
INSERT INTO `sys_oper_log` VALUES ('102', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 17:04:15');
INSERT INTO `sys_oper_log` VALUES ('103', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 17:05:01');
INSERT INTO `sys_oper_log` VALUES ('104', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 18:56:52');
INSERT INTO `sys_oper_log` VALUES ('105', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"2,3\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":2,\"otype\":3}', '0', '', '2020-02-07 18:57:59');
INSERT INTO `sys_oper_log` VALUES ('106', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 18:59:35');
INSERT INTO `sys_oper_log` VALUES ('107', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 18:59:39');
INSERT INTO `sys_oper_log` VALUES ('108', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"4,5,6,7\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":4,\"otype\":3}', '0', '', '2020-02-07 19:02:03');
INSERT INTO `sys_oper_log` VALUES ('109', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 19:04:35');
INSERT INTO `sys_oper_log` VALUES ('110', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"8,9\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":2,\"otype\":3}', '0', '', '2020-02-07 19:05:17');
INSERT INTO `sys_oper_log` VALUES ('111', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config,sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-07 19:05:36');
INSERT INTO `sys_oper_log` VALUES ('112', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"10,11\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":2,\"otype\":3}', '0', '', '2020-02-11 14:01:23');
INSERT INTO `sys_oper_log` VALUES ('113', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"t_zxuser,t_zjuser\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-11 14:01:31');
INSERT INTO `sys_oper_log` VALUES ('114', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"12,13\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":2,\"otype\":3}', '0', '', '2020-02-11 14:03:20');
INSERT INTO `sys_oper_log` VALUES ('115', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"t_zxuser,t_zjuser\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-11 14:03:34');
INSERT INTO `sys_oper_log` VALUES ('116', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"14,15\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":2,\"otype\":3}', '0', '', '2020-02-11 14:38:02');
INSERT INTO `sys_oper_log` VALUES ('117', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-11 14:38:21');
INSERT INTO `sys_oper_log` VALUES ('118', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"16\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-11 14:43:24');
INSERT INTO `sys_oper_log` VALUES ('119', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-11 14:43:28');
INSERT INTO `sys_oper_log` VALUES ('120', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"17\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-11 14:45:14');
INSERT INTO `sys_oper_log` VALUES ('121', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-11 14:45:18');
INSERT INTO `sys_oper_log` VALUES ('122', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"18\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-11 15:07:20');
INSERT INTO `sys_oper_log` VALUES ('123', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-11 15:07:24');
INSERT INTO `sys_oper_log` VALUES ('124', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"19\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-11 15:07:35');
INSERT INTO `sys_oper_log` VALUES ('125', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-11 15:07:53');
INSERT INTO `sys_oper_log` VALUES ('126', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"20\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-11 15:08:23');
INSERT INTO `sys_oper_log` VALUES ('127', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-11 15:09:37');
INSERT INTO `sys_oper_log` VALUES ('128', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-11 15:09:37');
INSERT INTO `sys_oper_log` VALUES ('129', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"21,22\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":2,\"otype\":3}', '0', '', '2020-02-11 15:10:15');
INSERT INTO `sys_oper_log` VALUES ('130', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-11 15:14:13');
INSERT INTO `sys_oper_log` VALUES ('131', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"25\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-11 15:15:50');
INSERT INTO `sys_oper_log` VALUES ('132', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-11 15:16:22');
INSERT INTO `sys_oper_log` VALUES ('133', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\",\"Params\":null,\"Columns\":null}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:15:22');
INSERT INTO `sys_oper_log` VALUES ('134', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\",\"Params\":null,\"Columns\":null}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:15:29');
INSERT INTO `sys_oper_log` VALUES ('135', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\",\"Params\":null,\"Columns\":null}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:16:18');
INSERT INTO `sys_oper_log` VALUES ('136', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\",\"Params\":null,\"Columns\":null}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:17:41');
INSERT INTO `sys_oper_log` VALUES ('137', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\",\"Params\":null,\"Columns\":null}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:22:18');
INSERT INTO `sys_oper_log` VALUES ('138', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\",\"Params\":null,\"Columns\":null}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:22:29');
INSERT INTO `sys_oper_log` VALUES ('139', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\",\"Params\":null,\"Columns\":null}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:27:04');
INSERT INTO `sys_oper_log` VALUES ('140', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\",\"Params\":null,\"Columns\":null}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:27:13');
INSERT INTO `sys_oper_log` VALUES ('141', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\",\"Params\":null,\"Columns\":null}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:29:54');
INSERT INTO `sys_oper_log` VALUES ('142', '修改参数', '1', '/system/config/edit', 'POST', '1', 'admin', '运维部门', '/system/config/edit', '[::1]', '内网IP', '{\"ConfigId\":1,\"ConfigName\":\"主框架页-默认皮肤样式名称\",\"ConfigKey\":\"sys.index.skinName\",\"ConfigValue\":\"skin-blue\",\"ConfigType\":\"Y\",\"Remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-12 15:30:59');
INSERT INTO `sys_oper_log` VALUES ('143', '修改参数', '1', '/system/config/edit', 'POST', '1', 'admin', '运维部门', '/system/config/edit', '[::1]', '内网IP', '{\"ConfigId\":1,\"ConfigName\":\"主框架页-默认皮肤样式名称\",\"ConfigKey\":\"sys.index.skinName\",\"ConfigValue\":\"skin-blue\",\"ConfigType\":\"Y\",\"Remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-12 15:32:17');
INSERT INTO `sys_oper_log` VALUES ('144', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:33:11');
INSERT INTO `sys_oper_log` VALUES ('145', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:35:13');
INSERT INTO `sys_oper_log` VALUES ('146', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:36:11');
INSERT INTO `sys_oper_log` VALUES ('147', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:37:30');
INSERT INTO `sys_oper_log` VALUES ('148', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:46:48');
INSERT INTO `sys_oper_log` VALUES ('149', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:52:10');
INSERT INTO `sys_oper_log` VALUES ('150', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:52:12');
INSERT INTO `sys_oper_log` VALUES ('151', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"表名称不能为空; 表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:53:15');
INSERT INTO `sys_oper_log` VALUES ('152', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"sys_dept\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:54:26');
INSERT INTO `sys_oper_log` VALUES ('153', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"TableId\":0,\"TableName\":\"sys_dept\",\"TableComment\":\"\",\"ClassName\":\"\",\"FunctionAuthor\":\"\",\"TplCategory\":\"\",\"PackageName\":\"\",\"ModuleName\":\"\",\"BusinessName\":\"\",\"FunctionName\":\"\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"表描述不能为空; 实体类名称不能为空; 作者不能为空; 生成包路径不能为空; 生成模块名不能为空; 生成业务名不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 15:55:40');
INSERT INTO `sys_oper_log` VALUES ('154', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', 'null', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 16:21:17');
INSERT INTO `sys_oper_log` VALUES ('155', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', 'null', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 20:29:28');
INSERT INTO `sys_oper_log` VALUES ('156', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', 'null', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 20:34:17');
INSERT INTO `sys_oper_log` VALUES ('157', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', 'null', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 20:37:42');
INSERT INTO `sys_oper_log` VALUES ('158', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', 'null', '{\"code\":500,\"msg\":\"参数错误\",\"data\":null,\"otype\":2}', '1', '', '2020-02-12 20:40:36');
INSERT INTO `sys_oper_log` VALUES ('159', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-02-13 08:08:32');
INSERT INTO `sys_oper_log` VALUES ('160', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"sys_dept\"}', '{\"code\":500,\"msg\":\"Error 1054: Unknown column \'class_name\' in \'field list\', INSERT INTO `gen_table_column`(`class_name`,`business_name`,`create_by`,`update_time`,`table_name`,`module_name`,`update_by`,`table_id`,`package_name`,`function_name`,`options`,`create_time`,`table_comment`,`tpl_category`,`function_author`,`remark`) VALUES(\'dept\',\'dept\',\'admin\',\'2020-02-13 08:08:55\',\'sys_dept\',\'yj-app\',\'admin\',26,\'module\',\'部门\',\'\',\'2020-02-11 15:16:10\',\'部门表\',\'crud\',\'yunjie\',\'\') ON DUPLICATE KEY UPDATE `class_name`=VALUES(`class_name`),`business_name`=VALUES(`business_name`),`create_by`=VALUES(`create_by`),`update_time`=VALUES(`update_time`),`table_name`=VALUES(`table_name`),`module_name`=VALUES(`module_name`),`update_by`=VALUES(`update_by`),`table_id`=VALUES(`table_id`),`package_name`=VALUES(`package_name`),`function_name`=VALUES(`function_name`),`options`=VALUES(`options`),`create_time`=VALUES(`create_time`),`table_comment`=VALUES(`table_comment`),`tpl_category`=VALUES(`tpl_category`),`function_author`=VALUES(`function_author`),`remark`=VALUES(`remark`)\\n\",\"data\":null,\"otype\":2}', '1', '', '2020-02-13 08:11:11');
INSERT INTO `sys_oper_log` VALUES ('161', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-02-13 08:13:46');
INSERT INTO `sys_oper_log` VALUES ('162', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-02-13 08:14:29');
INSERT INTO `sys_oper_log` VALUES ('163', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-02-13 08:16:55');
INSERT INTO `sys_oper_log` VALUES ('164', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-02-13 08:17:17');
INSERT INTO `sys_oper_log` VALUES ('165', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-02-13 08:17:33');
INSERT INTO `sys_oper_log` VALUES ('166', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"26\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-13 08:17:43');
INSERT INTO `sys_oper_log` VALUES ('167', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-13 08:17:51');
INSERT INTO `sys_oper_log` VALUES ('168', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"27\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-14 18:39:18');
INSERT INTO `sys_oper_log` VALUES ('169', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-14 18:39:23');
INSERT INTO `sys_oper_log` VALUES ('170', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"sys_config\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-02-15 09:26:23');
INSERT INTO `sys_oper_log` VALUES ('171', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-16 11:51:08');
INSERT INTO `sys_oper_log` VALUES ('172', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-02-16 11:51:31');
INSERT INTO `sys_oper_log` VALUES ('173', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '运维部门', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-02-16 20:28:59');
INSERT INTO `sys_oper_log` VALUES ('174', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"28,29\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":2,\"otype\":3}', '0', '', '2020-02-16 20:43:22');
INSERT INTO `sys_oper_log` VALUES ('175', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-16 20:43:29');
INSERT INTO `sys_oper_log` VALUES ('176', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"30\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-16 20:43:51');
INSERT INTO `sys_oper_log` VALUES ('177', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-16 20:45:17');
INSERT INTO `sys_oper_log` VALUES ('178', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"31\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-16 20:54:03');
INSERT INTO `sys_oper_log` VALUES ('179', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-16 20:54:07');
INSERT INTO `sys_oper_log` VALUES ('180', '生成代码', '0', '/tool/gen/genCode?tableId=32', 'GET', '1', 'admin', '运维部门', '/tool/gen/genCode?tableId=32', '[::1]', '内网IP', '{\"tableId\":32}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-16 20:54:10');
INSERT INTO `sys_oper_log` VALUES ('181', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"32\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-16 20:58:16');
INSERT INTO `sys_oper_log` VALUES ('182', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_dept\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-16 20:58:20');
INSERT INTO `sys_oper_log` VALUES ('187', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_user_online\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-17 14:03:51');
INSERT INTO `sys_oper_log` VALUES ('207', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"sys_job,sys_job_log\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-18 15:44:13');
INSERT INTO `sys_oper_log` VALUES ('208', '删除操作日志', '3', '/monitor/operlog/remove', 'POST', '1', 'admin', '运维部门', '/monitor/operlog/remove', '[::1]', '内网IP', '{\"Ids\":\"206,205,204,203,202,201,200,199,198\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":9,\"otype\":3}', '0', '', '2020-02-18 18:16:19');
INSERT INTO `sys_oper_log` VALUES ('209', '删除操作日志', '3', '/monitor/operlog/remove', 'POST', '1', 'admin', '运维部门', '/monitor/operlog/remove', '[::1]', '内网IP', '{\"Ids\":\"197,196,195,194,193,192,191,190\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":8,\"otype\":3}', '0', '', '2020-02-18 18:16:25');
INSERT INTO `sys_oper_log` VALUES ('210', '删除操作日志', '3', '/monitor/operlog/remove', 'POST', '1', 'admin', '运维部门', '/monitor/operlog/remove', '[::1]', '内网IP', '{\"Ids\":\"189,188,186,185,184,183\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":6,\"otype\":3}', '0', '', '2020-02-18 18:16:40');
INSERT INTO `sys_oper_log` VALUES ('211', '新增参数', '1', '/system/config/add', 'POST', '1', 'admin', '运维部门', '/system/config/add', '[::1]', '内网IP', '{\"ConfigName\":\"静态资源OSS存储\",\"ConfigKey\":\"sys.resource.oss\",\"ConfigValue\":\"null\",\"ConfigType\":\"Y\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":4,\"otype\":1}', '0', '', '2020-02-18 20:10:33');
INSERT INTO `sys_oper_log` VALUES ('212', '修改参数', '1', '/system/config/edit', 'POST', '1', 'admin', '运维部门', '/system/config/edit', '[::1]', '内网IP', '{\"ConfigId\":4,\"ConfigName\":\"静态资源OSS存储\",\"ConfigKey\":\"sys.resource.oss\",\"ConfigValue\":\"null\",\"ConfigType\":\"Y\",\"Remark\":\"public目录下的静态资源存储到OSS，如果不存储设为null\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-18 20:11:45');
INSERT INTO `sys_oper_log` VALUES ('213', '修改参数', '1', '/system/config/edit', 'POST', '1', 'admin', '运维部门', '/system/config/edit', '[::1]', '内网IP', '{\"ConfigId\":4,\"ConfigName\":\"静态资源OSS存储\",\"ConfigKey\":\"sys.resource.oss\",\"ConfigValue\":\"http://cos.yunjie.info/yjg/\",\"ConfigType\":\"Y\",\"Remark\":\"public目录下的静态资源存储到OSS，如果不存储设为null\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-18 20:28:33');
INSERT INTO `sys_oper_log` VALUES ('214', '修改参数', '1', '/system/config/edit', 'POST', '1', 'admin', '运维部门', '/system/config/edit', '[::1]', '内网IP', '{\"ConfigId\":4,\"ConfigName\":\"静态资源网盘存储\",\"ConfigKey\":\"sys.resource.url\",\"ConfigValue\":\"http://cos.yunjie.info/yjg/\",\"ConfigType\":\"Y\",\"Remark\":\"public目录下的静态资源存储到OSS/COS等网盘，如果不存储设为null，设置网址即开始\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-18 20:39:04');
INSERT INTO `sys_oper_log` VALUES ('215', '修改参数', '1', '/system/config/edit', 'POST', '1', 'admin', '运维部门', '/system/config/edit', '[::1]', '内网IP', '{\"ConfigId\":4,\"ConfigName\":\"静态资源网盘存储\",\"ConfigKey\":\"sys.resource.url\",\"ConfigValue\":\"http://cos.yunjie.info/yjg\",\"ConfigType\":\"Y\",\"Remark\":\"public目录下的静态资源存储到OSS/COS等网盘，如果不存储设为null，设置网址即开始\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-18 20:48:34');
INSERT INTO `sys_oper_log` VALUES ('216', '用户强退', '0', '/monitor/online/forceLogout', 'POST', '1', 'admin', '运维部门', '/monitor/online/forceLogout', '[::1]', '内网IP', '{\"sessionId\":\"C0LS01Q354HSCZPLNN\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-18 21:18:28');
INSERT INTO `sys_oper_log` VALUES ('217', '修改定时任务调度', '1', '/monitor/job/edit', 'POST', '1', 'admin', '运维部门', '/monitor/job/edit', '[::1]', '内网IP', '{\"JobName\":\"系统默认（无参）\",\"JobGroup\":\"DEFAULT\",\"JobId\":0,\"InvokeTarget\":\"test1()\",\"CronExpression\":\"0 30 * * * *\",\"MisfirePolicy\":\"3\",\"Concurrent\":\"1\",\"Status\":\"0\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-19 09:34:53');
INSERT INTO `sys_oper_log` VALUES ('218', '修改参数', '1', '/system/config/edit', 'POST', '1', 'admin', '运维部门', '/system/config/edit', '[::1]', '内网IP', '{\"ConfigId\":4,\"ConfigName\":\"静态资源网盘存储\",\"ConfigKey\":\"sys.resource.url\",\"ConfigValue\":\"null\",\"ConfigType\":\"Y\",\"Remark\":\"public目录下的静态资源存储到OSS/COS等网盘，如果不存储设为null，设置网址即开始http://cos.yunjie.info/yjg\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-19 09:38:03');
INSERT INTO `sys_oper_log` VALUES ('219', '修改参数', '1', '/system/config/edit', 'POST', '1', 'admin', '运维部门', '/system/config/edit', '[::1]', '内网IP', '{\"ConfigId\":4,\"ConfigName\":\"静态资源网盘存储\",\"ConfigKey\":\"sys.resource.url\",\"ConfigValue\":\"null\",\"ConfigType\":\"Y\",\"Remark\":\"public目录下的静态资源存储到OSS/COS等网盘，如果不存储设为null，设置网址即开始http://cos.yunjie.info/yjg\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-19 10:36:22');
INSERT INTO `sys_oper_log` VALUES ('220', '修改定时任务调度', '1', '/monitor/job/edit', 'POST', '1', 'admin', '运维部门', '/monitor/job/edit', '[::1]', '内网IP', '{\"JobName\":\"系统默认（无参）\",\"JobGroup\":\"DEFAULT\",\"JobId\":0,\"InvokeTarget\":\"test1()\",\"CronExpression\":\"0 30 * * * *\",\"MisfirePolicy\":\"3\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-19 11:03:20');
INSERT INTO `sys_oper_log` VALUES ('221', '修改定时任务调度', '1', '/monitor/job/edit', 'POST', '1', 'admin', '运维部门', '/monitor/job/edit', '[::1]', '内网IP', '{\"JobName\":\"系统默认（无参）\",\"JobGroup\":\"DEFAULT\",\"JobId\":0,\"InvokeTarget\":\"test1()\",\"CronExpression\":\"0 30 * * * *\",\"MisfirePolicy\":\"3\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-19 11:03:57');
INSERT INTO `sys_oper_log` VALUES ('222', '新增定时任务调度', '1', '/monitor/job/add', 'POST', '1', 'admin', '运维部门', '/monitor/job/add', '[::1]', '内网IP', '{\"JobName\":\"test\",\"JobGroup\":\"\",\"InvokeTarget\":\"test4\",\"CronExpression\":\"0 0/7 * * * ?\",\"MisfirePolicy\":\"1\",\"Concurrent\":\"1\",\"Status\":\"\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"状态（0正常 1暂停）不能为空\",\"data\":null,\"otype\":1}', '1', '', '2020-02-19 11:04:22');
INSERT INTO `sys_oper_log` VALUES ('223', '新增定时任务调度', '1', '/monitor/job/add', 'POST', '1', 'admin', '运维部门', '/monitor/job/add', '[::1]', '内网IP', '{\"JobName\":\"test\",\"JobGroup\":\"\",\"InvokeTarget\":\"test4\",\"CronExpression\":\"0 0/7 * * * ?\",\"MisfirePolicy\":\"1\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":4,\"otype\":1}', '0', '', '2020-02-19 11:04:30');
INSERT INTO `sys_oper_log` VALUES ('224', '删除定时任务调度', '3', '/monitor/job/remove', 'POST', '1', 'admin', '运维部门', '/monitor/job/remove', '[::1]', '内网IP', '{\"Ids\":\"4\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-19 11:04:42');
INSERT INTO `sys_oper_log` VALUES ('225', '新增定时任务调度', '1', '/monitor/job/add', 'POST', '1', 'admin', '运维部门', '/monitor/job/add', '[::1]', '内网IP', '{\"JobName\":\"test\",\"JobGroup\":\"\",\"InvokeTarget\":\"testtt\",\"CronExpression\":\"0 0/7 * * * ?\",\"MisfirePolicy\":\"1\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":5,\"otype\":1}', '0', '', '2020-02-19 11:06:01');
INSERT INTO `sys_oper_log` VALUES ('226', '导出Excel', '0', '/monitor/job/export', 'POST', '1', 'admin', '运维部门', '/monitor/job/export', '[::1]', '内网IP', '{\"JobId\":0,\"JobName\":\"\",\"JobGroup\":\"\",\"InvokeTarget\":\"\",\"CronExpression\":\"\",\"MisfirePolicy\":\"\",\"Concurrent\":\"\",\"Status\":\"\",\"BeginTime\":\"\",\"EndTime\":\"\",\"PageNum\":0,\"PageSize\":0}', '{\"code\":0,\"msg\":\"1582081836007320000.xls\",\"data\":null,\"otype\":0}', '0', '', '2020-02-19 11:10:36');
INSERT INTO `sys_oper_log` VALUES ('227', '修改定时任务调度', '1', '/monitor/job/edit', 'POST', '1', 'admin', '运维部门', '/monitor/job/edit', '[::1]', '内网IP', '{\"JobName\":\"系统默认（无参）\",\"JobGroup\":\"DEFAULT\",\"JobId\":0,\"InvokeTarget\":\"test1()\",\"CronExpression\":\"0 30 * * * *\",\"MisfirePolicy\":\"3\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-19 14:04:59');
INSERT INTO `sys_oper_log` VALUES ('228', '删除定时任务调度', '3', '/monitor/job/remove', 'POST', '1', 'admin', '运维部门', '/monitor/job/remove', '[::1]', '内网IP', '{\"Ids\":\"5\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-19 15:00:40');
INSERT INTO `sys_oper_log` VALUES ('229', '新增定时任务调度', '1', '/monitor/job/add', 'POST', '1', 'admin', '运维部门', '/monitor/job/add', '[::1]', '内网IP', '{\"JobName\":\"系统默认（无参）\",\"JobGroup\":\"DEFAULT\",\"InvokeTarget\":\"sdfsdfsf\",\"CronExpression\":\"0 0/7 * * * ?\",\"MisfirePolicy\":\"3\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":6,\"otype\":1}', '0', '', '2020-02-19 15:09:26');
INSERT INTO `sys_oper_log` VALUES ('230', '删除定时任务调度', '3', '/monitor/job/remove', 'POST', '1', 'admin', '运维部门', '/monitor/job/remove', '[::1]', '内网IP', '{\"Ids\":\"6\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-19 15:09:33');
INSERT INTO `sys_oper_log` VALUES ('231', '新增定时任务调度', '1', '/monitor/job/add', 'POST', '1', 'admin', '运维部门', '/monitor/job/add', '[::1]', '内网IP', '{\"JobName\":\"系统默认（无参）\",\"JobGroup\":\"DEFAULT\",\"InvokeTarget\":\"test1\",\"CronExpression\":\"0 0/7 * * * ?\",\"MisfirePolicy\":\"3\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":7,\"otype\":1}', '0', '', '2020-02-19 15:09:44');
INSERT INTO `sys_oper_log` VALUES ('232', '修改定时任务调度', '1', '/monitor/job/edit', 'POST', '1', 'admin', '运维部门', '/monitor/job/edit', '[::1]', '内网IP', '{\"JobName\":\"系统默认（无参）\",\"JobGroup\":\"DEFAULT\",\"JobId\":0,\"InvokeTarget\":\"test1\",\"CronExpression\":\"0 0/7 * * * ?\",\"MisfirePolicy\":\"3\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"ddd\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-19 15:09:54');
INSERT INTO `sys_oper_log` VALUES ('233', '修改定时任务调度', '1', '/monitor/job/edit', 'POST', '1', 'admin', '运维部门', '/monitor/job/edit', '[::1]', '内网IP', '{\"JobName\":\"系统默认（无参）\",\"JobGroup\":\"DEFAULT\",\"JobId\":0,\"InvokeTarget\":\"test1\",\"CronExpression\":\"0 0/7 * * * ?\",\"MisfirePolicy\":\"3\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"ddd\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-19 15:10:01');
INSERT INTO `sys_oper_log` VALUES ('234', '修改定时任务调度', '1', '/monitor/job/edit', 'POST', '1', 'admin', '运维部门', '/monitor/job/edit', '[::1]', '内网IP', '{\"JobName\":\"系统默认（无参）\",\"JobGroup\":\"DEFAULT\",\"JobId\":0,\"InvokeTarget\":\"test1\",\"CronExpression\":\"0 0/7 * * * ?\",\"MisfirePolicy\":\"3\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"ddd\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-02-19 15:11:35');
INSERT INTO `sys_oper_log` VALUES ('235', '修改定时任务调度', '1', '/monitor/job/edit', 'POST', '1', 'admin', '运维部门', '/monitor/job/edit', '[::1]', '内网IP', '{\"JobName\":\"系统默认（无参）\",\"JobGroup\":\"DEFAULT\",\"JobId\":7,\"InvokeTarget\":\"test1\",\"CronExpression\":\"0 0/7 * * * ?\",\"MisfirePolicy\":\"3\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-19 15:12:37');
INSERT INTO `sys_oper_log` VALUES ('236', '删除定时任务调度', '3', '/monitor/job/remove', 'POST', '1', 'admin', '运维部门', '/monitor/job/remove', '[::1]', '内网IP', '{\"Ids\":\"7\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-19 15:12:42');
INSERT INTO `sys_oper_log` VALUES ('237', '新增定时任务调度', '1', '/monitor/job/add', 'POST', '1', 'admin', '运维部门', '/monitor/job/add', '[::1]', '内网IP', '{\"JobName\":\"系统默认（无参）\",\"JobGroup\":\"DEFAULT\",\"InvokeTarget\":\"test1\",\"CronExpression\":\"0 0/7 * * * ?\",\"MisfirePolicy\":\"1\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":8,\"otype\":1}', '0', '', '2020-02-19 16:08:37');
INSERT INTO `sys_oper_log` VALUES ('238', '删除用户', '3', '/system/user/remove', 'POST', '1', 'admin', '运维部门', '/system/user/remove', '175.0.212.81', '深圳', '{\"Ids\":\"2\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-20 09:07:05');
INSERT INTO `sys_oper_log` VALUES ('239', '修改菜单', '1', '/system/menu/edit', 'POST', '1', 'admin', '运维部门', '/system/menu/edit', '175.0.212.81', '深圳', '{\"MenuId\":107,\"ParentId\":1086,\"MenuType\":\"C\",\"MenuName\":\"通知公告\",\"OrderNum\":8,\"Url\":\"/system/notice\",\"Icon\":\"#\",\"Target\":\"menuItem\",\"Perms\":\"system:notice:view\",\"Visible\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-20 09:12:54');
INSERT INTO `sys_oper_log` VALUES ('240', '删除用户', '3', '/system/user/remove', 'POST', '1', 'admin', '运维部门', '/system/user/remove', '175.0.212.81', '深圳', '{\"Ids\":\"1\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-20 09:17:16');
INSERT INTO `sys_oper_log` VALUES ('241', '修改用户密码', '2', '/system/user/profile/resetSavePwd', 'POST', '1', 'admin', '运维部门', '/system/user/profile/resetSavePwd', '175.0.212.81', '', '{\"Password\":\"\",\"NewPassword\":\"yunjiego\",\"ConfirmPassword\":\"\"}', '{\"code\":500,\"msg\":\"请输入旧密码; 旧密码长度为5到30位; 请输入确认密码; 确认密码长度为5到30位\",\"data\":null,\"otype\":2}', '1', '', '2020-02-20 09:22:21');
INSERT INTO `sys_oper_log` VALUES ('242', '修改用户密码', '2', '/system/user/profile/resetSavePwd', 'POST', '1', 'admin', '运维部门', '/system/user/profile/resetSavePwd', '175.0.212.81', '深圳', '{\"Password\":\"\",\"NewPassword\":\"yjg123456\",\"ConfirmPassword\":\"\"}', '{\"code\":500,\"msg\":\"请输入旧密码; 旧密码长度为5到30位; 请输入确认密码; 确认密码长度为5到30位\",\"data\":null,\"otype\":2}', '1', '', '2020-02-20 09:22:54');
INSERT INTO `sys_oper_log` VALUES ('243', '修改用户密码', '2', '/system/user/profile/resetSavePwd', 'POST', '1', 'admin', '运维部门', '/system/user/profile/resetSavePwd', '175.0.212.81', '深圳', '{\"Password\":\"\",\"NewPassword\":\"yjg123456\",\"ConfirmPassword\":\"\"}', '{\"code\":500,\"msg\":\"请输入旧密码; 旧密码长度为5到30位; 请输入确认密码; 确认密码长度为5到30位\",\"data\":null,\"otype\":2}', '1', '', '2020-02-20 09:23:04');
INSERT INTO `sys_oper_log` VALUES ('244', '修改用户密码', '2', '/system/user/profile/resetSavePwd', 'POST', '1', 'admin', '运维部门', '/system/user/profile/resetSavePwd', '175.0.212.81', '深圳', '{\"Password\":\"\",\"NewPassword\":\"yjg123456\",\"ConfirmPassword\":\"\"}', '{\"code\":500,\"msg\":\"请输入旧密码; 旧密码长度为5到30位; 请输入确认密码; 确认密码长度为5到30位\",\"data\":null,\"otype\":2}', '1', '', '2020-02-20 09:23:15');
INSERT INTO `sys_oper_log` VALUES ('245', '修改用户密码', '2', '/system/user/profile/resetSavePwd', 'POST', '1', 'admin', '运维部门', '/system/user/profile/resetSavePwd', '[::1]', '内网IP', '{\"OldPassword\":\"1qaz2wsx\",\"NewPassword\":\"yjg123456\",\"Confirm\":\"yjg123456\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-02-20 09:42:04');
INSERT INTO `sys_oper_log` VALUES ('246', 'demo演示', '2', '/demo/operate/edit', 'POST', '1', 'admin', '运维部门', '/demo/operate/edit', '[::1]', '内网IP', '{\"UserId\":1}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":{\"userId\":1,\"userCode\":\"1000001\",\"userPhone\":\"15888888888\",\"userEmail\":\"111@qq.com\",\"userBalance\":100,\"status\":\"0\",\"createTime\":\"2020-01-12 02:02:02\"},\"otype\":2}', '0', '', '2020-02-21 16:59:28');
INSERT INTO `sys_oper_log` VALUES ('247', 'demo演示', '2', '/demo/operate/edit', 'POST', '1', 'admin', '运维部门', '/demo/operate/edit', '[::1]', '内网IP', '{\"UserId\":1}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":{\"userId\":1,\"userCode\":\"1000001\",\"userPhone\":\"15888888888\",\"userEmail\":\"111@qq.com\",\"userBalance\":100,\"status\":\"0\",\"createTime\":\"2020-01-12 02:02:02\"},\"otype\":2}', '0', '', '2020-02-21 16:59:30');
INSERT INTO `sys_oper_log` VALUES ('248', 'demo演示', '2', '/demo/operate/edit?id=1', 'GET', '1', 'admin', '运维部门', '/demo/operate/edit?id=1', '[::1]', '内网IP', '{\"UserId\":1}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":{\"userId\":1,\"userCode\":\"1000001\",\"userPhone\":\"15888888888\",\"userEmail\":\"111@qq.com\",\"userBalance\":100,\"status\":\"0\",\"createTime\":\"2020-01-12 02:02:02\"},\"otype\":2}', '0', '', '2020-02-21 17:23:28');
INSERT INTO `sys_oper_log` VALUES ('249', 'demo演示', '2', '/demo/operate/edit?id=2', 'GET', '1', 'admin', '运维部门', '/demo/operate/edit?id=2', '[::1]', '内网IP', '{\"UserId\":1}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":{\"userId\":1,\"userCode\":\"1000001\",\"userPhone\":\"15888888888\",\"userEmail\":\"111@qq.com\",\"userBalance\":100,\"status\":\"0\",\"createTime\":\"2020-01-12 02:02:02\"},\"otype\":2}', '0', '', '2020-02-21 17:23:32');
INSERT INTO `sys_oper_log` VALUES ('250', '修改角色', '1', '/system/role/edit', 'POST', '1', 'admin', '运维部门', '/system/role/edit', '[::1]', '内网IP', '{\"RoleId\":1,\"RoleName\":\"管理员\",\"RoleKey\":\"admin\",\"RoleSort\":\"1\",\"Status\":\"0\",\"Remark\":\"管理员\",\"MenuIds\":\"1,100,502,1001,1004,1005,1098,1099,1101,1103,1104,1105,1106,1107,1108,1109,101,1007,1008,1009,1010,1011,1110,1111,1112,1113,1114,1115,1117,1118,1119,1120,1121,1122,102,1097,1012,1013,1123,1124,1125,1126,1127,103,1016,1017,1018,1019,1093,1094,1116,1129,1130,104,1020,1021,1022,1023,1024,1131,1132,1133,1134,105,1025,1026,1029,1137,1138,1139,1140,1143,1144,1148,1149,106,1030,1031,1034,1135,1136,1086,107,1035,1036,1037,1038,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,1151,1152,112,500,1039,1040,1096,1041,1042,501,1043,1044,1045,1046,1095,3,113,114,1057,1058,1059,1060,1061,1145,1146,1147,1150,115,4,5,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,6,27,28,29,30,31,32,33,35,36,37,38,39,40,41,42,43,44,7,45,46,47,8,48,49,9,50,51,52,53,10,54,55\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-26 14:55:29');
INSERT INTO `sys_oper_log` VALUES ('251', '修改定时任务调度', '1', '/monitor/job/edit', 'POST', '1', 'admin', '运维部门', '/monitor/job/edit', '[::1]', '内网IP', '{\"JobName\":\"test1\",\"JobGroup\":\"DEFAULT\",\"JobId\":1,\"InvokeTarget\":\"test1()\",\"CronExpression\":\"0 30 * * * *\",\"MisfirePolicy\":\"2\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-26 15:07:17');
INSERT INTO `sys_oper_log` VALUES ('252', '修改定时任务调度', '1', '/monitor/job/edit', 'POST', '1', 'admin', '运维部门', '/monitor/job/edit', '[::1]', '内网IP', '{\"JobName\":\"test1\",\"JobGroup\":\"DEFAULT\",\"JobId\":1,\"InvokeTarget\":\"test1()\",\"CronExpression\":\"0 30 * * * *\",\"MisfirePolicy\":\"2\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-26 15:08:02');
INSERT INTO `sys_oper_log` VALUES ('253', '', '0', '/monitor/job/run', 'POST', '1', 'admin', '运维部门', '/monitor/job/run', '[::1]', '内网IP', '{\"jobId\":1}', '{\"code\":500,\"msg\":\"任务不存在\",\"data\":null,\"otype\":0}', '1', '', '2020-02-26 15:21:58');
INSERT INTO `sys_oper_log` VALUES ('254', '', '0', '/monitor/job/run', 'POST', '1', 'admin', '运维部门', '/monitor/job/run', '[::1]', '内网IP', '{\"jobId\":1}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-26 15:23:46');
INSERT INTO `sys_oper_log` VALUES ('255', '删除定时任务调度', '3', '/monitor/job/remove', 'POST', '1', 'admin', '运维部门', '/monitor/job/remove', '[::1]', '内网IP', '{\"Ids\":\"1,2,3,8\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":4,\"otype\":3}', '0', '', '2020-02-26 15:27:24');
INSERT INTO `sys_oper_log` VALUES ('256', '新增定时任务调度', '1', '/monitor/job/add', 'POST', '1', 'admin', '运维部门', '/monitor/job/add', '[::1]', '内网IP', '{\"JobName\":\"test1\",\"JobGroup\":\"DEFAULT\",\"InvokeTarget\":\"test1\",\"CronExpression\":\"* * * * * *\",\"MisfirePolicy\":\"2\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":9,\"otype\":1}', '0', '', '2020-02-26 15:29:06');
INSERT INTO `sys_oper_log` VALUES ('257', '', '0', '/monitor/job/run', 'POST', '1', 'admin', '运维部门', '/monitor/job/run', '[::1]', '内网IP', '{\"jobId\":9}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-26 15:29:25');
INSERT INTO `sys_oper_log` VALUES ('258', '删除定时任务调度', '3', '/monitor/job/remove', 'POST', '1', 'admin', '运维部门', '/monitor/job/remove', '[::1]', '内网IP', '{\"Ids\":\"9\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-26 15:29:44');
INSERT INTO `sys_oper_log` VALUES ('259', '新增定时任务调度', '1', '/monitor/job/add', 'POST', '1', 'admin', '运维部门', '/monitor/job/add', '[::1]', '内网IP', '{\"JobName\":\"test1\",\"JobGroup\":\"DEFAULT\",\"InvokeTarget\":\"test1\",\"CronExpression\":\"* * * * * *\",\"MisfirePolicy\":\"2\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":10,\"otype\":1}', '0', '', '2020-02-26 15:30:27');
INSERT INTO `sys_oper_log` VALUES ('260', '', '0', '/monitor/job/run', 'POST', '1', 'admin', '运维部门', '/monitor/job/run', '[::1]', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-26 15:30:31');
INSERT INTO `sys_oper_log` VALUES ('261', '', '0', '/monitor/job/run', 'POST', '1', 'admin', '运维部门', '/monitor/job/run', '[::1]', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-26 16:28:44');
INSERT INTO `sys_oper_log` VALUES ('262', '', '0', '/monitor/job/run', 'POST', '1', 'admin', '运维部门', '/monitor/job/run', '[::1]', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-26 16:28:52');
INSERT INTO `sys_oper_log` VALUES ('263', '', '0', '/monitor/job/run', 'POST', '1', 'admin', '运维部门', '/monitor/job/run', '[::1]', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-26 16:31:55');
INSERT INTO `sys_oper_log` VALUES ('264', '', '0', '/monitor/job/run', 'POST', '1', 'admin', '运维部门', '/monitor/job/run', '[::1]', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-26 16:33:11');
INSERT INTO `sys_oper_log` VALUES ('265', '', '0', '/monitor/job/run', 'POST', '1', 'admin', '运维部门', '/monitor/job/run', '[::1]', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-26 16:33:19');
INSERT INTO `sys_oper_log` VALUES ('266', '', '0', '/monitor/job/run', 'POST', '1', 'admin', '运维部门', '/monitor/job/run', '[::1]', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-26 16:42:25');
INSERT INTO `sys_oper_log` VALUES ('267', '修改定时任务调度', '1', '/monitor/job/edit', 'POST', '1', 'admin', '运维部门', '/monitor/job/edit', '[::1]', '内网IP', '{\"JobName\":\"test1\",\"JobGroup\":\"DEFAULT\",\"JobId\":10,\"InvokeTarget\":\"test1\",\"CronExpression\":\"* * * * * *\",\"MisfirePolicy\":\"1\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":1}', '0', '', '2020-02-26 16:51:46');
INSERT INTO `sys_oper_log` VALUES ('268', '', '0', '/monitor/job/start', 'POST', '1', 'admin', '运维部门', '/monitor/job/start', '[::1]', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-26 16:52:55');
INSERT INTO `sys_oper_log` VALUES ('269', '新增定时任务调度', '1', '/monitor/job/add', 'POST', '1', 'admin', '运维部门', '/monitor/job/add', '[::1]', '内网IP', '{\"JobName\":\"test2\",\"JobParams\":\"hello|world\",\"JobGroup\":\"DEFAULT\",\"InvokeTarget\":\"test2\",\"CronExpression\":\"* * * * * *\",\"MisfirePolicy\":\"1\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":11,\"otype\":1}', '0', '', '2020-02-27 10:18:14');
INSERT INTO `sys_oper_log` VALUES ('270', '删除定时任务调度', '3', '/monitor/job/remove', 'POST', '1', 'admin', '运维部门', '/monitor/job/remove', '[::1]', '内网IP', '{\"Ids\":\"11\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-02-27 10:19:53');
INSERT INTO `sys_oper_log` VALUES ('271', '新增定时任务调度', '1', '/monitor/job/add', 'POST', '1', 'admin', '运维部门', '/monitor/job/add', '[::1]', '内网IP', '{\"JobName\":\"test2\",\"JobParams\":\"helloworld|yjgo\",\"JobGroup\":\"DEFAULT\",\"InvokeTarget\":\"test2\",\"CronExpression\":\"* * * * * *\",\"MisfirePolicy\":\"1\",\"Concurrent\":\"1\",\"Status\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":12,\"otype\":1}', '0', '', '2020-02-27 10:20:26');
INSERT INTO `sys_oper_log` VALUES ('272', '', '0', '/monitor/job/start', 'POST', '1', 'admin', '运维部门', '/monitor/job/start', '[::1]', '内网IP', '{\"jobId\":12}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-27 10:20:35');
INSERT INTO `sys_oper_log` VALUES ('273', '', '0', '/monitor/job/start', 'POST', '1', 'admin', '运维部门', '/monitor/job/start', '[::1]', '内网IP', '{\"jobId\":12}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-27 10:21:33');
INSERT INTO `sys_oper_log` VALUES ('274', '', '0', '/monitor/job/start', 'POST', '1', 'admin', '运维部门', '/monitor/job/start', '[::1]', '内网IP', '{\"jobId\":12}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-27 10:27:15');
INSERT INTO `sys_oper_log` VALUES ('275', '', '0', '/monitor/job/start', 'POST', '1', 'admin', '运维部门', '/monitor/job/start', '[::1]', '内网IP', '{\"jobId\":12}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-27 10:28:33');
INSERT INTO `sys_oper_log` VALUES ('276', '', '0', '/monitor/job/stop', 'POST', '1', 'admin', '运维部门', '/monitor/job/stop', '[::1]', '内网IP', '{\"jobId\":12}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-27 10:28:37');
INSERT INTO `sys_oper_log` VALUES ('277', '', '0', '/monitor/job/start', 'POST', '1', 'admin', '运维部门', '/monitor/job/start', '[::1]', '内网IP', '{\"jobId\":12}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-27 10:31:30');
INSERT INTO `sys_oper_log` VALUES ('278', '', '0', '/monitor/job/start', 'POST', '1', 'admin', '运维部门', '/monitor/job/start', '[::1]', '内网IP', '{\"jobId\":12}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-27 11:11:12');
INSERT INTO `sys_oper_log` VALUES ('279', '', '0', '/monitor/job/stop', 'POST', '1', 'admin', '运维部门', '/monitor/job/stop', '[::1]', '内网IP', '{\"jobId\":12}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-27 11:11:18');
INSERT INTO `sys_oper_log` VALUES ('280', '', '0', '/monitor/job/start', 'POST', '1', 'admin', '运维部门', '/monitor/job/start', '[::1]', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"启动成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-27 11:11:23');
INSERT INTO `sys_oper_log` VALUES ('281', '', '0', '/monitor/job/stop', 'POST', '1', 'admin', '运维部门', '/monitor/job/stop', '[::1]', '内网IP', '{\"jobId\":10}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', '0', '', '2020-02-27 11:11:28');
INSERT INTO `sys_oper_log` VALUES ('282', '删除菜单', '3', '/system/menu/remove?id=1035', 'GET', '1', 'admin', '运维部门', '/system/menu/remove?id=1035', '[::1]', '内网IP', '{\"id\":1035}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":true,\"otype\":3}', '0', '', '2020-02-28 09:38:45');
INSERT INTO `sys_oper_log` VALUES ('283', '删除菜单', '3', '/system/menu/remove?id=1036', 'GET', '1', 'admin', '运维部门', '/system/menu/remove?id=1036', '[::1]', '内网IP', '{\"id\":1036}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":true,\"otype\":3}', '0', '', '2020-02-28 09:38:48');
INSERT INTO `sys_oper_log` VALUES ('284', '删除菜单', '3', '/system/menu/remove?id=1037', 'GET', '1', 'admin', '运维部门', '/system/menu/remove?id=1037', '[::1]', '内网IP', '{\"id\":1037}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":true,\"otype\":3}', '0', '', '2020-02-28 09:38:55');
INSERT INTO `sys_oper_log` VALUES ('285', '删除菜单', '3', '/system/menu/remove?id=1038', 'GET', '1', 'admin', '运维部门', '/system/menu/remove?id=1038', '[::1]', '内网IP', '{\"id\":1038}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":true,\"otype\":3}', '0', '', '2020-02-28 09:38:57');
INSERT INTO `sys_oper_log` VALUES ('286', '删除参数', '3', '/tool/gen/remove', 'POST', '1', 'admin', '运维部门', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"33,34,35,36\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":4,\"otype\":3}', '0', '', '2020-02-28 13:46:18');
INSERT INTO `sys_oper_log` VALUES ('287', '导入表结构', '1', '/tool/gen/importTable', 'POST', '1', 'admin', '运维部门', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"t_answer,t_problem,t_user_withdrawals,t_zjuser,t_zxuser\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-02-28 13:53:14');
INSERT INTO `sys_oper_log` VALUES ('288', '修改用户', '2', '/system/user/edit', 'POST', '1', 'admin', '运维部门', '/system/user/edit', '[::1]', '内网IP', '{\"UserId\":1,\"UserName\":\"超级管理员\",\"Phonenumber\":\"15888888881\",\"Email\":\"dd122221111d@163.com\",\"DeptId\":0,\"Sex\":\"0\",\"Status\":\"0\",\"RoleIds\":\"1\",\"PostIds\":\"1\",\"Remark\":\"管理员111111\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":1,\"otype\":2}', '1', '', '2020-03-01 11:42:05');
INSERT INTO `sys_oper_log` VALUES ('289', '修改用户', '2', '/system/user/edit', 'POST', '1', 'admin', '运维部门', '/system/user/edit', '[::1]', '内网IP', '{\"UserId\":1,\"UserName\":\"超级管理员\",\"Phonenumber\":\"15888888881\",\"Email\":\"dd122221111d@163.com\",\"DeptId\":0,\"Sex\":\"0\",\"Status\":\"0\",\"RoleIds\":\"1\",\"PostIds\":\"1\",\"Remark\":\"管理员111111\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', '0', '', '2020-03-01 11:43:05');
INSERT INTO `sys_oper_log` VALUES ('290', '新增用户', '1', '/system/user/add', 'POST', '1', 'admin', '', '/system/user/add', '[::1]', '内网IP', '{\"UserName\":\"admin\",\"Phonenumber\":\"18788996255\",\"Email\":\"ddd@163.com\",\"LoginName\":\"admin111\",\"Password\":\"yjg123456\",\"DeptId\":110,\"Sex\":\"0\",\"Status\":\"0\",\"RoleIds\":\"1\",\"PostIds\":\"\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-03-11 11:22:10');
INSERT INTO `sys_oper_log` VALUES ('291', '新增用户', '1', '/system/user/add', 'POST', '1', 'admin', '', '/system/user/add', '[::1]', '内网IP', '{\"UserName\":\"admin\",\"Phonenumber\":\"18788996255\",\"Email\":\"ddd@163.com\",\"LoginName\":\"admin111\",\"Password\":\"yjg123456\",\"DeptId\":110,\"Sex\":\"0\",\"Status\":\"0\",\"RoleIds\":\"1\",\"PostIds\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":3,\"otype\":1}', '0', '', '2020-03-11 11:22:16');
INSERT INTO `sys_oper_log` VALUES ('292', '重置密码', '2', '/system/user/resetPwd', 'POST', '1', 'admin', '', '/system/user/resetPwd', '[::1]', '内网IP', '{\"UserId\":3,\"Password\":\"yjg123456\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-03-11 11:23:31');
INSERT INTO `sys_oper_log` VALUES ('293', '导入表结构', '0', '/tool/gen/importTable', 'POST', '1', 'admin', '', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"g_game\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-03-12 14:55:06');
INSERT INTO `sys_oper_log` VALUES ('294', '导入表结构', '0', '/tool/gen/importTable', 'POST', '1', 'admin', '', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"g_user\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-03-12 14:55:11');
INSERT INTO `sys_oper_log` VALUES ('295', '导入表结构', '0', '/tool/gen/importTable', 'POST', '1', 'admin', '', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"g_game\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-03-12 14:55:39');
INSERT INTO `sys_oper_log` VALUES ('296', '生成代码', '3', '/tool/gen/remove', 'POST', '1', 'admin', '', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"42,43,44\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-03-12 14:58:43');
INSERT INTO `sys_oper_log` VALUES ('297', '导入表结构', '0', '/tool/gen/importTable', 'POST', '1', 'admin', '', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"g_game,g_user\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-03-12 14:58:47');
INSERT INTO `sys_oper_log` VALUES ('298', '生成代码', '3', '/tool/gen/remove', 'POST', '1', 'admin', '', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"45,46\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-03-12 15:00:24');
INSERT INTO `sys_oper_log` VALUES ('299', '导入表结构', '0', '/tool/gen/importTable', 'POST', '1', 'admin', '', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"g_game\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-03-12 15:01:15');
INSERT INTO `sys_oper_log` VALUES ('300', '生成代码', '3', '/tool/gen/remove', 'POST', '1', 'admin', '', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"47\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-03-12 15:04:45');
INSERT INTO `sys_oper_log` VALUES ('301', '导入表结构', '0', '/tool/gen/importTable', 'POST', '1', 'admin', '', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"g_game\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-03-12 15:05:57');
INSERT INTO `sys_oper_log` VALUES ('302', '导入表结构', '0', '/tool/gen/importTable', 'POST', '1', 'admin', '', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"g_game\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-03-12 15:06:11');
INSERT INTO `sys_oper_log` VALUES ('303', '导入表结构', '0', '/tool/gen/importTable', 'POST', '1', 'admin', '', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"g_game\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-03-12 15:07:52');
INSERT INTO `sys_oper_log` VALUES ('304', '生成代码', '3', '/tool/gen/remove', 'POST', '1', 'admin', '', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"37,38,39,40,41,48,49,50\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-03-12 18:01:08');
INSERT INTO `sys_oper_log` VALUES ('305', '导入表结构', '0', '/tool/gen/importTable', 'POST', '1', 'admin', '', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"t_answer\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-03-12 18:06:02');
INSERT INTO `sys_oper_log` VALUES ('306', '字典数据管理', '2', '/system/dict/data/edit', 'POST', '1', 'admin', '', '/system/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":1,\"DictLabel\":\"男\",\"DictValue\":\"0\",\"DictType\":\"\",\"DictSort\":1,\"CssClass\":\"\",\"ListClass\":\"primary\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"[[*{remark}]]\"}', '{\"code\":500,\"msg\":\"字典类型不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-03-13 08:27:11');
INSERT INTO `sys_oper_log` VALUES ('307', '字典数据管理', '2', '/system/dict/data/edit', 'POST', '1', 'admin', '', '/system/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":1,\"DictLabel\":\"男\",\"DictValue\":\"0\",\"DictType\":\"\",\"DictSort\":1,\"CssClass\":\"\",\"ListClass\":\"primary\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"性别男\"}', '{\"code\":500,\"msg\":\"字典类型不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-03-13 08:28:10');
INSERT INTO `sys_oper_log` VALUES ('308', '字典数据管理', '2', '/system/dict/data/edit', 'POST', '1', 'admin', '', '/system/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":1,\"DictLabel\":\"男\",\"DictValue\":\"0\",\"DictType\":\"\",\"DictSort\":1,\"CssClass\":\"\",\"ListClass\":\"primary\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"性别男\"}', '{\"code\":500,\"msg\":\"字典类型不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-03-13 08:29:16');
INSERT INTO `sys_oper_log` VALUES ('309', '字典数据管理', '2', '/system/dict/data/edit', 'POST', '1', 'admin', '', '/system/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":1,\"DictLabel\":\"男\",\"DictValue\":\"0\",\"DictType\":\"\",\"DictSort\":1,\"CssClass\":\"\",\"ListClass\":\"primary\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"性别男\"}', '{\"code\":500,\"msg\":\"字典类型不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-03-13 08:49:44');
INSERT INTO `sys_oper_log` VALUES ('310', '字典数据管理', '2', '/system/dict/data/edit', 'POST', '1', 'admin', '', '/system/dict/data/edit', '[::1]', '内网IP', '{\"DictCode\":1,\"DictLabel\":\"男\",\"DictValue\":\"0\",\"DictType\":\"\",\"DictSort\":1,\"CssClass\":\"\",\"ListClass\":\"success\",\"IsDefault\":\"Y\",\"Status\":\"0\",\"Remark\":\"性别男\"}', '{\"code\":500,\"msg\":\"字典类型不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-03-13 08:51:18');
INSERT INTO `sys_oper_log` VALUES ('311', '修改用户', '2', '/system/user/edit', 'POST', '1', 'admin', '', '/system/user/edit', '[::1]', '内网IP', '{\"UserId\":3,\"UserName\":\"admin\",\"Phonenumber\":\"18788996255\",\"Email\":\"ddd@163.com\",\"DeptId\":0,\"Sex\":\"0\",\"Status\":\"0\",\"RoleIds\":\"1\",\"PostIds\":\"1\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', '0', '', '2020-03-29 20:02:24');
INSERT INTO `sys_oper_log` VALUES ('312', '角色管理', '2', '/system/role/edit', 'POST', '1', 'admin', '', '/system/role/edit', '[::1]', '内网IP', '{\"RoleId\":1,\"RoleName\":\"管理员\",\"RoleKey\":\"admin\",\"RoleSort\":\"1\",\"Status\":\"0\",\"Remark\":\"管理员\",\"MenuIds\":\"1,100,502,1001,1004,1005,1098,1099,1101,1103,1104,1105,1106,1107,1108,1109,101,1007,1008,1009,1010,1011,1110,1111,1112,1113,1114,1115,1117,1118,1119,1120,1121,1122,102,1097,1012,1013,1123,1124,1125,1126,1127,103,1016,1017,1018,1019,1093,1094,1116,1129,1130,104,1020,1021,1022,1023,1024,1131,1132,1133,1134,105,1025,1026,1029,1137,1138,1139,1140,1143,1144,1148,1149,106,1030,1031,1034,1135,1136,1086,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,1151,1152,112,500,1039,1040,1096,1041,1042,501,1043,1044,1045,1046,1095,3,113,114,1057,1058,1059,1060,1061,1145,1146,1147,1150,115,4,5,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,6,27,28,29,30,31,32,33,35,36,37,38,39,40,41,42,43,44,7,45,46,47,8,48,49,9,50,51,52,53,10,54,55\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', '0', '', '2020-03-29 20:02:29');
INSERT INTO `sys_oper_log` VALUES ('313', '部门管理', '2', '/system/dept/edit', 'POST', '1', 'admin', '', '/system/dept/edit', '[::1]', '内网IP', '{\"DeptId\":110,\"ParentId\":100,\"DeptName\":\"运维部门\",\"OrderNum\":1,\"Leader\":\"\",\"Phone\":\"\",\"Email\":\"\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', '0', '', '2020-03-29 20:05:44');
INSERT INTO `sys_oper_log` VALUES ('314', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"t_answer\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-09 11:22:45');
INSERT INTO `sys_oper_log` VALUES ('315', '导入表结构', '0', '/tool/gen/importTable', 'POST', '1', 'admin', '', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"tbl_file\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-09 11:25:39');
INSERT INTO `sys_oper_log` VALUES ('316', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"tbl_file\"}', '{\"code\":500,\"msg\":\"表描述不能为空; 生成功能名不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-05-09 11:26:16');
INSERT INTO `sys_oper_log` VALUES ('317', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"tbl_file\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-09 11:26:34');
INSERT INTO `sys_oper_log` VALUES ('318', '生成代码', '0', '/tool/gen/genCode?tableId=54', 'GET', '1', 'admin', '', '/tool/gen/genCode?tableId=54', '[::1]', '内网IP', '{\"tableId\":54}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-09 11:26:50');
INSERT INTO `sys_oper_log` VALUES ('319', '角色管理', '0', '/system/role/authDataScope', 'POST', '1', 'admin', '', '/system/role/authDataScope', '[::1]', '内网IP', '{\"RoleId\":1,\"RoleName\":\"管理员\",\"RoleKey\":\"admin\",\"DataScope\":\"1\",\"DeptIds\":\"\"}', '{\"code\":500,\"msg\":\"不允许操作超级管理员角色\",\"data\":null,\"otype\":0}', '1', '', '2020-05-09 11:49:45');
INSERT INTO `sys_oper_log` VALUES ('320', '新增用户', '1', '/system/user/add', 'POST', '1', 'admin', '', '/system/user/add', '[::1]', '内网IP', '{\"UserName\":\"zy-admin\",\"Phonenumber\":\"13810446192\",\"Email\":\"flywithyou_Ren@139.com\",\"LoginName\":\"zy-admin\",\"Password\":\"123456\",\"DeptId\":110,\"Sex\":\"0\",\"Status\":\"0\",\"RoleIds\":\"1\",\"PostIds\":\"\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":4,\"otype\":1}', '0', '', '2020-05-09 11:52:46');
INSERT INTO `sys_oper_log` VALUES ('321', '角色管理', '0', '/system/role/authDataScope', 'POST', '1', 'admin', '', '/system/role/authDataScope', '[::1]', '内网IP', '{\"RoleId\":1,\"RoleName\":\"管理员\",\"RoleKey\":\"admin\",\"DataScope\":\"1\",\"DeptIds\":\"\"}', '{\"code\":500,\"msg\":\"不允许操作超级管理员角色\",\"data\":null,\"otype\":0}', '1', '', '2020-05-09 11:56:31');
INSERT INTO `sys_oper_log` VALUES ('322', '角色管理', '2', '/system/role/edit', 'POST', '1', 'admin', '', '/system/role/edit', '[::1]', '内网IP', '{\"RoleId\":1,\"RoleName\":\"管理员\",\"RoleKey\":\"admin\",\"RoleSort\":\"1\",\"Status\":\"0\",\"Remark\":\"管理员\",\"MenuIds\":\"1,100,1001,1004,1005,101,1007,1008,1009,1010,1011,102,1012,1013,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1029,106,1030,1031,1034,107,1035,1036,1037,1038,4,1062,1063,1064,1065,1066,1067,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,113,114,1057,1058,1059,1060,1061,115,5,6,27,12,13,14,15,16,17,18,19,20,21,22,23,24,25,7,45,28,29,31,32,33,35,36,37,38,39,40,41,42,43,44,8,48,46,47,9,50,49,10,54,51,52,53,11,55\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', '0', '', '2020-05-09 11:56:43');
INSERT INTO `sys_oper_log` VALUES ('323', '角色管理', '2', '/system/role/edit', 'POST', '1', 'admin', '', '/system/role/edit', '[::1]', '内网IP', '{\"RoleId\":1,\"RoleName\":\"管理员\",\"RoleKey\":\"admin\",\"RoleSort\":\"1\",\"Status\":\"0\",\"Remark\":\"管理员\",\"MenuIds\":\"1,100,1001,1004,1005,101,1007,1008,1009,1010,1011,102,1012,1013,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1029,106,1030,1031,1034,107,1035,1036,1037,1038,4,1062,1063,1064,1065,1066,1067,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,113,114,1057,1058,1059,1060,1061,115,5,6,27,12,13,14,15,16,17,18,19,20,21,22,23,24,25,7,45,28,29,31,32,33,35,36,37,38,39,40,41,42,43,44,8,48,46,47,9,50,49,10,54,51,52,53,11,55\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', '0', '', '2020-05-09 11:57:44');
INSERT INTO `sys_oper_log` VALUES ('324', '角色管理', '2', '/system/role/edit', 'POST', '1', 'admin', '', '/system/role/edit', '[::1]', '内网IP', '{\"RoleId\":1,\"RoleName\":\"管理员\",\"RoleKey\":\"admin\",\"RoleSort\":\"1\",\"Status\":\"0\",\"Remark\":\"管理员\",\"MenuIds\":\"1,100,1001,1004,1005,101,1007,1008,1009,1010,1011,102,1012,1013,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1029,106,1030,1031,1034,107,1035,1036,1037,1038,4,1062,1063,1064,1065,1066,1067,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,113,114,1057,1058,1059,1060,1061,115,5,6,27,12,13,14,15,16,17,18,19,20,21,22,23,24,25,7,45,28,29,31,32,33,35,36,37,38,39,40,41,42,43,44,8,48,46,47,9,50,49,10,54,51,52,53,11,55\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', '0', '', '2020-05-09 12:05:13');
INSERT INTO `sys_oper_log` VALUES ('325', '角色管理', '2', '/system/role/edit', 'POST', '1', 'admin', '', '/system/role/edit', '[::1]', '内网IP', '{\"RoleId\":1,\"RoleName\":\"管理员\",\"RoleKey\":\"admin\",\"RoleSort\":\"1\",\"Status\":\"0\",\"Remark\":\"管理员\",\"MenuIds\":\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,4,1062,1063,1064,1065,1066,1067,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,113,114,1057,1058,1059,1060,1061,115,5,6,27,12,13,14,15,16,17,18,19,20,21,22,23,24,25,7,45,28,29,31,32,33,35,36,37,38,39,40,41,42,43,44,8,48,46,47,9,50,49,10,54,51,52,53,11,56,55\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', '0', '', '2020-05-09 12:05:35');
INSERT INTO `sys_oper_log` VALUES ('326', '文件管理新增数据', '0', '/module/file/add', 'POST', '1', 'admin', '', '/module/file/add', '[::1]', '内网IP', '{\"FileSha1\":\"22\",\"FileName\":\"3322\",\"FileSize\":2323,\"FileAddr\":\"12312\",\"Remark\":\"123123\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":2,\"otype\":0}', '0', '', '2020-05-09 12:13:07');
INSERT INTO `sys_oper_log` VALUES ('327', '文件管理删除数据', '3', '/module/file/remove', 'POST', '1', 'admin', '', '/module/file/remove', '[::1]', '内网IP', '{\"Ids\":\"2\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-05-09 12:16:40');
INSERT INTO `sys_oper_log` VALUES ('328', '文件管理新增数据', '0', '/module/file/add', 'POST', '1', 'admin', '', '/module/file/add', '[::1]', '内网IP', '{\"FileSha1\":\"2121\",\"FileName\":\"2222\",\"FileSize\":2222,\"FileAddr\":\"3231\",\"Remark\":\"1231231\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":3,\"otype\":0}', '0', '', '2020-05-09 12:16:49');
INSERT INTO `sys_oper_log` VALUES ('329', '文件管理删除数据', '3', '/module/file/remove', 'POST', '1', 'admin', '', '/module/file/remove', '[::1]', '内网IP', '{\"Ids\":\"3\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-05-09 12:18:57');
INSERT INTO `sys_oper_log` VALUES ('330', '文件管理新增数据', '0', '/module/file/add', 'POST', '1', 'admin', '', '/module/file/add', '[::1]', '内网IP', '{\"FileSha1\":\"12123\",\"FileName\":\"13123\",\"FileSize\":21312321,\"FileAddr\":\"1231231\",\"Remark\":\"12312313\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":4,\"otype\":0}', '0', '', '2020-05-09 12:19:39');
INSERT INTO `sys_oper_log` VALUES ('331', '文件管理修改数据', '2', '/module/file/edit', 'POST', '1', 'admin', '', '/module/file/edit', '[::1]', '内网IP', '{\"Id\":4,\"FileSha1\":\"12123解决就\",\"FileName\":\"13123\",\"FileSize\":21312321,\"FileAddr\":\"1231231\",\"Remark\":\"12312313\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-09 12:38:17');
INSERT INTO `sys_oper_log` VALUES ('332', '文件管理修改数据', '2', '/module/file/edit', 'POST', '1', 'admin', '', '/module/file/edit', '[::1]', '内网IP', '{\"Id\":4,\"FileSha1\":\"12123解决就\",\"FileName\":\"13123\",\"FileSize\":21312321,\"FileAddr\":\"1231231\",\"Remark\":\"1231231猫妈妈3\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-09 12:38:44');
INSERT INTO `sys_oper_log` VALUES ('333', '角色管理', '1', '/system/role/add', 'POST', '1', 'admin', '', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"测试角色\",\"RoleKey\":\"测试\",\"RoleSort\":\"1\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"4,1062,1063,1064,1065,1066,1067,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,113,114,1057,1058,1059,1060,1061,115,5,6,27,12,13,14,15,16,17,18,19,20,21,22,23,24,25,7,45,28,29,31,32,33,35,36,37,38,39,40,41,42,43,44,8,48,46,47,9,50,49,10,54,51,52,53,11,56,55\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-05-09 18:43:02');
INSERT INTO `sys_oper_log` VALUES ('334', '角色管理', '1', '/system/role/add', 'POST', '1', 'admin', '', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"测试角色\",\"RoleKey\":\"测试\",\"RoleSort\":\"1\",\"Status\":\"0\",\"Remark\":\"21\",\"MenuIds\":\"4,1062,1063,1064,1065,1066,1067,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,113,114,1057,1058,1059,1060,1061,115,5,6,27,12,13,14,15,16,17,18,19,20,21,22,23,24,25,7,45,28,29,31,32,33,35,36,37,38,39,40,41,42,43,44,8,48,46,47,9,50,49,10,54,51,52,53,11,56,55\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-05-09 18:43:06');
INSERT INTO `sys_oper_log` VALUES ('335', '角色管理', '1', '/system/role/add', 'POST', '1', 'admin', '', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"测试角色\",\"RoleKey\":\"测试\",\"RoleSort\":\"1\",\"Status\":\"0\",\"Remark\":\"21\",\"MenuIds\":\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,4,1062,1063,1064,1065,1066,1067,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,113,114,1057,1058,1059,1060,1061,115,5,6,27,12,13,14,15,16,17,18,19,20,21,22,23,24,25,7,45,28,29,31,32,33,35,36,37,38,39,40,41,42,43,44,8,48,46,47,9,50,49,10,54,51,52,53,11,56,55\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":4,\"otype\":1}', '0', '', '2020-05-09 18:43:10');
INSERT INTO `sys_oper_log` VALUES ('336', '角色管理', '2', '/system/role/edit', 'POST', '1', 'admin', '', '/system/role/edit', '[::1]', '内网IP', '{\"RoleId\":4,\"RoleName\":\"测试角色\",\"RoleKey\":\"测试\",\"RoleSort\":\"0\",\"Status\":\"0\",\"Remark\":\"21\",\"MenuIds\":\"4,1062,1063,1064,1065,1066,1067,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,113,114,1057,1058,1059,1060,1061,115,5,6,27,12,13,14,15,16,17,18,19,20,21,22,23,24,25,7,45,28,29,31,32,33,35,36,37,38,39,40,41,42,43,44,8,48,46,47,9,50,49,10,54,51,52,53,11,56,55\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', '0', '', '2020-05-09 18:43:28');
INSERT INTO `sys_oper_log` VALUES ('337', '角色管理', '1', '/system/role/add', 'POST', '1', 'admin', '', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"去\",\"RoleKey\":\"去\",\"RoleSort\":\"2\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"4,1062,1063,1064,1065,1066,1067,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,113,114,1057,1058,1059,1060,1061,115,5,6,27,12,13,14,15,16,17,18,19,20,21,22,23,24,25,7,45,28,29,31,32,33,35,36,37,38,39,40,41,42,43,44,8,48,46,47,9,50,49,10,54,51,52,53,11,56,55\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":5,\"otype\":1}', '0', '', '2020-05-09 18:48:52');
INSERT INTO `sys_oper_log` VALUES ('338', '角色管理', '1', '/system/role/add', 'POST', '1', 'admin', '', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"去\",\"RoleKey\":\"去\",\"RoleSort\":\"2\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"4,1062,1063,1064,1065,1066,1067,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,113,114,1057,1058,1059,1060,1061,115,5,6,27,12,13,14,15,16,17,18,19,20,21,22,23,24,25,7,45,28,29,31,32,33,35,36,37,38,39,40,41,42,43,44,8,48,46,47,9,50,49,10,54,51,52,53,11,56,55\"}', '{\"code\":500,\"msg\":\"角色名称已存在\",\"data\":null,\"otype\":1}', '1', '', '2020-05-09 18:48:53');
INSERT INTO `sys_oper_log` VALUES ('339', '角色管理', '1', '/system/role/add', 'POST', '1', 'admin', '', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"去321\",\"RoleKey\":\"去\",\"RoleSort\":\"2\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"4,1062,1063,1064,1065,1066,1067,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,113,114,1057,1058,1059,1060,1061,115,5,6,27,12,13,14,15,16,17,18,19,20,21,22,23,24,25,7,45,28,29,31,32,33,35,36,37,38,39,40,41,42,43,44,8,48,46,47,9,50,49,10,54,51,52,53,11,56,55\"}', '{\"code\":500,\"msg\":\"角色权限已存在\",\"data\":null,\"otype\":1}', '1', '', '2020-05-09 18:49:03');
INSERT INTO `sys_oper_log` VALUES ('340', '角色管理', '1', '/system/role/add', 'POST', '1', 'admin', '', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"橘色\",\"RoleKey\":\"12\",\"RoleSort\":\"222\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"5,6,27,12,13,14,15,16,17,18,19,20,21,22,23,24,25,7,45,28,29,31,32,33,35,36,37,38,39,40,41,42,43,44,8,48,46,47,9,50,49,10,54,51,52,53,11,56,55\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":6,\"otype\":1}', '0', '', '2020-05-09 18:49:25');
INSERT INTO `sys_oper_log` VALUES ('341', '角色管理', '3', '/system/role/remove', 'POST', '1', 'admin', '', '/system/role/remove', '[::1]', '内网IP', '{\"Ids\":\"4\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-05-09 18:49:37');
INSERT INTO `sys_oper_log` VALUES ('342', '角色管理', '3', '/system/role/remove', 'POST', '1', 'admin', '', '/system/role/remove', '[::1]', '内网IP', '{\"Ids\":\"6\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-05-09 18:49:40');
INSERT INTO `sys_oper_log` VALUES ('343', '角色管理', '3', '/system/role/remove', 'POST', '1', 'admin', '', '/system/role/remove', '[::1]', '内网IP', '{\"Ids\":\"5\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":3}', '0', '', '2020-05-09 18:49:42');
INSERT INTO `sys_oper_log` VALUES ('344', '角色管理', '1', '/system/role/add', 'POST', '1', 'admin', '', '/system/role/add', '[::1]', '内网IP', '{\"RoleName\":\"测试\",\"RoleKey\":\"测试\",\"RoleSort\":\"1\",\"Status\":\"0\",\"Remark\":\"\",\"MenuIds\":\"2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,500,1039,1040,1041,1042,501,1043,1044,1045,1046,3,113,114,1057,1058,1059,1060,1061,115,5,6,27,12,13,14,15,16,17,18,19,20,21,22,23,24,25,7,45,28,29,31,32,33,35,36,37,38,39,40,41,42,43,44,8,48,46,47,9,50,49,10,54,51,52,53,11,56,55\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":7,\"otype\":1}', '0', '', '2020-05-09 18:50:10');
INSERT INTO `sys_oper_log` VALUES ('345', '用户强退', '0', '/monitor/online/forceLogout', 'POST', '1', 'admin', '', '/monitor/online/forceLogout', '[::1]', '内网IP', '{\"sessionId\":\"C1NAWWEVNJ4ODV45AN\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-09 18:53:47');
INSERT INTO `sys_oper_log` VALUES ('346', '用户强退', '0', '/monitor/online/forceLogout', 'POST', '1', 'admin', '', '/monitor/online/forceLogout', '[::1]', '内网IP', '{\"sessionId\":\"C1NAWWEVNJ4ODV45AN\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-09 18:53:50');
INSERT INTO `sys_oper_log` VALUES ('347', '定时任务管理启动', '0', '/monitor/job/start', 'POST', '1', 'admin', '', '/monitor/job/start', '[::1]', '内网IP', '{\"jobId\":12}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":0}', '1', '', '2020-05-09 18:53:56');
INSERT INTO `sys_oper_log` VALUES ('348', '定时任务管理启动', '0', '/monitor/job/start', 'POST', '1', 'admin', '', '/monitor/job/start', '[::1]', '内网IP', '{\"jobId\":12}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":0}', '1', '', '2020-05-09 19:15:35');
INSERT INTO `sys_oper_log` VALUES ('349', '定时任务管理停止', '0', '/monitor/job/stop', 'POST', '1', 'admin', '', '/monitor/job/stop', '[::1]', '内网IP', '{\"jobId\":12}', '{\"code\":0,\"msg\":\"停止成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-09 19:15:38');
INSERT INTO `sys_oper_log` VALUES ('350', '导入表结构', '0', '/tool/gen/importTable', 'POST', '1', 'admin', '', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"rmp_file,rmp_path,rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-11 16:08:09');
INSERT INTO `sys_oper_log` VALUES ('351', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-11 16:09:50');
INSERT INTO `sys_oper_log` VALUES ('352', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_path\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-11 16:10:24');
INSERT INTO `sys_oper_log` VALUES ('353', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_file\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-11 16:10:37');
INSERT INTO `sys_oper_log` VALUES ('354', '生成代码', '0', '/tool/gen/genCode?tableId=55', 'GET', '1', 'admin', '', '/tool/gen/genCode?tableId=55', '[::1]', '内网IP', '{\"tableId\":55}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-11 16:11:33');
INSERT INTO `sys_oper_log` VALUES ('355', '生成代码', '0', '/tool/gen/genCode?tableId=56', 'GET', '1', 'admin', '', '/tool/gen/genCode?tableId=56', '[::1]', '内网IP', '{\"tableId\":56}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-11 16:11:37');
INSERT INTO `sys_oper_log` VALUES ('356', '生成代码', '0', '/tool/gen/genCode?tableId=57', 'GET', '1', 'admin', '', '/tool/gen/genCode?tableId=57', '[::1]', '内网IP', '{\"tableId\":57}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-11 16:11:41');
INSERT INTO `sys_oper_log` VALUES ('357', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_file\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-11 16:17:08');
INSERT INTO `sys_oper_log` VALUES ('358', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_path\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-11 16:17:59');
INSERT INTO `sys_oper_log` VALUES ('359', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-11 16:18:09');
INSERT INTO `sys_oper_log` VALUES ('360', '生成代码', '0', '/tool/gen/genCode?tableId=55', 'GET', '1', 'admin', '', '/tool/gen/genCode?tableId=55', '[::1]', '内网IP', '{\"tableId\":55}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-11 16:18:13');
INSERT INTO `sys_oper_log` VALUES ('361', '生成代码', '0', '/tool/gen/genCode?tableId=56', 'GET', '1', 'admin', '', '/tool/gen/genCode?tableId=56', '[::1]', '内网IP', '{\"tableId\":56}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-11 16:18:17');
INSERT INTO `sys_oper_log` VALUES ('362', '生成代码', '0', '/tool/gen/genCode?tableId=57', 'GET', '1', 'admin', '', '/tool/gen/genCode?tableId=57', '[::1]', '内网IP', '{\"tableId\":57}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-11 16:18:21');
INSERT INTO `sys_oper_log` VALUES ('363', '文件夹结构新增数据', '0', '/module/rmp_path/add', 'POST', '1', 'admin', '', '/module/rmp_path/add', '[::1]', '内网IP', '{\"PathName\":\"test\",\"ParentId\":0,\"ParentPath\":\"11\",\"Remark\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":0}', '0', '', '2020-05-11 16:21:56');
INSERT INTO `sys_oper_log` VALUES ('364', '资源类型新增数据', '0', '/module/rmp_type/add', 'POST', '1', 'admin', '', '/module/rmp_type/add', '[::1]', '内网IP', '{\"TypeName\":\"纹理资源\",\"TypeExt\":\".jpg;.png\",\"MetaDataField\":\"\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":0}', '0', '', '2020-05-11 16:43:04');
INSERT INTO `sys_oper_log` VALUES ('365', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_path\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-12 14:31:43');
INSERT INTO `sys_oper_log` VALUES ('366', '生成代码', '0', '/tool/gen/genCode?tableId=56', 'GET', '1', 'admin', '', '/tool/gen/genCode?tableId=56', '[::1]', '内网IP', '{\"tableId\":56}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-12 14:31:54');
INSERT INTO `sys_oper_log` VALUES ('367', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_path\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-12 14:34:17');
INSERT INTO `sys_oper_log` VALUES ('368', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_path\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-12 14:34:42');
INSERT INTO `sys_oper_log` VALUES ('369', '生成代码', '0', '/tool/gen/genCode?tableId=56', 'GET', '1', 'admin', '', '/tool/gen/genCode?tableId=56', '[::1]', '内网IP', '{\"tableId\":56}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-12 14:35:11');
INSERT INTO `sys_oper_log` VALUES ('370', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_path\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-12 14:47:47');
INSERT INTO `sys_oper_log` VALUES ('371', '生成代码', '0', '/tool/gen/genCode?tableId=56', 'GET', '1', 'admin', '', '/tool/gen/genCode?tableId=56', '[::1]', '内网IP', '{\"tableId\":56}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-12 14:47:56');
INSERT INTO `sys_oper_log` VALUES ('372', '用户强退', '0', '/monitor/online/forceLogout', 'POST', '1', 'admin', '', '/monitor/online/forceLogout', '[::1]', '内网IP', '{\"sessionId\":\"C1A6G4JTFKI0HAFO20\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-12 17:55:40');
INSERT INTO `sys_oper_log` VALUES ('373', '用户强退', '0', '/monitor/online/forceLogout', 'POST', '1', 'admin', '', '/monitor/online/forceLogout', '[::1]', '内网IP', '{\"sessionId\":\"C1NAWWEVNJ4ODV45AN\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-12 17:55:47');
INSERT INTO `sys_oper_log` VALUES ('374', '菜单管理', '3', '/system/menu/remove?id=1062', 'GET', '1', 'admin', '', '/system/menu/remove?id=1062', '[::1]', '内网IP', '{\"id\":1062}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-05-13 10:46:52');
INSERT INTO `sys_oper_log` VALUES ('375', '菜单管理', '3', '/system/menu/remove?id=1063', 'GET', '1', 'admin', '', '/system/menu/remove?id=1063', '[::1]', '内网IP', '{\"id\":1063}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-05-13 10:47:05');
INSERT INTO `sys_oper_log` VALUES ('376', '菜单管理', '3', '/system/menu/remove?id=1064', 'GET', '1', 'admin', '', '/system/menu/remove?id=1064', '[::1]', '内网IP', '{\"id\":1064}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-05-13 10:47:09');
INSERT INTO `sys_oper_log` VALUES ('377', '菜单管理', '3', '/system/menu/remove?id=1065', 'GET', '1', 'admin', '', '/system/menu/remove?id=1065', '[::1]', '内网IP', '{\"id\":1065}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-05-13 10:47:12');
INSERT INTO `sys_oper_log` VALUES ('378', '菜单管理', '3', '/system/menu/remove?id=1066', 'GET', '1', 'admin', '', '/system/menu/remove?id=1066', '[::1]', '内网IP', '{\"id\":1066}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-05-13 10:47:15');
INSERT INTO `sys_oper_log` VALUES ('379', '菜单管理', '3', '/system/menu/remove?id=1067', 'GET', '1', 'admin', '', '/system/menu/remove?id=1067', '[::1]', '内网IP', '{\"id\":1067}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-05-13 10:47:18');
INSERT INTO `sys_oper_log` VALUES ('380', '菜单管理', '3', '/system/menu/remove?id=1069', 'GET', '1', 'admin', '', '/system/menu/remove?id=1069', '[::1]', '内网IP', '{\"id\":1069}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-05-13 10:47:24');
INSERT INTO `sys_oper_log` VALUES ('381', '菜单管理', '3', '/system/menu/remove?id=1073', 'GET', '1', 'admin', '', '/system/menu/remove?id=1073', '[::1]', '内网IP', '{\"id\":1073}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-05-13 10:47:43');
INSERT INTO `sys_oper_log` VALUES ('382', '生成代码', '3', '/tool/gen/remove', 'POST', '1', 'admin', '', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"57\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-05-13 11:25:42');
INSERT INTO `sys_oper_log` VALUES ('383', '生成代码', '3', '/tool/gen/remove', 'POST', '1', 'admin', '', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"56\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-05-13 11:25:44');
INSERT INTO `sys_oper_log` VALUES ('384', '生成代码', '3', '/tool/gen/remove', 'POST', '1', 'admin', '', '/tool/gen/remove', '[::1]', '内网IP', '{\"Ids\":\"55\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":3}', '0', '', '2020-05-13 11:25:46');
INSERT INTO `sys_oper_log` VALUES ('385', '导入表结构', '0', '/tool/gen/importTable', 'POST', '1', 'admin', '', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"rmp_path\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-13 11:25:58');
INSERT INTO `sys_oper_log` VALUES ('386', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_path\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-13 11:26:37');
INSERT INTO `sys_oper_log` VALUES ('387', '生成代码', '0', '/tool/gen/genCode?tableId=58', 'GET', '1', 'admin', '', '/tool/gen/genCode?tableId=58', '[::1]', '内网IP', '{\"tableId\":58}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-13 11:26:47');
INSERT INTO `sys_oper_log` VALUES ('388', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_path\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-13 11:46:41');
INSERT INTO `sys_oper_log` VALUES ('389', '生成代码', '0', '/tool/gen/genCode?tableId=58', 'GET', '1', 'admin', '', '/tool/gen/genCode?tableId=58', '[::1]', '内网IP', '{\"tableId\":58}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-13 11:50:29');
INSERT INTO `sys_oper_log` VALUES ('390', '部门管理', '1', '/system/dept/add', 'POST', '1', 'admin', '', '/system/dept/add', '[::1]', '内网IP', '{\"ParentId\":110,\"DeptName\":\"2\",\"OrderNum\":2,\"Leader\":\"2\",\"Phone\":\"15342050992\",\"Email\":\"zy@ideapool.tv\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-05-13 14:23:15');
INSERT INTO `sys_oper_log` VALUES ('391', '部门管理', '2', '/system/dept/edit', 'POST', '1', 'admin', '', '/system/dept/edit', '[::1]', '内网IP', '{\"DeptId\":110,\"ParentId\":100,\"DeptName\":\"运维部门\",\"OrderNum\":1,\"Leader\":\"\",\"Phone\":\"\",\"Email\":\"\",\"Status\":\"1\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', '0', '', '2020-05-13 14:35:30');
INSERT INTO `sys_oper_log` VALUES ('392', '部门管理', '1', '/system/dept/add', 'POST', '1', 'admin', '', '/system/dept/add', '[::1]', '内网IP', '{\"ParentId\":111,\"DeptName\":\"3\",\"OrderNum\":2,\"Leader\":\"22\",\"Phone\":\"13810446192\",\"Email\":\"12@qq.com\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-05-13 14:35:52');
INSERT INTO `sys_oper_log` VALUES ('393', '文件夹结构新增数据', '1', '/module/rmp_path/add', 'POST', '1', 'admin', '', '/module/rmp_path/add', '[::1]', '内网IP', '{\"PathName\":\"112\",\"ParentId\":0,\"Ancestors\":\"2222\",\"Status\":\"\",\"Remark\":\"2222\"}', '{\"code\":500,\"msg\":\"角色状态（0正常 1停用）不能为空\",\"data\":null,\"otype\":1}', '1', '', '2020-05-13 16:12:23');
INSERT INTO `sys_oper_log` VALUES ('394', '文件夹结构新增数据', '0', '/module/rmp_path/add', 'POST', '1', 'admin', '', '/module/rmp_path/add', '[::1]', '内网IP', '{\"PathName\":\"test\",\"ParentId\":0,\"Ancestors\":\"\",\"Status\":\"0\",\"Remark\":\"12\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":0}', '0', '', '2020-05-13 17:19:12');
INSERT INTO `sys_oper_log` VALUES ('395', '文件夹结构新增数据', '1', '/module/rmp_path/add', 'POST', '1', 'admin', '', '/module/rmp_path/add', '[::1]', '内网IP', '{\"PathName\":\"22\",\"ParentId\":100000,\"Ancestors\":\"\",\"Status\":\"0\",\"Remark\":\"22\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-05-13 18:43:10');
INSERT INTO `sys_oper_log` VALUES ('396', '文件夹结构新增数据', '1', '/module/rmp_path/add', 'POST', '1', 'admin', '', '/module/rmp_path/add', '[::1]', '内网IP', '{\"PathName\":\"22\",\"ParentId\":100000,\"Ancestors\":\"\",\"Status\":\"0\",\"Remark\":\"22\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-05-13 18:43:36');
INSERT INTO `sys_oper_log` VALUES ('397', '文件夹结构新增数据', '1', '/module/rmp_path/add', 'POST', '1', 'admin', '', '/module/rmp_path/add', '[::1]', '内网IP', '{\"PathName\":\"22\",\"ParentId\":100000,\"Ancestors\":\"\",\"Status\":\"0\",\"Remark\":\"22\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-05-13 18:45:01');
INSERT INTO `sys_oper_log` VALUES ('398', '文件夹结构新增数据', '1', '/module/rmp_path/add', 'POST', '1', 'admin', '', '/module/rmp_path/add', '[::1]', '内网IP', '{\"PathName\":\"22\",\"ParentId\":100000,\"Ancestors\":\"\",\"Status\":\"0\",\"Remark\":\"22\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":1}', '1', '', '2020-05-13 18:45:03');
INSERT INTO `sys_oper_log` VALUES ('399', '文件夹结构新增数据', '0', '/module/rmp_path/add', 'POST', '1', 'admin', '', '/module/rmp_path/add', '[::1]', '内网IP', '{\"PathName\":\"22\",\"ParentId\":100000,\"Ancestors\":\"\",\"Status\":\"0\",\"Remark\":\"22\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":100002,\"otype\":0}', '0', '', '2020-05-13 18:45:46');
INSERT INTO `sys_oper_log` VALUES ('400', '文件夹结构新增数据', '0', '/module/rmp_path/add', 'POST', '1', 'admin', '', '/module/rmp_path/add', '[::1]', '内网IP', '{\"PathName\":\"222\",\"ParentId\":100000,\"Ancestors\":\"\",\"Status\":\"0\",\"Remark\":\"2222\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":100003,\"otype\":0}', '0', '', '2020-05-13 18:48:57');
INSERT INTO `sys_oper_log` VALUES ('401', '部门管理', '1', '/system/dept/add', 'POST', '1', 'admin', '', '/system/dept/add', '[::1]', '内网IP', '{\"ParentId\":100,\"DeptName\":\"2\",\"OrderNum\":22,\"Leader\":\"22\",\"Phone\":\"13500871010\",\"Email\":\"122@11.com\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-05-13 19:12:37');
INSERT INTO `sys_oper_log` VALUES ('402', '部门管理', '1', '/system/dept/add', 'POST', '1', 'admin', '', '/system/dept/add', '[::1]', '内网IP', '{\"ParentId\":111,\"DeptName\":\"2\",\"OrderNum\":2,\"Leader\":\"2\",\"Phone\":\"13098202222\",\"Email\":\"2@22.com\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":1}', '0', '', '2020-05-13 19:13:32');
INSERT INTO `sys_oper_log` VALUES ('403', '文件夹结构新增数据', '0', '/module/rmp_path/add', 'POST', '1', 'admin', '', '/module/rmp_path/add', '[::1]', '内网IP', '{\"PathName\":\"测试编辑\",\"ParentId\":100003,\"Ancestors\":\"\",\"Status\":\"0\",\"Remark\":\"测试编辑备注\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":100004,\"otype\":0}', '0', '', '2020-05-14 11:41:28');
INSERT INTO `sys_oper_log` VALUES ('404', '文件夹结构新增数据', '0', '/module/rmp_path/add', 'POST', '1', 'admin', '', '/module/rmp_path/add', '[::1]', '内网IP', '{\"PathName\":\"你们好\",\"ParentId\":100003,\"Ancestors\":\"\",\"Status\":\"0\",\"Remark\":\"你们好\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":100005,\"otype\":0}', '0', '', '2020-05-14 11:45:00');
INSERT INTO `sys_oper_log` VALUES ('405', '文件夹结构修改数据', '2', '/module/rmp_path/edit', 'POST', '1', 'admin', '', '/module/rmp_path/edit', '[::1]', '内网IP', '{\"PathId\":100003,\"PathName\":\"222\",\"ParentId\":100000,\"Ancestors\":\"\",\"Status\":\"0\",\"Remark\":\"2222\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-14 11:47:29');
INSERT INTO `sys_oper_log` VALUES ('406', '部门管理', '2', '/system/dept/edit', 'POST', '1', 'admin', '', '/system/dept/edit', '[::1]', '内网IP', '{\"DeptId\":112,\"ParentId\":100,\"DeptName\":\"3\",\"OrderNum\":2,\"Leader\":\"22\",\"Phone\":\"13810446192\",\"Email\":\"12@qq.com\",\"Status\":\"0\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":1,\"otype\":2}', '0', '', '2020-05-14 11:53:23');
INSERT INTO `sys_oper_log` VALUES ('407', '文件夹结构修改数据', '2', '/module/rmp_path/edit', 'POST', '1', 'admin', '', '/module/rmp_path/edit', '[::1]', '内网IP', '{\"PathId\":100005,\"PathName\":\"你们好\",\"ParentId\":100000,\"Ancestors\":\"\",\"Status\":\"0\",\"Remark\":\"你们好\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-14 12:12:27');
INSERT INTO `sys_oper_log` VALUES ('408', '文件夹结构修改数据', '2', '/module/rmp_path/edit', 'POST', '1', 'admin', '', '/module/rmp_path/edit', '[::1]', '内网IP', '{\"PathId\":100005,\"PathName\":\"你们好\",\"ParentId\":100004,\"Ancestors\":\"\",\"Status\":\"0\",\"Remark\":\"你们好\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-14 12:12:56');
INSERT INTO `sys_oper_log` VALUES ('409', '文件夹结构删除数据', '3', '/module/rmp_path/remove?id=100005', 'GET', '1', 'admin', '', '/module/rmp_path/remove?id=100005', '[::1]', '内网IP', '{\"Ids\":\"\"}', '{\"code\":500,\"msg\":\"请选择要删除的数据记录\",\"data\":null,\"otype\":3}', '1', '', '2020-05-14 12:19:52');
INSERT INTO `sys_oper_log` VALUES ('410', '文件夹结构删除数据', '3', '/module/rmp_path/remove?id=100003', 'GET', '1', 'admin', '', '/module/rmp_path/remove?id=100003', '[::1]', '内网IP', '{\"id\":100003}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":3}', '1', '', '2020-05-14 14:27:21');
INSERT INTO `sys_oper_log` VALUES ('411', '文件夹结构新增数据', '0', '/module/rmp_path/add', 'POST', '1', 'admin', '', '/module/rmp_path/add', '[::1]', '内网IP', '{\"PathName\":\"22222\",\"ParentId\":100000,\"Ancestors\":\"\",\"Status\":\"0\",\"Remark\":\"2232121\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":100006,\"otype\":0}', '0', '', '2020-05-14 14:38:14');
INSERT INTO `sys_oper_log` VALUES ('412', '导入表结构', '0', '/tool/gen/importTable', 'POST', '1', 'admin', '', '/tool/gen/importTable', '[::1]', '内网IP', '{\"tables\":\"rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-14 15:27:28');
INSERT INTO `sys_oper_log` VALUES ('413', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-14 15:30:28');
INSERT INTO `sys_oper_log` VALUES ('414', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-14 15:30:45');
INSERT INTO `sys_oper_log` VALUES ('415', '生成代码', '0', '/tool/gen/genCode?tableId=59', 'GET', '1', 'admin', '', '/tool/gen/genCode?tableId=59', '[::1]', '内网IP', '{\"tableId\":59}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-14 15:30:59');
INSERT INTO `sys_oper_log` VALUES ('416', 'demo演示', '0', '/demo/operate/edit', 'POST', '1', 'admin', '', '/demo/operate/edit', '[::1]', '内网IP', '{\"UserId\":1}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":{\"userId\":1,\"userCode\":\"1000001\",\"userPhone\":\"15888888888\",\"userEmail\":\"111@qq.com\",\"userBalance\":100,\"status\":\"0\",\"createTime\":\"2020-01-12 02:02:02\"},\"otype\":0}', '0', '', '2020-05-14 15:50:13');
INSERT INTO `sys_oper_log` VALUES ('417', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-14 16:03:54');
INSERT INTO `sys_oper_log` VALUES ('418', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-14 16:04:28');
INSERT INTO `sys_oper_log` VALUES ('419', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-14 16:06:09');
INSERT INTO `sys_oper_log` VALUES ('420', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-14 16:06:28');
INSERT INTO `sys_oper_log` VALUES ('421', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-14 16:06:54');
INSERT INTO `sys_oper_log` VALUES ('422', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-14 16:07:11');
INSERT INTO `sys_oper_log` VALUES ('423', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-14 16:07:40');
INSERT INTO `sys_oper_log` VALUES ('424', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-14 16:07:53');
INSERT INTO `sys_oper_log` VALUES ('425', '生成代码', '2', '/tool/gen/edit', 'POST', '1', 'admin', '', '/tool/gen/edit', '[::1]', '内网IP', '{\"tableName\":\"rmp_type\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-14 16:08:09');
INSERT INTO `sys_oper_log` VALUES ('426', '生成代码', '0', '/tool/gen/genCode?tableId=59', 'GET', '1', 'admin', '', '/tool/gen/genCode?tableId=59', '[::1]', '内网IP', '{\"tableId\":59}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":0}', '0', '', '2020-05-14 16:08:39');
INSERT INTO `sys_oper_log` VALUES ('427', '资源类型新增数据', '0', '/module/rmp_type/add', 'POST', '1', 'admin', '', '/module/rmp_type/add', '[::1]', '内网IP', '{\"TypeName\":\"32\",\"TypeExt\":\"bmp,as,www,万维网\",\"MetaDataField\":\"111\",\"Status\":\"0\",\"Remark\":\"33\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":3,\"otype\":0}', '0', '', '2020-05-14 16:53:13');
INSERT INTO `sys_oper_log` VALUES ('428', '资源类型新增数据', '1', '/module/rmp_type/add', 'POST', '1', 'admin', '', '/module/rmp_type/add', '[::1]', '内网IP', '{\"TypeName\":\"212\",\"TypeExt\":\"bmp,aaa,2222\",\"MetaDataField\":\"222\",\"Status\":\"0\",\"Remark\":\"32\"}', '{\"code\":500,\"msg\":\"资源类型重复\",\"data\":null,\"otype\":1}', '1', '', '2020-05-14 16:54:34');
INSERT INTO `sys_oper_log` VALUES ('429', '资源类型新增数据', '1', '/module/rmp_type/add', 'POST', '1', 'admin', '', '/module/rmp_type/add', '[::1]', '内网IP', '{\"TypeName\":\"212\",\"TypeExt\":\"bmp,aaa,2222\",\"MetaDataField\":\"222\",\"Status\":\"0\",\"Remark\":\"32\"}', '{\"code\":500,\"msg\":\"资源类型重复\",\"data\":null,\"otype\":1}', '1', '', '2020-05-14 16:55:37');
INSERT INTO `sys_oper_log` VALUES ('430', '资源类型修改数据', '2', '/module/rmp_type/edit', 'POST', '1', 'admin', '', '/module/rmp_type/edit', '[::1]', '内网IP', '{\"Id\":2,\"TypeName\":\"测试文件\",\"TypeExt\":\"clp,pkg,new,bmp\",\"MetaDataField\":\"222\",\"Status\":\"\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"类型状态（0正常 1停用）不能为空\",\"data\":null,\"otype\":2}', '1', '', '2020-05-15 14:11:48');
INSERT INTO `sys_oper_log` VALUES ('431', '资源类型修改数据', '2', '/module/rmp_type/edit', 'POST', '1', 'admin', '', '/module/rmp_type/edit', '[::1]', '内网IP', '{\"Id\":2,\"TypeName\":\"测试文件\",\"TypeExt\":\"clp,pkg,new,bmp\",\"MetaDataField\":\"222\",\"Status\":\"0\",\"Remark\":\"\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":2}', '1', '', '2020-05-15 14:11:52');
INSERT INTO `sys_oper_log` VALUES ('432', '资源类型新增数据', '1', '/module/rmp_type/edit', 'POST', '1', 'admin', '', '/module/rmp_type/edit', '[::1]', '内网IP', '{\"Id\":2,\"TypeName\":\"测试文件\",\"TypeExt\":\"clp,pkg,new\",\"MetaDataField\":\"222\",\"Status\":\"1\",\"Remark\":\"8888\"}', '{\"code\":500,\"msg\":\"资源类型重复\",\"data\":null,\"otype\":1}', '1', '', '2020-05-15 14:15:12');
INSERT INTO `sys_oper_log` VALUES ('433', '资源类型新增数据', '1', '/module/rmp_type/edit', 'POST', '1', 'admin', '', '/module/rmp_type/edit', '[::1]', '内网IP', '{\"Id\":2,\"TypeName\":\"测试文件\",\"TypeExt\":\"clp,pkg,new\",\"MetaDataField\":\"222\",\"Status\":\"1\",\"Remark\":\"8888\"}', '{\"code\":500,\"msg\":\"资源类型重复\",\"data\":null,\"otype\":1}', '1', '', '2020-05-15 14:16:04');
INSERT INTO `sys_oper_log` VALUES ('434', '资源类型修改数据', '2', '/module/rmp_type/edit', 'POST', '1', 'admin', '', '/module/rmp_type/edit', '[::1]', '内网IP', '{\"Id\":2,\"TypeName\":\"测试文件\",\"TypeExt\":\"clp,pkg,new\",\"MetaDataField\":\"222\",\"Status\":\"1\",\"Remark\":\"8888\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":2}', '1', '', '2020-05-15 14:18:22');
INSERT INTO `sys_oper_log` VALUES ('435', '资源类型修改数据', '2', '/module/rmp_type/edit', 'POST', '1', 'admin', '', '/module/rmp_type/edit', '[::1]', '内网IP', '{\"Id\":2,\"TypeName\":\"测试文件\",\"TypeExt\":\"clp,pkg,new\",\"MetaDataField\":\"222\",\"Status\":\"1\",\"Remark\":\"8888\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":2}', '1', '', '2020-05-15 14:19:25');
INSERT INTO `sys_oper_log` VALUES ('436', '资源类型修改数据', '2', '/module/rmp_type/edit', 'POST', '1', 'admin', '', '/module/rmp_type/edit', '[::1]', '内网IP', '{\"Id\":2,\"TypeName\":\"测试文件\",\"TypeExt\":\"clp,pkg,new\",\"MetaDataField\":\"222\",\"Status\":\"1\",\"Remark\":\"8888\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":2}', '1', '', '2020-05-15 14:19:43');
INSERT INTO `sys_oper_log` VALUES ('437', '资源类型修改数据', '2', '/module/rmp_type/edit', 'POST', '1', 'admin', '', '/module/rmp_type/edit', '[::1]', '内网IP', '{\"Id\":2,\"TypeName\":\"测试文件\",\"TypeExt\":\"clp,pkg,new\",\"MetaDataField\":\"222\",\"Status\":\"1\",\"Remark\":\"8888\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":2}', '1', '', '2020-05-15 14:20:11');
INSERT INTO `sys_oper_log` VALUES ('438', '资源类型修改数据', '2', '/module/rmp_type/edit', 'POST', '1', 'admin', '', '/module/rmp_type/edit', '[::1]', '内网IP', '{\"Id\":2,\"TypeName\":\"测试文件\",\"TypeExt\":\"clp,pkg,new\",\"MetaDataField\":\"222\",\"Status\":\"1\",\"Remark\":\"8888\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":2}', '1', '', '2020-05-15 14:20:18');
INSERT INTO `sys_oper_log` VALUES ('439', '资源类型修改数据', '2', '/module/rmp_type/edit', 'POST', '1', 'admin', '', '/module/rmp_type/edit', '[::1]', '内网IP', '{\"Id\":2,\"TypeName\":\"测试文件\",\"TypeExt\":\"clp,pkg,new\",\"MetaDataField\":\"222\",\"Status\":\"1\",\"Remark\":\"8888\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":2}', '1', '', '2020-05-15 14:20:28');
INSERT INTO `sys_oper_log` VALUES ('440', '资源类型新增数据', '1', '/module/rmp_type/edit', 'POST', '1', 'admin', '', '/module/rmp_type/edit', '[::1]', '内网IP', '{\"Id\":3,\"TypeName\":\"32\",\"TypeExt\":\"bmp,as,www,万维网\",\"MetaDataField\":\"111\",\"Status\":\"1\",\"Remark\":\"33\"}', '{\"code\":500,\"msg\":\"资源类型重复\",\"data\":null,\"otype\":1}', '1', '', '2020-05-15 14:20:40');
INSERT INTO `sys_oper_log` VALUES ('441', '资源类型修改数据', '2', '/module/rmp_type/edit', 'POST', '1', 'admin', '', '/module/rmp_type/edit', '[::1]', '内网IP', '{\"Id\":3,\"TypeName\":\"32\",\"TypeExt\":\"as,www,万维网\",\"MetaDataField\":\"111\",\"Status\":\"1\",\"Remark\":\"33\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null,\"otype\":2}', '1', '', '2020-05-15 14:20:50');
INSERT INTO `sys_oper_log` VALUES ('442', '资源类型修改数据', '2', '/module/rmp_type/edit', 'POST', '1', 'admin', '', '/module/rmp_type/edit', '[::1]', '内网IP', '{\"Id\":3,\"TypeName\":\"32\",\"TypeExt\":\"as,www,万维网\",\"MetaDataField\":\"111\",\"Status\":\"1\",\"Remark\":\"33\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-15 14:21:45');
INSERT INTO `sys_oper_log` VALUES ('443', '资源类型修改数据', '2', '/module/rmp_type/edit', 'POST', '1', 'admin', '', '/module/rmp_type/edit', '[::1]', '内网IP', '{\"Id\":2,\"TypeName\":\"测试文件\",\"TypeExt\":\"clp,pkg,new\",\"MetaDataField\":\"222\",\"Status\":\"0\",\"Remark\":\"000\"}', '{\"code\":0,\"msg\":\"操作成功\",\"data\":null,\"otype\":2}', '0', '', '2020-05-15 14:21:59');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', '', '2020-02-04 19:36:13', '4223434');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', '', '2020-05-09 12:05:35', '管理员');
INSERT INTO `sys_role` VALUES ('7', '测试', '测试', '0', '1', '0', '0', 'admin', '2020-05-09 18:50:10', '', null, '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '110');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '25');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '31');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('1', '33');
INSERT INTO `sys_role_menu` VALUES ('1', '35');
INSERT INTO `sys_role_menu` VALUES ('1', '36');
INSERT INTO `sys_role_menu` VALUES ('1', '37');
INSERT INTO `sys_role_menu` VALUES ('1', '38');
INSERT INTO `sys_role_menu` VALUES ('1', '39');
INSERT INTO `sys_role_menu` VALUES ('1', '40');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('1', '42');
INSERT INTO `sys_role_menu` VALUES ('1', '43');
INSERT INTO `sys_role_menu` VALUES ('1', '44');
INSERT INTO `sys_role_menu` VALUES ('1', '45');
INSERT INTO `sys_role_menu` VALUES ('1', '46');
INSERT INTO `sys_role_menu` VALUES ('1', '47');
INSERT INTO `sys_role_menu` VALUES ('1', '48');
INSERT INTO `sys_role_menu` VALUES ('1', '49');
INSERT INTO `sys_role_menu` VALUES ('1', '50');
INSERT INTO `sys_role_menu` VALUES ('1', '51');
INSERT INTO `sys_role_menu` VALUES ('1', '52');
INSERT INTO `sys_role_menu` VALUES ('1', '53');
INSERT INTO `sys_role_menu` VALUES ('1', '54');
INSERT INTO `sys_role_menu` VALUES ('1', '55');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('1', '100');
INSERT INTO `sys_role_menu` VALUES ('1', '101');
INSERT INTO `sys_role_menu` VALUES ('1', '102');
INSERT INTO `sys_role_menu` VALUES ('1', '103');
INSERT INTO `sys_role_menu` VALUES ('1', '104');
INSERT INTO `sys_role_menu` VALUES ('1', '105');
INSERT INTO `sys_role_menu` VALUES ('1', '106');
INSERT INTO `sys_role_menu` VALUES ('1', '107');
INSERT INTO `sys_role_menu` VALUES ('1', '109');
INSERT INTO `sys_role_menu` VALUES ('1', '110');
INSERT INTO `sys_role_menu` VALUES ('1', '112');
INSERT INTO `sys_role_menu` VALUES ('1', '113');
INSERT INTO `sys_role_menu` VALUES ('1', '114');
INSERT INTO `sys_role_menu` VALUES ('1', '115');
INSERT INTO `sys_role_menu` VALUES ('1', '500');
INSERT INTO `sys_role_menu` VALUES ('1', '501');
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1001');
INSERT INTO `sys_role_menu` VALUES ('1', '1002');
INSERT INTO `sys_role_menu` VALUES ('1', '1003');
INSERT INTO `sys_role_menu` VALUES ('1', '1004');
INSERT INTO `sys_role_menu` VALUES ('1', '1005');
INSERT INTO `sys_role_menu` VALUES ('1', '1006');
INSERT INTO `sys_role_menu` VALUES ('1', '1007');
INSERT INTO `sys_role_menu` VALUES ('1', '1008');
INSERT INTO `sys_role_menu` VALUES ('1', '1009');
INSERT INTO `sys_role_menu` VALUES ('1', '1010');
INSERT INTO `sys_role_menu` VALUES ('1', '1011');
INSERT INTO `sys_role_menu` VALUES ('1', '1012');
INSERT INTO `sys_role_menu` VALUES ('1', '1013');
INSERT INTO `sys_role_menu` VALUES ('1', '1014');
INSERT INTO `sys_role_menu` VALUES ('1', '1015');
INSERT INTO `sys_role_menu` VALUES ('1', '1016');
INSERT INTO `sys_role_menu` VALUES ('1', '1017');
INSERT INTO `sys_role_menu` VALUES ('1', '1018');
INSERT INTO `sys_role_menu` VALUES ('1', '1019');
INSERT INTO `sys_role_menu` VALUES ('1', '1020');
INSERT INTO `sys_role_menu` VALUES ('1', '1021');
INSERT INTO `sys_role_menu` VALUES ('1', '1022');
INSERT INTO `sys_role_menu` VALUES ('1', '1023');
INSERT INTO `sys_role_menu` VALUES ('1', '1024');
INSERT INTO `sys_role_menu` VALUES ('1', '1025');
INSERT INTO `sys_role_menu` VALUES ('1', '1026');
INSERT INTO `sys_role_menu` VALUES ('1', '1027');
INSERT INTO `sys_role_menu` VALUES ('1', '1028');
INSERT INTO `sys_role_menu` VALUES ('1', '1029');
INSERT INTO `sys_role_menu` VALUES ('1', '1030');
INSERT INTO `sys_role_menu` VALUES ('1', '1031');
INSERT INTO `sys_role_menu` VALUES ('1', '1032');
INSERT INTO `sys_role_menu` VALUES ('1', '1033');
INSERT INTO `sys_role_menu` VALUES ('1', '1034');
INSERT INTO `sys_role_menu` VALUES ('1', '1035');
INSERT INTO `sys_role_menu` VALUES ('1', '1036');
INSERT INTO `sys_role_menu` VALUES ('1', '1037');
INSERT INTO `sys_role_menu` VALUES ('1', '1038');
INSERT INTO `sys_role_menu` VALUES ('1', '1039');
INSERT INTO `sys_role_menu` VALUES ('1', '1040');
INSERT INTO `sys_role_menu` VALUES ('1', '1041');
INSERT INTO `sys_role_menu` VALUES ('1', '1042');
INSERT INTO `sys_role_menu` VALUES ('1', '1043');
INSERT INTO `sys_role_menu` VALUES ('1', '1044');
INSERT INTO `sys_role_menu` VALUES ('1', '1045');
INSERT INTO `sys_role_menu` VALUES ('1', '1046');
INSERT INTO `sys_role_menu` VALUES ('1', '1047');
INSERT INTO `sys_role_menu` VALUES ('1', '1048');
INSERT INTO `sys_role_menu` VALUES ('1', '1049');
INSERT INTO `sys_role_menu` VALUES ('1', '1050');
INSERT INTO `sys_role_menu` VALUES ('1', '1051');
INSERT INTO `sys_role_menu` VALUES ('1', '1052');
INSERT INTO `sys_role_menu` VALUES ('1', '1053');
INSERT INTO `sys_role_menu` VALUES ('1', '1054');
INSERT INTO `sys_role_menu` VALUES ('1', '1055');
INSERT INTO `sys_role_menu` VALUES ('1', '1056');
INSERT INTO `sys_role_menu` VALUES ('1', '1057');
INSERT INTO `sys_role_menu` VALUES ('1', '1058');
INSERT INTO `sys_role_menu` VALUES ('1', '1059');
INSERT INTO `sys_role_menu` VALUES ('1', '1060');
INSERT INTO `sys_role_menu` VALUES ('1', '1061');
INSERT INTO `sys_role_menu` VALUES ('1', '1062');
INSERT INTO `sys_role_menu` VALUES ('1', '1063');
INSERT INTO `sys_role_menu` VALUES ('1', '1064');
INSERT INTO `sys_role_menu` VALUES ('1', '1065');
INSERT INTO `sys_role_menu` VALUES ('1', '1066');
INSERT INTO `sys_role_menu` VALUES ('1', '1067');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '9');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '11');
INSERT INTO `sys_role_menu` VALUES ('2', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '13');
INSERT INTO `sys_role_menu` VALUES ('2', '14');
INSERT INTO `sys_role_menu` VALUES ('2', '15');
INSERT INTO `sys_role_menu` VALUES ('2', '16');
INSERT INTO `sys_role_menu` VALUES ('2', '17');
INSERT INTO `sys_role_menu` VALUES ('2', '18');
INSERT INTO `sys_role_menu` VALUES ('2', '19');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '21');
INSERT INTO `sys_role_menu` VALUES ('2', '22');
INSERT INTO `sys_role_menu` VALUES ('2', '23');
INSERT INTO `sys_role_menu` VALUES ('2', '24');
INSERT INTO `sys_role_menu` VALUES ('2', '25');
INSERT INTO `sys_role_menu` VALUES ('2', '26');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '28');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '31');
INSERT INTO `sys_role_menu` VALUES ('2', '32');
INSERT INTO `sys_role_menu` VALUES ('2', '33');
INSERT INTO `sys_role_menu` VALUES ('2', '34');
INSERT INTO `sys_role_menu` VALUES ('2', '35');
INSERT INTO `sys_role_menu` VALUES ('2', '36');
INSERT INTO `sys_role_menu` VALUES ('2', '37');
INSERT INTO `sys_role_menu` VALUES ('2', '38');
INSERT INTO `sys_role_menu` VALUES ('2', '39');
INSERT INTO `sys_role_menu` VALUES ('2', '40');
INSERT INTO `sys_role_menu` VALUES ('2', '41');
INSERT INTO `sys_role_menu` VALUES ('2', '42');
INSERT INTO `sys_role_menu` VALUES ('2', '43');
INSERT INTO `sys_role_menu` VALUES ('2', '44');
INSERT INTO `sys_role_menu` VALUES ('2', '45');
INSERT INTO `sys_role_menu` VALUES ('2', '46');
INSERT INTO `sys_role_menu` VALUES ('2', '47');
INSERT INTO `sys_role_menu` VALUES ('2', '48');
INSERT INTO `sys_role_menu` VALUES ('2', '49');
INSERT INTO `sys_role_menu` VALUES ('2', '50');
INSERT INTO `sys_role_menu` VALUES ('2', '51');
INSERT INTO `sys_role_menu` VALUES ('2', '52');
INSERT INTO `sys_role_menu` VALUES ('2', '53');
INSERT INTO `sys_role_menu` VALUES ('2', '54');
INSERT INTO `sys_role_menu` VALUES ('2', '55');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');
INSERT INTO `sys_role_menu` VALUES ('2', '1058');
INSERT INTO `sys_role_menu` VALUES ('2', '1059');
INSERT INTO `sys_role_menu` VALUES ('2', '1060');
INSERT INTO `sys_role_menu` VALUES ('2', '1061');
INSERT INTO `sys_role_menu` VALUES ('3', '1062');
INSERT INTO `sys_role_menu` VALUES ('3', '1063');
INSERT INTO `sys_role_menu` VALUES ('3', '1064');
INSERT INTO `sys_role_menu` VALUES ('3', '1065');
INSERT INTO `sys_role_menu` VALUES ('3', '1066');
INSERT INTO `sys_role_menu` VALUES ('3', '1067');
INSERT INTO `sys_role_menu` VALUES ('3', '1068');
INSERT INTO `sys_role_menu` VALUES ('3', '1069');
INSERT INTO `sys_role_menu` VALUES ('3', '1070');
INSERT INTO `sys_role_menu` VALUES ('3', '1071');
INSERT INTO `sys_role_menu` VALUES ('3', '1072');
INSERT INTO `sys_role_menu` VALUES ('3', '1073');
INSERT INTO `sys_role_menu` VALUES ('3', '1074');
INSERT INTO `sys_role_menu` VALUES ('3', '1075');
INSERT INTO `sys_role_menu` VALUES ('3', '1076');
INSERT INTO `sys_role_menu` VALUES ('3', '1077');
INSERT INTO `sys_role_menu` VALUES ('3', '1078');
INSERT INTO `sys_role_menu` VALUES ('3', '1079');
INSERT INTO `sys_role_menu` VALUES ('3', '1080');
INSERT INTO `sys_role_menu` VALUES ('3', '1081');
INSERT INTO `sys_role_menu` VALUES ('3', '1082');
INSERT INTO `sys_role_menu` VALUES ('3', '1083');
INSERT INTO `sys_role_menu` VALUES ('3', '1084');
INSERT INTO `sys_role_menu` VALUES ('3', '1085');
INSERT INTO `sys_role_menu` VALUES ('3', '1086');
INSERT INTO `sys_role_menu` VALUES ('3', '1087');
INSERT INTO `sys_role_menu` VALUES ('3', '1088');
INSERT INTO `sys_role_menu` VALUES ('3', '1089');
INSERT INTO `sys_role_menu` VALUES ('3', '1090');
INSERT INTO `sys_role_menu` VALUES ('3', '1091');
INSERT INTO `sys_role_menu` VALUES ('3', '1092');
INSERT INTO `sys_role_menu` VALUES ('4', '2');
INSERT INTO `sys_role_menu` VALUES ('4', '3');
INSERT INTO `sys_role_menu` VALUES ('4', '4');
INSERT INTO `sys_role_menu` VALUES ('4', '5');
INSERT INTO `sys_role_menu` VALUES ('4', '6');
INSERT INTO `sys_role_menu` VALUES ('4', '7');
INSERT INTO `sys_role_menu` VALUES ('4', '8');
INSERT INTO `sys_role_menu` VALUES ('4', '9');
INSERT INTO `sys_role_menu` VALUES ('4', '10');
INSERT INTO `sys_role_menu` VALUES ('4', '11');
INSERT INTO `sys_role_menu` VALUES ('4', '12');
INSERT INTO `sys_role_menu` VALUES ('4', '13');
INSERT INTO `sys_role_menu` VALUES ('4', '14');
INSERT INTO `sys_role_menu` VALUES ('4', '15');
INSERT INTO `sys_role_menu` VALUES ('4', '16');
INSERT INTO `sys_role_menu` VALUES ('4', '17');
INSERT INTO `sys_role_menu` VALUES ('4', '18');
INSERT INTO `sys_role_menu` VALUES ('4', '19');
INSERT INTO `sys_role_menu` VALUES ('4', '20');
INSERT INTO `sys_role_menu` VALUES ('4', '21');
INSERT INTO `sys_role_menu` VALUES ('4', '22');
INSERT INTO `sys_role_menu` VALUES ('4', '23');
INSERT INTO `sys_role_menu` VALUES ('4', '24');
INSERT INTO `sys_role_menu` VALUES ('4', '25');
INSERT INTO `sys_role_menu` VALUES ('4', '27');
INSERT INTO `sys_role_menu` VALUES ('4', '28');
INSERT INTO `sys_role_menu` VALUES ('4', '29');
INSERT INTO `sys_role_menu` VALUES ('4', '31');
INSERT INTO `sys_role_menu` VALUES ('4', '32');
INSERT INTO `sys_role_menu` VALUES ('4', '33');
INSERT INTO `sys_role_menu` VALUES ('4', '35');
INSERT INTO `sys_role_menu` VALUES ('4', '36');
INSERT INTO `sys_role_menu` VALUES ('4', '37');
INSERT INTO `sys_role_menu` VALUES ('4', '38');
INSERT INTO `sys_role_menu` VALUES ('4', '39');
INSERT INTO `sys_role_menu` VALUES ('4', '40');
INSERT INTO `sys_role_menu` VALUES ('4', '41');
INSERT INTO `sys_role_menu` VALUES ('4', '42');
INSERT INTO `sys_role_menu` VALUES ('4', '43');
INSERT INTO `sys_role_menu` VALUES ('4', '44');
INSERT INTO `sys_role_menu` VALUES ('4', '45');
INSERT INTO `sys_role_menu` VALUES ('4', '46');
INSERT INTO `sys_role_menu` VALUES ('4', '47');
INSERT INTO `sys_role_menu` VALUES ('4', '48');
INSERT INTO `sys_role_menu` VALUES ('4', '49');
INSERT INTO `sys_role_menu` VALUES ('4', '50');
INSERT INTO `sys_role_menu` VALUES ('4', '51');
INSERT INTO `sys_role_menu` VALUES ('4', '52');
INSERT INTO `sys_role_menu` VALUES ('4', '53');
INSERT INTO `sys_role_menu` VALUES ('4', '54');
INSERT INTO `sys_role_menu` VALUES ('4', '55');
INSERT INTO `sys_role_menu` VALUES ('4', '56');
INSERT INTO `sys_role_menu` VALUES ('4', '109');
INSERT INTO `sys_role_menu` VALUES ('4', '110');
INSERT INTO `sys_role_menu` VALUES ('4', '112');
INSERT INTO `sys_role_menu` VALUES ('4', '113');
INSERT INTO `sys_role_menu` VALUES ('4', '114');
INSERT INTO `sys_role_menu` VALUES ('4', '115');
INSERT INTO `sys_role_menu` VALUES ('4', '500');
INSERT INTO `sys_role_menu` VALUES ('4', '501');
INSERT INTO `sys_role_menu` VALUES ('4', '1039');
INSERT INTO `sys_role_menu` VALUES ('4', '1040');
INSERT INTO `sys_role_menu` VALUES ('4', '1041');
INSERT INTO `sys_role_menu` VALUES ('4', '1042');
INSERT INTO `sys_role_menu` VALUES ('4', '1043');
INSERT INTO `sys_role_menu` VALUES ('4', '1044');
INSERT INTO `sys_role_menu` VALUES ('4', '1045');
INSERT INTO `sys_role_menu` VALUES ('4', '1046');
INSERT INTO `sys_role_menu` VALUES ('4', '1047');
INSERT INTO `sys_role_menu` VALUES ('4', '1048');
INSERT INTO `sys_role_menu` VALUES ('4', '1049');
INSERT INTO `sys_role_menu` VALUES ('4', '1050');
INSERT INTO `sys_role_menu` VALUES ('4', '1051');
INSERT INTO `sys_role_menu` VALUES ('4', '1052');
INSERT INTO `sys_role_menu` VALUES ('4', '1053');
INSERT INTO `sys_role_menu` VALUES ('4', '1054');
INSERT INTO `sys_role_menu` VALUES ('4', '1055');
INSERT INTO `sys_role_menu` VALUES ('4', '1056');
INSERT INTO `sys_role_menu` VALUES ('4', '1057');
INSERT INTO `sys_role_menu` VALUES ('4', '1058');
INSERT INTO `sys_role_menu` VALUES ('4', '1059');
INSERT INTO `sys_role_menu` VALUES ('4', '1060');
INSERT INTO `sys_role_menu` VALUES ('4', '1061');
INSERT INTO `sys_role_menu` VALUES ('4', '1062');
INSERT INTO `sys_role_menu` VALUES ('4', '1063');
INSERT INTO `sys_role_menu` VALUES ('4', '1064');
INSERT INTO `sys_role_menu` VALUES ('4', '1065');
INSERT INTO `sys_role_menu` VALUES ('4', '1066');
INSERT INTO `sys_role_menu` VALUES ('4', '1067');
INSERT INTO `sys_role_menu` VALUES ('5', '2');
INSERT INTO `sys_role_menu` VALUES ('5', '3');
INSERT INTO `sys_role_menu` VALUES ('5', '4');
INSERT INTO `sys_role_menu` VALUES ('5', '5');
INSERT INTO `sys_role_menu` VALUES ('5', '6');
INSERT INTO `sys_role_menu` VALUES ('5', '7');
INSERT INTO `sys_role_menu` VALUES ('5', '8');
INSERT INTO `sys_role_menu` VALUES ('5', '9');
INSERT INTO `sys_role_menu` VALUES ('5', '10');
INSERT INTO `sys_role_menu` VALUES ('5', '11');
INSERT INTO `sys_role_menu` VALUES ('5', '12');
INSERT INTO `sys_role_menu` VALUES ('5', '13');
INSERT INTO `sys_role_menu` VALUES ('5', '14');
INSERT INTO `sys_role_menu` VALUES ('5', '15');
INSERT INTO `sys_role_menu` VALUES ('5', '16');
INSERT INTO `sys_role_menu` VALUES ('5', '17');
INSERT INTO `sys_role_menu` VALUES ('5', '18');
INSERT INTO `sys_role_menu` VALUES ('5', '19');
INSERT INTO `sys_role_menu` VALUES ('5', '20');
INSERT INTO `sys_role_menu` VALUES ('5', '21');
INSERT INTO `sys_role_menu` VALUES ('5', '22');
INSERT INTO `sys_role_menu` VALUES ('5', '23');
INSERT INTO `sys_role_menu` VALUES ('5', '24');
INSERT INTO `sys_role_menu` VALUES ('5', '25');
INSERT INTO `sys_role_menu` VALUES ('5', '27');
INSERT INTO `sys_role_menu` VALUES ('5', '28');
INSERT INTO `sys_role_menu` VALUES ('5', '29');
INSERT INTO `sys_role_menu` VALUES ('5', '31');
INSERT INTO `sys_role_menu` VALUES ('5', '32');
INSERT INTO `sys_role_menu` VALUES ('5', '33');
INSERT INTO `sys_role_menu` VALUES ('5', '35');
INSERT INTO `sys_role_menu` VALUES ('5', '36');
INSERT INTO `sys_role_menu` VALUES ('5', '37');
INSERT INTO `sys_role_menu` VALUES ('5', '38');
INSERT INTO `sys_role_menu` VALUES ('5', '39');
INSERT INTO `sys_role_menu` VALUES ('5', '40');
INSERT INTO `sys_role_menu` VALUES ('5', '41');
INSERT INTO `sys_role_menu` VALUES ('5', '42');
INSERT INTO `sys_role_menu` VALUES ('5', '43');
INSERT INTO `sys_role_menu` VALUES ('5', '44');
INSERT INTO `sys_role_menu` VALUES ('5', '45');
INSERT INTO `sys_role_menu` VALUES ('5', '46');
INSERT INTO `sys_role_menu` VALUES ('5', '47');
INSERT INTO `sys_role_menu` VALUES ('5', '48');
INSERT INTO `sys_role_menu` VALUES ('5', '49');
INSERT INTO `sys_role_menu` VALUES ('5', '50');
INSERT INTO `sys_role_menu` VALUES ('5', '51');
INSERT INTO `sys_role_menu` VALUES ('5', '52');
INSERT INTO `sys_role_menu` VALUES ('5', '53');
INSERT INTO `sys_role_menu` VALUES ('5', '54');
INSERT INTO `sys_role_menu` VALUES ('5', '55');
INSERT INTO `sys_role_menu` VALUES ('5', '56');
INSERT INTO `sys_role_menu` VALUES ('5', '109');
INSERT INTO `sys_role_menu` VALUES ('5', '110');
INSERT INTO `sys_role_menu` VALUES ('5', '112');
INSERT INTO `sys_role_menu` VALUES ('5', '113');
INSERT INTO `sys_role_menu` VALUES ('5', '114');
INSERT INTO `sys_role_menu` VALUES ('5', '115');
INSERT INTO `sys_role_menu` VALUES ('5', '500');
INSERT INTO `sys_role_menu` VALUES ('5', '501');
INSERT INTO `sys_role_menu` VALUES ('5', '1039');
INSERT INTO `sys_role_menu` VALUES ('5', '1040');
INSERT INTO `sys_role_menu` VALUES ('5', '1041');
INSERT INTO `sys_role_menu` VALUES ('5', '1042');
INSERT INTO `sys_role_menu` VALUES ('5', '1043');
INSERT INTO `sys_role_menu` VALUES ('5', '1044');
INSERT INTO `sys_role_menu` VALUES ('5', '1045');
INSERT INTO `sys_role_menu` VALUES ('5', '1046');
INSERT INTO `sys_role_menu` VALUES ('5', '1047');
INSERT INTO `sys_role_menu` VALUES ('5', '1048');
INSERT INTO `sys_role_menu` VALUES ('5', '1049');
INSERT INTO `sys_role_menu` VALUES ('5', '1050');
INSERT INTO `sys_role_menu` VALUES ('5', '1051');
INSERT INTO `sys_role_menu` VALUES ('5', '1052');
INSERT INTO `sys_role_menu` VALUES ('5', '1053');
INSERT INTO `sys_role_menu` VALUES ('5', '1054');
INSERT INTO `sys_role_menu` VALUES ('5', '1055');
INSERT INTO `sys_role_menu` VALUES ('5', '1056');
INSERT INTO `sys_role_menu` VALUES ('5', '1057');
INSERT INTO `sys_role_menu` VALUES ('5', '1058');
INSERT INTO `sys_role_menu` VALUES ('5', '1059');
INSERT INTO `sys_role_menu` VALUES ('5', '1060');
INSERT INTO `sys_role_menu` VALUES ('5', '1061');
INSERT INTO `sys_role_menu` VALUES ('5', '1062');
INSERT INTO `sys_role_menu` VALUES ('5', '1063');
INSERT INTO `sys_role_menu` VALUES ('5', '1064');
INSERT INTO `sys_role_menu` VALUES ('5', '1065');
INSERT INTO `sys_role_menu` VALUES ('5', '1066');
INSERT INTO `sys_role_menu` VALUES ('5', '1067');
INSERT INTO `sys_role_menu` VALUES ('6', '5');
INSERT INTO `sys_role_menu` VALUES ('6', '6');
INSERT INTO `sys_role_menu` VALUES ('6', '7');
INSERT INTO `sys_role_menu` VALUES ('6', '8');
INSERT INTO `sys_role_menu` VALUES ('6', '9');
INSERT INTO `sys_role_menu` VALUES ('6', '10');
INSERT INTO `sys_role_menu` VALUES ('6', '11');
INSERT INTO `sys_role_menu` VALUES ('6', '12');
INSERT INTO `sys_role_menu` VALUES ('6', '13');
INSERT INTO `sys_role_menu` VALUES ('6', '14');
INSERT INTO `sys_role_menu` VALUES ('6', '15');
INSERT INTO `sys_role_menu` VALUES ('6', '16');
INSERT INTO `sys_role_menu` VALUES ('6', '17');
INSERT INTO `sys_role_menu` VALUES ('6', '18');
INSERT INTO `sys_role_menu` VALUES ('6', '19');
INSERT INTO `sys_role_menu` VALUES ('6', '20');
INSERT INTO `sys_role_menu` VALUES ('6', '21');
INSERT INTO `sys_role_menu` VALUES ('6', '22');
INSERT INTO `sys_role_menu` VALUES ('6', '23');
INSERT INTO `sys_role_menu` VALUES ('6', '24');
INSERT INTO `sys_role_menu` VALUES ('6', '25');
INSERT INTO `sys_role_menu` VALUES ('6', '27');
INSERT INTO `sys_role_menu` VALUES ('6', '28');
INSERT INTO `sys_role_menu` VALUES ('6', '29');
INSERT INTO `sys_role_menu` VALUES ('6', '31');
INSERT INTO `sys_role_menu` VALUES ('6', '32');
INSERT INTO `sys_role_menu` VALUES ('6', '33');
INSERT INTO `sys_role_menu` VALUES ('6', '35');
INSERT INTO `sys_role_menu` VALUES ('6', '36');
INSERT INTO `sys_role_menu` VALUES ('6', '37');
INSERT INTO `sys_role_menu` VALUES ('6', '38');
INSERT INTO `sys_role_menu` VALUES ('6', '39');
INSERT INTO `sys_role_menu` VALUES ('6', '40');
INSERT INTO `sys_role_menu` VALUES ('6', '41');
INSERT INTO `sys_role_menu` VALUES ('6', '42');
INSERT INTO `sys_role_menu` VALUES ('6', '43');
INSERT INTO `sys_role_menu` VALUES ('6', '44');
INSERT INTO `sys_role_menu` VALUES ('6', '45');
INSERT INTO `sys_role_menu` VALUES ('6', '46');
INSERT INTO `sys_role_menu` VALUES ('6', '47');
INSERT INTO `sys_role_menu` VALUES ('6', '48');
INSERT INTO `sys_role_menu` VALUES ('6', '49');
INSERT INTO `sys_role_menu` VALUES ('6', '50');
INSERT INTO `sys_role_menu` VALUES ('6', '51');
INSERT INTO `sys_role_menu` VALUES ('6', '52');
INSERT INTO `sys_role_menu` VALUES ('6', '53');
INSERT INTO `sys_role_menu` VALUES ('6', '54');
INSERT INTO `sys_role_menu` VALUES ('6', '55');
INSERT INTO `sys_role_menu` VALUES ('6', '56');
INSERT INTO `sys_role_menu` VALUES ('7', '2');
INSERT INTO `sys_role_menu` VALUES ('7', '3');
INSERT INTO `sys_role_menu` VALUES ('7', '5');
INSERT INTO `sys_role_menu` VALUES ('7', '6');
INSERT INTO `sys_role_menu` VALUES ('7', '7');
INSERT INTO `sys_role_menu` VALUES ('7', '8');
INSERT INTO `sys_role_menu` VALUES ('7', '9');
INSERT INTO `sys_role_menu` VALUES ('7', '10');
INSERT INTO `sys_role_menu` VALUES ('7', '11');
INSERT INTO `sys_role_menu` VALUES ('7', '12');
INSERT INTO `sys_role_menu` VALUES ('7', '13');
INSERT INTO `sys_role_menu` VALUES ('7', '14');
INSERT INTO `sys_role_menu` VALUES ('7', '15');
INSERT INTO `sys_role_menu` VALUES ('7', '16');
INSERT INTO `sys_role_menu` VALUES ('7', '17');
INSERT INTO `sys_role_menu` VALUES ('7', '18');
INSERT INTO `sys_role_menu` VALUES ('7', '19');
INSERT INTO `sys_role_menu` VALUES ('7', '20');
INSERT INTO `sys_role_menu` VALUES ('7', '21');
INSERT INTO `sys_role_menu` VALUES ('7', '22');
INSERT INTO `sys_role_menu` VALUES ('7', '23');
INSERT INTO `sys_role_menu` VALUES ('7', '24');
INSERT INTO `sys_role_menu` VALUES ('7', '25');
INSERT INTO `sys_role_menu` VALUES ('7', '27');
INSERT INTO `sys_role_menu` VALUES ('7', '28');
INSERT INTO `sys_role_menu` VALUES ('7', '29');
INSERT INTO `sys_role_menu` VALUES ('7', '31');
INSERT INTO `sys_role_menu` VALUES ('7', '32');
INSERT INTO `sys_role_menu` VALUES ('7', '33');
INSERT INTO `sys_role_menu` VALUES ('7', '35');
INSERT INTO `sys_role_menu` VALUES ('7', '36');
INSERT INTO `sys_role_menu` VALUES ('7', '37');
INSERT INTO `sys_role_menu` VALUES ('7', '38');
INSERT INTO `sys_role_menu` VALUES ('7', '39');
INSERT INTO `sys_role_menu` VALUES ('7', '40');
INSERT INTO `sys_role_menu` VALUES ('7', '41');
INSERT INTO `sys_role_menu` VALUES ('7', '42');
INSERT INTO `sys_role_menu` VALUES ('7', '43');
INSERT INTO `sys_role_menu` VALUES ('7', '44');
INSERT INTO `sys_role_menu` VALUES ('7', '45');
INSERT INTO `sys_role_menu` VALUES ('7', '46');
INSERT INTO `sys_role_menu` VALUES ('7', '47');
INSERT INTO `sys_role_menu` VALUES ('7', '48');
INSERT INTO `sys_role_menu` VALUES ('7', '49');
INSERT INTO `sys_role_menu` VALUES ('7', '50');
INSERT INTO `sys_role_menu` VALUES ('7', '51');
INSERT INTO `sys_role_menu` VALUES ('7', '52');
INSERT INTO `sys_role_menu` VALUES ('7', '53');
INSERT INTO `sys_role_menu` VALUES ('7', '54');
INSERT INTO `sys_role_menu` VALUES ('7', '55');
INSERT INTO `sys_role_menu` VALUES ('7', '56');
INSERT INTO `sys_role_menu` VALUES ('7', '109');
INSERT INTO `sys_role_menu` VALUES ('7', '110');
INSERT INTO `sys_role_menu` VALUES ('7', '112');
INSERT INTO `sys_role_menu` VALUES ('7', '113');
INSERT INTO `sys_role_menu` VALUES ('7', '114');
INSERT INTO `sys_role_menu` VALUES ('7', '115');
INSERT INTO `sys_role_menu` VALUES ('7', '500');
INSERT INTO `sys_role_menu` VALUES ('7', '501');
INSERT INTO `sys_role_menu` VALUES ('7', '1039');
INSERT INTO `sys_role_menu` VALUES ('7', '1040');
INSERT INTO `sys_role_menu` VALUES ('7', '1041');
INSERT INTO `sys_role_menu` VALUES ('7', '1042');
INSERT INTO `sys_role_menu` VALUES ('7', '1043');
INSERT INTO `sys_role_menu` VALUES ('7', '1044');
INSERT INTO `sys_role_menu` VALUES ('7', '1045');
INSERT INTO `sys_role_menu` VALUES ('7', '1046');
INSERT INTO `sys_role_menu` VALUES ('7', '1047');
INSERT INTO `sys_role_menu` VALUES ('7', '1048');
INSERT INTO `sys_role_menu` VALUES ('7', '1049');
INSERT INTO `sys_role_menu` VALUES ('7', '1050');
INSERT INTO `sys_role_menu` VALUES ('7', '1051');
INSERT INTO `sys_role_menu` VALUES ('7', '1052');
INSERT INTO `sys_role_menu` VALUES ('7', '1053');
INSERT INTO `sys_role_menu` VALUES ('7', '1054');
INSERT INTO `sys_role_menu` VALUES ('7', '1055');
INSERT INTO `sys_role_menu` VALUES ('7', '1056');
INSERT INTO `sys_role_menu` VALUES ('7', '1057');
INSERT INTO `sys_role_menu` VALUES ('7', '1058');
INSERT INTO `sys_role_menu` VALUES ('7', '1059');
INSERT INTO `sys_role_menu` VALUES ('7', '1060');
INSERT INTO `sys_role_menu` VALUES ('7', '1061');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '0', 'admin', '超级管理员', '00', 'dd122221111d@163.com', '15888888881', '0', '/upload/admin1579180516186761000.png', '609ac514e6ef0b9a5f4eee66693fd7f8', 'NcSB3H', '0', '0', '127.0.0.1', '2020-01-13 13:20:40', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-01 11:43:05', '管理员111111');
INSERT INTO `sys_user` VALUES ('3', '0', 'admin111', 'admin', '', 'ddd@163.com', '18788996255', '0', '', 'd505d06b9e2645026018b0f1af9cbb8c', 'EsnR7i', '0', '0', '', null, 'admin', '2020-03-11 11:22:16', 'admin', '2020-03-29 20:02:24', '');
INSERT INTO `sys_user` VALUES ('4', '110', 'zy-admin', 'zy-admin', '', 'flywithyou_Ren@139.com', '13810446192', '0', '', 'f0aa8cf4e44225d07a01268804ec1c3a', 'Ojjjjj', '0', '0', '', null, 'admin', '2020-05-09 11:52:46', '', null, '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('C1A6G4JTFKI0HAFO20', 'admin', '', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', 'on_line', '2020-03-14 09:46:34', '2020-03-14 09:46:34', '1440');
INSERT INTO `sys_user_online` VALUES ('C1J3DMZYYVOWS7S7WJ', 'admin', '', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', 'on_line', '2020-03-24 21:16:15', '2020-03-24 21:16:15', '1440');
INSERT INTO `sys_user_online` VALUES ('C1NAWWEVNJ4ODV45AN', 'admin', '', '[::1]', '内网IP', 'Chrome', 'Intel Mac OS X 10_14_6', 'on_line', '2020-03-29 20:01:12', '2020-03-29 20:01:12', '1440');
INSERT INTO `sys_user_online` VALUES ('C2L7CYJN7BKWPFB8AC', 'admin', '', '[::1]', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2020-05-09 11:57:13', '2020-05-09 11:57:13', '1440');
INSERT INTO `sys_user_online` VALUES ('C2LWBP7ZUFPKRFHGKH', 'admin', '', '[::1]', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2020-05-09 11:58:34', '2020-05-09 11:58:34', '1440');
INSERT INTO `sys_user_online` VALUES ('C2NOLE80WHFCHRCOFP', 'admin', '', '[::1]', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2020-05-13 11:31:04', '2020-05-13 11:31:04', '1440');
INSERT INTO `sys_user_online` VALUES ('C2Q3ERZ2WTQC4ZVORS', 'admin', '', '[::1]', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2020-05-14 10:22:23', '2020-05-14 10:22:23', '1440');
INSERT INTO `sys_user_online` VALUES ('C2Q4A1RHMPSGHWBHJD', 'admin', '', '[::1]', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2020-05-14 11:03:13', '2020-05-14 11:03:13', '1440');
INSERT INTO `sys_user_online` VALUES ('C2Q4EA7W3OFG0UXYWM', 'admin', '', '[::1]', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2020-05-14 11:08:45', '2020-05-14 11:08:45', '1440');
INSERT INTO `sys_user_online` VALUES ('C2R6ZX4F25QSSLONDD', 'admin', '', '[::1]', '内网IP', 'Firefox', 'Windows 10', 'on_line', '2020-05-15 17:23:43', '2020-05-15 17:23:43', '1440');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('3', '1');
INSERT INTO `sys_user_post` VALUES ('8', '1');
INSERT INTO `sys_user_post` VALUES ('8', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('3', '1');
INSERT INTO `sys_user_role` VALUES ('4', '1');

-- ----------------------------
-- Table structure for tbl_file
-- ----------------------------
DROP TABLE IF EXISTS `tbl_file`;
CREATE TABLE `tbl_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `file_sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件hash',
  `file_name` varchar(256) NOT NULL DEFAULT '' COMMENT '文件名',
  `file_size` bigint(20) DEFAULT '0' COMMENT '文件大小',
  `file_addr` varchar(1024) NOT NULL DEFAULT '' COMMENT '文件存储位置',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_file_hash` (`file_sha1`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_file
-- ----------------------------
INSERT INTO `tbl_file` VALUES ('4', '12123解决就', '13123', '21312321', '1231231', 'admin', '2020-05-09 12:19:39', '', '2020-05-09 12:38:44', '1231231猫妈妈3');

-- ----------------------------
-- Table structure for t_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_answer`;
CREATE TABLE `t_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` bigint(20) DEFAULT NULL COMMENT '问题ID',
  `atype` tinyint(1) DEFAULT '0' COMMENT '回复人类别',
  `user_id` bigint(20) DEFAULT NULL COMMENT '回复人ID',
  `nick_name` varchar(50) DEFAULT '' COMMENT '回复人名称',
  `avatar` varchar(50) DEFAULT '' COMMENT '回复人头像',
  `remark` tinytext COMMENT '回复内容',
  `img1` varchar(100) DEFAULT '' COMMENT '回复图片1',
  `img2` varchar(100) DEFAULT '' COMMENT '回复图片2',
  `img3` varchar(100) DEFAULT '' COMMENT '回复图片3',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='回复表';

-- ----------------------------
-- Records of t_answer
-- ----------------------------

-- ----------------------------
-- Table structure for t_problem
-- ----------------------------
DROP TABLE IF EXISTS `t_problem`;
CREATE TABLE `t_problem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zx_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `zx_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `zx_avatar` varchar(50) DEFAULT '' COMMENT '咨询头像',
  `zj_id` bigint(20) DEFAULT NULL COMMENT '专家ID',
  `remark` varchar(250) DEFAULT '' COMMENT '问题描述',
  `img1` varchar(100) DEFAULT '' COMMENT '问题图片1',
  `img2` varchar(100) DEFAULT '' COMMENT '问题图片2',
  `img3` varchar(100) DEFAULT '' COMMENT '问题图片3',
  `ispay` tinyint(1) DEFAULT '0' COMMENT '是否付费',
  `pay_time` datetime DEFAULT NULL COMMENT '付费时间',
  `pay_no` varchar(50) DEFAULT '' COMMENT '订单号',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题表';

-- ----------------------------
-- Records of t_problem
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_withdrawals
-- ----------------------------
DROP TABLE IF EXISTS `t_user_withdrawals`;
CREATE TABLE `t_user_withdrawals` (
  `wid` int(50) NOT NULL AUTO_INCREMENT COMMENT '申请ID',
  `uid` int(50) DEFAULT '0' COMMENT '用户ID',
  `realname` varchar(50) DEFAULT NULL COMMENT '姓名',
  `idno` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `wmoney` decimal(10,0) DEFAULT '0' COMMENT '提现金额',
  `wbankname` varchar(50) DEFAULT '' COMMENT '银行名称',
  `wbankaccount` varchar(50) DEFAULT '' COMMENT '银行帐户',
  `wrealname` varchar(50) DEFAULT '' COMMENT '银行户名',
  `wopenbank` varchar(50) DEFAULT '' COMMENT '开户行',
  `wcreatetime` varchar(50) DEFAULT '' COMMENT '申请时间',
  `wstatus` int(11) DEFAULT '0' COMMENT '审核结果',
  `wremark` varchar(255) DEFAULT '' COMMENT '审核意见',
  `waudittime` varchar(50) DEFAULT '' COMMENT '审核时间',
  PRIMARY KEY (`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现申请';

-- ----------------------------
-- Records of t_user_withdrawals
-- ----------------------------

-- ----------------------------
-- Table structure for t_zjuser
-- ----------------------------
DROP TABLE IF EXISTS `t_zjuser`;
CREATE TABLE `t_zjuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uname` varchar(11) DEFAULT '' COMMENT '手机号',
  `puid` bigint(20) DEFAULT NULL COMMENT '推荐人ID',
  `puname` varchar(11) DEFAULT '' COMMENT '推荐人手机号',
  `real_name` varchar(30) DEFAULT '' COMMENT '姓名',
  `idno` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(50) DEFAULT '' COMMENT '头像',
  `job` varchar(50) DEFAULT '' COMMENT '职业',
  `utype` tinyint(1) DEFAULT '0' COMMENT '用户类别',
  `upwd` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(45) DEFAULT '' COMMENT '密码盐',
  `idpic1` varchar(100) DEFAULT NULL COMMENT '身份证正面',
  `idpic2` varchar(100) DEFAULT NULL COMMENT '身份证反面',
  `pimg1` varchar(100) DEFAULT NULL COMMENT '职业资格认证1',
  `pimg2` varchar(100) DEFAULT NULL COMMENT '职业资格认证2',
  `pimg3` varchar(100) DEFAULT NULL COMMENT '职业资格认证3',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `im_money` decimal(8,2) DEFAULT '0.00' COMMENT '在线咨询费用',
  `tel_money` decimal(8,2) DEFAULT '0.00' COMMENT '电话咨询费用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='专家用户';

-- ----------------------------
-- Records of t_zjuser
-- ----------------------------
INSERT INTO `t_zjuser` VALUES ('1', '13245675486', null, '', '', null, '', '', '0', 'd296507972d67a50fd62060b637d1605', '5mFIIg', null, null, null, null, null, '0', '0.00', '0.00', '2019-12-05 14:02:16', '2019-12-22 10:41:58');
INSERT INTO `t_zjuser` VALUES ('2', '13245675487', null, '', '', null, '', '', '0', '5026692e16d7ee025da1c6157f5974e6', 'M7vokL', null, null, null, null, null, '0', '0.00', '0.00', '2019-12-16 13:51:30', null);

-- ----------------------------
-- Table structure for t_zxuser
-- ----------------------------
DROP TABLE IF EXISTS `t_zxuser`;
CREATE TABLE `t_zxuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source_id` varchar(50) DEFAULT '' COMMENT '注册ID',
  `source_type` tinyint(1) DEFAULT '0' COMMENT '注册类别',
  `recommender` varchar(20) DEFAULT '' COMMENT '推荐人',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(50) DEFAULT '' COMMENT '头像',
  `zj_id` bigint(20) DEFAULT NULL COMMENT '专家ID',
  `status` tinyint(11) DEFAULT '0' COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='咨询用户';

-- ----------------------------
-- Records of t_zxuser
-- ----------------------------
