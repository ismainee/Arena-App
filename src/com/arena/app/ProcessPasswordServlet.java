package com.arena.app;

import java.io.*;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
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

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.arena.app.OrderBean;

/**
 * Servlet implementation class ProcessPasswordServlet
 */
@WebServlet("/processpassword.html")
public class ProcessPasswordServlet extends HttpServlet {
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
	public ProcessPasswordServlet() {
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
	ArrayList<OrderBean> Order = new ArrayList<OrderBean>();

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		StringBuilder codes = new StringBuilder();
		String pass = request.getParameter("password");
		String room = request.getParameter("room");
		String custname = request.getParameter("custname");
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		System.out.println(dateFormat.format(date));
		PreparedStatement p = null;
		try {
			int x = Integer.parseInt(session.getAttribute("userid").toString());
			String sql = "SELECT password FROM users_table WHERE user_id = ?";
			p = connection.prepareStatement(sql);
			p.setInt(1, x);
			ResultSet rs = p.executeQuery();
			String passdb = null;
			while (rs.next()) {
				passdb = rs.getString("password");
				System.out.println(passdb);
				if (passdb.equals(pass)) {
					if (session.getAttribute("finalorder") != null) {

						Order = (ArrayList<OrderBean>) session
								.getAttribute("finalorder");
//						boolean network;
//						if (InetAddress.getByAddress("10.141.59.77".getBytes()).isReachable(1000) == true)
//						{
//							network = true;
//							System.out.println("Connection True!");
//						}
//						else
//						{
//							network = false;
//							System.out.println("Connection False");
//						}
						Socket sock = new Socket("10.141.59.77", 9100); // ET0021B7D63CFA.smprime.sm.ph
						PrintWriter oStream = new PrintWriter(
								sock.getOutputStream());
						oStream.println("<html>");
						oStream.println("<body bgcolor=\"white\">");
						oStream.println("<head>");
						oStream.println("<title> Order Slip </title>");
						oStream.println("</head>");
						oStream.println("<p>**************************************</p>");
						oStream.println("<p>         Kitchen Order Slip           </p>");
						oStream.println("<p>**************************************</p>");
						oStream.println("<p> Suite: " + room + " </p>");
						oStream.println("<p> " + dateFormat.format(date) + " </p>");
						oStream.println("<p> Server:" + session.getAttribute("fname").toString() + "</p>");
						oStream.println("<p> Customer:" + custname + "</p>");
						oStream.println("<p>**************************************</p>");
						String sql2 = "INSERT INTO orders_table (waiter_id, orders_list) VALUES (?,?)";
						p = connection.prepareStatement(sql2);
						p.setInt(1, x);
						for (int i = 0; i < Order.size(); i++) {
							codes.append(Order.get(i).getCode()).append("X");
							codes.append(Order.get(i).getQty()).append("_");
							oStream.println("<p>" + Order.get(i).getQty() + " * " + Order.get(i).getCode() + "</p>");
//							oStream.println("<tr>");
//							oStream.println("<td> " + Order.get(i).getCode()
//									+ " </td>");
//							oStream.println("<td> " + Order.get(i).getQty()
//									+ " </td>");
//							oStream.println("</tr>");
						}
						p.setString(2, room + "," + dateFormat.format(date)
								+ "," + custname + "," + codes.toString());
						int s = p.executeUpdate();
						if (s > 0) {
							System.out.println("Order Logs inserted!");
						}
						oStream.println("</body>");
						oStream.println("</html>");
						oStream.close();
						sock.close();
						getServletContext().getRequestDispatcher(
								"/actionstatus.jsp?success=printed").forward(
								request, response);
						Order.clear();
					}
				} else {

					getServletContext().getRequestDispatcher(
							"/actionstatus.jsp?success=unabletoprint").forward(
							request, response);

				}
			}

		} catch (Exception ex) {
			System.out.println("Found some error : " + ex);
			ex.printStackTrace();
		}
	}

}
