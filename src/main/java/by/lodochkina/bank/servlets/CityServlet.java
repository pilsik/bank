package by.lodochkina.bank.servlets;

import by.lodochkina.bank.models.City;
import by.lodochkina.bank.services.CityService;
import by.lodochkina.bank.services.CityServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CityServlet extends HttpServlet {

    private CityService cityService;

    public CityServlet() {
        this.cityService = new CityServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<City> cityList = this.cityService.findAll();
        req.setAttribute("cities", cityList);
        req.getRequestDispatcher("/WEB-INF/views/city.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("cityName");
        this.cityService.persist(new City(name));
        resp.setStatus(HttpServletResponse.SC_FOUND);
        resp.sendRedirect("/city");
    }
}
