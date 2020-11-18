package interfaces;

import model.Aircraft;
import model.Flight;

import java.sql.SQLException;
import java.util.List;

public interface FlightInterface {

    boolean createNewFlight(Aircraft aircraft, String departure, String destination,
                            String date, double price);

    boolean updateFlight(Flight flight);

    boolean deleteFlight(String flightId);

    Flight getFlightByCode(String flightId);
    List<Flight> searchFlight(String query);
    String assignSeat(String flightId, String seatClass) throws SQLException;
    int getFlightCapacity(String flightId);
    void updateFlightCapacity(String flightId, int capacity);
    List<Flight> getAll();
    List<Flight> getAvailableFlight(String destination, String departure, String date);
    double getFlightPrice (String type, String grade, double price);

}
