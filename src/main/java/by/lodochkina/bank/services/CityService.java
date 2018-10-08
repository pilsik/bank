package by.lodochkina.bank.services;

import by.lodochkina.bank.dao.CityDao;
import by.lodochkina.bank.models.City;

import java.util.List;

public class CityService {
    
    private static CityDao cityDao;

    public CityService() {
        cityDao = new CityDao();
    }

    public void persist(City entity) {
        cityDao.openCurrentSessionwithTransaction();
        cityDao.persist(entity);
        cityDao.closeCurrentSessionwithTransaction();
    }

    public void update(City entity) {
        cityDao.openCurrentSessionwithTransaction();
        cityDao.update(entity);
        cityDao.closeCurrentSessionwithTransaction();
    }

    public City findById(Long id) {
        cityDao.openCurrentSession();
        City city = cityDao.findById(id);
        cityDao.closeCurrentSession();
        return city;
    }

    public void delete(Long id) {
        cityDao.openCurrentSessionwithTransaction();
        City city = cityDao.findById(id);
        cityDao.delete(city);
        cityDao.closeCurrentSessionwithTransaction();
    }

    public List<City> findAll() {
        cityDao.openCurrentSession();
        List<City> citys = cityDao.findAll();
        cityDao.closeCurrentSession();
        return citys;
    }

    public void deleteAll() {
        cityDao.openCurrentSessionwithTransaction();
        cityDao.deleteAll();
        cityDao.closeCurrentSessionwithTransaction();
    }

    public CityDao cityDao() {
        return cityDao;
    }
}
