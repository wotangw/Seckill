package org.seckill.dao;

import java.util.Date;
import java.util.List;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.entity.Seckill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/*
 * ����spring��junit���ϣ�junit����ʱ����springIOC����
 * spring-test, junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
//����junit spring�����ļ�
@ContextConfiguration({ "classpath:spring/spring-dao.xml" })
public class SeckillDaoTest {
	
	//ע��Daoʵ��������
	@Autowired
	private SeckillDao seckillDao;
	 
	@Test
	public void testQueryById() throws Exception
	{
		long id = 1000;
		System.out.println("test1");
		Seckill seckill = seckillDao.queryById(id);
		System.out.println("***************��ʼTestQueryById****************");
		System.out.println(seckill.getName());
		System.out.println(seckill);
		System.out.println("***************����TestQueryById****************");
	}

	@Test
	public void testQueryAll() throws Exception
	{
		/*
		 * Caused by: org.apache.ibatis.binding.BindingException: 
		 * Parameter 'offset' not found. Available parameters are [0, 1, param1, param2]
		 */
		//List<Seckill> queryAll(int offet, int limit);
		//javaû�б����βεļ�¼queryAll(int offet, int limit)-->queryAll(arg0,arg1)
		List<Seckill> list = seckillDao.queryAll(0, 100);
		for (Seckill seckill : list)
		{
			System.out.println(seckill);
		}
	}

	@Test
	public void testReduceNumber() throws Exception
	{
		Date killTime = new Date();
		int updateCount = seckillDao.reduceNumber(1000L, killTime);
		System.out.println("updateCount=" + updateCount);
	}
}
