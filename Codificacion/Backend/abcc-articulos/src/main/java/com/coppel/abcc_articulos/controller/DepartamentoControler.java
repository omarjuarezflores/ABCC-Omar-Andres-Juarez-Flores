package com.coppel.abcc_articulos.controller;
import com.coppel.abcc_articulos.ResponseMessage.ResponseMessage;
import com.coppel.abcc_articulos.model.DepartamentoModel;
import com.coppel.abcc_articulos.service.DepartamentoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;


@RestController
@RequestMapping("api/departamentos")  // Ruta base para los endpoints de este controlador
@CrossOrigin(origins = "http://localhost:4200")
public class DepartamentoControler {
   @Autowired
    private DepartamentoService departamentoService;

    @GetMapping("obtener")
    public ResponseEntity<ResponseMessage> getAllDepartamentos() {
        List<DepartamentoModel> departamentos = departamentoService.getDepartamentos();
        ResponseMessage responseMessage = new ResponseMessage(true, "Departamentos obtenidos correctamente.", departamentos);
        return new ResponseEntity<>(responseMessage, HttpStatus.OK);
    }


    @PostMapping("buscar")
    public ResponseEntity<ResponseMessage> buscarDepartamentoPorId(@RequestBody Map<String, Object> request) {
        // Extraer el ID del departamento del cuerpo de la solicitud
        Integer idDepartamento = (Integer) request.get("id_departamento");

        // Buscar el departamento por ID
        Optional<DepartamentoModel> departamentoExistente = departamentoService.getDepartamentoById(idDepartamento);

        if (!departamentoExistente.isPresent()) {
            return new ResponseEntity<>(new ResponseMessage(false, "Departamento no encontrado.", null), HttpStatus.NOT_FOUND);
        }

        // Devolver respuesta con el departamento en el campo 'data'
        return new ResponseEntity<>(new ResponseMessage(true, "Departamento encontrado.", departamentoExistente.get()), HttpStatus.OK);
    }

}
