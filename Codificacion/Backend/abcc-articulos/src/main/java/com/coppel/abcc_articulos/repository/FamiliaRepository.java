package com.coppel.abcc_articulos.repository;

import com.coppel.abcc_articulos.model.FamiliaModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FamiliaRepository extends JpaRepository<FamiliaModel, Integer> {

        // Método para encontrar familias por id_clase
        List<FamiliaModel> findByIdClase(Integer idClase);
}

