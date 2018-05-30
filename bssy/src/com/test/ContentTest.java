package com.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dao.ContentDao;
import com.model.Content;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-dao.xml","classpath:spring-base.xml"})
public class ContentTest {
	@Autowired
	private ContentDao contentDao;
	@Test
	public void test(){
		List<Content> list=contentDao.selectAllList("where contentlock=0");
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getTitle());
		}
	}
}
