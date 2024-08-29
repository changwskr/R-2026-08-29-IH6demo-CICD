package com.example.h3demo.deposite.business.as.helper;

public class SourceDTO {
    private String name;
    private int age;

    // Constructor

    public SourceDTO(String name, int age) {
        this.name = name;
        this.age = age;
	}

	// Getter and Setter methods
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}

