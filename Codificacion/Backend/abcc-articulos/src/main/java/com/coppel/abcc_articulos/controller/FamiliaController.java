package com.coppel.abcc_articulos.controller;

import com.coppel.abcc_articulos.ResponseMessage.ResponseMessage;
import com.coppel.abcc_articulos.model.ClaseModel;
import com.coppel.abcc_articulos.model.FamiliaModel;
import com.coppel.abcc_articulos.repository.FamiliaRepository;
import com.coppel.abcc_articulos.service.FamiliaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("api/familias")  // Ruta base para los endpoints de este controlador
@CrossOrigin(origins = "http://localhost:4200")
public class FamiliaController {
    @Autowired
    private FamiliaService familiaService;


    @GetMapping("obtener")
    public ResponseEntity<ResponseMessage> getAllFamilias() {
        List<FamiliaModel> clases = familiaService.getFamilias();
        ResponseMessage responseMessage = new ResponseMessage(true, "Familias obtenidos correctamente.", clases);
        return new ResponseEntity<>(responseMessage, HttpStatus.OK);
    }


    @PostMapping("buscar/byClase")
    public ResponseEntity<ResponseMessage> buscarFamiliasPorIdClase(@RequestBody Map<String, Object> request) {
        Integer idClase = (Integer) request.get("id_clase");

        List<FamiliaModel> familiasExistentes = familiaService.getFamiliasByIdClase(idClase);

        if (familiasExistentes.isEmpty()) {
            return new ResponseEntity<>(new ResponseMessage(false, "Familias no encontradas.", null), HttpStatus.NOT_FOUND);
        }

        // Devolver respuesta con las familias en el campo 'data'
        return new ResponseEntity<>(new ResponseMessage(true, "Familias encontradas.", familiasExistentes), HttpStatus.OK);
    }

    @PostMapping("buscar/byId")
    public ResponseEntity<ResponseMessage> buscarFamiliaPorId(@RequestBody Map<String, Object> request) {
        Integer idFamlia = (Integer) request.get("id_familia");

        Optional<FamiliaModel> familiaExistente = familiaService.getFamiliaById(idFamlia);

        if (!familiaExistente.isPresent()) {
            return new ResponseEntity<>(new ResponseMessage(false, "Clase no encontrada.", null), HttpStatus.NOT_FOUND);
        }

        // Devolver respuesta con el departamento en el campo 'data'
        return new ResponseEntity<>(new ResponseMessage(true, "Clase encontrada.", familiaExistente.get()), HttpStatus.OK);
    }
}
