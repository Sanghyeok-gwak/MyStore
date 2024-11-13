package com.gd.mystore.service;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class WeatherService {
    private final String apiKey = "94fccb1a2f1d7d67cb4adb4066e3e825";
    private final String url = "http://api.openweathermap.org/data/2.5/weather";

    public String getWeatherData(double latitude, double longitude) {
        RestTemplate restTemplate = new RestTemplate();

        // URL 구성
        String uri = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("lat", latitude)
                .queryParam("lon", longitude)
                .queryParam("appid", apiKey)
                .queryParam("units", "metric")  // 섭씨 온도 단위
                .toUriString();

        // API 호출 및 JSON 데이터 수신
        return restTemplate.getForObject(uri, String.class);
    }
}
