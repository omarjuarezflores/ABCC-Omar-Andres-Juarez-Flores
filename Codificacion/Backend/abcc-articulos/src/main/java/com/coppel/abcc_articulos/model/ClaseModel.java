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
@Table(name = "clases")
public class ClaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idClase; // Identificador de la clase

    @Column(name = "nombre_clase", nullable = false, length = 30)
    private String nombreClase; // Nombre del departamento

    @Column(nullable = false)
    private Boolean activo; // Indicador de activo de la clase

    @Column(name = "id_departamento", nullable = false)
    private Integer idDepartamento;    // Departamento al que pertenece la clase
}