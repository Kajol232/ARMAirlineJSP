package interfaces;

import java.sql.SQLException;

public interface SeatInterface {

    void createSeat(int capacity, String flightId);
    int assignSeat(String section, String flightId) throws SQLException;
    void updateSeat(String id, int seat, String section);
    String getSection(int choice, String section1, String section2);
    void selectOtherSection(String section);
}
