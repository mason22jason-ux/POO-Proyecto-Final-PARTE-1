package util;

import dao.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PruebaInsertarLibro {

    public static void main(String[] args) {

        String sqlMaterial = "INSERT INTO material (codigo, titulo, tipo, estado) VALUES (?, ?, ?, ?)";
        String sqlLibro = "INSERT INTO libro (id_material, autor, editorial, anio_publicacion, numero_paginas, genero) VALUES (LAST_INSERT_ID(), ?, ?, ?, ?, ?)";

        try (Connection conexion = Conexion.getConnection()) {

            if (conexion != null) {
                conexion.setAutoCommit(false);

                try (
                    PreparedStatement psMaterial = conexion.prepareStatement(sqlMaterial);
                    PreparedStatement psLibro = conexion.prepareStatement(sqlLibro)
                ) {
                    psMaterial.setString(1, "LIB001");
                    psMaterial.setString(2, "El Principito");
                    psMaterial.setString(3, "Libro");
                    psMaterial.setString(4, "Disponible");
                    psMaterial.executeUpdate();

                    psLibro.setString(1, "Antoine de Saint-Exupéry");
                    psLibro.setString(2, "Reynal & Hitchcock");
                    psLibro.setInt(3, 1943);
                    psLibro.setInt(4, 96);
                    psLibro.setString(5, "Narrativa");
                    psLibro.executeUpdate();

                    conexion.commit();

                    System.out.println("Libro guardado correctamente desde Java.");
                } catch (SQLException e) {
                    conexion.rollback();
                    System.out.println("Error al guardar el libro.");
                    System.out.println(e.getMessage());
                }
            }

        } catch (SQLException e) {
            System.out.println("Error general.");
            System.out.println(e.getMessage());
        }
    }
}