package com.coppel.abcc_articulos.service;

import com.coppel.abcc_articulos.model.ClaseModel;
import com.coppel.abcc_articulos.model.FamiliaModel;
import com.coppel.abcc_articulos.repository.FamiliaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FamiliaService {
    @Autowired
    private FamiliaRepository familiaRepository;

    public List<FamiliaModel> getFamilias() {
        return familiaRepository.findAll();
    }

    // Método para obtener familias por id_clase
    public List<FamiliaModel> getFamiliasByIdClase(Integer idClase) {
        return familiaRepository.findByIdClase(idClase);
    }

    public Optional<FamiliaModel> getFamiliaById(Integer id) {
        return familiaRepository.findById(id);
    }
}
