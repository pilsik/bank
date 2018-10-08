package by.lodochkina.bank.dao;

import by.lodochkina.bank.models.Citizenship;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class CitizenshipDaoImpl implements CitizenshipDao<Citizenship, Long> {

    private Session currentSession;

    private Transaction currentTransaction;

    public CitizenshipDaoImpl() {
    }

    public Session openCurrentSession() {
        currentSession = getSessionFactory().openSession();
        return currentSession;
    }

    public Session openCurrentSessionwithTransaction() {
        currentSession = getSessionFactory().openSession();
        currentTransaction = currentSession.beginTransaction();
        return currentSession;
    }

    public void closeCurrentSession() {
        currentSession.close();
    }

    public void closeCurrentSessionwithTransaction() {
        currentTransaction.commit();
        currentSession.close();
    }

    private static SessionFactory getSessionFactory() {
        Configuration configuration = new Configuration().configure();
        StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder()
                .applySettings(configuration.getProperties());
        SessionFactory sessionFactory = configuration.buildSessionFactory(builder.build());
        return sessionFactory;
    }

    public Session getCurrentSession() {
        return currentSession;
    }

    public void setCurrentSession(Session currentSession) {
        this.currentSession = currentSession;
    }

    public Transaction getCurrentTransaction() {
        return currentTransaction;
    }

    public void setCurrentTransaction(Transaction currentTransaction) {
        this.currentTransaction = currentTransaction;
    }

    public void persist(Citizenship entity) {
        getCurrentSession().save(entity);
    }

    public void update(Citizenship entity) {
        getCurrentSession().update(entity);
    }

    public Citizenship findById(Long id) {
        Citizenship citizenship = (Citizenship) getCurrentSession().get(Citizenship.class, id);
        return citizenship;
    }

    public void delete(Citizenship entity) {
        getCurrentSession().delete(entity);
    }

    @SuppressWarnings("unchecked")
    public List<Citizenship> findAll() {
        List<Citizenship> citizenshipList = (List<Citizenship>) getCurrentSession().createQuery("from Citizenship").list();
        return citizenshipList;
    }

    public void deleteAll() {
        List<Citizenship> entityList = findAll();
        for (Citizenship entity : entityList) {
            delete(entity);
        }
    }
}
