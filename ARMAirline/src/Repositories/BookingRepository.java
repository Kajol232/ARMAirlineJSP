package Repositories;

import interfaces.BookingInterface;
import model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingRepository implements BookingInterface {
    private final Connection con;
    private PreparedStatement preparedStatement = null;
    private ResultSet rs = null;
    private final Generator gen = new Generator();
    private final List<Booking> bookingList = new ArrayList<>();
    private final FlightRepository flightRepository;
    private final PassengerRepository passengerRepository;

    public BookingRepository() throws SQLException {
        this.flightRepository = new FlightRepository();
        this.passengerRepository = new PassengerRepository();

        con = DriverManager.getConnection("jdbc:sqlite:c://sqlite//ARMAirline_db.db");
        System.out.println("Database connected");
    }

    @Override
    public String createNewBooking(String seatNum, Passenger passenger, Flight flight, String typeOfFlight,
                                    String classOfFlight, double payment) {
        Aircraft a  = flight.getAircraft();
        String code = a.getModel();
        String pass = passenger.getId();

        
        String ticketId = gen.genTicketId(seatNum, code, pass);
        try {
            preparedStatement = con.prepareStatement("insert into booking (ticket_id,flightId, passenger_id, passenger_name," +
                    " flight_type, flight_class, payment) values (?,?,?,?,?,?,?)");

            preparedStatement.setString(1,ticketId);
            preparedStatement.setString(2,code);
            preparedStatement.setString(3, pass);
            preparedStatement.setString(4,passenger.getName());
            preparedStatement.setString(5,typeOfFlight);
            preparedStatement.setString(6, classOfFlight);
            preparedStatement.setInt(7,(int) payment);

            int count = preparedStatement.executeUpdate();

            if (count > 0){
                String f = a.getModel();
                int c = flight.getCapacity();
                flightRepository.updateFlightCapacity(f,c);
                return ticketId;
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }finally {
            try{
                if (preparedStatement != null) preparedStatement.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public String updateBooking(Booking booking, String passId,String seatNum) {
        String tid = booking.getTicketId();
        Flight f = booking.getFlight();
        Aircraft a  = f.getAircraft();
        String code = a.getModel();


        String ticketId = gen.genTicketId(seatNum, code, passId);
        try {
            preparedStatement = con.prepareStatement("update booking set ticket_id = ?, " +
                    "flight_type =?,flight_class =?,payment=? where  passenger_Id =? AND  ticket_id =?");
            preparedStatement.setString(1, ticketId);
            preparedStatement.setString(2, booking.getTypeOfFlight());
            preparedStatement.setString(3, booking.getClassOfFlight());
            preparedStatement.setDouble(4,booking.getPrice());
            preparedStatement.setString(5, passId);
            preparedStatement.setString(6,tid);
            int count = preparedStatement.executeUpdate();

            if (count > 0){
                return ticketId;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if (preparedStatement != null) preparedStatement.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public boolean deleteBooking(String ticketId) {
        try {
            preparedStatement = con.prepareStatement("delete from booking where ticket_Id =?");
            preparedStatement.setString(1,ticketId);
            int count = preparedStatement.executeUpdate();

            if (count > 0){
                return true;
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if (preparedStatement != null) preparedStatement.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public Booking getBookingById(String ticketId) {
        try {
            preparedStatement = con.prepareStatement("select  * from booking where " +
                    "ticket_Id = ?");
            preparedStatement.setString(1, ticketId);
            rs = preparedStatement.executeQuery();

            while(rs.next()){
                String fid = rs.getString(2);
                String passId = rs.getString(3);
                String type= rs.getString(5);
                String classes = rs.getString(6);
                double pay = rs.getDouble(7);

                Passenger passenger = passengerRepository.getPassengerById(passId);
                Flight flight = flightRepository.getFlightByCode(fid);


                return new Booking(ticketId, passenger, flight,type, classes,pay);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if (rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }

        return null;
    }

    @Override
    public List<Booking> searchBooking(String query) {
        try {
            preparedStatement = con.prepareStatement("select * from booking where? " +
                    "in(ticket_Id,flightId, passenger_Id, passenger_name)");
            preparedStatement.setString(1, query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String ticketId = rs.getString(1);
                String fId = rs.getString(2);
                String passId = rs.getString(3);
                String type= rs.getString(5);
                String classes = rs.getString(6);
                double pay = rs.getDouble(7);


                Flight flight = flightRepository.getFlightByCode(fId);

                Passenger passenger = passengerRepository.getPassengerById(passId);

              Booking booking = new Booking(ticketId,passenger,flight,type,classes,pay);
              bookingList.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingList;
    }

    @Override
    public List<Booking> getPassengerBookingLists(String id) {
        try {
            preparedStatement = con.prepareStatement("select * from booking where passenger_id =?");
            preparedStatement.setString(1, id);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String ticketId = rs.getString(1);
                String fId = rs.getString(2);
                String type= rs.getString(5);
                String classes = rs.getString(6);
                double pay = rs.getDouble(7);

                Flight flight = flightRepository.getFlightByCode(fId);

                Passenger passenger = passengerRepository.getPassengerById(id);

                Booking booking = new Booking(ticketId,passenger,flight,type,classes,pay);
                bookingList.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingList;
    }

    @Override
    public List<Booking> getFlightBookingLists(String fId) {
        try {
            preparedStatement = con.prepareStatement("select * from booking where flightId =?");
            preparedStatement.setString(1, fId);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String ticketId = rs.getString(1);
                String id = rs.getString(3);
                String type= rs.getString(5);
                String classes = rs.getString(6);
                double pay = rs.getDouble(7);

                Flight flight = flightRepository.getFlightByCode(fId);

                Passenger passenger = passengerRepository.getPassengerById(id);

                Booking booking = new Booking(ticketId,passenger,flight,type,classes,pay);
                bookingList.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingList;
    }




}
