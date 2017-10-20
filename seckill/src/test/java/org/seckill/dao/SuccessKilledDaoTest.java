package org.seckill.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.entity.SuccessKilled;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
//∏ÊÀﬂjunit spring≈‰÷√Œƒº˛
@ContextConfiguration({ "classpath:spring/spring-dao.xml" })
public class SuccessKilledDaoTest {
	
	@Autowired
	private SuccessKilledDao successKilledDao;

	@Test
	public void testInsertSuccessKilled()
	{
		long id=1000L;
		long phone=18751805555L;
		int insertCount=successKilledDao.insertSuccessKilled(id, phone);
		System.out.println("insertCount:"+insertCount);
	}

	@Test
	public void testQueryByIdWithSeckill()
	{
		long id=1000L;
		long phone=18751805555L;
		SuccessKilled successKilled=successKilledDao.queryByIdWithSeckill(id, phone);
		System.out.println(successKilled.getSeckill());
		
	}
}
