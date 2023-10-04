package com.example.entity;

import lombok.Data;
import org.springframework.context.annotation.Bean;

@Data
public class RestBean<T> {
    private int status;
    private boolean success;
    private T message;

    public RestBean(int status, boolean success, T message) {
        this.status = status;
        this.success = success;
        this.message = message;
    }

    public static <T> RestBean success(){
        return new RestBean(200,true,null);
    }

    public static <T> RestBean success(T data){
        return new RestBean(200,true,data);
    }
    public static <T> RestBean failure(int status){
        return new RestBean(status,false,null);
    }
    public static <T> RestBean failure(int status, T data){
        return new RestBean(status,false,data);
    }
}
