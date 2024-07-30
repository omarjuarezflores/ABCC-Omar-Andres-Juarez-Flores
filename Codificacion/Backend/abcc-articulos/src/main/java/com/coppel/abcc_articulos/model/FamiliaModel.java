package com.coppel.abcc_articulos.model;


import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "familias")
public class FamiliaModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idFamilia; // Identificador de la familia

    @Column(name = "nombre_familia", nullable = false, length = 50)
    private String nombreFamilia; // Nombre de la familia

    @Column(nullable = false)
    private Boolean activo; // Indicador de activo de la clase

    @Column(name = "id_clase", nullable = false)
    private Integer idClase;    // Departamento al que pertenece la familia
}