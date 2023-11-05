package com.example.OBS;


import jakarta.annotation.Nonnull;
import jakarta.persistence.*;
import org.springframework.boot.context.properties.bind.DefaultValue;

@Entity
@Table(name="information")
public class Information {


    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    Long id;


    public Information(String username, String email, String password) {
        this.username = username;
        this.email = email;
        this.password = password;

    }

    public Information() {

    }


    @Column(name = "un",unique = true)
    String username;


    @Column(name = "email")
    String email;

    @Column(name = "pass")

    String password;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Column(name="role", columnDefinition = "varchar(20) default 'user'"  )
    String role="user";

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
