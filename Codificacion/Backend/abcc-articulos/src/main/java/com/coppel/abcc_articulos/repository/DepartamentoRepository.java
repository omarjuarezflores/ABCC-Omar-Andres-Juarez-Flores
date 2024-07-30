package com.coppel.abcc_articulos.repository;

import com.coppel.abcc_articulos.model.DepartamentoModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DepartamentoRepository extends JpaRepository<DepartamentoModel, Integer> {
}
