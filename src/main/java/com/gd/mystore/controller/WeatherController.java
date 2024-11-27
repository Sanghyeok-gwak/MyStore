package com.gd.mystore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.mystore.service.WeatherService;

@Controller
@RequestMapping("/weather")
public class WeatherController {

    @Autowired
    private WeatherService weatherService;

    @GetMapping("/coord")
    public String getWeather(
            @RequestParam("lat") double latitude,
            @RequestParam("lon") double longitude,
            Model model) {
    	
        String weatherData = weatherService.getWeatherData(latitude, longitude);
        
        model.addAttribute("weatherData", weatherData);
        
        return "main";
    }
}
