package com.juhi.cottagerental.Controller;

import com.juhi.cottagerental.Data.UserData;
import com.juhi.cottagerental.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.ConstraintViolationException;
import javax.validation.Valid;
import java.util.HashSet;

@Controller
public class RegisterController {

    @Autowired
    UserService userService;

    @GetMapping("/register")
    public String showRegisterPage(Model model) {
        model.addAttribute("user", new UserData());
        return "register";
    }

    @PostMapping("/register")
    public String userRegistration(@Valid @ModelAttribute UserData userData,
                                   BindingResult result,
                                   Model model) {

        if(result.hasErrors()) {
            System.out.println(result);
            model.addAttribute("errors", result);
            return "register";
        }
        try {
            System.out.println("trying to register user");
            userService.register(userData);
        } catch(Exception e) {
            e.printStackTrace();
            return "register";
        }

        return "redirect:/";
    }
}
