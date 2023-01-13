package com.synapsesft.gestordenotas.repositories;

import com.synapsesft.gestordenotas.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {

    public User findByEmail(String email);
}
