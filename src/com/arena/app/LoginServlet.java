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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
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
	public LoginServlet() {
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
	// private String url = "jdbc:mysql://localhost:3306/arenadb";
	// private String username = "root";
	// private String password = "qwerty1234";

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// TODO Auto-generated method stub
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		// System.out.println(user + " " + pass);
		Statement p = null;
		try {
			if (connection != null) {
				String sql = "SELECT * FROM users_table";
				p = connection.createStatement();
				ResultSet rs = p.executeQuery(sql);
				String usernamedb = null;
				String passworddb = null;
				while (rs.next()) {
					usernamedb = rs.getString("username");
					passworddb = rs.getString("password");
					if (usernamedb.contentEquals(user)) {
						if (passworddb.contentEquals(pass)) {
							session.setAttribute("lname", rs.getString("lastname"));
							session.setAttribute("fname", rs.getString("firstname"));
							session.setAttribute("mname", rs.getString("middleinitial"));
							session.setAttribute("userid", rs.getInt("user_id"));
							getServletContext().getRequestDispatcher(
									"/home.jsp").forward(request, response);
						} else {
							getServletContext()
									.getRequestDispatcher(
											"/actionstatus.jsp?success=invalidpassword")
									.forward(request, response);
						}
					} else {
						if (rs.isLast()) {
							System.out.println("Username not found."); // Exception
							getServletContext().getRequestDispatcher(
									"/actionstatus.jsp?success=invaliduser")
									.forward(request, response);
						} else {
							continue;
						}
					}
				}
			}
		} catch (Exception ex) {
			System.out.println("Found some error : " + ex);
			System.err.print(ex);
			ex.printStackTrace();
			session.setAttribute("error", ex.getMessage());
			getServletContext().getRequestDispatcher("/actionstatus.jsp?success=error").forward(request, response);
		}
	}

}
