package util;

import dao.Conexion;
import java.sql.Connection;

public class PruebaConexion {

    public static void main(String[] args) {
        Connection conexion = Conexion.getConnection();

        if (conexion != null) {
            System.out.println("La conexión funciona correctamente.");
        } else {
            System.out.println("No se pudo conectar a la base de datos.");
        }
    }
}