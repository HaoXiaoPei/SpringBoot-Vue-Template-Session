package com.example.service;

import org.springframework.security.core.userdetails.UserDetailsService;

public interface AuthorizeService extends UserDetailsService {
    String sendVaildateEmail(String email, String sessionId);
    String vaildateAndRegister(String username,String password, String email, String code, String sessionId);
}
