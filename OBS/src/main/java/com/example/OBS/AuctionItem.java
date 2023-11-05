package com.example.OBS;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;



@Table(name="auction")
@Entity
public class AuctionItem {
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public String getImageFile() {
        return imageData;
    }

    public void setImageFile(String imageFile) {
        this.imageData = imageFile;
    }

    public AuctionItem() {
    }




    @Column(name="name")
    String name;

    @Column(name="description")
    private String description;



//    @Column(name="condition")
//    private String condition;


    @Column(name="startingBid")
    private double startingBid;





    @NotNull(message = "Please select an image")
    @Column(name="imageData")
    private String imageData;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }



    public double getStartingBid() {
        return startingBid;
    }

    public void setStartingBid(double startingBid) {
        this.startingBid = startingBid;
    }

    public String getImageData() {
        return imageData;
    }

    public void setImageData(String imageData) {
        this.imageData = imageData;
    }

    public AuctionItem(String name, String description, double currentBid, String imageFile) {
        this.name = name;
        this.description = description;
        this.startingBid = currentBid;
        this.imageData = imageFile;
    }



    @Transient
    public String getPhotosImagePath() {
        if (imageData == null || id == null) return null;

        return "/user-photos/" + id + "/" + imageData;
    }

//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    public String getDescription() {
//        return description;
//    }
//
//    public void setDescription(String description) {
//        this.description = description;
//    }
//
//    public String getCondition() {
//        return condition;
//    }
//
//    public void setCondition(String condition) {
//        this.condition = condition;
//    }
//
//    public double getCurrentBid() {
//        return currentBid;
//    }
//
//    public void setCurrentBid(double currentBid) {
//        this.currentBid = currentBid;
//    }






}
