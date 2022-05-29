package common;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class Email {

	public void sendEmail(String email, String emailSubject, String emailContent) throws UnsupportedEncodingException {
		final String sender = "funixemailtest@gmail.com";
        final String senderPassword = "Funix111";

        Properties prop = new Properties();
        
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.ssl.trust", "*");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
        
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(sender, senderPassword);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender, "contact@northernlottery.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject(emailSubject);
            message.setText(emailContent);

            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
	}
	
	//Truong hop reset pass tu admin hoac nguoi dung
	public void sendResetPass(String email, String newPassword, String fullName) throws UnsupportedEncodingException {
		String emailSubject = "Mật khẩu đăng nhập mới";
		
		String emailContent = "Xin chào, "+ fullName + "\n"
                + "Đây là mật khẩu đăng nhập mới của bạn.\n"
        		+ "Mật khẩu: "+newPassword+ "\n" 
        		+ "Hãy thay đổi mật khẩu sau khi đăng nhập.";
		
		new Email().sendEmail(email, emailSubject, emailContent);
	}
	
	//Truong gui email khi dang ki tai khoan
	public void sendFirstPass(String email, String newPassword, String fullName) throws UnsupportedEncodingException {
		String emailSubject = "Thông tin đăng nhập";
		
		String emailContent = "Xin chào, "+fullName+ "\n"
							+"Vui lòng truy cập đường link sau để kích hoạt tài khoản: \n"
							+ "http://localhost:8080/FX13308_Project/register?action=activate&email="+email+"&code="+newPassword+"\n"
							+"hoặc sử dụng mật khẩu "+newPassword;
		
		new Email().sendEmail(email, emailSubject, emailContent);
	}
}