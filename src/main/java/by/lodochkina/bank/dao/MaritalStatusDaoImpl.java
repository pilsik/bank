package by.lodochkina.bank.dao;

import by.lodochkina.bank.models.MaritalStatus;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class MaritalStatusDaoImpl implements MaritalStatusDao<MaritalStatus, Long> {

    private Session currentSession;

    private Transaction currentTransaction;

    public MaritalStatusDaoImpl() {
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

    public void persist(MaritalStatus entity) {
        getCurrentSession().save(entity);
    }

    public void update(MaritalStatus entity) {
        getCurrentSession().update(entity);
    }

    public MaritalStatus findById(Long id) {
        MaritalStatus maritalStatus = (MaritalStatus) getCurrentSession().get(MaritalStatus.class, id);
        return maritalStatus;
    }

    public void delete(MaritalStatus entity) {
        getCurrentSession().delete(entity);
    }

    @SuppressWarnings("unchecked")
    public List<MaritalStatus> findAll() {
        List<MaritalStatus> maritalStatusList = (List<MaritalStatus>) getCurrentSession().createQuery("from MaritalStatus").list();
        return maritalStatusList;
    }

    public void deleteAll() {
        List<MaritalStatus> entityList = findAll();
        for (MaritalStatus entity : entityList) {
            delete(entity);
        }
    }
}
