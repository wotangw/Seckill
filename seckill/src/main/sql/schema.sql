-- 数据库初始化脚本

-- 创建数据库
create database seckill;

-- 使用数据库
use seckill;

-- 创建秒杀库存表
-- mysql有多中存储引擎，但只有InnoDB支持事物，所以显式声明存储引擎
-- 初始自增id从1000开始，定义默认字符编码utf8，添加表注释
create table seckill(
	seckill_id  bigint NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
  	name VARCHAR(120) NOT NULL COMMENT '商品名称',
  	number int NOT NULL COMMENT '库存数量',
  	start_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT'秒杀开启时间',
 	end_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '秒杀结束时间',
  	create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  	PRIMARY KEY (seckill_id),
  	KEY idx_create_time(create_time),
  	KEY idx_start_time(start_time),
  	KEY idx_end_time(end_time)
)engine=InnoDB auto_increment=1000 default charset=utf8  comment '秒杀库存表';

-- 初始化数据
INSERT INTO 
	seckill(name,number,start_time,end_time)
VALUES 
	('1000元秒杀iphone6',100,'2017-02-03 00:00:00','2017-02-04 00:00:00'),
	('500元秒杀ipad2',200,'2017-02-03 00:00:00','2017-02-04 00:00:00'),
	('300元秒杀小米4',300,'2017-02-03 00:00:00','2017-02-04 00:00:00'),
	('200元秒杀红米note',400,'2017-02-03 00:00:00','2017-02-04 00:00:00');



-- 秒杀成功明细表
-- 用户登录认证相关的信息
CREATE TABLE success_killed(
	`seckill_id` bigint NOT NULL COMMENT '秒杀商品id',
	`user_phone` bigint NOT NULL COMMENT '用户手机号',
	`state` tinyint NOT NULL DEFAULT -1 COMMENT '状态标示:-1:无效 0:成功 1:已付款 2:已发货',
	`create_time` timestamp NOT NULL COMMENT '创建时间',
	PRIMARY KEY(seckill_id,user_phone),/*联合主键*/
	KEY idx_create_time(create_time)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';


-- 查看建表sql语句
show create table seckill\G;

-- 为什么手写DDL
-- 纪录每次上线的DDL修改
-- 上线V1.1
ALTER TABLE seckill
DROP INDEX idx_create_time,
ADD INDEX idx_c_s(start_time,create_time);

-- 上线V1.2


