package by.lodochkina.bank.servlets;

import by.lodochkina.bank.models.Client;
import by.lodochkina.bank.services.ClientService;
import by.lodochkina.bank.services.ClientServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class WelcomeServlet extends HttpServlet {

    private ClientService clientService;

    public WelcomeServlet() {
        this.clientService = new ClientServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Client client = this.clientService.findById(1L);
        req.setAttribute("client", client);
        req.getRequestDispatcher("/views/welcome.jsp").forward(req, resp);
    }
}


