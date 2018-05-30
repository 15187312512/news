package com.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.ContentDao;
import com.dao.SimilarDao;
import com.model.Content;
import com.model.Similar;
import com.service.SimilarService;
import com.util.Cosine;

public class SimilarServiceImpl implements SimilarService {

	private SimilarDao similarDao;
	private ContentDao contentDao;
	public SimilarDao getSimilarDao() {
		return similarDao;
	}

	public void setSimilarDao(SimilarDao similarDao) {
		this.similarDao = similarDao;
	}

	public ContentDao getContentDao() {
		return contentDao;
	}

	public void setContentDao(ContentDao contentDao) {
		this.contentDao = contentDao;
	}

	public List<Content> getSimList(Content content, int top) {
		String where="where (co="+content.getId()+" or ct="+content.getId()+") and sim>0.2 order by sim desc ";
		List<Similar> list=similarDao.selectBeanList(where,top);
		List<Content> listT=new ArrayList<Content>();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getContentCo().getId()==content.getId()) {
				listT.add(list.get(i).getContentCt());
			}else {
				listT.add(list.get(i).getContentCo());
			}
		}
		return listT;
	}


	public void calculateSim(Content content) {
		String where="where co="+content.getId()+" or ct="+content.getId();
		List<Similar> list=similarDao.selectBeanList(where);
		for (int i = 0; i < list.size(); i++) {
			Similar similar=list.get(i);
			String co=similar.getContentCo().getTitle();
			String ct=similar.getContentCt().getTitle();
			Double sim=Cosine.getSimilarity(co, ct);
			similar.setSim(sim);
			similarDao.updateBean(similar);
		}
	}

}
