package Repositories;

import interfaces.PassengerInterface;
import model.Generator;
import model.Passenger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PassengerRepository implements PassengerInterface {

    private final Connection con;
    private PreparedStatement preparedStatement = null;
    private ResultSet rs = null;
    private List<Passenger> passengerList = new ArrayList<>();
    private Generator gen;

    public PassengerRepository() throws SQLException {
        gen = new Generator();

        con = DriverManager.getConnection("jdbc:sqlite:c://sqlite//ARMAirline_db.db");
        System.out.println("Database connected");
    }
    @Override
    public String createPassenger(String name, String mobile, String email, String address, String password) {
        String id = gen.genPassengerId(name);

        try {
            preparedStatement = con.prepareStatement("insert into passenger (id, name,mobile, " +
                    "email, address,password)values (?,?,?,?,?,?)");
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, mobile);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, address);
            preparedStatement.setString(6,password);

            int count = preparedStatement.executeUpdate();
            if (count > 0){
                return id;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try{
                if (preparedStatement != null) preparedStatement.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return  null;
    }

    @Override
    public boolean updatePassenger(String id, String mobile, String email, String address, String password) {
        try {
            preparedStatement = con.prepareStatement("update passenger set " +
                    " mobile =?, email =?, address =? where id =? and password = ?");

            preparedStatement.setString(1, mobile);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, address);
            preparedStatement.setString(4, id);
            preparedStatement.setString(5, password);
            int count = preparedStatement.executeUpdate();

            if (count > 0){
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public boolean deletePassenger(String id, String password) {
        try {
            preparedStatement = con.prepareStatement("delete from passenger where id =? and password = ?");

            preparedStatement.setString(1, id);
            preparedStatement.setString(2, password);
            int count = preparedStatement.executeUpdate();

            if (count > 0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public Passenger getPassengerById(String id) {
        try {
            preparedStatement = con.prepareStatement("select * from " +
                    "passenger where id =?");
            preparedStatement.setString(1, id);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString(2);
                String mobile = rs.getString(3);
                String email = rs.getString(4);
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

    @Override
    public List<Passenger> getPassengerList(String query) {
        try {
            preparedStatement = con.prepareStatement("select * from passenger " +
                    "where ? in (id, name, mobile,email, address)");
            preparedStatement.setString(1, query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String mobile = rs.getString(3);
                String email = rs.getString(4);
                String address = rs.getString(5);

                Passenger passenger = new Passenger(id, name, mobile, email,address);

                passengerList.add(passenger);

            }

        } catch (SQLException e) {
            System.out.println("Invalid query");
            e.printStackTrace();
        }finally {
            try {
                if (rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return passengerList;
    }
}
