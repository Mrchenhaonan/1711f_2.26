package com.bawei.controller;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bawei.entity.Movie;
import com.bawei.service.MovieService;
import com.bawei.vo.MovieVO;

@Controller
public class MovieController {

	@Resource
	private MovieService service;
	@RequestMapping("selects")
	public String list(MovieVO movieVo,Model m) {
		List<Movie> list = service.selects(movieVo);
		m.addAttribute("list", list);
		m.addAttribute("movieVO", movieVo);
		return "movies";
	}
	@ResponseBody
	@RequestMapping("delete")
	public int delete(String ids) {
		 service.delete(ids);
		return 1;
	}
}
