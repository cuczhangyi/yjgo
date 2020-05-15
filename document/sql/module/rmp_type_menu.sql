/*
==========================================================================
云捷GO自动生成菜单SQL,只生成一次,按需修改.
生成日期：2020-05-14 15:27:27
生成路径: document/sql/module/rmp_type_menu.sql
生成人：张一
==========================================================================
*/

-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('资源类型', '4', '1', '/module/rmp_type', 'C', '0', 'module:rmp_type:view', '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '资源类型菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)




values('资源类型查询', @parentId, '1',  '#',  'F', '0', 'module:rmp_type:list',         '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('资源类型新增', @parentId, '2',  '#',  'F', '0', 'module:rmp_type:add',          '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('资源类型修改', @parentId, '3',  '#',  'F', '0', 'module:rmp_type:edit',         '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('资源类型删除', @parentId, '4',  '#',  'F', '0', 'module:rmp_type:remove',       '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('资源类型导出', @parentId, '5',  '#',  'F', '0', 'module:rmp_type:export',       '#', 'admin', '2020-01-01', 'admin', '2020-01-01', '');