package com.project.dd.activity.movie.mapper;

import java.util.List;

import com.project.dd.activity.movie.domain.MovieDTO;

public interface MovieMapper {

	List<MovieDTO> getMovieList(String date);

	MovieDTO getMovie(String seq);

}
