package model;

import java.sql.Time;

public class Booking {

    private String ticketId;
    private final Passenger passenger;
    private final Flight flight;
    private String typeOfFlight;
    private String classOfFlight;


    public Booking( String ticketId,Passenger passenger,Flight flight, String typeOfFlight,String classOfFlight) {
        this.ticketId = ticketId;
        this.passenger = passenger;
        this.flight = flight;
        this.typeOfFlight = typeOfFlight;
        this.classOfFlight = classOfFlight;

    }

    public Passenger getPassenger() {
        return passenger;
    }

    public String getTicketId() {
        return ticketId;
    }

    public void setTicketId(String ticketId) {
        this.ticketId = ticketId;
    }


    public String getTypeOfFlight() {
        return typeOfFlight;
    }

    public void setTypeOfFlight(String typeOfFlight) {
        this.typeOfFlight = typeOfFlight;
    }

    public String getClassOfFlight() {
        return classOfFlight;
    }

    public void setClassOfFlight(String classOfFlight) {
        this.classOfFlight = classOfFlight;
    }

    public Flight getFlight() {
        return flight;
    }

}
