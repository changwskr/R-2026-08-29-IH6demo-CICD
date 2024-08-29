package com.example.h3demo.deposite.business.dto;

import java.util.ArrayList;

public class StudentDTO {
    private String name;
    private int age;

    // Constructor
    public StudentDTO(String name, int age) {
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

    @Override
    public String toString() {
        return "StudentDTO{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
    
    public static void main(String[] args) {
        // ArrayList to store StudentDTO objects
        ArrayList<StudentDTO> students = new ArrayList<>();

        // Adding StudentDTO objects to the ArrayList
        students.add(new StudentDTO("John Doe", 20));
        students.add(new StudentDTO("Jane Smith", 22));
        students.add(new StudentDTO("Emily Johnson", 19));

        // Displaying all students
        for (StudentDTO student : students) {
            System.out.println(student);
        }

        // Finding a student by name
        String searchName = "Jane Smith";
        for (StudentDTO student : students) {
            if (student.getName().equals(searchName)) {
                System.out.println("Found student: " + student);
            }
        }

        // Updating a student's age
        String updateName = "John Doe";
        for (StudentDTO student : students) {
            if (student.getName().equals(updateName)) {
                student.setAge(21);
                System.out.println("Updated student: " + student);
            }
        }

        // Removing a student by name
        String removeName = "Emily Johnson";
        students.removeIf(student -> student.getName().equals(removeName));

        // Displaying all students after removal
        System.out.println("Students after removal:");
        for (StudentDTO student : students) {
            System.out.println(student);
        }
    }
}