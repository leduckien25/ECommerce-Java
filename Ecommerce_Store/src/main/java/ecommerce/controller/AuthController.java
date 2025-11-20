package ecommerce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ecommerce.entity.User;
import ecommerce.service.UserService;
import ecommerce.utils.PasswordUtil;
import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController extends BaseController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String loginPage(Model model) {
        addCommonData(model);
        return "/auth/login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam String username,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        addCommonData(model);

        User user = userService.findByUsername(username);

        if (user == null || !PasswordUtil.verify(password, user.getPassword())) {
            return "/auth/login";
        }

        session.setAttribute("loggedUser", user);

        return "redirect:/admin";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loggedUser");
        return "redirect:/";
    }

    @GetMapping("/change-password")
    public String changePasswordPage(Model model) {
        addCommonData(model);
        return "/auth/change-password";
    }

    @PostMapping("/change-password")
    public String changePassword(
            @RequestParam String oldPassword,
            @RequestParam String newPassword,
            @RequestParam String confirmPassword,
            HttpSession session,
            Model model) {

        var user = (User) session.getAttribute("loggedUser");

        if (user == null) {
            return "redirect:/login";
        }

        if (!PasswordUtil.verify(oldPassword, user.getPassword())) {
            return "/auth/change-password";
        }

        if (!newPassword.equals(confirmPassword)) {
            return "/auth/change-password";
        }

        String newHashPassword = PasswordUtil.hash(newPassword);
        user.setPassword(newHashPassword);
        userService.saveUser(user);

        return "redirect:/login";
    }

    @GetMapping("/forgot-password")
    public String forgotPassword(HttpSession session,
            Model model) {
        addCommonData(model);

        return "/auth/forgot-password";

    }

}