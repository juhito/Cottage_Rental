package com.juhi.cottagerental.Model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "roles", schema = "CRental")
public class RolesEntity {
    private int roleId;
    private String role;

    private Collection<UserRoleEntity> userRolesByRoleId;

    @Id
    @Column(name = "role_id")
    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Basic
    @Column(name = "role")
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RolesEntity that = (RolesEntity) o;
        return roleId == that.roleId &&
                Objects.equals(role, that.role);
    }

    @Override
    public int hashCode() {
        return Objects.hash(roleId, role);
    }

    @OneToMany(mappedBy = "rolesByRoleId")
    public Collection<UserRoleEntity> getUserRolesByRoleId() {
        return userRolesByRoleId;
    }

    public void setUserRolesByRoleId(Collection<UserRoleEntity> userRolesByRoleId) {
        this.userRolesByRoleId = userRolesByRoleId;
    }
}
