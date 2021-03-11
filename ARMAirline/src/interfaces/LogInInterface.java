package interfaces;

public interface LogInInterface {
    boolean logIn(String email, String password, String type);
    boolean logOff(String email);
    boolean checkPassword(String email,String password);
    boolean checkAdminPassword(int id, String email,String password);
    boolean resetPassword(String email, String password);
    boolean resetAdminPassword(int id, String email, String password);
}
