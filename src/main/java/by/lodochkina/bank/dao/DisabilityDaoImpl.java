package by.lodochkina.bank.dao;

import by.lodochkina.bank.models.Disability;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import java.util.List;

public class DisabilityDaoImpl implements DisabilityDao<Disability, Long> {

    private Session currentSession;

    private Transaction currentTransaction;

    public DisabilityDaoImpl() {
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

    public void persist(Disability entity) {
        getCurrentSession().save(entity);
    }

    public void update(Disability entity) {
        getCurrentSession().update(entity);
    }

    public Disability findById(Long id) {
        Disability disability = (Disability) getCurrentSession().get(Disability.class, id);
        return disability;
    }

    public void delete(Disability entity) {
        getCurrentSession().delete(entity);
    }

    @SuppressWarnings("unchecked")
    public List<Disability> findAll() {
        List<Disability> disabilityList = (List<Disability>) getCurrentSession().createQuery("from Disability").list();
        return disabilityList;
    }

    public void deleteAll() {
        List<Disability> entityList = findAll();
        for (Disability entity : entityList) {
            delete(entity);
        }
    }
}
