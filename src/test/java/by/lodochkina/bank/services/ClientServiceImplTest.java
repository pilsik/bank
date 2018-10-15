package by.lodochkina.bank.services;

import by.lodochkina.bank.models.Client;
import by.lodochkina.bank.models.Contact;
import by.lodochkina.bank.models.Passport;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.Date;

import static org.junit.Assert.*;


public class ClientServiceImplTest {

    ClientService clientService = new ClientServiceImpl();
    CityService cityService = new CityServiceImpl();
    CitizenshipService citizenshipService = new CitizenshipServiceImpl();
    DisabilityService disabilityService = new DisabilityServiceImpl();
    MaritalStatusService maritalStatusService = new MaritalStatusServiceImpl();

    @Test
    public void persist() throws Exception {
        Client client = new Client("surname", "name", "patronymic", new Date(), true, true, new BigDecimal(100), "bpl",
                null, null, this.cityService.findById(1L),
                this.cityService.findById(1L), this.maritalStatusService.findById(1L),
                this.citizenshipService.findById(1L), this.disabilityService.findById(1L));
        Passport passport = new Passport(client, "KB", "1234567", "test",
                new Date(), "1234567M123PB6");
        Contact contact = new Contact(client, "test", "123456", "+375(12)1234567", "test@test.te");
        client.setPassport(passport);
        client.setContact(contact);
        this.clientService.persist(client);

    }

    @Test
    public void update() throws Exception {
    }

    @Test
    public void findById() throws Exception {
    }

    @Test
    public void delete() throws Exception {
    }

    @Test
    public void findAll() throws Exception {
    }

    @Test
    public void deleteAll() throws Exception {
    }

}