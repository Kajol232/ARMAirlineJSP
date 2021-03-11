package Repositories;

import interfaces.LogInInterface;
import model.Passenger;

import java.sql.*;

public class LogInRepository implements LogInInterface {
    private final Connection con;
    private PreparedStatement preparedStatement = null;
    private ResultSet rs = null;


    public LogInRepository() throws SQLException {
        con = DriverManager.getConnection("jdbc:sqlite:c://sqlite//ARMAirline_db.db");
        System.out.println("Database connected");
    }

    @Override
    public boolean logIn(String email, String password, String type) {
        boolean check= checkPassword(email,password);
        if (check){
            try{
                preparedStatement = con.prepareStatement("insert into login (email, password, type) " +
                        "values (?,?,?)");
                preparedStatement.setString(1,email);
                preparedStatement.setString(2,password);
                preparedStatement.setString(3,type);

                int count = preparedStatement.executeUpdate();

                if (count > 0){
                    return true;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try{
                    if (preparedStatement != null) preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return false;
    }

    @Override
    public boolean logOff(String email) {
        try{
            preparedStatement = con.prepareStatement("delete from login where email = ?");
            preparedStatement.setString(1, email);
            int count = preparedStatement.executeUpdate();
            if (count > 0){
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if (preparedStatement != null) preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public boolean checkPassword(String email,String password) {
        try{
            preparedStatement=con.prepareStatement("select password from passenger where email =?");
            preparedStatement.setString(1,email);
            rs = preparedStatement.executeQuery();
            while (rs.next()){
                String pswd = rs.getString(6);

                if(pswd.equals(password)){
                    return true;
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if(rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public boolean checkAdminPassword(int id, String email, String password) {
        try{
            preparedStatement=con.prepareStatement("select password from admin where email =? AND id=?");
            preparedStatement.setString(1,email);
            preparedStatement.setInt(2,id);
            rs = preparedStatement.executeQuery();
            while (rs.next()){
                String pswd = rs.getString(4);

                if(pswd.equals(password)){
                    return true;
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if(rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }


    @Override
    public boolean resetPassword(String email, String password) {
        try{
            preparedStatement = con.prepareStatement("update passenger set password = ? where email = ?");
            preparedStatement.setString(1,password);
            preparedStatement.setString(2,email);

            int count = preparedStatement.executeUpdate();
            if (count >0){
                return  true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if (preparedStatement != null) preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public boolean resetAdminPassword(int id, String email, String password) {
        try{
            preparedStatement = con.prepareStatement("update admin set password = ? where email = ? AND id =?");
            preparedStatement.setString(1,password);
            preparedStatement.setString(2,email);
            preparedStatement.setInt(3,id);

            int count = preparedStatement.executeUpdate();
            if (count >0){
                return  true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if (preparedStatement != null) preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public Passenger getPassengerByEmail(String email) {
        try {
            preparedStatement = con.prepareStatement("select * from " +
                    "passenger where email =?");
            preparedStatement.setString(1, email);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String mobile = rs.getString(3);
                String address = rs.getString(5);

                return new Passenger(id, name, mobile, email, address);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if(rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
