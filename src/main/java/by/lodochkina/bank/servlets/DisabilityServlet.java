package by.lodochkina.bank.servlets;

import by.lodochkina.bank.models.Disability;
import by.lodochkina.bank.services.DisabilityService;
import by.lodochkina.bank.services.DisabilityServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class DisabilityServlet extends HttpServlet{

    private DisabilityService disabilityService;

    public DisabilityServlet() {
        this.disabilityService = new DisabilityServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Disability> disabilityList = this.disabilityService.findAll();
        req.setAttribute("disabilityList", disabilityList);
        req.getRequestDispatcher("WEB-INF/views/disability.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("disabilityName");
        this.disabilityService.persist(new Disability(name));
        resp.setStatus(HttpServletResponse.SC_FOUND);
        resp.sendRedirect("/disability");
    }
}
