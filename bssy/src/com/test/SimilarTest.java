package com.test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dao.ContentDao;
import com.dao.SimilarDao;
import com.model.Content;
import com.model.Similar;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-dao.xml","classpath:spring-base.xml"})
public class SimilarTest {
	@Autowired
	private SimilarDao similarDao;
	@Autowired
	private ContentDao contentDao;
	
	public void test() {
		Similar similar=new Similar();
		Content contento=contentDao.selectBean("where id=1");
		Content contentt=contentDao.selectBean("where id=2");	
		similar.setContentCo(contento);
		similar.setContentCt(contentt);
		similar.setSim(0.233);
		similarDao.insertBean(similar);
	}

	public void test1(){
		long co=37;
		String where="where co="+co+" or ct="+co+" order by sim desc ";
		List<Similar> list=similarDao.selectBeanList(where,3);
		List<Content> listT=new ArrayList<Content>();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getContentCo().getId()==co) {
				listT.add(list.get(i).getContentCt());
			}else {
				listT.add(list.get(i).getContentCo());
			}
		}
		for (int i = 0; i < listT.size(); i++) {
			System.out.println(listT.get(i).getId()+listT.get(i).getTitle());
		}
	} 
	@Test
	public void test3(){
		Content content=new Content();
		content.setId(3);
		String where="where co="+content.getId()+" or ct="+content.getId();
		List<Similar> list=similarDao.selectBeanList(where);
		for (int i = 0; i < list.size(); i++) {
			Similar similar=list.get(i);
			System.out.println(similar.getContentCo().getTitle());
			similar.setSim(0.55);
			similarDao.updateBean(similar);
		}
	}
}
