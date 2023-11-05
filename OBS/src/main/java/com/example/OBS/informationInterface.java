package com.example.OBS;

import org.springframework.data.jpa.repository.JpaRepository;

public interface informationInterface extends JpaRepository<Information,String> {

    Information findByUsername(String username);
}
