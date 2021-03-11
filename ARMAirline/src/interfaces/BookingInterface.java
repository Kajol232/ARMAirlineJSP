package interfaces;

import model.Booking;
import model.Flight;
import model.Passenger;

import java.sql.Time;
import java.util.List;

public interface BookingInterface {
    String createNewBooking(String seatNum, Passenger passenger, Flight flight, String typeOfFlight,
                             String classOfFlight,double payment);

    String updateBooking(Booking booking, String passId,String seatNum);

    boolean deleteBooking(String ticketId);
    Booking getBookingById(String ticketId);
    List<Booking> searchBooking(String query);
    List<Booking>getPassengerBookingLists(String id);
    List<Booking>getFlightBookingLists(String fId);

}
