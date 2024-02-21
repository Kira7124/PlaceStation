package com.project3.placestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project3.placestation.admin.dto.AdminTodoDTO;
import com.project3.placestation.admin.dto.Criteria;
import com.project3.placestation.admin.dto.TodoCriteria;
import com.project3.placestation.repository.entity.Todo;
import com.project3.placestation.repository.interfaces.TodoRepository;

@Service
public class TodoService {
	
	@Autowired
	private TodoRepository todoRepository;
	
	//todo 리스트(페이징)출력
	public List<Todo> adminTodoList(TodoCriteria cri) throws Exception{
		List<Todo> result = todoRepository.adminTodoList(cri);
		return result;
	}
	
	//todo 숫자세기(페이징)
	public int countTodo() throws Exception{
		return todoRepository.countTodo();
		
	}
	
	
	//todo 삭제
	@Transactional
	public void deleteTodo(AdminTodoDTO dto) throws Exception{
		
		Todo todo = Todo.builder()
				.todotitle(dto.getTodotitle())
				.todocontent(dto.getTodocontent())
				.todono(dto.getTodono())
				.todoregdate(dto.getTodoregdate())
				.build();
		
		Integer result = todoRepository.deleteTodo(todo);
		
	}
	
	
	
	
	
}
