package by.lodochkina.bank.servlets;

import by.lodochkina.bank.models.City;
import by.lodochkina.bank.models.Client;
import by.lodochkina.bank.services.CityService;
import by.lodochkina.bank.services.CityServiceImpl;
import by.lodochkina.bank.services.ClientService;
import by.lodochkina.bank.services.ClientServiceImpl;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class WelcomeServlet extends HttpServlet {

    final static Logger logger = Logger.getLogger(WelcomeServlet.class);

    private CityService cityService;

    private ClientService clientService;

    public WelcomeServlet() {
        this.cityService = new CityServiceImpl();
        this.clientService = new ClientServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        City city =  this.cityService.findById(1L);
        Client client = this.clientService.findById(1L);
        logger.info(city);
        logger.info(client);
        req.getRequestDispatcher("/views/welcome.jsp").forward(req, resp);
    }
}


