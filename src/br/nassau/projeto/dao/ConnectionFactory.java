package br.nassau.projeto.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	public Connection getConnection() {
		try {
			String url = "jdbc:mysql://localhost:3306/gestor";
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(url, "root", "root");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

}
