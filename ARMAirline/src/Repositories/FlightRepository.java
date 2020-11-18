package Repositories;

import interfaces.FlightInterface;
import model.Aircraft;
import model.Flight;
import model.Generator;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FlightRepository implements FlightInterface {
    private final Connection con;
    private PreparedStatement preparedStatement = null;
    private ResultSet rs = null;
    private Statement statement = null;
    private final Time departureTime;
    private List<Flight> flightList = new ArrayList<>();
    private final AircraftRepository aircraftRepository;
    private final SeatRepository seatRepository;



    public FlightRepository() throws SQLException {
        this.aircraftRepository = new AircraftRepository();
        this.seatRepository = new SeatRepository();
        Generator generator = new Generator();
        departureTime = generator.generateDepartureTime();
        //Connect to database
        con = DriverManager.getConnection("jdbc:sqlite:c://sqlite//ARMAirline_db.db");
        System.out.println("Database connected");

    }

    @Override
    public boolean createNewFlight(Aircraft aircraft, String departure, String destination, String date,double price) {
            String model = aircraft.getModel();
             int seat = aircraft.getCapacity();

        try {
            preparedStatement = con.prepareStatement("insert into flight (aircraft_model, departure, destination," +
                    " departure_time,departure_date,seat,price) VALUES (?,?,?,?,?,?,?) ");

            preparedStatement.setString(1, model);
            preparedStatement.setString(2, departure);
            preparedStatement.setString(3, destination);
            preparedStatement.setString(4, String.valueOf(departureTime));
            preparedStatement.setString(5, date);
            preparedStatement.setInt(6, seat);
            preparedStatement.setInt(7,(int) price);

            int count = preparedStatement.executeUpdate();
            if (count > 0) {
                aircraftRepository.updateAircraftStatus(model, "t");
                seatRepository.createSeat(seat, model);
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

    @Override
    public boolean updateFlight(Flight flight) {
        Aircraft aircraft = flight.getAircraft();
        try {
            preparedStatement = con.prepareStatement("update flight set destination =?," +
                    " departure =?, departure_date =?, departure_time =?, price = ? where aircraft_model = ?");

            preparedStatement.setString(1, flight.getDestination());
            preparedStatement.setString(2, flight.getDeparture());
            preparedStatement.setString(3, flight.getDate());
            preparedStatement.setString(4, String.valueOf(departureTime));
            preparedStatement.setInt(5, (int) flight.getPrice());
            preparedStatement.setString(6, aircraft.getModel());


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

    @Override
    public boolean deleteFlight(String flightId) {
        try {
            preparedStatement = con.prepareStatement("delete from flight " +
                    "where aircraft_model=?");

            preparedStatement.setString(1, flightId);
            int count = preparedStatement.executeUpdate();

            if (count > 0) {
                aircraftRepository.updateAircraftStatus(flightId, "f");

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

    @Override
    public Flight getFlightByCode(String flightId) {
        Aircraft aircraft = aircraftRepository.getAircraftByModel(flightId);
        try {
            preparedStatement = con.prepareStatement("select * from " +
                    "flight where aircraft_model =?");
            preparedStatement.setString(1, flightId);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String departure = rs.getString(2);
                String destination = rs.getString(3);
                String departureTime = rs.getString(4);
                String date = rs.getString(5);
                int seat = rs.getInt(6);
                double price = rs.getInt(7);
                return new Flight(aircraft,departure,destination,Time.valueOf(departureTime),date,seat, price);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (rs != null) rs.close();

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public List<Flight> searchFlight(String query) {

        try {
            preparedStatement = con.prepareStatement("select * from flight " +
                    "where ? in (aircraft_model,destination,departure,departure_date,departure_time)");
            preparedStatement.setString(1, query);
            rs = preparedStatement.executeQuery();

            getAllrs();


        } catch (SQLException e) {
            System.out.println("invalid query");
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return flightList;
    }

    @Override
    public String assignSeat(String flightId, String seatClass) throws SQLException {

        int cap = getFlightCapacity(flightId);

        if (cap > 0) {

            return seatRepository.assignSeat(seatClass,flightId) + seatClass.substring(0, 3);
        }
        return null;
    }

    @Override
    public int getFlightCapacity(String flightId) {
        try {
            preparedStatement = con.prepareStatement("select * from flight where aircraft_model = ?");
            preparedStatement.setString(1, flightId);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getInt(6);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (rs != null) rs.close();

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return 0;
    }

    @Override
    public void updateFlightCapacity(String flightId, int capacity) {

        try {
            preparedStatement = con.prepareStatement("update flight set seat =? where aircraft_model =?");
            preparedStatement.setInt(1, capacity-1);
            preparedStatement.setString(2, flightId);
            preparedStatement.executeUpdate();


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

    @Override
    public List<Flight> getAll() {
        try {
            String query = "select * from flight";
            statement = con.createStatement();
            rs = statement.executeQuery(query);

            getAllrs();
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

        return flightList;
    }

    private void getAllrs() throws SQLException {
        while (rs.next()) {
            String model = rs.getString(1);
            String departure = rs.getString(2);
            String destination = rs.getString(3);
            String departureTime = rs.getString(4);
            String departureDate = rs.getString(5);
            int capacity = rs.getInt(6);
            double price = rs.getInt(7);

            Aircraft aircraft = aircraftRepository.getAircraftByModel(model);
            Flight flight = new Flight(aircraft, departure,destination, Time.valueOf(departureTime),
                    departureDate, capacity,price);

            flightList.add(flight);
        }
    }


    @Override
    public List<Flight> getAvailableFlight(String destination, String departure,String date) {
        int count = 0;
        flightList = getAll();
        List<Flight> result = new ArrayList<>();
        for (Flight f:flightList) {
            String des = f.getDestination();
            String dep = f.getDeparture();
            String dat = f.getDate();
            int cap = f.getCapacity();

            if (dep.equalsIgnoreCase(departure) && des.equalsIgnoreCase(destination) && dat.equalsIgnoreCase(date)){
                if( cap > 0){
                result.add(f);
                count++;

                }else if(cap <= 0) {
                    Aircraft a = f.getAircraft();
                    String s = a.getModel();
                    deleteFlight(s);
                }
                }


            }
        if (count > 0){
            return result;

        }
        return null;
    }

    @Override
    public double getFlightPrice(String type, String grade, double price) {
        double gradePrice = getGradePrice(grade, price);
        if(type.equalsIgnoreCase("Return")){
            return gradePrice * 2;
        }else{
            return gradePrice;
        }
    }

    private double getGradePrice(String grade, double price){
        if (grade.equalsIgnoreCase("FirstClass")) {
            return (price + 10000);
        }else if (grade.equalsIgnoreCase("Business")){
            return (price + 5000);
        }else {
            return price;
        }
    }




}
