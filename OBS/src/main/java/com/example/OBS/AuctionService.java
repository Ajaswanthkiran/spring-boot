package com.example.OBS;

import java.util.List;

public interface AuctionService {

    public AuctionItem insertInfo(AuctionItem auctionItem);
    public List<AuctionItem> findAll();
}
