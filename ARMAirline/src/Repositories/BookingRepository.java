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
            preparedStatement = con.prepareStatement("insert into booking (ticket_id, passenger_id, passenger_name," +
                    " flight_type, flight_class,destination,departure, date,time, payment) values (?,?,?,?,?,?,?,?,?,?)");

            preparedStatement.setString(1,ticketId);
            preparedStatement.setString(2, pass);
            preparedStatement.setString(3,passenger.getName());
            preparedStatement.setString(4,typeOfFlight);
            preparedStatement.setString(5, classOfFlight);
            preparedStatement.setString(6, flight.getDestination());
            preparedStatement.setString(7, flight.getDeparture());
            preparedStatement.setString(8,flight.getDate());
            preparedStatement.setString(9, String.valueOf(flight.getDepartureTime()));
            preparedStatement.setInt(10,(int) payment);

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
    public boolean updateBooking(Booking booking, String passId) {
        try {
            preparedStatement = con.prepareStatement("update booking set ticket_id = ?, " +
                    "flight_type =?,flight_class =? where  passenger_Id =?");
            preparedStatement.setString(1, booking.getTicketId());
            preparedStatement.setString(2, booking.getTypeOfFlight());
            preparedStatement.setString(2, booking.getClassOfFlight());
            preparedStatement.setString(4, passId);
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
        String flightId = ticketId.substring(0, 7);
        Flight flight = flightRepository.getFlightByCode(flightId);
        try {
            preparedStatement = con.prepareStatement("select  * from booking where " +
                    "ticket_Id = ?");
            preparedStatement.setString(1, ticketId);
            rs = preparedStatement.executeQuery();

            while(rs.next()){
                String passId = rs.getString(2);
                String type= rs.getString(4);
                String classes = rs.getString(5);

                Passenger passenger = passengerRepository.getPassengerById(passId);


                return new Booking(ticketId, passenger, flight,type, classes);
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
                    "in(ticket_Id, passenger_Id, passenger_name, destination, departure, date, time)");
            preparedStatement.setString(1, query);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String ticketId = rs.getString(1);
                String passId = rs.getString(2);
                String type= rs.getString(4);
                String classes = rs.getString(5);

                String flightId = ticketId.substring(0, 7);
                Flight flight = flightRepository.getFlightByCode(flightId);

                Passenger passenger = passengerRepository.getPassengerById(passId);

              Booking booking = new Booking(ticketId,passenger,flight,type,classes);
              bookingList.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingList;
    }


}
