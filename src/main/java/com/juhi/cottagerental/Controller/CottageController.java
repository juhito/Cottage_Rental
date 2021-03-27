package com.juhi.cottagerental.Controller;

import com.juhi.cottagerental.Data.ReservationData;
import com.juhi.cottagerental.Model.CottageEntity;
import com.juhi.cottagerental.Model.ReservationEntity;
import com.juhi.cottagerental.Repository.CottageRepository;
import com.juhi.cottagerental.Repository.ReservationRepository;
import com.juhi.cottagerental.Repository.UserRepository;
import com.juhi.cottagerental.Service.CottageService;
import com.juhi.cottagerental.Service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
public class CottageController {

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

    @GetMapping("/cottages")
    public String listCottages(Model model) {
        List<CottageEntity> cottages = cottageRepository.findAll();

        model.addAttribute("cottages", cottages);

        return "cottages";
    }

    @GetMapping("/cottages/{cottageId}")
    public String getCottage(@PathVariable("cottageId") String id, Model model) {
        CottageEntity cg = cottageRepository.findById(Integer.parseInt(id)).orElse(null);
        if(cg == null) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "Cottage not found"
            );
        }
        ArrayList<List<LocalDate>> reservations = new ArrayList<>();

        for (ReservationEntity r : cg.getReservationsByCottageId()) {
            List<LocalDate> d = getDatesInBetween(r.getStartingDate(), r.getEndingDate());
            reservations.add(d);
        }

        model.addAttribute("cottage", cg);
        model.addAttribute("reservation", new ReservationData());
        model.addAttribute("reservation_data", reservations);
        return "cottage";
    }

    @PostMapping("/cottages/{cottageId}/book")
    public String bookCottage(@Valid @PathVariable("cottageId") String id,
                              @Valid @ModelAttribute ReservationData reservationData,
                              BindingResult result,
                              @AuthenticationPrincipal User user,
                              RedirectAttributes redirectAttributes) {
        System.out.println("ReservationData: " + reservationData.getStartingDate() + ", " + reservationData.getEndingDate());

        if(result.hasErrors()) {
            System.out.println(result);
            redirectAttributes.addFlashAttribute("errors", result);
            return "redirect:/cottages/{cottageId}";
        }
        try {

            CottageEntity cottage = cottageRepository.findById(Integer.parseInt(id)).orElse(null);
            List<ReservationEntity> reservation = reservationRepository.findByCottageByCottageId(cottage);

            for (ReservationEntity e : reservation) {
                List<LocalDate> dates = getDatesInBetween(e.getStartingDate(), e.getEndingDate());
                List<LocalDate> rdates = getDatesInBetween(reservationData.getStartingDate(), reservationData.getEndingDate());

                for(LocalDate d : rdates) {
                    if(dates.contains(d)) {
                        redirectAttributes.addFlashAttribute("errors", "Cottage was already booked during that timeperiod, sorry.");
                        return "redirect:/cottages/{cottageId}";
                    }
                }
            }


            reservationData.setUserId(userRepository.findByUsername(user.getUsername()).getUserId());
            reservationData.setCottageId(Integer.parseInt(id));
            reservationService.reserve(reservationData);
            redirectAttributes.addFlashAttribute("success", "Reservation was successful");

        } catch(Exception e) {
            e.printStackTrace();
            return "redirect:/cottages/{cottageId}";
        }
        return "redirect:/cottages/{cottageId}";
    }

    private List<LocalDate> getDatesInBetween(LocalDate startDate, LocalDate endDate) {
        long numbersBetween = ChronoUnit.DAYS.between(startDate, endDate);
        // Collect each localdate from start date until end date
        return IntStream.iterate(0, i -> i + 1)
                .limit(numbersBetween + 1)
                .mapToObj(startDate::plusDays)
                .collect(Collectors.toList());
    }
}
