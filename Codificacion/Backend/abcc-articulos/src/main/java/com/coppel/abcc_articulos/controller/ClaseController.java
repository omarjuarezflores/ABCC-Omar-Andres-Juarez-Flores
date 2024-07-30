package com.coppel.abcc_articulos.controller;

import com.coppel.abcc_articulos.ResponseMessage.ResponseMessage;
import com.coppel.abcc_articulos.model.ClaseModel;
import com.coppel.abcc_articulos.model.DepartamentoModel;
import com.coppel.abcc_articulos.service.ClaseService;
import com.coppel.abcc_articulos.service.DepartamentoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;
@RestController
@RequestMapping("api/clases")  // Ruta base para los endpoints de este controlador
@CrossOrigin(origins = "http://localhost:4200")
public class ClaseController {


    @Autowired
    private ClaseService claseService;

    @GetMapping("obtener")
    public ResponseEntity<ResponseMessage> getAllClases() {
        List<ClaseModel> clases = claseService.getClases();
        ResponseMessage responseMessage = new ResponseMessage(true, "Departamentos obtenidos correctamente.", clases);
        return new ResponseEntity<>(responseMessage, HttpStatus.OK);
    }


    @PostMapping("buscar/byDepartamento")
    public ResponseEntity<ResponseMessage> buscarClasesPorIdDepartamento(@RequestBody Map<String, Object> request) {
        Integer idDepartamento = (Integer) request.get("id_departamento");

        List<ClaseModel> clasesExistentes = claseService.getClasesByIdDepartamento(idDepartamento);

        if (clasesExistentes.isEmpty()) {
            return new ResponseEntity<>(new ResponseMessage(false, "Clases no encontradas.", null), HttpStatus.NOT_FOUND);
        }

        // Devolver respuesta con las clases en el campo 'data'
        return new ResponseEntity<>(new ResponseMessage(true, "Clases encontradas.", clasesExistentes), HttpStatus.OK);
    }

    @PostMapping("buscar/byId")

    public ResponseEntity<ResponseMessage> buscarClasePorId(@RequestBody Map<String, Object> request) {
        // Extraer el ID del departamento del cuerpo de la solicitud
        Integer idClase = (Integer) request.get("id_clase");

        // Buscar el departamento por ID
        Optional<ClaseModel> claseExistente = claseService.getClaseById(idClase);

        if (!claseExistente.isPresent()) {
            return new ResponseEntity<>(new ResponseMessage(false, "Clase no encontrada.", null), HttpStatus.NOT_FOUND);
        }

        // Devolver respuesta con el departamento en el campo 'data'
        return new ResponseEntity<>(new ResponseMessage(true, "Clase encontrada.", claseExistente.get()), HttpStatus.OK);
    }

}
