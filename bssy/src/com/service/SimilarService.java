package com.service;

import java.util.List;

import com.model.Content;

public interface SimilarService {
	public List<Content> getSimList(Content content,int top);
	public void calculateSim(Content content);
}
