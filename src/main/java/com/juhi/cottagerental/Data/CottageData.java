package com.juhi.cottagerental.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

public class CottageData implements Serializable {

    @NotNull
    @NotBlank
    private String name;

    @NotNull
    @NotBlank
    private String description;

    @NotNull
    @NotBlank
    private String location;

    @NotNull
    private short area;

    @NotNull
    private short people_size;

    @NotNull
    private int price;

    private int ownerId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public short getArea() {
        return area;
    }

    public void setArea(short area) {
        this.area = area;
    }

    public short getPeopleSize() { return people_size; }

    public void setPeopleSize(short people_size) { this.people_size = people_size; }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getOwnerId() { return ownerId; }

    public void setOwner(int ownerId) { this.ownerId = ownerId; }
}
