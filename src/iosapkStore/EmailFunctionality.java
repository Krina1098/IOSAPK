package iosapkStore;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailFunctionality {

	Properties prop;
	Session ses;
	MimeMessage msg;
	
	//smtp host
	String host="smtp.gmail.com";
	
	//smtp port number
	String port="587";
	
	//carrier email id of contact us that is default for all users
	String from="ios.apkstore@gmail.com";
	
	//carrier password
	String pass="Admin@1234";
	
	//recipient email address
	String toMail="apkios.store@gmail.com";
	
	
	//setting server properties
	public void setServerProperties()
	{
		//java.lang.System.Properties() Define current system properties
		prop=System.getProperties();
		
		prop.put("mail.smtp.host", host);
		
		//smtp server port to connect to smtp server
		prop.put("mail.smtp.port",port);
		

		//authenticating user (from,pass)
		prop.put("mail.smtp.auth", "true");
		
		//provide transport layer security(TLS)-protected connection before issuing login command
		prop.put("mail.smtp.starttls.enable", "true");
	}
	
	
	//message creation
	public void createMessage(String sub,String body) throws AddressException, MessagingException
	{
		
		//create new session object by calling getDefaultInstance(properties) and passing properties
		//as argument to get all the properties
		ses=Session.getDefaultInstance(prop);
		
		//Mime style message which allowed to include text message in email
		msg= new MimeMessage(ses);
		
		//adding recipient
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
		
		//setting subject
		msg.setSubject(sub);
		
		//setting body
		msg.setContent(body,"text/html");
	}
	
	public void sendEmail() throws AddressException, MessagingException
	{
		//for transporting email
	   Transport trans=ses.getTransport();
	   
	   //using smtp host,email and password
	   trans.connect(host, from, pass);
	   
	   //message transposition to recipient
	   trans.sendMessage(msg, msg.getAllRecipients());
	   
	   //closing transport
	   trans.close();
	   
	}
	
}
