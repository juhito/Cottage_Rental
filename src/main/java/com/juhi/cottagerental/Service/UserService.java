package com.juhi.cottagerental.Service;

import com.juhi.cottagerental.Data.UserData;
import com.juhi.cottagerental.Model.UserEntity;
import com.juhi.cottagerental.Model.UserRoleEntity;
import com.juhi.cottagerental.Repository.RolesRepository;
import com.juhi.cottagerental.Repository.UserRoleRepository;
import com.juhi.cottagerental.Repository.UserRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserRoleRepository userRoleRepository;

    @Autowired
    private RolesRepository rolesRepository;

    public void register(UserData userData) throws Exception {
        if(checkifUserExists(userData.getUsername())) {
            throw new Exception("User already exists");
        }
        else if(checkifEmailNotUnique(userData.getEmail())) {
            throw new Exception("Email already in use");
        }

        // Create and save user
        UserEntity userEntity = new UserEntity();
        BeanUtils.copyProperties(userData, userEntity);
        encodePassword(userEntity, userData);
        System.out.println("Saving user data...");
        userRepository.save(userEntity);

        // Assign user role

        UserRoleEntity userRoleEntity = new UserRoleEntity();
        userRoleEntity.setUserId(userRepository.findByUsername(userEntity.getUsername()).getUserId());
        userRoleEntity.setRoleId(rolesRepository.findByName("ROLE_USER").getRoleId());

        userRoleRepository.save(userRoleEntity);
    }

    public boolean checkifUserExists(String username) { return userRepository.findByName(username) != null; }

    public boolean checkifEmailNotUnique(String email) {
        return userRepository.findByEmail(email) != null;
    }

    private void encodePassword(UserEntity user, UserData userData) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        user.setPassword(passwordEncoder.encode(userData.getPassword()));
    }
}