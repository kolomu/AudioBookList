package dao;

import entity.Person;
import exceptions.DaoException;
import javax.persistence.NoResultException;

public class PersonDao extends AbstractJpaDao<Person> {
    
    public PersonDao() {
        super(Person.class);
    }
    
    public Person searchPerson(String username) throws NoResultException, DaoException {
       Person person = null;
       createManager();
       person = (Person) em.createQuery("SELECT p FROM Person p WHERE p.username LIKE :username")
               .setParameter("userName", username).getSingleResult();
       closeManager();
       return person;
    }
    
}
