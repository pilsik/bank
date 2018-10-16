package by.lodochkina.bank.servlets;

import by.lodochkina.bank.models.MaritalStatus;
import by.lodochkina.bank.services.MaritalStatusService;
import by.lodochkina.bank.services.MaritalStatusServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class MaritalStatusServlet extends HttpServlet {

    private MaritalStatusService maritalStatusService;

    public MaritalStatusServlet() {
        this.maritalStatusService = new MaritalStatusServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<MaritalStatus> maritalStatusList = this.maritalStatusService.findAll();
        req.setAttribute("maritalStatusList", maritalStatusList);
        req.getRequestDispatcher("WEB-INF/views/maritalStatus.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("maritalStatusName");
        this.maritalStatusService.persist(new MaritalStatus(name));
        resp.setStatus(HttpServletResponse.SC_FOUND);
        resp.sendRedirect("/maritalStatus");
    }
}
