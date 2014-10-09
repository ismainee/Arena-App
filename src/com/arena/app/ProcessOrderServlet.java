package com.arena.app;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;

import com.arena.app.OrderBean;

/**
 * Servlet implementation class ProcessOrderServlet
 */
@WebServlet("/processorder.html")
public class ProcessOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProcessOrderServlet() {
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
	final ArrayList<OrderBean> Order = new ArrayList<OrderBean>();
	static int x;
	boolean match;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// TODO Auto-generated method stub
		// if (request.getParameter("action").equals("deleteorder")) {
		// int y = Integer.parseInt(request.getParameter("id"));
		// Order.remove(y);
		// getServletContext().getRequestDispatcher(
		// "/vieworders.jsp").forward(
		// request, response);
		// } else {
		try {
			String cat = session.getAttribute("cat").toString();
			String regex = "[0-9]+";
			if (request.getParameter("action").equals(("addorder"))) {
				String data = request.getParameter("qty");
				int q;
				if (request.getParameter("qty") == ""
						|| request.getParameter("qty") == null
						|| data.matches(regex) == false) {
					q = 0;
				} else {

					q = Integer.parseInt(request.getParameter("qty"));
				}

				if (q != 0) {

					String name = request.getParameter("name");
					String code = request.getParameter("code");
					if (Order != null) {
						for (int i = 0; i < Order.size(); i++) {
							if (Order.get(i).getCode().contains(code)) {
								x = i;
								match = true;
								break;
							} else {
								match = false;

							}
						}
					}
					System.out.println(match);
					System.out.println("Umaabot dito");
					if (match) {
						Order.get(x).setQty(q + Order.get(x).getQty());
						System.out.println("Quantity updated!");
					} else {
						Order.add(new OrderBean(code, q, name));
						System.out.println("Order Added");
					}

					session.setAttribute("orderlist", Order);
					getServletContext().getRequestDispatcher(
							"/displayfood.html?action= '" + cat + "'").forward(
							request, response);
				} else {
					getServletContext().getRequestDispatcher(
							"/displayfood.html?action= '" + cat + "'").forward(
							request, response);
				}
			} else if (request.getParameter("action").equals("deleteorder")) {
				int y = Integer.parseInt(request.getParameter("id"));
				Order.remove(y);
				getServletContext().getRequestDispatcher("/vieworders.jsp")
						.forward(request, response);
			} else if (request.getParameter("action").equals("updateorder")) {
				int z = Integer.parseInt(request.getParameter("id"));
				String data2 = request.getParameter("newq");
				int newq;
				if (data2 == "" || data2 == null
						|| data2.matches(regex) == false) {
					newq = Order.get(z).getQty();
				} else {
					newq = Integer.parseInt(request.getParameter("newq"));
				}
				System.out.println(z + newq);
				Order.get(z).setQty(newq);
				getServletContext().getRequestDispatcher("/vieworders.jsp")
						.forward(request, response);
			}
		} catch (Exception ex) {
			System.out.println("Found some error : " + ex);
			System.err.print(ex);
			ex.printStackTrace();
			session.setAttribute("error", ex.getMessage());
		}
	}
}
