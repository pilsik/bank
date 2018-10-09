package by.lodochkina.bank.services;

import by.lodochkina.bank.dao.ClientDaoImpl;
import by.lodochkina.bank.models.Client;

import java.util.List;

public class ClientServiceImpl implements ClientService {

    private static ClientDaoImpl clientDao;

    public ClientServiceImpl() {
        clientDao = new ClientDaoImpl();
    }

    public void persist(Client entity) {
        clientDao.openCurrentSessionwithTransaction();
        clientDao.persist(entity);
        clientDao.closeCurrentSessionwithTransaction();
    }

    public void update(Client entity) {
        clientDao.openCurrentSessionwithTransaction();
        clientDao.update(entity);
        clientDao.closeCurrentSessionwithTransaction();
    }

    public Client findById(Long id) {
        clientDao.openCurrentSession();
        Client client = clientDao.findById(id);
        clientDao.closeCurrentSession();
        return client;
    }

    public void delete(Long id) {
        clientDao.openCurrentSessionwithTransaction();
        Client client = clientDao.findById(id);
        clientDao.delete(client);
        clientDao.closeCurrentSessionwithTransaction();
    }

    public List<Client> findAll() {
        clientDao.openCurrentSession();
        List<Client> clientList = clientDao.findAll();
        clientDao.closeCurrentSession();
        return clientList;
    }

    public void deleteAll() {
        clientDao.openCurrentSessionwithTransaction();
        clientDao.deleteAll();
        clientDao.closeCurrentSessionwithTransaction();
    }

    public ClientDaoImpl clientDao() {
        return clientDao;
    }

}
