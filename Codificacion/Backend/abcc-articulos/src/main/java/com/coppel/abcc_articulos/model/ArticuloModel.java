package com.coppel.abcc_articulos.model;

import lombok.Data;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Column;
import java.time.LocalDate;

@Data
@Entity
@Table(name = "articulos")
public class ArticuloModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sku;               // Identificador del artículo

    @Column(nullable = false, length = 15)
    private String nombre;             // Nombre del artículo

    @Column(nullable = false, length = 15)
    private String marca;              // Marca del artículo

    @Column(nullable = false, length = 20)
    private String modelo;             // Modelo del artículo

    @Column(name = "id_departamento", nullable = false)
    private Integer idDepartamento;    // Departamento al que pertenece el artículo

    @Column(name = "id_clase", nullable = false)
    private Integer idClase;           // Clase del artículo

    @Column(name = "id_familia", nullable = false)
    private Integer idFamilia;         // Familia a la que pertenece el artículo

    @Column(name = "fecha_alta", nullable = false)
    private LocalDate fechaAlta;       // Fecha en la que se da de alta el artículo

    @Column(nullable = false)
    private Integer stock;             // Cantidad en stock

    @Column(nullable = false)
    private Integer cantidad;          // Cantidad en tienda o departamento

    @Column(nullable = false)
    private Boolean descontinuado;     // Indicador de artículo descontinuado

    @Column(name = "fecha_baja")
    private LocalDate fechaBaja;       // Fecha de baja del artículo

    @Column(nullable = false)
    private Boolean activo;
}
