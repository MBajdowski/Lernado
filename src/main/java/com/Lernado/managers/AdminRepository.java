package com.Lernado.managers;

import com.Lernado.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;


public  interface AdminRepository extends JpaRepository<Admin, Integer> {}
