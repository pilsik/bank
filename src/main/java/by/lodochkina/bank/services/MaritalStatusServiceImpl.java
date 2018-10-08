package by.lodochkina.bank.services;

import by.lodochkina.bank.dao.MaritalStatusDaoImpl;
import by.lodochkina.bank.models.MaritalStatus;

import java.util.List;

public class MaritalStatusServiceImpl implements MaritalStatusService {

    private static MaritalStatusDaoImpl maritalStatusDao;

    public MaritalStatusServiceImpl() {
        maritalStatusDao = new MaritalStatusDaoImpl();
    }

    public void persist(MaritalStatus entity) {
        maritalStatusDao.openCurrentSessionwithTransaction();
        maritalStatusDao.persist(entity);
        maritalStatusDao.closeCurrentSessionwithTransaction();
    }

    public void update(MaritalStatus entity) {
        maritalStatusDao.openCurrentSessionwithTransaction();
        maritalStatusDao.update(entity);
        maritalStatusDao.closeCurrentSessionwithTransaction();
    }

    public MaritalStatus findById(Long id) {
        maritalStatusDao.openCurrentSession();
        MaritalStatus maritalStatus = maritalStatusDao.findById(id);
        maritalStatusDao.closeCurrentSession();
        return maritalStatus;
    }

    public void delete(Long id) {
        maritalStatusDao.openCurrentSessionwithTransaction();
        MaritalStatus maritalStatus = maritalStatusDao.findById(id);
        maritalStatusDao.delete(maritalStatus);
        maritalStatusDao.closeCurrentSessionwithTransaction();
    }

    public List<MaritalStatus> findAll() {
        maritalStatusDao.openCurrentSession();
        List<MaritalStatus> maritalStatusList = maritalStatusDao.findAll();
        maritalStatusDao.closeCurrentSession();
        return maritalStatusList;
    }

    public void deleteAll() {
        maritalStatusDao.openCurrentSessionwithTransaction();
        maritalStatusDao.deleteAll();
        maritalStatusDao.closeCurrentSessionwithTransaction();
    }

    public MaritalStatusDaoImpl maritalStatusDao() {
        return maritalStatusDao;
    }
}
