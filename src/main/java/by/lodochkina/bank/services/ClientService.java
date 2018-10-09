package by.lodochkina.bank.services;

import by.lodochkina.bank.dao.ClientDaoImpl;
import by.lodochkina.bank.models.Client;

import java.util.List;

public interface ClientService {

    public void update(Client entity);

    public Client findById(Long id);

    public void delete(Long id);

    public List<Client> findAll();

    public void deleteAll();

    public ClientDaoImpl clientDao();
}
