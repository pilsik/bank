package by.lodochkina.bank.services;

import by.lodochkina.bank.dao.CitizenshipDaoImpl;
import by.lodochkina.bank.models.Citizenship;

import java.util.List;

public interface CitizenshipService {

    public void update(Citizenship entity);

    public Citizenship findById(Long id);

    public void delete(Long id);

    public List<Citizenship> findAll();

    public void deleteAll();

    public CitizenshipDaoImpl citizenshipDao();
}
