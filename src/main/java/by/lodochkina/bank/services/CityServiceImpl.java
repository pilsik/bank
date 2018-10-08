package by.lodochkina.bank.services;

import by.lodochkina.bank.dao.CityDaoImpl;
import by.lodochkina.bank.models.City;

import java.util.List;

public class CityServiceImpl implements CityService{
    
    private static CityDaoImpl cityDao;

    public CityServiceImpl() {
        cityDao = new CityDaoImpl();
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
        List<City> cityList = cityDao.findAll();
        cityDao.closeCurrentSession();
        return cityList;
    }

    public void deleteAll() {
        cityDao.openCurrentSessionwithTransaction();
        cityDao.deleteAll();
        cityDao.closeCurrentSessionwithTransaction();
    }

    public CityDaoImpl cityDao() {
        return cityDao;
    }
}
