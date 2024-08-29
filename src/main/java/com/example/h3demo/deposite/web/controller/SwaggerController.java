package com.example.h3demo.deposite.web.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.h3demo.deposite.web.transfer.ImageDto;

@RestController
public class SwaggerController {
	
	@PostMapping("/postTest")
    public ResponseEntity<?> postTest(@RequestBody ImageDto imageDto) {
        System.out.println(imageDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/getTest")
    public String getTest() {
        return "getTest";
    }
    
    @PutMapping("/putTest")
    public ResponseEntity<?> putTest(@RequestBody ImageDto imageDto) {
        System.out.println(imageDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    
    @DeleteMapping("/deleteTest")
    public ResponseEntity<?> deleteTest(@RequestBody ImageDto imageDto) {
        System.out.println(imageDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
