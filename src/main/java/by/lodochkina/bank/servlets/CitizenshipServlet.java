package by.lodochkina.bank.servlets;

import by.lodochkina.bank.models.Citizenship;
import by.lodochkina.bank.services.CitizenshipService;
import by.lodochkina.bank.services.CitizenshipServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CitizenshipServlet extends HttpServlet{

    private CitizenshipService citizenshipService;

    public CitizenshipServlet() {
        this.citizenshipService = new CitizenshipServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Citizenship> citizenships = this.citizenshipService.findAll();
        req.setAttribute("citizenships", citizenships);
        req.getRequestDispatcher("/views/citizenship.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("citizenshipName");
        this.citizenshipService.persist(new Citizenship(name));
        resp.setStatus(HttpServletResponse.SC_FOUND);
        resp.sendRedirect("/citizenship");
    }
}
