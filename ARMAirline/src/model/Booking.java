package model;

import java.sql.Time;

public class Booking {

    private String ticketId;
    private final Passenger passenger;
    private final Flight flight;
    private String typeOfFlight;
    private String classOfFlight;
    private double price;


    public Booking( String ticketId,Passenger passenger,Flight flight, String typeOfFlight,String classOfFlight, double price) {
        this.ticketId = ticketId;
        this.passenger = passenger;
        this.flight = flight;
        this.typeOfFlight = typeOfFlight;
        this.classOfFlight = classOfFlight;
        this.price = price;

    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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
