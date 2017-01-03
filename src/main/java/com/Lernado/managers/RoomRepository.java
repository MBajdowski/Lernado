package com.Lernado.managers;


import com.Lernado.model.Room;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoomRepository extends JpaRepository<Room, Integer> {
    List<Room> findByTitleContaining(String title);
}
