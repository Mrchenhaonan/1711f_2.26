package com.bawei.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bawei.entity.Movie;
import com.bawei.vo.MovieVO;

public interface MovieMapper {

	
	List<Movie> selects(MovieVO movieVO);
	void delete(@Param("ids")String ids);
}
