package com.juhi.cottagerental.Repository;

import com.juhi.cottagerental.Model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface UserRepository extends JpaRepository<UserEntity, Integer> {
    public UserEntity findByEmail(String email);
    public UserEntity findByName(String name);

    public List<UserEntity> findTop4ByOrderByUserIdDesc();

    @Query("SELECT u FROM UserEntity u WHERE u.username = :username")
    public UserEntity findByUsername(String username);

    @Query("SELECT u FROM UserEntity u WHERE u.userRoleByUserId.rolesByRoleId.role = 'ROLE_USER'")
    public List<UserEntity> findAllUsers();
}
