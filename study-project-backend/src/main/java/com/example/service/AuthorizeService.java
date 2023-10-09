package com.example.service;

import org.springframework.security.core.userdetails.UserDetailsService;

public interface AuthorizeService extends UserDetailsService {
    String sendVaildateEmail(String email, String sessionId, boolean hasAccount);
    String vaildateAndRegister(String username,String password, String email, String code, String sessionId);
    String vaildateOnly(String email, String code, String sessionId);
    boolean resetPassword(String password, String email);
}
