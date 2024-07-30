package com.coppel.abcc_articulos.repository;

import com.coppel.abcc_articulos.model.ClaseModel;
import com.coppel.abcc_articulos.model.FamiliaModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClaseRepository extends JpaRepository<ClaseModel, Integer> {
    List<ClaseModel> findByIdDepartamento(Integer idDepartamento);

}

