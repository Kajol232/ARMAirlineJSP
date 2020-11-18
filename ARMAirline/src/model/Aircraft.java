package model;

public class Aircraft {
    private String name;
    private String status;
    private final String model;
    private  int capacity;


    public Aircraft( String model,String name, int capacity, String status) {
        this.model = model;
        this.name = name;
        this.capacity = capacity;
        this.status = status;
    }


    public int getCapacity() {
        return capacity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModel() {
        return model;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getStatus() {

        return status;
    }


    public void setStatus(String status) {
        this.status = status;
    }

    public String toString(){
        return "[" + this.model + ", " + this.name + this.capacity + "]";
    }

}
