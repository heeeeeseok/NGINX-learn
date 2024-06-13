package com.nginx_learn;

import java.util.Arrays;
import lombok.RequiredArgsConstructor;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.web.bind.annotation.RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class RestController {

  private final Environment env;

  @GetMapping("/profile")
  public String getProfile() {
    return Arrays.stream(env.getActiveProfiles())
        .findFirst()
        .orElse("");
  }
}
