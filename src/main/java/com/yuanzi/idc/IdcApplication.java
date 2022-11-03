package com.yuanzi.idc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import xyz.erupt.core.annotation.EruptScan;

@SpringBootApplication
@EntityScan
@EruptScan
public class IdcApplication {

    public static void main(String[] args) {
        SpringApplication.run(IdcApplication.class, args);
    }

}
