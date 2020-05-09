/*
==========================================================================
云捷GO自动生成菜单SQL,只生成一次,按需修改.
生成日期：2020-05-09 11:25:39
生成路径: document/sql/module/file_menu.sql
生成人：yunjie
==========================================================================
*/

-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('文件管理', '4', '1', '/module/file', 'C', '0', 'file:view', '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '文件管理菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('文件管理查询', @parentId, '1',  '#',  'F', '0', 'module:file:list',         '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('文件管理新增', @parentId, '2',  '#',  'F', '0', 'module:file:add',          '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('文件管理修改', @parentId, '3',  '#',  'F', '0', 'module:file:edit',         '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('文件管理删除', @parentId, '4',  '#',  'F', '0', 'module:file:remove',       '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('文件管理导出', @parentId, '5',  '#',  'F', '0', 'module:file:export',       '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');