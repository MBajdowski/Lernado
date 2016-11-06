package com.Lernado.managers;

import com.Lernado.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    public User getByIduser(int id);

    public Optional<User> getByEmail(String email);
}
