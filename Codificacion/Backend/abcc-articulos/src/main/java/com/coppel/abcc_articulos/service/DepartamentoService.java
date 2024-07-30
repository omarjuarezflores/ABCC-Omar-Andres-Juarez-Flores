package com.coppel.abcc_articulos.service;

import com.coppel.abcc_articulos.model.ArticuloModel;
import com.coppel.abcc_articulos.model.DepartamentoModel;
import com.coppel.abcc_articulos.repository.DepartamentoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DepartamentoService {
     @Autowired
     private DepartamentoRepository departamentoRepository;


    // Metodo para obtener todos los departamentos
    public List<DepartamentoModel> getDepartamentos() {
        return departamentoRepository.findAll();
    }

    public Optional<DepartamentoModel> getDepartamentoById(Integer id) {
        return departamentoRepository.findById(id);
    }
}
