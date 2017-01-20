package com.Lernado.jms;


import com.Lernado.beans.JmsMessage;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Component;

import javax.jms.Message;
import javax.jms.MessageProducer;
import javax.jms.QueueBrowser;
import javax.jms.TextMessage;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

@Component
public class JmsService {


    public static JmsTemplate jmsTemplate;

    @JmsListener(destination = "TestingDestination")
    private void printMessage(Message message) {
        System.out.println(message.toString());
    }

    public void sendTo(String topic, JmsMessage jmsMessage) {
        jmsTemplate.execute(
                session -> {
                    MessageProducer messageProducer = session.createProducer(session.createQueue(topic));
                    TextMessage textMessage = session.createTextMessage(jmsMessage.getMessage());
                    textMessage.setIntProperty("iduser", jmsMessage.getIduser());
                    textMessage.setStringProperty("author", jmsMessage.getAuthor());
                    messageProducer.send(textMessage);
                    return null;
                });
    }

    public List<JmsMessage> receiveAllFrom(String topic) {

        return jmsTemplate.execute(session -> {
            QueueBrowser queueBrowser = session.createBrowser(session.createQueue(topic));
            Enumeration<Message> enum1 = queueBrowser.getEnumeration();
            List<JmsMessage> chat = new ArrayList<>();
            while (enum1.hasMoreElements()) {
                Message message = enum1.nextElement();
                if (message != null) {
                    if (message instanceof TextMessage) {
                        TextMessage textMessage = (TextMessage) message;
                        chat.add(new JmsMessage(textMessage.getStringProperty("author"),
                                textMessage.getIntProperty("iduser"),
                                textMessage.getText()));
                    }
                }
            }
            return chat;
        }, true);
    }
}
