package com.juhi.cottagerental.Model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "user", schema = "CRental")
public class UserEntity {
    private int userId;
    private String username;
    private String name;
    private String email;
    private String password;
    private byte enabled;

    private Collection<CottageEntity> cottagesByUserId;
    private Collection<ReservationEntity> reservationsByUserId;
    private UserRoleEntity userRoleByUserId;

    @Id
    @Column(name = "user_id")
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "enabled")
    public byte getEnabled() {
        return enabled;
    }

    public void setEnabled(byte enabled) {
        this.enabled = enabled;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserEntity that = (UserEntity) o;
        return userId == that.userId &&
                enabled == that.enabled &&
                Objects.equals(username, that.username) &&
                Objects.equals(name, that.name) &&
                Objects.equals(email, that.email) &&
                Objects.equals(password, that.password);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, username, name, email, password, enabled);
    }

    @OneToMany(mappedBy = "userByOwnerId")
    public Collection<CottageEntity> getCottagesByUserId() {
        return cottagesByUserId;
    }

    public void setCottagesByUserId(Collection<CottageEntity> cottagesByUserId) {
        this.cottagesByUserId = cottagesByUserId;
    }

    @OneToMany(mappedBy = "userByUserId")
    public Collection<ReservationEntity> getReservationsByUserId() {
        return reservationsByUserId;
    }

    public void setReservationsByUserId(Collection<ReservationEntity> reservationsByUserId) {
        this.reservationsByUserId = reservationsByUserId;
    }

    @OneToOne(mappedBy = "userByUserId")
    public UserRoleEntity getUserRoleByUserId() {
        return userRoleByUserId;
    }

    public void setUserRoleByUserId(UserRoleEntity userRoleByUserId) {
        this.userRoleByUserId = userRoleByUserId;
    }
}
