package ru.iopump.qa.allure.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ResultResponse {
    String uuid;
    long size;
}
