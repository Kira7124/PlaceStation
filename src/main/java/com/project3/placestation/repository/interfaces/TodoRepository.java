package com.project3.placestation.repository.interfaces;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.admin.dto.TodoCriteria;
import com.project3.placestation.repository.entity.Todo;

@Mapper
public interface TodoRepository {
	
	//todo 리스트출력
	public List<Todo> adminTodoList(TodoCriteria cri) throws Exception;
	
	//todo 숫자세기(페이징처리)
	public int countTodo() throws Exception;
	
	//todo 삭제
	public Integer deleteTodo(Todo todo) throws Exception;
	
	
	
	
	
}
