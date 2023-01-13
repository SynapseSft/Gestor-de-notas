package com.synapsesft.gestordenotas.services.impl;

import com.synapsesft.gestordenotas.dtos.UserDto;
import com.synapsesft.gestordenotas.entities.User;
import com.synapsesft.gestordenotas.repositories.UserRepository;
import com.synapsesft.gestordenotas.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class UserServiceImplementation implements UserService {

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    private UserRepository userRepository;

    private UserServiceImplementation (UserRepository userRepository){
        this.userRepository = userRepository;
    }
    @Override
    public User createAdmin(UserDto userDto) {
        User user = new User(userDto.getEmail(), passwordEncoder.encode(userDto.getPassword()));
        return userRepository.save(user);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(username);
        if(user == null){
            throw new UsernameNotFoundException("Usuario o password inválidos");
        }

        return (UserDetails) new User(user.getEmail(), user.getPassword());
    }
}
