package com.arena.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class MenuDetailsServlet
 */
@WebServlet("/mdetails.html")
public class MenuDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	Connection connection;

	public void init() throws ServletException {
		try {

			DataSource dataSource = InitialContext
					.doLookup("java:comp/env/jdbc/arenadb");
			connection = dataSource.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if (request.getParameter("action").equals("getdetails")) {
			int x = Integer.parseInt(request.getParameter("id"));
			PreparedStatement p = null;
			try {
				
				String sql = "SELECT * FROM menu_table WHERE menu_id = ?";
				p = connection.prepareStatement(sql);
				p.setInt(1, x);
				ResultSet rs = p.executeQuery();
				session.setAttribute("newdetails", rs);
				getServletContext().getRequestDispatcher("/menudetails.jsp").forward(
						request, response);
			} catch (Exception ex) {
				System.out.println("Found some error : " + ex);
			}
		}
	}

}
