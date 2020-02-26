package com.bawei.service;

import java.util.List;

import com.bawei.entity.Movie;
import com.bawei.vo.MovieVO;

public interface MovieService {

	List<Movie> selects(MovieVO movieVO);
	void delete(String ids);
}
