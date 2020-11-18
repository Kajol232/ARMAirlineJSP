package interfaces;

import model.Passenger;

import java.util.List;

public interface PassengerInterface {

   String createPassenger(String name, String mobile, String email, String address,String password);
   boolean updatePassenger(String id, String mobile, String email, String address,String password);
   boolean deletePassenger(String id, String password);
   Passenger getPassengerById(String id);
   List<Passenger> getPassengerList(String query);

}
