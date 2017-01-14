package dao;

import exceptions.DaoException;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public abstract class AbstractJpaDao<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    private static final EntityManagerFactory EMF = Persistence.createEntityManagerFactory("AudioBookList");
    protected Class<T> clazz;
    protected EntityManager em;

    public AbstractJpaDao(Class<T> clazz) {
        this.clazz = clazz;
    }

    public boolean isManagerSet() {
        return (em != null && em.isOpen());
    }

    public void createManager() throws DaoException {
        if (isManagerSet()) {
            return;
        }

        try {
            em = EMF.createEntityManager();
        } catch (IllegalStateException e) {
            throw new DaoException("Could not create Entity Manager", e);
        }
    }

    public EntityManager getManager() {
        return this.em;
    }

    public void beginTransaction() throws DaoException {
        try {
            em.getTransaction().begin();
        } catch (IllegalStateException e) {
            throw new DaoException("Could not begin the Transaction", e);
        }
    }

    public void commit() throws DaoException {
        try {
            em.getTransaction().commit();
        } catch (IllegalStateException e) {
            throw new DaoException("Could not commit the Transaction", e);
        }
    }

    public void closeManager() {
        if (isManagerSet()) {
            try {
                em.close();
            } catch (IllegalStateException e) {
                // do nothing, manager already closed
            }
        }
        em = null;
    }

    public final void setClazz(Class<T> clazzToSet) {
        this.clazz = clazzToSet;
    }

    public T findOne(long id) throws DaoException {
        System.out.println("FINDONE CLAZZ: " + clazz + "ID: " + id);
        if (id < 1) {
            throw new DaoException("ID has to be bigger than one");
        }
        T obj = em.find(this.clazz, id);
        return obj;
    }

    @SuppressWarnings("unchecked")
    public List<T> findAll() {
        return em.createQuery("SELECT a from " + clazz.getSimpleName() + " a").getResultList();
    }

    public void create(T entity) throws DaoException {
        beginTransaction();
        em.persist(entity);
        commit();
    }

    public T update(T entity) throws DaoException {
        T obj = null;
        beginTransaction();
        obj = em.merge(entity);
        commit();
        return obj;
    }

    public void delete(T entity) throws DaoException {
        beginTransaction();
        em.remove(entity);
        commit();
    }

    public void deleteById(long id) throws DaoException {
        T entity = findOne(id);
        if (entity == null) {
            throw new DaoException("no record found by id");
        }
        delete(entity);
    }
}
