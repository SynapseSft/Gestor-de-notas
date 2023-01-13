package com.synapsesft.gestordenotas.security;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;

public interface SecurityConfigurationInterface {
    abstract void configure(AuthenticationManagerBuilder builder) throws Exception;

    abstract void configure(HttpSecurity httpSecurity) throws Exception;
}
