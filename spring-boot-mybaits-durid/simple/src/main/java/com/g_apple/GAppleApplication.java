package com.g_apple;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan
@EnableAutoConfiguration
@MapperScan(basePackages={"com.g_apple.**.dao"})
public class GAppleApplication {

	public static void main(String[] args) {
		SpringApplication.run(GAppleApplication.class, args);
	}
}
