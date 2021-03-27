package com.juhi.cottagerental.Data;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDate;

public class ReservationData implements Serializable {

    private int userId;

    private int cottageId;

    private int price;

    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-d")
    private LocalDate startingDate;

    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-d")
    private LocalDate endingDate;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCottageId() {
        return cottageId;
    }

    public void setCottageId(int cottageId) {
        this.cottageId = cottageId;
    }

    public LocalDate getStartingDate() {
        return startingDate;
    }

    public void setStartingDate(LocalDate startingDate) {
        this.startingDate = startingDate;
    }

    public LocalDate getEndingDate() {
        return endingDate;
    }

    public void setEndingDate(LocalDate endingDate) {
        this.endingDate = endingDate;
    }


    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
