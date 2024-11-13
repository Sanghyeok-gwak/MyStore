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

        // URL ����
        String uri = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("lat", latitude)
                .queryParam("lon", longitude)
                .queryParam("appid", apiKey)
                .queryParam("units", "metric")  // ���� �µ� ����
                .toUriString();

        // API ȣ�� �� JSON ������ ����
        return restTemplate.getForObject(uri, String.class);
    }
}
