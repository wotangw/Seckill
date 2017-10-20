-- ���ݿ��ʼ���ű�

-- �������ݿ�
create database seckill;

-- ʹ�����ݿ�
use seckill;

-- ������ɱ����
-- mysql�ж��д洢���棬��ֻ��InnoDB֧�����������ʽ�����洢����
-- ��ʼ����id��1000��ʼ������Ĭ���ַ�����utf8����ӱ�ע��
create table seckill(
	seckill_id  bigint NOT NULL AUTO_INCREMENT COMMENT '��Ʒ���id',
  	name VARCHAR(120) NOT NULL COMMENT '��Ʒ����',
  	number int NOT NULL COMMENT '�������',
  	start_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT'��ɱ����ʱ��',
 	end_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '��ɱ����ʱ��',
  	create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  	PRIMARY KEY (seckill_id),
  	KEY idx_create_time(create_time),
  	KEY idx_start_time(start_time),
  	KEY idx_end_time(end_time)
)engine=InnoDB auto_increment=1000 default charset=utf8  comment '��ɱ����';

-- ��ʼ������
INSERT INTO 
	seckill(name,number,start_time,end_time)
VALUES 
	('1000Ԫ��ɱiphone6',100,'2017-02-03 00:00:00','2017-02-04 00:00:00'),
	('500Ԫ��ɱipad2',200,'2017-02-03 00:00:00','2017-02-04 00:00:00'),
	('300Ԫ��ɱС��4',300,'2017-02-03 00:00:00','2017-02-04 00:00:00'),
	('200Ԫ��ɱ����note',400,'2017-02-03 00:00:00','2017-02-04 00:00:00');



-- ��ɱ�ɹ���ϸ��
-- �û���¼��֤��ص���Ϣ
CREATE TABLE success_killed(
	`seckill_id` bigint NOT NULL COMMENT '��ɱ��Ʒid',
	`user_phone` bigint NOT NULL COMMENT '�û��ֻ���',
	`state` tinyint NOT NULL DEFAULT -1 COMMENT '״̬��ʾ:-1:��Ч 0:�ɹ� 1:�Ѹ��� 2:�ѷ���',
	`create_time` timestamp NOT NULL COMMENT '����ʱ��',
	PRIMARY KEY(seckill_id,user_phone),/*��������*/
	KEY idx_create_time(create_time)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='��ɱ�ɹ���ϸ��';


-- �鿴����sql���
show create table seckill\G;

-- Ϊʲô��дDDL
-- ��¼ÿ�����ߵ�DDL�޸�
-- ����V1.1
ALTER TABLE seckill
DROP INDEX idx_create_time,
ADD INDEX idx_c_s(start_time,create_time);

-- ����V1.2


