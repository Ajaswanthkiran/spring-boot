package com.example.OBS;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;



@Service
public class AuctionServiceClass implements  AuctionService{



    @Autowired
    public AuctionServiceClass(AuctionRepository auctionRepository) {
        this.auctionRepository = auctionRepository;
    }

    AuctionRepository auctionRepository;
    @Override
    public AuctionItem insertInfo(AuctionItem auctionItem) {
        auctionRepository.save(auctionItem);
        return auctionItem;
    }

    @Override
    public List<AuctionItem> findAll() {
       return auctionRepository.findAll();
    }
}
