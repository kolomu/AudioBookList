package exceptions;

public class DaoException extends Exception {

    public DaoException() {
    }

    public DaoException(String message) {
        super(message);
    }
    
    public DaoException(String message, Exception cause) {
        super(message, cause);
    }
}
