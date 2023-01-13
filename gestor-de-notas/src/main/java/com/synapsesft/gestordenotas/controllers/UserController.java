package com.synapsesft.gestordenotas.controllers;

import com.synapsesft.gestordenotas.dtos.UserDto;
import com.synapsesft.gestordenotas.entities.User;
import com.synapsesft.gestordenotas.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class UserController {

    private UserService userService;

    public UserController(UserService userService){
        this.userService = userService;
    }

    @PostMapping("/admin")
    public User createAdmin(UserDto userDto){
        return userService.createAdmin(userDto);
    }
}
