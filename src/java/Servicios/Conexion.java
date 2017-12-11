package Servicios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jg
 */
public class Conexion {
    
    public static Conexion instancia;
    private Connection cnn;

    private Conexion() {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/gruberbd";
        String usuario = "root";
        String pass = "";
        try {
            Class.forName(driver);
            cnn = DriverManager.getConnection(url, usuario, pass);
        } catch (Exception ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
//paso 1: metodo public para aplicar patrón Singleton

    public static Conexion getInstance() {
    //public synchronized static Conexion getInstance() {
        if (instancia == null) {
            instancia = new Conexion();
        }
        return instancia;
    }

    public Connection getCnn() {
        return cnn;
    }

    //paso 2: metodo que cierra la conexion
    public void cerrar() {
        instancia = null;
    }
}
