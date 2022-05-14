package com;
import model.Electricity;
import java.util.HashMap; 
import java.util.Map; 
import java.util.Scanner;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ItemsAPI
 */

@WebServlet("/ElectricityAPI")
public class ElectricityAPI extends HttpServlet {
	Electricity eleconnec = new Electricity();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElectricityAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		String output = eleconnec.insertNewConnection(request.getParameter("AccountNum"), 
				 request.getParameter("LineNum"), 
				request.getParameter("ClientName"), 
				request.getParameter("NIC"),
				request.getParameter("ConnecType"),
				request.getParameter("Email"),
				request.getParameter("Address"),
				request.getParameter("WiringType")); 
				response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) 
			 throws ServletException, IOException 
			{ 
			 Map paras = getParasMap(request); 
			 String output = eleconnec.updateConnections(paras.get("hidItemIDSave").toString(), 
			 paras.get("AccountNum").toString(), 
			paras.get("LineNum").toString(), 
			paras.get("ClientName").toString(), 
			paras.get("NIC").toString(), 
			paras.get("ConnecType").toString(), 
			paras.get("Email").toString(), 
			paras.get("Address").toString(),
			paras.get("WiringType").toString()); 
			response.getWriter().write(output); 
			} 
	
	
	private static Map getParasMap(HttpServletRequest request) 
	{ 
	 Map<String, String> map = new HashMap<String, String>(); 
	try
	 { 
	 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8"); 
	 String queryString = scanner.hasNext() ? 
	 scanner.useDelimiter("\\A").next() : ""; 
	 scanner.close(); 
	 String[] params = queryString.split("&"); 
	 for (String param : params) 
	 { 
	 String[] p = param.split("="); 
	 map.put(p[0], p[1]); 
	 } 
	 } 
	catch (Exception e) 
	 { 
	 } 
	return map; 
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) 
			 throws ServletException, IOException 
			{ 
			 Map paras = getParasMap(request); 
			 String output = eleconnec.deleteConnection(paras.get("ConCode").toString()); 
			response.getWriter().write(output); 
			}


}


