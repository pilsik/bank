package by.lodochkina.bank.services;

import by.lodochkina.bank.dao.CityDaoImpl;
import by.lodochkina.bank.models.City;

import java.util.List;

public interface CityService {

    public void update(City entity);

    public City findById(Long id);

    public void delete(Long id);

    public List<City> findAll();

    public void deleteAll();

    public CityDaoImpl cityDao();
}

