package com.coppel.abcc_articulos.repository;

import com.coppel.abcc_articulos.dto.ArticuloDTO;
import com.coppel.abcc_articulos.model.ArticuloModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Repository
public interface ArticuloRepository extends JpaRepository<ArticuloModel, Integer> {

    @Query(value = "SELECT a.sku, a.nombre, a.marca, a.modelo, a.id_departamento AS idDepartamento, d.nombre_departamento AS nombreDepartamento, a.id_clase AS idClase, c.nombre_clase AS nombreClase, a.id_familia AS idFamilia, f.nombre_familia AS nombreFamilia, a.fecha_alta AS fechaAlta, a.stock, a.cantidad, a.descontinuado, a.fecha_baja AS fechaBaja, a.activo " +
            "FROM articulos a " +
            "JOIN departamentos d ON a.id_departamento = d.id_departamento " +
            "JOIN clases c ON a.id_clase = c.id_clase " +
            "JOIN familias f ON a.id_familia = f.id_familia " +
            "WHERE a.sku = :sku AND a.activo = true",
            nativeQuery = true)
    Optional<Map<String, Object>> findArticuloDetallado(@Param("sku") Integer sku);
}
