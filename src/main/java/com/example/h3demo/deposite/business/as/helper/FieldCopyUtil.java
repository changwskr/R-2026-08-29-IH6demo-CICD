package com.example.h3demo.deposite.business.as.helper;

import java.lang.reflect.Field;

public class FieldCopyUtil {

    public static void copyFields(Object source, Object target) throws IllegalAccessException {
        Class<?> sourceClass = source.getClass();
        Class<?> targetClass = target.getClass();

        for (Field sourceField : sourceClass.getDeclaredFields()) {
            try {
                Field targetField = targetClass.getDeclaredField(sourceField.getName());
                sourceField.setAccessible(true);
                targetField.setAccessible(true);

                Object value = sourceField.get(source);
                targetField.set(target, value);


            } catch (NoSuchFieldException e) {
                // Target field does not exist, ignore and continue
            }
        }
    }
    
    public static void main(String[] args) {
        SourceDTO source = new SourceDTO("John Doe", 30);
        TargetDTO target = new TargetDTO();

        try {
            FieldCopyUtil.copyFields(source, target);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }

        System.out.println("Source: " + source.getName() + ", " + source.getAge());
        System.out.println("Target: " + target);
    }
}

