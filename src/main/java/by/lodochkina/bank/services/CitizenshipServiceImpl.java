package by.lodochkina.bank.services;

import by.lodochkina.bank.dao.CitizenshipDaoImpl;
import by.lodochkina.bank.models.Citizenship;

import java.util.List;

public class CitizenshipServiceImpl implements CitizenshipService {

    private static CitizenshipDaoImpl citizenshipDao;

    public CitizenshipServiceImpl() {
        citizenshipDao = new CitizenshipDaoImpl();
    }

    public void persist(Citizenship entity) {
        citizenshipDao.openCurrentSessionwithTransaction();
        citizenshipDao.persist(entity);
        citizenshipDao.closeCurrentSessionwithTransaction();
    }

    public void update(Citizenship entity) {
        citizenshipDao.openCurrentSessionwithTransaction();
        citizenshipDao.update(entity);
        citizenshipDao.closeCurrentSessionwithTransaction();
    }

    public Citizenship findById(Long id) {
        citizenshipDao.openCurrentSession();
        Citizenship citizenship = citizenshipDao.findById(id);
        citizenshipDao.closeCurrentSession();
        return citizenship;
    }

    public void delete(Long id) {
        citizenshipDao.openCurrentSessionwithTransaction();
        Citizenship citizenship = citizenshipDao.findById(id);
        citizenshipDao.delete(citizenship);
        citizenshipDao.closeCurrentSessionwithTransaction();
    }

    public List<Citizenship> findAll() {
        citizenshipDao.openCurrentSession();
        List<Citizenship> citizenshipList = citizenshipDao.findAll();
        citizenshipDao.closeCurrentSession();
        return citizenshipList;
    }

    public void deleteAll() {
        citizenshipDao.openCurrentSessionwithTransaction();
        citizenshipDao.deleteAll();
        citizenshipDao.closeCurrentSessionwithTransaction();
    }

    public CitizenshipDaoImpl citizenshipDao() {
        return citizenshipDao;
    }

}
