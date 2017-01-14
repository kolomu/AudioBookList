package dbtest;

import dao.PersonDao;
import entity.Person;
import exceptions.DaoException;

public class PersonTest {
    public static void main(String[] args) {
        PersonDao dao;
        dao = new PersonDao();
        Person person;
        
       try {
           dao.createManager();
           person = dao.findOne(1);
           dao.closeManager();
           System.out.println(person.toString());
       } catch (DaoException e){
           e.printStackTrace();
       }
    }
}
