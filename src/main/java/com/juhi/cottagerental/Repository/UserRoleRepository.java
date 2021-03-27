package com.juhi.cottagerental.Repository;

import com.juhi.cottagerental.Model.UserRoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRoleRepository extends JpaRepository<UserRoleEntity, Integer> {

    public UserRoleEntity findByUserId(Integer user_id);
}
