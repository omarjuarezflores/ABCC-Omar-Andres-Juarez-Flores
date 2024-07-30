package com.coppel.abcc_articulos.model;


import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Data;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Column;


@Data
@Entity
@Table(name = "departamentos")
public class DepartamentoModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idDepartamento; // Identificador del departamento

    @Column(name = "nombre_departamento", nullable = false, length = 30)
    private String nombreDepartamento; // Nombre del departamento

    @Column(nullable = false)
    private Boolean activo; // Indicador de activo del departamento
}