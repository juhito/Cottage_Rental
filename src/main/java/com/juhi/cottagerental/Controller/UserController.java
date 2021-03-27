package com.juhi.cottagerental.Controller;

import com.juhi.cottagerental.Model.UserEntity;
import com.juhi.cottagerental.Repository.ReservationRepository;
import com.juhi.cottagerental.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserRepository userRepository;

    @Autowired
    ReservationRepository reservationRepository;

    @GetMapping("{username}")
    @PreAuthorize("#username == authentication.principal.Username || hasRole('ADMIN')")
    public String getUser(@PathVariable String username, Model model) {
        UserEntity user = userRepository.findByUsername(username);
        if(user == null) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "User not found"
            );
        }
        model.addAttribute("user", user);
        return "profile";
    }

    @PostMapping("/delete-reservation")
    public String removeUserReservation(@RequestParam String deleteReservationId, HttpServletRequest req) {
        reservationRepository.delete(reservationRepository.findReservationEntityByReservationId(Short.parseShort(deleteReservationId)));
        return "redirect:" + req.getHeader("Referer");
    }
}
