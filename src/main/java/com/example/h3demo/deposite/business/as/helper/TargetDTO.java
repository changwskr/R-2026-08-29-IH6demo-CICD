package com.example.h3demo.deposite.business.as.helper;

public class TargetDTO {
    private String name;
    private int age;

    // Constructor
    public TargetDTO() {
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

    @Override
    public String toString() {
        return "TargetDTO{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
}
