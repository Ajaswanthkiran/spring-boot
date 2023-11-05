package com.example.OBS;

import java.util.List;

public interface informationinterfaceImp {

    public void insertInfo(Information info);

    public void deleteInfo(String un);

    public void updateInfo(Information info);

    public List<Information> findAll();

    public boolean existsByUsernameAndPassword(String username, String password);

}
