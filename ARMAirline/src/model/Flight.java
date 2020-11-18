package model;


import java.sql.Time;

public class Flight {
    private String departure, destination;
    private final Time departureTime;
    private String date;
    private int capacity;
    private final double price;
    private final Aircraft aircraft;

    public Flight(Aircraft aircraft, String departure, String destination, Time departureTime,
                  String date, int capacity, double price) {
        this.aircraft = aircraft;
        this.departure = departure;
        this.destination = destination;
        this.departureTime = departureTime;
        this.date = date;
        this.capacity =capacity;
        this.price = price;

    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Time getDepartureTime() {
        return departureTime;
    }


    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCapacity() {
        return capacity;
    }

    public Aircraft getAircraft() {
        return aircraft;
    }

    public double getPrice() {
        return price;
    }

}
