package by.lodochkina.bank.services;

import by.lodochkina.bank.dao.DisabilityDaoImpl;
import by.lodochkina.bank.models.Disability;

import java.util.List;

public class DisabilityServiceImpl implements DisabilityService {

    private static DisabilityDaoImpl disabilityDao;

    public DisabilityServiceImpl() {
        disabilityDao = new DisabilityDaoImpl();
    }

    public void persist(Disability entity) {
        disabilityDao.openCurrentSessionwithTransaction();
        disabilityDao.persist(entity);
        disabilityDao.closeCurrentSessionwithTransaction();
    }

    public void update(Disability entity) {
        disabilityDao.openCurrentSessionwithTransaction();
        disabilityDao.update(entity);
        disabilityDao.closeCurrentSessionwithTransaction();
    }

    public Disability findById(Long id) {
        disabilityDao.openCurrentSession();
        Disability disability = disabilityDao.findById(id);
        disabilityDao.closeCurrentSession();
        return disability;
    }

    public void delete(Long id) {
        disabilityDao.openCurrentSessionwithTransaction();
        Disability disability = disabilityDao.findById(id);
        disabilityDao.delete(disability);
        disabilityDao.closeCurrentSessionwithTransaction();
    }

    public List<Disability> findAll() {
        disabilityDao.openCurrentSession();
        List<Disability> disabilityList = disabilityDao.findAll();
        disabilityDao.closeCurrentSession();
        return disabilityList;
    }

    public void deleteAll() {
        disabilityDao.openCurrentSessionwithTransaction();
        disabilityDao.deleteAll();
        disabilityDao.closeCurrentSessionwithTransaction();
    }

    public DisabilityDaoImpl disabilityDao() {
        return disabilityDao;
    }
}
