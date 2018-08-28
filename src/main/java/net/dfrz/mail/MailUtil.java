package net.dfrz.mail;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.SimpleMailMessage;

public class MailUtil {

	public static void autosend(final String address, final String text) {
		if (address != null && !"".equals(address)) {
			ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:config/spring/spring-mail.xml",
					"classpath:config/mail/applicationContext.xml");
			MailSenderDemo sender = (MailSenderDemo) ac.getBean("MailSenderDemo");
			SimpleMailMessage mail = new SimpleMailMessage();
			mail.setTo(address);
			mail.setFrom("13178389008@163.com");
			mail.setSubject("请假信息");
			mail.setText(text);
			sender.send(mail);
		}
	}

	public static void sendMailByAsynchronous(final String address, final String text) {
		new Thread(new Runnable() {

			@Override
			public void run() {
				// TODO Auto-generated method stub
				MailUtil.autosend(address, text);
			}
		}).start();
	}
}
