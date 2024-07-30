package com.coppel.abcc_articulos.service;

import com.coppel.abcc_articulos.model.ClaseModel;
import com.coppel.abcc_articulos.repository.ClaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ClaseService {
    @Autowired
    private ClaseRepository claseRepository;


    public List<ClaseModel> getClases() {
        return claseRepository.findAll();
    }

    public List<ClaseModel> getClasesByIdDepartamento(Integer idDepartamento) {
        return claseRepository.findByIdDepartamento(idDepartamento);
    }

    public Optional<ClaseModel> getClaseById(Integer id) {
        return claseRepository.findById(id);
    }

}
