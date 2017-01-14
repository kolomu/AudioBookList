package standard;

public class StringUtils {

    public static boolean isNullOrEmpty(String value) {
        if (value == null) {
            return true;
        }
        if (value.trim().isEmpty()) {
            return true;
        } else {
            return false;
        }
    }
    
    
}
