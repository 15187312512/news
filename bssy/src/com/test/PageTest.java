package com.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.action.PageAction;
import com.model.Content;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-dao.xml","classpath:spring-base.xml","classpath:spring-actions.xml"})
public class PageTest {
	@Autowired
	private PageAction pageAction;
	@Test
	public void test(){
		/*List<Content> list= (List<Content>) pageAction.pageForIndex();
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getTitle());
		}*/
		
	}
}
