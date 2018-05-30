package com.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dao.ContentDao;
import com.dao.PinglunDao;
import com.model.Content;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-dao.xml","classpath:spring-base.xml"})
public class CommentTest {
	@Autowired
	private PinglunDao pinglunDao;
	@Test
	public void test(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar c = Calendar.getInstance();
         
        //过去七天
        c.setTime(new Date());
        c.add(Calendar.DATE, - 7);
        Date d = c.getTime();
        String startDay = format.format(d);
       
		String where="select content.title,count(*) from Pinglun where createtime>="+startDay+
				" group by contentid order by count(*) DESC";
/*		String where="select content.title,count(*) from Pinglun where createtime> "
				+ " group by contentid order by count(*) DESC";*/
		List<Object> list=pinglunDao.selectCommentsCount(where ,7);
        Iterator iterator=list.iterator();
        while (iterator.hasNext()) {
			Object[] object = (Object[]) iterator.next();
			System.out.println(object[0]+"  "+object[1]);
		}
	}
}
