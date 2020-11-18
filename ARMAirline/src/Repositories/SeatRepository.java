package Repositories;

import interfaces.SeatInterface;

import java.sql.*;

public class SeatRepository implements SeatInterface {
    final String FIRST_CLASS = "FirstClass";
    final String ECONOMY = "Economy";
    final String BUSINESS = "Business";

    private final Connection con;
    private PreparedStatement preparedStatement = null;
    private ResultSet rs = null;

    public SeatRepository() throws SQLException{

        con = DriverManager.getConnection("jdbc:sqlite:c://sqlite//ARMAirline_db.db");
        System.out.println("Database connected");
    }

    @Override
    public void createSeat(int capacity, String flightId) {
        int firstClass = (int) (capacity * 0.1);
        int business = (int) (capacity *0.3);
        int economy = (int) (capacity*0.6);
        try{
            preparedStatement = con.prepareStatement("insert into seat(flight_id, first_class, business, economy)" +
                    "VALUES (?,?,?,?) ");
            preparedStatement.setString(1, flightId);
            preparedStatement.setInt(2, firstClass);
            preparedStatement.setInt(3, business);
            preparedStatement.setInt(4, economy);
            preparedStatement.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }


    @Override
    public int assignSeat(String section, String flightId) throws SQLException {

        switch (section){
            case FIRST_CLASS:
                try {
                    preparedStatement = con.prepareStatement("select * from seat where flight_id =?");
                    preparedStatement.setString(1,flightId);
                    rs = preparedStatement.executeQuery();
                    while (rs.next()) {
                        int seatNum = rs.getInt(2);
                        if(seatNum > 0){
                            updateSeat(flightId, seatNum, section);
                            return seatNum;
                        }else if (seatNum <= 0){
                            return 0;
                            //when creating jsp find solution for getting other section while seats is full for a section.
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }finally {
                    try{
                        if (rs != null) rs.close();
                        if(preparedStatement != null) preparedStatement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                break;
            case ECONOMY:
                try {
                    preparedStatement = con.prepareStatement("select * from seat where flight_id=?");
                    preparedStatement.setString(1,flightId);
                    rs = preparedStatement.executeQuery();
                    while (rs.next()) {
                        int seatNum = rs.getInt(4);
                        if(seatNum > 0) {
                            updateSeat(flightId, seatNum, section);
                            return seatNum;
                        }else if (seatNum <= 0){
                            return 0;
                            //when creating jsp find solution for getting other section while seats is full for a section.
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }finally {
                    try{
                        if (rs != null) rs.close();
                        if(preparedStatement != null) preparedStatement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                break;
            case BUSINESS:
                try {
                    preparedStatement = con.prepareStatement("select * from seat where flight_id =?");
                    preparedStatement.setString(1,flightId);
                    rs = preparedStatement.executeQuery();
                    while (rs.next()) {
                        int seatNum = rs.getInt(3);
                        if (seatNum > 0) {
                            updateSeat(flightId, seatNum, section);
                            return seatNum;
                        }else if (seatNum <= 0){
                            return 0;
                           //when creating jsp find solution for getting other section while seats is full for a section.
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }finally {
                    try{
                        if (rs != null) rs.close();
                        if(preparedStatement != null) preparedStatement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                break;
            default:
                System.out.println("Invalid section selected");
        }

        return 0;
    }


    @Override
    public void updateSeat(String id, int seat, String section) {
        switch (section) {
            case FIRST_CLASS:
                try {
                    preparedStatement = con.prepareStatement("update seat set first_class = ? where flight_id = ? ");
                    preparedStatement.setInt(1, seat-1);
                    preparedStatement.setString(2, id);
                    preparedStatement.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                }finally {
                    try{
                        if(preparedStatement != null) preparedStatement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                break;
            case BUSINESS:
                try {
                    preparedStatement = con.prepareStatement("update seat set business = ? where flight_id = ? ");
                    preparedStatement.setInt(1, seat-1);
                    preparedStatement.setString(2, id);
                    preparedStatement.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                }finally {
                    try{
                        if(preparedStatement != null) preparedStatement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                break;
            case ECONOMY:
                try {
                    preparedStatement = con.prepareStatement("update seat set economy = ? where flight_id = ? ");
                    preparedStatement.setInt(1, seat-1);
                    preparedStatement.setString(2, id);
                    preparedStatement.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                }finally {
                    try{
                        if(preparedStatement != null) preparedStatement.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                break;
            default:

        }
    }

    public String getSection(int choice, String section1, String section2){
        if (choice == 1){
            return section1;
        }else if(choice == 2){
            return section2;
        }else
            return "invalid Selection";
    }

    @Override
    public void selectOtherSection(String section) {

    }

    public boolean deleteSeat(String model) {
        try {
            preparedStatement = con.prepareStatement("delete from seat where flight_id =?");
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
}
