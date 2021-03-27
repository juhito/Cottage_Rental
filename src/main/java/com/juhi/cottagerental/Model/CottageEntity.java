package com.juhi.cottagerental.Model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "cottage", schema = "CRental")
public class CottageEntity {
    private int cottageId;
    private String name;
    private String description;
    private short area;
    private short peopleSize;
    private int price;
    private String location;
    private int ownerId;

    private UserEntity userByOwnerId;
    private Collection<ReservationEntity> reservationsByCottageId;

    @Id
    @Column(name = "cottage_id")
    public int getCottageId() {
        return cottageId;
    }

    public void setCottageId(int cottageId) {
        this.cottageId = cottageId;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "area")
    public short getArea() {
        return area;
    }

    public void setArea(short area) {
        this.area = area;
    }

    @Basic
    @Column(name = "people_size")
    public short getPeopleSize() {
        return peopleSize;
    }

    public void setPeopleSize(short peopleSize) {
        this.peopleSize = peopleSize;
    }

    @Basic
    @Column(name = "price")
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Basic
    @Column(name = "location")
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Basic
    @Column(name = "owner_id")
    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CottageEntity that = (CottageEntity) o;
        return cottageId == that.cottageId &&
                area == that.area &&
                peopleSize == that.peopleSize &&
                price == that.price &&
                ownerId == that.ownerId &&
                Objects.equals(name, that.name) &&
                Objects.equals(description, that.description) &&
                Objects.equals(location, that.location);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cottageId, name, description, area, peopleSize, price, location, ownerId);
    }

    @ManyToOne
    @JoinColumn(name = "owner_id", referencedColumnName = "user_id", nullable = false,
    insertable = false, updatable = false)
    public UserEntity getUserByOwnerId() {
        return userByOwnerId;
    }

    public void setUserByOwnerId(UserEntity userByOwnerId) {
        this.userByOwnerId = userByOwnerId;
    }

    @OneToMany(mappedBy = "cottageByCottageId")
    public Collection<ReservationEntity> getReservationsByCottageId() {
        return reservationsByCottageId;
    }

    public void setReservationsByCottageId(Collection<ReservationEntity> reservationsByCottageId) {
        this.reservationsByCottageId = reservationsByCottageId;
    }
}
