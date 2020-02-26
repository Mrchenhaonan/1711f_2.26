package com.bawei.service.impl;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.bawei.dao.MovieMapper;
import com.bawei.entity.Movie;
import com.bawei.service.MovieService;
import com.bawei.vo.MovieVO;

@Service
public class MovieServiceImpl implements MovieService{

	@Resource
	private MovieMapper dao;
	@Override
	public List<Movie> selects(MovieVO movieVO) {
		// TODO Auto-generated method stub
		return dao.selects(movieVO);
	}
	@Override
	public void delete(String ids) {
		// TODO Auto-generated method stub
		 dao.delete(ids);
	
	}

}
