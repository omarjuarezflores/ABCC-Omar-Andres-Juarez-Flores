package com.coppel.abcc_articulos.ResponseMessage;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ResponseMessage {
    private boolean estatus;
    private String message;
    private Object data;
}
