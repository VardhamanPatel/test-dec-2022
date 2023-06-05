package com.example.First_Spring_Boot_App;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

public class MyController {
	
	@GetMapping("/vardhaman")
	public String welcome() {
		return "Hello Vardhman- Welcomeeee to myfirstapp";
	}
}
