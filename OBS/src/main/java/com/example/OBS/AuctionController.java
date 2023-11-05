package com.example.OBS;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
public class AuctionController {


    @Autowired
    public AuctionController(AuctionService auctionItemRepository) {
        this.auctionItemRepository = auctionItemRepository;
    }


    private AuctionService auctionItemRepository;

    @GetMapping("/add-item")
    public String showAddItemForm() {
        return "add-item"; // JSP page for adding a product
    }

    @PostMapping("/add-item")
    public String addAuctionItem(AuctionItem user,@RequestParam("image") MultipartFile multipartFile) throws IOException {


        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());


        user.setImageFile(fileName);

        AuctionItem savedUser = auctionItemRepository.insertInfo(user);

        String uploadDir = "image/user-photos/" + savedUser.getId();

        FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);


        return "redirect:/items";
    }

    @GetMapping("/items")
    public String displayAllItems(Model model) {
        Iterable<AuctionItem> items = auctionItemRepository.findAll();

        for(AuctionItem i:items)
        {
            System.out.println(i);
        }

        model.addAttribute("items", items);
        return "auctions"; // JSP page for displaying all available items
    }
}
