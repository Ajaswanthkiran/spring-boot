package com.example.OBS;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

@SpringBootApplication
public class ObsApplication {

	@Autowired
	public JavaMailSender javaMailSender;

	public static void main(String[] args) {

		SpringApplication.run(ObsApplication.class, args);
	}


	void sendEmail(String name,String email) throws MessagingException {

		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true);
		helper.setSubject("Recivide your Messeage ");
		helper.setTo(email);
		helper.setText("<!DOCTYPE html><html><head><style>"
				+ "body { font-family: Arial, sans-serif; }"
				+ ".message { background-color: #f5f5f5; padding: 10px; }"
				+ "</style></head><body>"
				+ "<h2>Thank You for Contacting Us, " + name + "!</h2>"
				+ "<div class='message'>We will contact you within 24 hours.</div>"
				+ "</body></html>", true);


		javaMailSender.send(message);

	}

	public void sendOTPEmail(String toEmail, String otp) throws MessagingException {
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true);

		// Set the recipient's email address
		helper.setTo(toEmail);

		// Set the email subject
		helper.setSubject("Your OTP Code");

		// Set the email content (you can format this as needed)
		String emailContent = "Your OTP code is: " + otp;
		helper.setText(emailContent, true); // Use true to enable HTML content

		// Send the email
		javaMailSender.send(message);
	}

}
