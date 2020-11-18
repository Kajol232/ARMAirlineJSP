package model;

import java.sql.Connection;

public class Seat {

    private final String flightId;
    private final int capacity;
    private int economy, firstClass,business;




    public Seat(String flightId, int capacity) {

        this.capacity = capacity;
        this.flightId = flightId;
        setEconomy();
        setBusiness();
        setFirstClass();
    }

    public String getFlightId() {
        return flightId;
    }

    public int getEconomy() {
        return economy;
    }

   private void setEconomy() {
        economy = (int) (capacity*0.6);
    }

    public int getFirstClass() {
        return firstClass;
    }

    private void setFirstClass() {
        firstClass = (int) (capacity * 0.1);
    }

    public int getBusiness() {
        return business;
    }

    private void setBusiness() {
        business = (int) (capacity *0.3);
    }

    public int getCapacity() {
        return capacity;
    }
}
