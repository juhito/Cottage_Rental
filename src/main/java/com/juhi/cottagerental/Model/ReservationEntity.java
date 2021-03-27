package com.juhi.cottagerental.Model;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Objects;

@Entity
@Table(name = "reservation", schema = "CRental")
public class ReservationEntity {
    private short reservationId;
    private int userId;
    private int cottageId;
    private int price;
    private LocalDate endingDate;
    private LocalDate startingDate;

    private UserEntity userByUserId;
    private CottageEntity cottageByCottageId;

    @Id
    @Column(name = "reservation_id")
    public short getReservationId() {
        return reservationId;
    }

    public void setReservationId(short reservationId) {
        this.reservationId = reservationId;
    }

    @Basic
    @Column(name = "user_id")
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "cottage_id")
    public int getCottageId() {
        return cottageId;
    }

    public void setCottageId(int cottageId) {
        this.cottageId = cottageId;
    }

    @Basic
    @Column(name = "price")
    public int getPrice() { return price; }

    public void setPrice(int price) { this.price = price; }

    @Basic
    @Column(name = "ending_date")
    public LocalDate getEndingDate() {
        return endingDate;
    }

    public void setEndingDate(LocalDate endingDate) {
        this.endingDate = endingDate;
    }

    @Basic
    @Column(name = "starting_date")
    public LocalDate getStartingDate() {
        return startingDate;
    }

    public void setStartingDate(LocalDate startingDate) {
        this.startingDate = startingDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ReservationEntity that = (ReservationEntity) o;
        return reservationId == that.reservationId &&
                userId == that.userId &&
                cottageId == that.cottageId &&
                Objects.equals(endingDate, that.endingDate) &&
                Objects.equals(startingDate, that.startingDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(reservationId, userId, cottageId, endingDate, startingDate);
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id", nullable = false,
    insertable = false, updatable = false)
    public UserEntity getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(UserEntity userByUserId) {
        this.userByUserId = userByUserId;
    }

    @ManyToOne
    @JoinColumn(name = "cottage_id", referencedColumnName = "cottage_id", nullable = false,
    insertable = false, updatable = false)
    public CottageEntity getCottageByCottageId() {
        return cottageByCottageId;
    }

    public void setCottageByCottageId(CottageEntity cottageByCottageId) {
        this.cottageByCottageId = cottageByCottageId;
    }
}
