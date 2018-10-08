package by.lodochkina.bank.services;

import by.lodochkina.bank.dao.MaritalStatusDaoImpl;
import by.lodochkina.bank.models.MaritalStatus;

import java.util.List;

public interface MaritalStatusService {
    
    public void update(MaritalStatus entity);

    public MaritalStatus findById(Long id);

    public void delete(Long id);

    public List<MaritalStatus> findAll();

    public void deleteAll();

    public MaritalStatusDaoImpl maritalStatusDao();
}
