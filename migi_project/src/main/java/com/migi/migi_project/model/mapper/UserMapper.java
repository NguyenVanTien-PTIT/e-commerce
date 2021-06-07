package com.migi.migi_project.model.mapper;

import com.migi.migi_project.entity.User;
import com.migi.migi_project.model.dto.UserDTO;
import org.springframework.security.crypto.bcrypt.BCrypt;

public class UserMapper {
    public static UserDTO toUserDTO(User user){
        return new UserDTO(user.getId(), user.getUsername(), user.getPassword(),
                            user.getFullname(),user.getPhoneNumber(),
                            user.getAddress(), user.getCreateDate());
    }

    public static User toUser(UserDTO userDTO){
        User user= new User();
        user.setId(userDTO.getId());
        user.setUsername(userDTO.getUsername());
        // Hash password using BCrypt
        String hash = BCrypt.hashpw(userDTO.getPassword(), BCrypt.gensalt(12));
        user.setPassword(hash);
        user.setFullname(userDTO.getFullname());
        user.setPhoneNumber(userDTO.getPhoneNumber());
        user.setAddress(userDTO.getAddress());
        user.setCreateDate(userDTO.getCreateDate());
        return user;
    }
}
