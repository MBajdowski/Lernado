package com.Lernado.managers;

import com.Lernado.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;


public  interface AdminRepository extends JpaRepository<Admin, Integer> {
    public Admin getByEmail(String email);
}
