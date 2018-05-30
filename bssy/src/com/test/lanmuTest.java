package com.test;

import java.io.IOException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dao.LanmuDao;
import com.model.Lanmu;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={ "classpath*:/spring-base.xml", "classpath*:/spring-dao.xml" })

public class lanmuTest {
	@Autowired
	private LanmuDao lanmuDao;
	@Test
	public void test() throws IOException {
		Lanmu lanmu=new Lanmu();

		lanmu.setLanmulock(1);
		lanmu.setLanmuming("测试");
		lanmuDao.insertBean(lanmu);
	}
}
