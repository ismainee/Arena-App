package com.arena.app;

import java.io.*;
import java.sql.*;
import java.util.*;

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
 * Servlet implementation class OrderLogsServlet
 */
@WebServlet("/orderlogs.html")
public class OrderLogsServlet extends HttpServlet {
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
    public OrderLogsServlet() {
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
		PreparedStatement p = null;
		try 
		{
			int x = Integer.parseInt(session.getAttribute("userid").toString());
			String sql = "SELECT * FROM orders_table WHERE waiter_id = ?";
			p = connection.prepareStatement(sql);
			p.setInt(1, x);
			ResultSet rs = p.executeQuery();
			session.setAttribute("or", rs);
			getServletContext().getRequestDispatcher("/orderlogs.jsp").forward(request, response);
		} catch (Exception ex) {
			System.out.println("Found some error : " + ex);
		}
	}
}
