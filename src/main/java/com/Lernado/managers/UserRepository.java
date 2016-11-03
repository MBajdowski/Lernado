package com.Lernado.managers;

import com.Lernado.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    public User getByIduser(int id);
}
