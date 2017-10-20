package org.seckill.dao;

import org.apache.ibatis.annotations.Param;
import org.seckill.entity.SuccessKilled;

public interface SuccessKilledDao {
	/**
	 * ���빺����ϸ���ɹ����ظ�����Ʊ��ʱ���������������
	 * @param seckillId
	 * @param userPhone
	 * @return  Ӱ�������
	 */
	int insertSuccessKilled(@Param("seckillId") long seckillId,@Param("userPhone") long userPhone);
	
	/**
	 * ����id��ѯSuccessKilled��Я����ɱ����ʵ��
	 * @param seckillId
	 * @return
	 */
	SuccessKilled queryByIdWithSeckill(@Param("seckillId") long seckillId,@Param("userPhone") long userPhone);
}
