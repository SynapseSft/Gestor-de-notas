package com.synapsesft.gestordenotas.services;

import com.synapsesft.gestordenotas.dtos.UserDto;
import com.synapsesft.gestordenotas.entities.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
    User createAdmin(UserDto userDto);
}
