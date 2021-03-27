package com.juhi.cottagerental.Repository;

import com.juhi.cottagerental.Model.RolesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RolesRepository extends JpaRepository<RolesEntity, Integer> {

    @Query("SELECT r FROM RolesEntity r WHERE r.role = :role")
    public RolesEntity findByName(String role);
}
