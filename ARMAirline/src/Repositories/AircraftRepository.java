package Repositories;

import model.Aircraft;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AircraftRepository {
    private final Connection con;
    private PreparedStatement preparedStatement = null;
    private ResultSet rs = null;
    private Statement statement = null;
    private final List<Aircraft> aircraftList = new ArrayList<>();

    public AircraftRepository() throws SQLException {
        //Connect to database
        con = DriverManager.getConnection("jdbc:sqlite:c://sqlite//ARMAirline_db.db");
        System.out.println("Database connected");
    }

    public boolean createAircraft(String name, String model, int capacity) {
        String s = "f";
        try {
            preparedStatement = con.prepareStatement("insert into aircraft(name,capacity,model,status)" +
                    "values (?,?,?,?)");


            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, capacity);
            preparedStatement.setString(3, model);
            preparedStatement.setString(4, s);

            int count = preparedStatement.executeUpdate();

            if (count > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }

    public boolean updateAircraft(Aircraft aircraft) {
        try {
            preparedStatement = con.prepareStatement("update aircraft set name =?, capacity=? where model = ?");
            preparedStatement.setString(1, aircraft.getName());
            preparedStatement.setInt(2, aircraft.getCapacity());
            preparedStatement.setString(3, aircraft.getModel());
            int count = preparedStatement.executeUpdate();
            if (count > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }

    public Aircraft getAircraftByModel(String model) {
        try {
            preparedStatement = con.prepareStatement("select * from aircraft where model = ?");
            preparedStatement.setString(1, model);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString(2);
                int capacity = rs.getInt(3);
                String status = rs.getString(4);

                return new Aircraft(model, name, capacity, status);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if(rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    public List<Aircraft> searchAircraft(String query) {

        try {
            preparedStatement = con.prepareStatement("select * from aircraft where ? in (name,model)");
            preparedStatement.setString(1, query);
            rs = preparedStatement.executeQuery();
            getLists(rs);


        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                if (rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return aircraftList;
    }

    public boolean deleteAircraft(String model) {
        try {
            preparedStatement = con.prepareStatement("delete from aircraft where model =?");
            preparedStatement.setString(1, model);
            int count = preparedStatement.executeUpdate();

            if (count > 0) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (preparedStatement != null) preparedStatement.close();

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }

    public List<Aircraft> getAircraftList() {
        try {
            String query = "select * from aircraft";
            statement = con.createStatement();
            rs = statement.executeQuery(query);

            getLists(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (rs != null) rs.close();
                if (statement != null) statement.close();

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return aircraftList;
    }



    public List<Aircraft> getAvailableAircraft() {
        try {
            String query = "select * from aircraft where status ='f' ";
            statement = con.createStatement();
            rs = statement.executeQuery(query);
            getLists(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (rs != null) rs.close();
                if (statement != null) statement.close();

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return aircraftList;
    }
    private void getLists(ResultSet rs) throws SQLException {
        while (rs.next()) {
            String model = rs.getString(1);
            String name = rs.getString(2);
            int capacity = rs.getInt(3);
            String status = rs.getString(4);

            Aircraft aircraft = new Aircraft(model, name, capacity, status);

            aircraftList.add(aircraft);
        }
    }



    public void updateAircraftStatus(String model, String s) {
        try {
            preparedStatement = con.prepareStatement("update aircraft set status = ? where model = ? ");
            preparedStatement.setString(1,s);
            preparedStatement.setString(1, model);



        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
