package com.soloproject.BrightIdeasBlog.Services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.soloproject.BrightIdeasBlog.Models.LoginUser;
import com.soloproject.BrightIdeasBlog.Models.User;
import com.soloproject.BrightIdeasBlog.Repositories.UserRepository;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    


public User register(User newUser, BindingResult result) {
        

	Optional<User> userLookUp = userRepository.findByEmail(newUser.getEmail());
	if (userLookUp.isPresent()) {
		result.rejectValue("email", "Unique", "Account with this email already exists.");
	}
	
	if(!newUser.getPassword().equals(newUser.getConfirm())) {
	    result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
	}

	if(result.hasErrors()) {
		return null;
	}

	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
	newUser.setPassword(hashed);
	
	newUser = userRepository.save(newUser);
	System.out.println("New user created with ID: " + newUser.getId());
	
    return newUser;
}
    
    public User login(LoginUser newLogin, BindingResult result) {
        
    	Optional<User> userLookUp = userRepository.findByEmail(newLogin.getEmail());
    	if (!userLookUp.isPresent()) {
    		result.rejectValue("email", "MissingAccount", "No account found.");
    		return null;
    	}

    	User user = userLookUp.get();

    	if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	}
    	
    	if(result.hasErrors()) {
    		return null;
    	}
    	
        return user;
    }

    public User findUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

	public int getTotalLikesForUser(Object currentUser) {
		// TODO Auto-generated method stub
		return 0;
	}

	public User findByUsername(String name) {
		// TODO Auto-generated method stub
		return null;
	}
}