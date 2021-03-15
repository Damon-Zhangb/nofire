CREATE DATABASE FireFighting;
USE FireFighting;

/*
  修改
     1.取消了多余的用户和公司之间的关联，人员与公司关联即可
	 2.设置身份证号为人员表的主键
     3.在设施表中添加了设备ID，取消了设备表中的设施ID，因为设施与设备是一对多的关系
*/

-- ----------------------------
-- Table structure for company
-- ----------------------------
CREATE TABLE company (
company_id int(11) NOT NULL AUTO_INCREMENT ,
company_name varchar(30) NOT NULL COMMENT '公司名称',
company_code varchar(50) NOT NULL  COMMENT '公司代码',
company_type int(2) NOT NULL DEFAULT 0 COMMENT '单位类型  1:办公楼 2:医院 3:学校 4:非国企 5:国企 6:博物馆 7:宾馆、饭店 8:公共娱乐 9:交通枢纽 10:会馆 11:客运站
 12:商场 13:党政机关 14:住宅小区 15:养老机构 16:易燃易爆 17:运输',
province varchar(20) NOT NULL COMMENT '省份',
city varchar(20) NOT NULL COMMENT '城市',
district varchar(20) NOT NULL COMMENT '区县',
address varchar(200) COMMENT '详细地址',
longitude decimal(10,7) COMMENT '经度',
latiturede decimal(10,7) COMMENT '维度',
creation_time date NOT NULL COMMENT '创建时间',
phone varchar(11) NOT NULL COMMENT '消防控制室电话', 
email varchar(50) COMMENT '邮箱',
postal_code varchar(10) COMMENT '邮政编码',
assets double(30,1) COMMENT '总资产',
employee_num int(10) COMMENT '职工数',
PRIMARY KEY (company_id),
UNIQUE KEY(company_code)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='公司';

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE user (
user_id int(11) NOT NULL AUTO_INCREMENT,
user_name varchar(30) NOT NULL COMMENT '用户名',
password varchar(30) NOT NULL COMMENT '登录密码',
password_change_time datetime COMMENT '密码修改时间',
user_type int(1) NOT NULL DEFAULT 0 COMMENT '用户类型 1:一般身份 2:巡检员 3:安全管理员',
creation_time datetime COMMENT '创建时间',
person_id int(11) DEFAULT NULL COMMENT '人员ID',
PRIMARY KEY (user_id) 
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Table structure for person
-- ----------------------------
CREATE TABLE person (
person_id varchar(18) NOT NULL COMMENT '身份证号码',
person_name varchar(100) NOT NULL COMMENT '人员名称',
phone varchar(11) DEFAULT NULL COMMENT '电话',
email varchar(50) DEFAULT NULL COMMENT '邮箱',
person_position varchar(50) COMMENT '职位',
company_id int(11) DEFAULT NULL COMMENT '公司ID',
is_SMS int(1) DEFAULT 1 NULL COMMENT '短信接收控制: 1:接收 0:不接收',
is_phone int(1) DEFAULT 1 NULL COMMENT '电话接收控制: 1:接收 0:不接收',
PRIMARY KEY (person_id) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员';

-- --------------------------------------------
-- Table structure for fire_facilities
-- --------------------------------------------
CREATE TABLE fire_facilities (
facility_id int(11) NOT NULL AUTO_INCREMENT,
facility_name varchar(30) COMMENT '操作名称' ,
setting_location varchar(100) COMMENT '设置部位',
use_time date COMMENT '投入使用时间',
detectors_num int(20) COMMENT '探测器数量',
controller_num int(20) COMMENT '控制器数量',
produce_phone varchar(11) COMMENT '生产单位联系方式',
service_phone varchar(11) COMMENT '维修单位联系方式',
company_id int(11) DEFAULT NULL COMMENT '公司ID',
equipment_id int(11) DEFAULT NULL COMMENT '消防设备ID',
PRIMARY KEY (facility_id) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消防设施';

-- ----------------------------------
-- Table structure for fire_equipment
-- ----------------------------------
CREATE TABLE fire_equipment (
equipment_id int(11) NOT NULL AUTO_INCREMENT,
equipment_name varchar(30) COMMENT '设备名称',
equipment_type int(2)  DEFAULT 0 COMMENT'设备类型 1:配电箱监测 2:消防水源监测 3:消防主机监测 4:消防视频监控 5:NB烟感 6:NB可燃气体 7:气体系统 8:燃气系统 
9:防火分离 10:应急疏散',
address varchar(255) NOT NULL COMMENT '设备位置',
equipment_code varchar(30) NOT NULL COMMENT '设备识别码',
longitude decimal(10,7) COMMENT '经度',
latitude decimal(10,7) COMMENT '维度',
protocol_type int(1) DEFAULT 1 COMMENT '协议类型 1:TCP 2:UDP',
SIM_id varchar(50) COMMENT 'SIM卡号',
creation_time datetime COMMENT '开卡时间',
heart_time varchar(50) COMMENT '心跳时长',
vendor_logo int(2)  DEFAULT 0 COMMENT '厂商标志: 1:传输装置 2:配电箱 3:液压 4:液位 5:NB烟感 6:NB可燃气体 7:气体系统 8:煤气系统 9:防火分离 10:应急疏散',
PRIMARY KEY (equipment_id) ,
UNIQUE KEY(equipment_code)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='消防设备';

-- ----------------------------------------
-- Table structure for fire_fighting_parts
-- ----------------------------------------
CREATE TABLE fire_fighting_parts (
parts_id int(11) NOT NULL AUTO_INCREMENT,
parts_name varchar(30) NOT NULL COMMENT '部件名称',
parts_type int(2) DEFAULT 1 COMMENT '部件类型 1:通用 2:火灾报警控制器 3:可燃气体探测器 4:点型可燃气体探测器 5:独立式可燃气体探测器 6:线型可燃气体探测器 
7:电气火灾监控报警器 8:剩余电流式火灾监控探测器 9:温测试电气火灾监控探测器 10:探测回路 11:火灾显示盘 12:手动火灾报警按钮 13:消火栓按钮 14:火灾探测器 15:感温火灾探测器 
16:感烟火灾探测器 17:复合式火灾探测器 18:气体探测器 19:其他',
area_code varchar(50) COMMENT ' 部件区号',
circuit_code varchar(50) COMMENT '部件回路号',
tag_code varchar(50) COMMENT '部件位号',
model varchar(50)COMMENT '部件型号',
address varchar(255) COMMENT '安装位置',
company_id int(11) DEFAULT NULL COMMENT '公司ID',
equipment_id int(11) DEFAULT NULL COMMENT '设备ID',
PRIMARY KEY (parts_id) 
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='消防部件';

-- ----------------------------------------
-- Table structure for building
-- ----------------------------------------
CREATE TABLE building (
building_id int(11) NOT NULL AUTO_INCREMENT,
building_name varchar(30) NOT NULL COMMENT '建筑名称',
build_time date COMMENT '建筑时间',
use_nature int(1) DEFAULT 1 COMMENT '使用性质 1:民用建筑 2:公共建筑 3:工业建筑 4:农业建筑',
fire_hazard_class int(1) DEFAULT 1 COMMENT '火灾危险等级 1:轻危险级 2:中危险级 3:严重危险级 4:仓库危险级',
structure_type int(1) DEFAULT 1 COMMENT '结构类型 1:砖木结构建筑 2:砖混结构建筑 3:钢筋混凝土结构建筑 4:钢结构建筑',
fire_resistant_level int(1) DEFAULT 1 COMMENT '耐火等级 1:一级 2:二级 3:三级',
height double(30,3) COMMENT '建筑高度',
building_area double(30,3) COMMENT '建筑面积',
field_area double(30,3) COMMENT '占地面积',
tereogram varchar(255) COMMENT '建筑立体图',
fire_facilities_layout varchar(255) COMMENT '建筑平面图',
company_id int(11) DEFAULT NULL COMMENT '公司ID',
PRIMARY KEY (building_id) 
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='建筑物';

-- ----------------------------------------
-- Table structure for protocol
-- ----------------------------------------
CREATE TABLE protocol(
protocol_id int(11) NOT NULL AUTO_INCREMENT,
protocol_name varchar(30) NOT NULL COMMENT '协议名称',
protocol_content varchar(255) NOT NULL COMMENT '协议内容',
person_id int(11) DEFAULT NULL COMMENT '人员ID',
PRIMARY KEY (protocol_id) ,
UNIQUE KEY (protocol_name)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='协议';

-- --------------------------------------------
-- Table structure for consumption_regulations
-- --------------------------------------------
CREATE TABLE consumption_regulations (
regulations_id int(11) NOT NULL AUTO_INCREMENT,
regulations_name varchar(50) NOT NULL COMMENT '法规名称',
regulation_category int(2) COMMENT '法规类别',
lssuing_authorrity varchar(30) COMMENT '颁布机关',
lssue_number varchar(30) COMMENT'颁布文号',
create_date date COMMENT '颁布日期',
use_date date COMMENT '实行日期',
regulation_content varchar(255) COMMENT '法规内容',
user_id int(11) DEFAULT NULL COMMENT '用户ID',
PRIMARY KEY (regulations_id) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消防法规';

-- --------------------------------------------
-- Table structure for notice
-- --------------------------------------------
CREATE TABLE notice (
notice_id int(11) NOT NULL AUTO_INCREMENT,
notice_type int(1) DEFAULT 1 COMMENT '通知类型: 1:短信通知 2:电话通知',
content varchar(255) COMMENT '通知内容',
notice_time datetime COMMENT '通知时间',
person_id int(11) DEFAULT NULL COMMENT '人员ID',
PRIMARY KEY (notice_id) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知信息';

-- --------------------------------------------
-- Table structure for alarm_record
-- --------------------------------------------
CREATE TABLE alarm_record (
alarm_id int(11) NOT NULL AUTO_INCREMENT,
alarm_time datetime NOT NULL COMMENT '报警时间',
accept_time datetime NOT NULL COMMENT '受理时间',
alarm_type int(1) DEFAULT 1 COMMENT '报警类型: 1:短信通知 2:电话通知',
content varchar(255) COMMENT '处理情况',
company_id int(11) DEFAULT NULL COMMENT '公司ID',
person_id int(11) DEFAULT NULL COMMENT '人员ID',
PRIMARY KEY (alarm_id) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报警信息';

-- --------------------------------------------
-- Table structure for operation_log
-- --------------------------------------------
CREATE TABLE operation_log (
log_id int(11) NOT NULL AUTO_INCREMENT,
operation_time datetime COMMENT '操作时间',
operation_type int(2) DEFAULT NULL COMMENT '操作类型',
content varchar(255) COMMENT '操作内容',
user_id int(11) DEFAULT NULL COMMENT '用户ID',
PRIMARY KEY (log_id) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- --------------------------------------------
-- Table structure for role
-- --------------------------------------------
CREATE TABLE role (
role_id int(11) NOT NULL AUTO_INCREMENT,
role_name varchar(30) COMMENT '角色名称',
role_describe varchar(255) COMMENT '角色描述',
PRIMARY KEY (role_id) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- --------------------------------------------
-- Table structure for user_role
-- --------------------------------------------
CREATE TABLE user_role (
user_role_id int(11) NOT NULL AUTO_INCREMENT,
user_id int(11) DEFAULT NULL COMMENT '用户ID',
role_id int(11) DEFAULT NULL COMMENT '角色ID',
PRIMARY KEY (user_role_id) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- --------------------------------------------
-- Table structure for role_privilege
-- --------------------------------------------
CREATE TABLE role_privilege (
role_privilege_id int(11) NOT NULL AUTO_INCREMENT,
role_id int(11) DEFAULT NULL COMMENT '角色ID',
functional_module_id int(11) DEFAULT NULL COMMENT '功能模块ID',
PRIMARY KEY (role_privilege_id) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户权限表';

-- --------------------------------------------
-- Table structure for function_menu
-- --------------------------------------------
CREATE TABLE function_menu (
functional_module_id int(11) NOT NULL AUTO_INCREMENT,
functional_module_name varchar(30) COMMENT '功能模块名称',
parent_function_module_id int(11) DEFAULT NULL  COMMENT '父功能模块ID',
functional_module_describe varchar(255) COMMENT '功能模块描述',
functional_module_url varchar(255) COMMENT 'URL',
PRIMARY KEY (functional_module_id) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能菜单表';