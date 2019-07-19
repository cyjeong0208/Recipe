package com.solrecipe.recipe;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	static {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		try(Connection con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:49161:xe","solrecipe", "solrecipe")){
			System.out.print(con);
		}catch(Exception e) {
			fail(e.getMessage());
		}
	}

}
