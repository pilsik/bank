package by.lodochkina.bank.servlets;

import by.lodochkina.bank.models.City;
import by.lodochkina.bank.services.CityService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class WelcomeServlet extends HttpServlet {

    private CityService cityService;

    public WelcomeServlet() {
        this.cityService = new CityService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        City city =  this.cityService.findById(1L);
        req.getRequestDispatcher("/views/welcome.jsp").forward(req, resp);
    }
}


