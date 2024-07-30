package com.coppel.abcc_articulos.controller;


import com.coppel.abcc_articulos.ResponseMessage.ResponseMessage;
import com.coppel.abcc_articulos.dto.ArticuloDTO;
import com.coppel.abcc_articulos.model.ArticuloModel;
import com.coppel.abcc_articulos.service.ArticuloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@RestController
@RequestMapping("api/articulos")  // Ruta base para los endpoints de este controlador
@CrossOrigin(origins = "http://localhost:4200")
public class ArticuloController {
    @Autowired
    private ArticuloService articuloService;

    @GetMapping("obtener")
    public List<ArticuloModel> getAllArticulos() {
        return articuloService.getArticulos();
    }

    @PostMapping("alta")
    public ResponseEntity<ResponseMessage> agregarArticulo(@RequestBody ArticuloModel articuloModel) {
        // Validación de cantidad no mayor que stock
        if (articuloModel.getCantidad() > articuloModel.getStock()) {
            return new ResponseEntity<>(new ResponseMessage(false, "La cantidad no puede ser mayor que el stock.", null), HttpStatus.BAD_REQUEST);
        }

        // Guardar el artículo
        ArticuloModel articuloGuardado = articuloService.agregarArticulo(articuloModel);

        // Devolver respuesta con el artículo guardado en el campo 'data'
        return new ResponseEntity<>(new ResponseMessage(true, "Artículo guardado correctamente.", articuloGuardado), HttpStatus.CREATED);
    }


    @PutMapping("cambio")
    public ResponseEntity<ResponseMessage> actualizarArticulo(@RequestBody ArticuloModel articuloModel) {
        // Buscar el artículo por SKU
        Optional<ArticuloModel> articuloExistente = articuloService.getArticuloBySku(articuloModel.getSku());

        if (!articuloExistente.isPresent()) {
            return new ResponseEntity<>(new ResponseMessage(false, "Artículo no encontrado.", null), HttpStatus.NOT_FOUND);
        }

        // Validación de cantidad no mayor que stock
        if (articuloModel.getCantidad() > articuloModel.getStock()) {
            return new ResponseEntity<>(new ResponseMessage(false, "La cantidad no puede ser mayor que el stock.", null), HttpStatus.BAD_REQUEST);
        }

        // Actualizar y guardar el artículo
        ArticuloModel articuloActualizado = articuloService.actualizarArticulo(articuloModel);

        // Devolver respuesta con el artículo actualizado en el campo 'data'
        return new ResponseEntity<>(new ResponseMessage(true, "Artículo actualizado correctamente.", articuloActualizado), HttpStatus.OK);
    }

    @PostMapping("buscar")
    public ResponseEntity<ResponseMessage> buscarArticuloPorSku(@RequestBody Map<String, Object> request) {
        // Extraer el SKU del cuerpo de la solicitud
        Integer sku = (Integer) request.get("sku");

        // Buscar el artículo por SKU
        Optional<ArticuloModel> articuloExistente = articuloService.getArticuloBySku(sku);

        if (!articuloExistente.isPresent()) {
            return new ResponseEntity<>(new ResponseMessage(false, "Artículo no encontrado o no está activo.", null), HttpStatus.NOT_FOUND);
        }

        // Devolver respuesta con el artículo en el campo 'data'
        return new ResponseEntity<>(new ResponseMessage(true, "Artículo encontrado.", articuloExistente.get()), HttpStatus.OK);
    }

    @PostMapping("descontinuar")
    public ResponseEntity<ResponseMessage> descontinuarArticulo(@RequestBody Map<String, Object> request) {
        Integer sku = (Integer) request.get("sku");
        Boolean descontinuado = (Boolean) request.get("descontinuado");

        // Verificar que SKU y descontinuado no sean nulos
        if (sku == null || descontinuado == null) {
            return new ResponseEntity<>(new ResponseMessage(false, "SKU o estado de descontinuado no proporcionados.", null), HttpStatus.BAD_REQUEST);
        }

        // Buscar el artículo por SKU
        Optional<ArticuloModel> articuloExistente = articuloService.getArticuloBySku(sku);

        if (!articuloExistente.isPresent()) {
            return new ResponseEntity<>(new ResponseMessage(false, "Artículo no encontrado.", null), HttpStatus.NOT_FOUND);
        }

        // Obtener el artículo
        ArticuloModel articulo = articuloExistente.get();

        // Actualizar el campo descontinuado
        articulo.setDescontinuado(descontinuado);

        // Actualizar la fecha baja basada en el estado de descontinuado
        if (descontinuado) {
            articulo.setFechaBaja(LocalDate.now());
        } else {
            // Establecer fecha baja a '1900-01-01'
            articulo.setFechaBaja(LocalDate.parse("1900-01-01", DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        }

        // Guardar los cambios en el artículo
        articuloService.actualizarArticulo(articulo);

        // Devolver respuesta
        return new ResponseEntity<>(new ResponseMessage(true, "Estado de descontinuado y fecha de baja actualizados correctamente.", null), HttpStatus.OK);
    }

    @PostMapping("baja")
    public ResponseEntity<ResponseMessage> desactivarArticuloPorSku(@RequestBody Map<String, Object> request) {
        // Extraer el SKU del cuerpo de la solicitud
        Integer sku = (Integer) request.get("sku");

        ResponseEntity<ResponseMessage> response = articuloService.desactivarArticuloPorSku(sku);

        // Devolver respuesta
        return response;
    }

    @PostMapping("detalles")
    public ResponseEntity<Object[]> buscarArticuloDetalle(@RequestBody Map<String, Object> request) {
        Integer sku = (Integer) request.get("sku");

        Optional<Map<String, Object>> articuloExistente = articuloService.getArticuloDetalle(sku);

        if (!articuloExistente.isPresent()) {
            return ResponseEntity
                    .status(HttpStatus.NOT_FOUND)
                    .body(new Map[]{Map.of("mensaje", "Artículo no encontrado o no está activo.")});
        }

        return ResponseEntity.ok(new Map[]{articuloExistente.get()});
    }

}
