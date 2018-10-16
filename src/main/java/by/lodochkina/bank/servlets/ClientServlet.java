package by.lodochkina.bank.servlets;

import by.lodochkina.bank.models.*;
import by.lodochkina.bank.services.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ClientServlet extends HttpServlet {

    private ClientService clientService;

    public ClientServlet() {
        this.clientService = new ClientServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null && action.equalsIgnoreCase("delete")) {
            Long clientId = Long.valueOf(req.getParameter("clientId"));
            this.clientService.delete(clientId);
        }
        List<Client> clientList = this.clientService.findAll();
        req.setAttribute("clientList", clientList);
        req.getRequestDispatcher("/WEB-INF/views/client.jsp").forward(req, resp);
    }

}
