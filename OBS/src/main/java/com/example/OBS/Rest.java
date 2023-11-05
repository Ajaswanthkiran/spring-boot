package com.example.OBS;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.AddressException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
public class Rest {

    public String islogin="no";

    String role="user";
    @Autowired
    public Rest(informationinterfaceImp ifi) {
        this.ifi = ifi;
    }

    informationinterfaceImp ifi;


    @GetMapping("/")
    public String home()
    {

        if(role=="user") {
            return "home";
        }

        return "homeb";
    }

    @GetMapping("/front")
    public String front()
    {

        return "front";
    }





    @GetMapping("/nav")
    public String nav()
    {
        if(role=="user") {
            return "navbar";
        }


        return "navbar2";
    }

    @GetMapping("/login")
    public String login()
    {

        return "login";
    }

    @GetMapping("/signup")
    public String signup()
    {

        return "signup";
    }

    @GetMapping("/aboutus")
    public String aboutus()
    {

        return "aboutus";
    }

    @GetMapping("/contactus")
    public String contactus()
    {

        return "contactus";
    }

    @GetMapping("/live-auction")
    public String auction()
    {

        return "auctions";
    }

    Information nainfo;
    String newotp="";
    @PostMapping("/otp")
    public String otp(@ModelAttribute Information info,Model model) throws MessagingException {

        nainfo=info;

        model.addAttribute("email",info.getEmail());
        model.addAttribute("usename",info.getUsername());
        model.addAttribute("password",info.getPassword());

        newotp=generateRandomOTP();
        model.addAttribute("otp",newotp);

        obsApplication.sendOTPEmail(info.getEmail(),newotp);
        return "fillotp";
    }



    @GetMapping("/loading")
    public String loading() {
        // Simulate a delay (replace with actual loading logic)
        try {
            Thread.sleep(3000); // 3 seconds
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

        // Redirect to your main application page
        return "reloading";
    }


    @PostMapping("/save")
    public String registrationSave(@RequestParam String otp)
    {

        System.out.println(otp+" "+newotp);
        if(otp.equals(newotp))
        {
            ifi.insertInfo(nainfo);
            return "login";
        }
        else {
            return "redirect:/signup";
        }




    }

    @PostMapping("/check")
    public String check(@ModelAttribute("info") Information info, Model model, HttpSession session) {
        // Authenticate the user and set user information in the session


        System.out.println(info.getUsername()+" "+info.getPassword());
        if (ifi.existsByUsernameAndPassword(info.getUsername(), info.getPassword())) {

            session.setAttribute("loggedInUser", info);

            if(info.getUsername()=="ajk" || info.username=="newajk")
                role="admin";

            islogin="yes";
            model.addAttribute("isLoggedIn", islogin);
            model.addAttribute(info);
            return "redirect:/";

        } else {
            session.setAttribute("isLoggedIn", islogin);
            session.setAttribute("message", "Invalid username or password");
            return "redirect:/login";
        }
    }

    @RequestMapping("/send-otp")
    public ResponseEntity<String> sendOTP(@RequestParam String email) {
        // Generate a random OTP (e.g., using a utility method)
        String otp = generateRandomOTP();

        System.out.println("yes i am here");

        // Send the OTP via email

            try {
                obsApplication.sendOTPEmail(email, otp);
                return ResponseEntity.ok("OTP sent successfully.");
            } catch (Exception e) {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to send OTP.");
            }
    }

    private String generateRandomOTP() {
        // Generate a random 6-digit OTP
        return String.valueOf((int) ((Math.random() * 9000) + 1000));
    }


    @GetMapping("/logout")
        public String logout(HttpServletRequest request) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate(); // Invalidate the session
            }
            // Redirect to a page indicating successful logout
            return "redirect:/";
        }



    @GetMapping("/showaccessdenied")
    public String getdeniedpage(){
        return "access-denied";
    }



    @Autowired
    ObsApplication obsApplication;

    @RequestMapping(value = "/sendmailcontactus")
    public String send(@ModelAttribute("obj1") Information i) throws AddressException, MessagingException, IOException {


        //sendEmail();
        obsApplication.sendEmail(i.getUsername(),i.getEmail());
        return "redirect:/";
    }



    private String getEmailContent(String name) {
        // Customize the email message
        return "<!DOCTYPE html><html><head><style>"
                + "body { font-family: Arial, sans-serif; }"
                + ".message { background-color: #f5f5f5; padding: 10px; }"
                + "</style></head><body>"
                + "<h2>Thank You for Contacting Us, " + name + "!</h2>"
                + "<div class='message'>We will contact you within 24 hours.</div>"
                + "</body></html>";
    }



}
