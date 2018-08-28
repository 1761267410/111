package net.dfrz.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

public class MailSenderDemo {
	@Autowired
	private JavaMailSender mailSender;

	public void send(SimpleMailMessage mail) {
		mailSender.send(mail);
	}
}
