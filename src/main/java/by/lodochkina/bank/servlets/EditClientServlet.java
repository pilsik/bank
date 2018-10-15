package by.lodochkina.bank.servlets;

import by.lodochkina.bank.models.*;
import by.lodochkina.bank.services.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class EditClientServlet extends HttpServlet {

    private ClientService clientService;

    private CityService cityService;

    private CitizenshipService citizenshipService;

    private DisabilityService disabilityService;

    private MaritalStatusService maritalStatusService;

    public EditClientServlet() {
        this.clientService = new ClientServiceImpl();
        this.cityService = new CityServiceImpl();
        this.citizenshipService = new CitizenshipServiceImpl();
        this.disabilityService = new DisabilityServiceImpl();
        this.maritalStatusService = new MaritalStatusServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String clientId = req.getParameter("clientId");
        Client client;
        if (clientId != null && this.clientService.findById(Long.valueOf(clientId)) != null) {
            client = this.clientService.findById(Long.valueOf(clientId));
        } else {
            client = new Client();
        }
        List<City> cityList = this.cityService.findAll();
        List<Disability> disabilityList = this.disabilityService.findAll();
        List<Citizenship> citizenshipList = this.citizenshipService.findAll();
        List<MaritalStatus> maritalStatuses = this.maritalStatusService.findAll();
        req.setAttribute("client", client);
        req.setAttribute("cityList", cityList);
        req.setAttribute("disabilityList", disabilityList);
        req.setAttribute("citizenshipList", citizenshipList);
        req.setAttribute("maritalStatuses", maritalStatuses);
        req.getRequestDispatcher("/views/editAndCreateClient.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String clientId = req.getParameter("clientId");

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String surname = req.getParameter("surname");
        String name = req.getParameter("name");
        String patronymic = req.getParameter("patronymic");
        Date dob = null;
        Date passport_date_of_issue = null;
        try {
            dob = dateFormat.parse(req.getParameter("dob"));
            passport_date_of_issue = dateFormat.parse(req.getParameter("passport_date_of_issue"));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Boolean sex = req.getParameter("sex") != null;
        Boolean pensioner = req.getParameter("pensioner") != null;
        BigDecimal monthly_income = new BigDecimal(req.getParameter("monthly_income"));
        String bpl = req.getParameter("bpl");

        Long cityOfRegistration = Long.valueOf(req.getParameter("cityOfRegistration"));
        Long cityOfResidence = Long.valueOf(req.getParameter("cityOfResidence"));
        Long maritalStatus = Long.valueOf(req.getParameter("maritalStatus"));
        Long citizenship = Long.valueOf(req.getParameter("citizenship"));
        Long disability = Long.valueOf(req.getParameter("disability"));

        String passport_series = req.getParameter("passport_series");
        String passport_number = req.getParameter("passport_number");
        String passport_authority = req.getParameter("passport_authority");
        String passport_identification_number = req.getParameter("passport_identification_number");

        String address = req.getParameter("address");
        String phone_home = req.getParameter("phone_home");
        String phone_mobile = req.getParameter("phone_mobile");
        String email = req.getParameter("email");

        Client client = new Client(surname, name, patronymic, dob, sex, pensioner, monthly_income, bpl,
                null, null, this.cityService.findById(cityOfResidence),
                this.cityService.findById(cityOfRegistration), this.maritalStatusService.findById(maritalStatus),
                this.citizenshipService.findById(citizenship), this.disabilityService.findById(disability));
        Passport passport = new Passport(client, passport_series, passport_number, passport_authority,
                passport_date_of_issue, passport_identification_number);
        Contact contact = new Contact(client, address, phone_home, phone_mobile, email);
        client.setPassport(passport);
        client.setContact(contact);

        if (clientId == null || clientId.isEmpty()) {
            this.clientService.persist(client);
        } else {
            client.setId(Long.valueOf(clientId));
            passport.setId(Long.valueOf(clientId));
            contact.setId(Long.valueOf(clientId));
            this.clientService.update(client);
        }
        resp.setStatus(HttpServletResponse.SC_CREATED);
        resp.sendRedirect("/client");
    }
}
