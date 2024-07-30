package com.coppel.abcc_articulos.service;


import com.coppel.abcc_articulos.ResponseMessage.ResponseMessage;
import com.coppel.abcc_articulos.model.ArticuloModel;
import com.coppel.abcc_articulos.repository.ArticuloRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class ArticuloService {
    @Autowired
    private ArticuloRepository articuloRepository;

    // Metodo para obtener todos los articulos
    public List<ArticuloModel> getArticulos() {
        return articuloRepository.findAll();
    }

    public ArticuloModel agregarArticulo(ArticuloModel articuloModel) {
        return articuloRepository.save(articuloModel);
    }

  /*  public Optional<ArticuloModel> getArticuloBySku(Integer sku) {
        return articuloRepository.findById(sku);
    }*/
    public Optional<ArticuloModel> getArticuloBySku(Integer sku) {
        // Buscar el artículo por SKU
        Optional<ArticuloModel> articulo = articuloRepository.findById(sku);

        // Verificar activo
        if (articulo.isPresent() && articulo.get().getActivo()) {
            return articulo;
        }

        // Retornar vacio
        return Optional.empty();
    }


    public ArticuloModel actualizarArticulo(ArticuloModel articuloModel) {
        return articuloRepository.save(articuloModel);
    }

    public ResponseEntity<ResponseMessage> desactivarArticuloPorSku(Integer sku) {
        // Buscar el artículo por SKU
        Optional<ArticuloModel> articulo = articuloRepository.findById(sku);

        if (!articulo.isPresent()) {
            return new ResponseEntity<>(new ResponseMessage(false, "Artículo no encontrado.", null), HttpStatus.NOT_FOUND);
        }

        // Obtener el artículo y desactivarlo
        ArticuloModel articuloExistente = articulo.get();
        articuloExistente.setActivo(false); // False para indicar que el artículo está inactivo

        // Guardar los cambios en el artículo
        articuloRepository.save(articuloExistente);

        // Devolver respuesta
        return new ResponseEntity<>(new ResponseMessage(true, "Artículo desactivado correctamente.", null), HttpStatus.OK);
    }


    public Optional<Map<String, Object>> getArticuloDetalle(Integer sku) {
        return articuloRepository.findArticuloDetallado(sku);
    }


}
