/*
==========================================================================
云捷GO自动生成菜单SQL,只生成一次,按需修改.
生成日期：2020-05-13 11:25:57
生成路径: document/sql/module/rmp_path_menu.sql
生成人：yunjie
==========================================================================
*/

-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('文件夹结构', '4', '1', '/module/rmp_path', 'C', '0', 'module:rmp_path:view', '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '文件夹结构菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)




values('文件夹结构查询', @parentId, '1',  '#',  'F', '0', 'module:rmp_path:list',         '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('文件夹结构新增', @parentId, '2',  '#',  'F', '0', 'module:rmp_path:add',          '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('文件夹结构修改', @parentId, '3',  '#',  'F', '0', 'module:rmp_path:edit',         '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('文件夹结构删除', @parentId, '4',  '#',  'F', '0', 'module:rmp_path:remove',       '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('文件夹结构导出', @parentId, '5',  '#',  'F', '0', 'module:rmp_path:export',       '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');