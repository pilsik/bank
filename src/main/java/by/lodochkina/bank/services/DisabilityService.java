package by.lodochkina.bank.services;

import by.lodochkina.bank.dao.DisabilityDaoImpl;
import by.lodochkina.bank.models.Disability;

import java.util.List;

public interface DisabilityService {

    public void persist(Disability entity);

    public void update(Disability entity);

    public Disability findById(Long id);

    public void delete(Long id);

    public List<Disability> findAll();

    public void deleteAll();

    public DisabilityDaoImpl disabilityDao();
    
}
