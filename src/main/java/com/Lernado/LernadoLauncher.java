package com.Lernado;

import com.Lernado.jms.JmsService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.jms.core.JmsTemplate;

@SpringBootApplication
public class LernadoLauncher {

	public static void main(String[] args) {

		ConfigurableApplicationContext context = SpringApplication.run(LernadoLauncher.class, args);
		JmsService.jmsTemplate = context.getBean(JmsTemplate.class);
	}
}
