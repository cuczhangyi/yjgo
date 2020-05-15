/*
==========================================================================
云捷GO自动生成菜单SQL,只生成一次,按需修改.
生成日期：2020-05-11 16:08:09
生成路径: document/sql/module/rmp_file_menu.sql
生成人：yunjie
==========================================================================
*/

-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('资源文件', '4', '1', '/module/rmp_file', 'C', '0', 'module:rmp_file:view', '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '资源文件菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)




values('资源文件查询', @parentId, '1',  '#',  'F', '0', 'module:rmp_file:list',         '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('资源文件新增', @parentId, '2',  '#',  'F', '0', 'module:rmp_file:add',          '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('资源文件修改', @parentId, '3',  '#',  'F', '0', 'module:rmp_file:edit',         '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('资源文件删除', @parentId, '4',  '#',  'F', '0', 'module:rmp_file:remove',       '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('资源文件导出', @parentId, '5',  '#',  'F', '0', 'module:rmp_file:export',       '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');