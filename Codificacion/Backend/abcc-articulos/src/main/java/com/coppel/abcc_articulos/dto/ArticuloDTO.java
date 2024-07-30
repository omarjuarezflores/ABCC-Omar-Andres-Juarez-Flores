package com.coppel.abcc_articulos.dto;

import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ArticuloDTO {

    private Integer sku;
    private String nombre;
    private String marca;
    private String modelo;
    private Integer idDepartamento;
    private String nombreDepartamento;
    private Integer idClase;
    private String nombreClase;
    private Integer idFamilia;
    private String nombreFamilia;
    private LocalDate fechaAlta;
    private Integer stock;
    private Integer cantidad;
    private Boolean descontinuado;
    private LocalDate fechaBaja;
    private Boolean activo;
}