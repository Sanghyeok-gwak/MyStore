package com.gd.mystore.controller;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sales")
public class SalesController {
	
	@GetMapping("list.po")
    public String list(Model model) {
        Random random = new Random();
        int[][] sales = new int[2][12];
        int[][] profitRates = new int[2][12];

        // 매출액 및 매익률 랜덤값 생성
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 12; j++) {
                sales[i][j] = 10000000 + random.nextInt(40000001); // 1000만원 ~ 5000만원
                profitRates[i][j] = 1 + random.nextInt(20); // 1% ~ 20%
            }
        }

        model.addAttribute("sales", sales);
        model.addAttribute("profitRates", profitRates);

        return "branchoffice/sales/main";
    }

}



