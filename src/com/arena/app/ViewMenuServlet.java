package com.arena.app;

import java.io.IOException;
import java.sql.*;

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
 * Servlet implementation class DisplayFoodServlet
 */
@WebServlet("/displayfood.html")
public class ViewMenuServlet extends HttpServlet {
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
	public ViewMenuServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	private String category = null;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		if (request.getParameter("action").equals("food")) {
			category = "Food";
		} else if (request.getParameter("action").equals("drink")) {
			category = "Drinks";
		} else if (request.getParameter("action").equals("dessert")) {
			category = "Desserts";
		}
		
//		if(request.getParameter("qty") != null || request.getParameter("qty") != "")
//		{
//			int q = Integer.parseInt(request.getParameter("qty"));
//			System.out.println(q);
//		}
		
		PreparedStatement p = null;
		try {
			String sql = "SELECT * FROM menu_table WHERE category = ? ORDER BY name";
			p = connection.prepareStatement(sql);
			p.setString(1, category);
			ResultSet rs = p.executeQuery();
			session.setAttribute("menu", rs);
			session.setAttribute("cat", category);
			getServletContext().getRequestDispatcher("/mainmenu.jsp").forward(
					request, response);
		} catch (Exception ex) {
			System.out.println("Found some error : " + ex);
		}
	}
}
