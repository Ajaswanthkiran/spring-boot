package com.example.OBS;

import jakarta.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;



@Service
public class InformationClass implements informationinterfaceImp{




    @Autowired
    public InformationClass(informationInterface ir) {
        this.ir = ir;
    }

    informationInterface ir;


    @Override
    public void insertInfo(Information info) {
        ir.save(info);
    }

    @Override
    public void deleteInfo(String un) {

        ir.deleteById(un);
    }

    @Override
    public void updateInfo(Information info) {

    }

    @Override
    public List<Information> findAll() {
        return ir.findAll();
    }


    @Autowired
    private EntityManager entityManager;

    public boolean existsByUsernameAndPassword(String username, String password) {

        if(username!=null && username.contains("@"))
        {
            Long count = (Long) entityManager.createQuery(
                            "SELECT COUNT(i) FROM Information i WHERE i.email = :username AND i.password = :password")
                    .setParameter("email", username)
                    .setParameter("password", password)
                    .getSingleResult();

            return count > 0;
        }


        Long count = (Long) entityManager.createQuery(
                        "SELECT COUNT(i) FROM Information i WHERE i.username = :username AND i.password = :password")
                .setParameter("username", username)
                .setParameter("password", password)
                .getSingleResult();

        System.out.println(count);

        return count > 0;


    }


}
