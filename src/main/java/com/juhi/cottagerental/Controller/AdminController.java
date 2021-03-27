package com.juhi.cottagerental.Controller;

import com.juhi.cottagerental.Data.CottageData;
import com.juhi.cottagerental.Model.CottageEntity;
import com.juhi.cottagerental.Model.ReservationEntity;
import com.juhi.cottagerental.Model.UserEntity;
import com.juhi.cottagerental.Repository.CottageRepository;
import com.juhi.cottagerental.Repository.ReservationRepository;
import com.juhi.cottagerental.Repository.UserRepository;
import com.juhi.cottagerental.Service.CottageService;
import com.juhi.cottagerental.Service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    CottageRepository cottageRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    CottageService cottageService;

    @Autowired
    ReservationService reservationService;

    @Autowired
    ReservationRepository reservationRepository;

    @GetMapping
    public String getAdminController(Model model) {
        List<CottageEntity> cottages = cottageRepository.findTop4ByOrderByCottageId();
        List<UserEntity> users = userRepository.findTop4ByOrderByUserIdDesc();

        model.addAttribute("cottages", cottages);
        model.addAttribute("users", users);

        return "admin/admin";
    }

    @GetMapping("/cottages")
    public String getCottagesAdmin(Model model) {
        List<CottageEntity> cottages = cottageRepository.findAll();

        model.addAttribute("cottages", cottages);

        return "admin/cottages";
    }

    @PostMapping("/cottages/delete-cottage")
    public String deleteCottageAdmin(@RequestParam String cottageId, HttpServletRequest req) {
        cottageRepository.delete(cottageRepository.findById(Integer.parseInt(cottageId)).orElse(null));
        return "redirect:" + req.getHeader("Referer");
    }

    @GetMapping("/cottages/{cottageId}")
    public String getCottageAdmin(@PathVariable("cottageId") String id, Model model) {
        Optional<CottageEntity> cg = cottageRepository.findById(Integer.parseInt(id));
        if(cg.isEmpty()) { return "error/404"; }
        model.addAttribute("cottage", cg);
        return "redirect:/cottages/{cottageId}";
    }

    @GetMapping("/cottages/add")
    public String getAddCottageAdmin(Model model) {

        model.addAttribute("cottage", new CottageData());

        return "admin/new_cottage";
    }

    @PostMapping("/cottages/add")
    public String addNewCottage(@Valid @ModelAttribute CottageData cottageData,
                                @AuthenticationPrincipal User user,
                                BindingResult result) {

        if(result.hasErrors()) {
            System.out.println(result);
            return "admin/new_cottage";
        }
        try {
            cottageData.setOwner(userRepository.findByUsername(user.getUsername()).getUserId());
            cottageService.addCottage(cottageData);
        } catch(Exception e) {
            e.printStackTrace();
            return "admin/new_cottage";
        }

        return "admin/new_cottage";
    }

    @GetMapping("/users")
    public String getUsersAdmin(Model model) {
        List<UserEntity> users = userRepository.findAllUsers();

        model.addAttribute("users", users);

        return "admin/users";
    }

    @PostMapping("users/toggle")
    public String toggleUserAdmin(@RequestParam String userId, HttpServletRequest req) {
        UserEntity user = userRepository.findById(Integer.parseInt(userId)).orElse(null);
        user.setEnabled((byte) (user.getEnabled() == 1 ? 0 : 1));
        userRepository.save(user);
        return "redirect:" + req.getHeader("Referer");
    }

    @PostMapping("users/delete")
    public String deleteUserAdmin(@RequestParam String deleteUserId, HttpServletRequest req) {
        userRepository.delete(userRepository.findById(Integer.parseInt(deleteUserId)).orElse(null));
        return "redirect:" + req.getHeader("Referer");
    }

    @GetMapping("/reservations")
    public String getReservationAdmin(Model model) {
        List<ReservationEntity> reservations = reservationRepository.findAll();

        model.addAttribute("reservations", reservations);

        return "admin/reservations";
    }

    @PostMapping("/reservations/delete")
    public String deleteReservationAdmin(@RequestParam String deleteReservationId, HttpServletRequest req) {
        reservationRepository.delete(reservationRepository.findReservationEntityByReservationId(Short.parseShort(deleteReservationId)));
        return "redirect:"+ req.getHeader("Referer");
    }
}
