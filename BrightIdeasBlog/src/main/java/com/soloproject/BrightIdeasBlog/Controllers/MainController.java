package com.soloproject.BrightIdeasBlog.Controllers;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soloproject.BrightIdeasBlog.Models.Idea;
import com.soloproject.BrightIdeasBlog.Models.LoginUser;
import com.soloproject.BrightIdeasBlog.Models.User;
import com.soloproject.BrightIdeasBlog.Services.IdeaService;
import com.soloproject.BrightIdeasBlog.Services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController {  
    @Autowired
    private UserService userService;

    @Autowired
    private IdeaService ideaService;

   
    @GetMapping("/login")
    public String showLogin(Model model) {
        model.addAttribute("newLogin", new LoginUser());
        return "login.jsp"; 
    }
    
    
    @GetMapping("/")
    public String showRegister(Model model) {
        model.addAttribute("newUser", new User());
        return "register.jsp"; 
    }
    
    
    @PostMapping("/")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
                           BindingResult result, 
                           Model model, HttpSession session) {
        userService.register(newUser, result);
        if(result.hasErrors()) {
            return "register.jsp"; 
        }
        session.setAttribute("userId", newUser.getId());
        return "redirect:/dashboard";
    }

    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
                        BindingResult result, 
                        Model model, HttpSession session) {
        User user = userService.login(newLogin, result);
        if(result.hasErrors()) {
            return "login.jsp"; 
        }
        session.setAttribute("userId", user.getId());
        return "redirect:/dashboard";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        User user = userService.findUserById(userId);
        List<Idea> ideas = ideaService.getAllIdeasSortedByLikes();

        model.addAttribute("user", user);
        model.addAttribute("ideas", ideas);
        model.addAttribute("newIdea", new Idea());
        return "dashboard.jsp";
    }

   
    @PostMapping("/ideas/new")
    public String createIdea(@Valid @ModelAttribute("newIdea") Idea newIdea, 
                             BindingResult result, 
                             HttpSession session, 
                             Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        if (result.hasErrors()) {
            User user = userService.findUserById(userId);
            List<Idea> ideas = ideaService.getAllIdeasSortedByLikes();
            model.addAttribute("user", user);
            model.addAttribute("ideas", ideas);
            return "dashboard.jsp";
        }
        User user = userService.findUserById(userId);
        newIdea.setUser(user);
        ideaService.saveIdea(newIdea);
        return "redirect:/dashboard";
    }

    @PostMapping("/ideas/{id}/like")
    @ResponseBody 
    public ResponseEntity<?> likeIdea(@PathVariable("id") Long ideaId, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not logged in.");
        }
        User user = userService.findUserById(userId);
        Idea idea = ideaService.findIdeaById(ideaId);
        ideaService.likeIdea(user, idea);
        return ResponseEntity.ok().build(); 
    }

    
    @GetMapping("/ideas/{id}/delete")
    public String deleteIdea(@PathVariable("id") Long ideaId, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        Idea idea = ideaService.findIdeaById(ideaId);
        if (idea.getUser().getId().equals(userId)) {
            ideaService.deleteIdea(ideaId);
        }
        return "redirect:/dashboard";
    }
    
    @PostMapping("/ideas/{id}/edit")
    public String editIdea(@PathVariable("id") Long id, @RequestParam("content") String content, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        Idea idea = ideaService.findIdeaById(id);
        
        if (idea.getUser().getId().equals(userId)) {
            idea.setContent(content); 
            ideaService.updateIdea(idea);
        }
        return "redirect:/dashboard"; 
    }

    
    @GetMapping("/users/{id}")
    public String userProfile(@PathVariable("id") Long userId, Model model) {
        User user = userService.findUserById(userId); 
        int totalPosts = user.getIdeas().size(); 
        int totalLikes = ideaService.getTotalLikesForUser(user); 

        model.addAttribute("user", user);
        model.addAttribute("totalPosts", totalPosts);
        model.addAttribute("totalLikes", totalLikes);
        return "profile.jsp"; 
    }


        @GetMapping("/bright_ideas/{id}")
        public String showIdeaLikes(@PathVariable("id") Long id, Model model) {
            Idea idea = ideaService.findIdeaById(id);
          
            Set<User> uniqueLikers = new HashSet<>(idea.getLikedUsers());
            model.addAttribute("idea", idea);
            model.addAttribute("uniqueLikers", uniqueLikers); 
            return "likeStatus.jsp"; 
        }

    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login"; 
    }
}
