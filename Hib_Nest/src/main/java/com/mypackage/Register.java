package com.mypackage;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public Register() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String nm = request.getParameter("title");
		String per = request.getParameter("msg");
		
		Configuration cfg =new Configuration();
		cfg.configure();
		SessionFactory sf =cfg.buildSessionFactory();
		Session sess = sf.openSession();
		
		Todo st =new Todo();
		
		st.setTitle(nm);
		st.setMessage(per);
		
//		pw.print(nm);
		Transaction tx =sess.beginTransaction();
		sess.save(st);
		
		tx.commit();
		response.sendRedirect("index.jsp?insert=success");

//		pw.print("Login success!");
		sess.close();
		sf.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
