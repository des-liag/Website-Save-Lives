package save_lives_2021_2022;

import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;  
/** 
 * This class is used to send simple email 
 * via Gmail server using TLS connection. 
 *   @author w3spoint
 */ 
public class SendEmail { 
final String senderEmailId = "savelivesaueb@gmail.com";
final String senderPassword = "save123lives";
final String emailSMTPserver = "smtp.gmail.com";
final String emailSMTPPort = "587";
 
public SendEmail(String receiverEmail, String subject, String messageText) {		
    Properties props = new Properties(); 
    props.put("mail.smtp.auth", "true"); 
    props.put("mail.smtp.starttls.enable", "true"); 
    props.put("mail.smtp.host", emailSMTPserver); 
    props.put("mail.smtp.port", emailSMTPPort);  
    try { 			
        Authenticator auth = new SMTPAuthenticator();
        Session session = Session.getInstance(props, auth);
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(senderEmailId));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiverEmail));
        message.setSubject(subject);
        message.setText(messageText);
    
        Transport.send(message); 
        System.out.println("Το email στάλθηκε επιτυχώς."); 
    } catch (Exception e) {
        e.printStackTrace();
        System.err.println("Σφάλμα. Δεν ήταν δυνατή η αποστολή του email.");
  }
}

public SendEmail(String receiverEmail, String subject, String htmlContent, String contentType) {		
    Properties props = new Properties(); 
    props.put("mail.smtp.auth", "true"); 
    props.put("mail.smtp.starttls.enable", "true"); 
    props.put("mail.smtp.host", emailSMTPserver); 
    props.put("mail.smtp.port", emailSMTPPort);  
    try { 			
        Authenticator auth = new SMTPAuthenticator();
        Session session = Session.getInstance(props, auth);
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(senderEmailId));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiverEmail));
        message.setSubject(subject);
        message.setContent(htmlContent, contentType);
    
        Transport.send(message); 
        System.out.println("Το email στάλθηκε επιτυχώς."); 
    } catch (Exception e) {
        e.printStackTrace();
        System.err.println("Σφάλμα. Δεν ήταν δυνατή η αποστολή του email.");
  }
}

 
private class SMTPAuthenticator extends javax.mail.Authenticator {
    public PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(senderEmailId, senderPassword);
    }
}
}





















































// package save_lives_2021_2022;

// import java.util.Properties;

// import javax.mail.Message;
// import javax.mail.PasswordAuthentication;
// import javax.mail.Session;
// import javax.mail.Transport;
// import javax.mail.internet.InternetAddress;
// import javax.mail.internet.MimeMessage;


// public class SendEmail {
	
// 	private String userEmail;
// 	private String hash;
	
// 	public SendEmail(String userEmail, String hash) {
// 		super();
// 		this.userEmail = userEmail;
// 		this.hash = hash;
// 	}
	
// 	public void sendMail() {
// 		String email = "savelivesaueb@gmail.com"; // sender email
// 		String password = "save123lives"; // sender password
		
// 		Properties properties = new Properties();
		
// 		properties.put("mail.smtp.auth", "true");
//         properties.put("mail.smtp.starttls.enable", "true");
//         properties.put("mail.smtp.host", "smtp.gmail.com");
//         properties.put("mail.smtp.port", "587");
        
        
//         Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() 
//         {    
//             protected PasswordAuthentication getPasswordAuthentication(){
            
//                 return new PasswordAuthentication(email, password);
//             }
//         });
        
//         try {
        	
//         	MimeMessage message = new MimeMessage(session);
//         	message.setFrom(new InternetAddress(email));
//         	message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
//         	message.setText("Verification Link....");
//             message.setText("Click Here ::" + "http://localhost:8080/Send-Email-In-Java-With-Verification/AccountActivate?key1=" + userEmail + "&key2="+ hash);
//             Transport.send(message);
        	
//         }catch(Exception e){
        	
//         	System.out.println("SendEmail File Error" + e);
//         }
// 	}
// }