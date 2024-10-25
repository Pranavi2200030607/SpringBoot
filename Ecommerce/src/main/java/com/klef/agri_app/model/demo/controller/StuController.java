package com.klef.agri_app.model.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.klef.agri_app.model.student;

@RestController
public class StuController {
	@GetMapping("/student")
	public student getstudent() {
		student stu=new student(8, "pranavi", "Pratap", 100000000);
		return stu;
		
	}

}
