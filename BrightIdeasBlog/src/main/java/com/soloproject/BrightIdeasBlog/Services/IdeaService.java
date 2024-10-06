package com.soloproject.BrightIdeasBlog.Services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soloproject.BrightIdeasBlog.Models.Idea;
import com.soloproject.BrightIdeasBlog.Models.User;
import com.soloproject.BrightIdeasBlog.Repositories.IdeaRepository;

@Service
public class IdeaService {

    @Autowired
    private IdeaRepository ideaRepository;

    
    public Idea saveIdea(Idea idea) {
        return ideaRepository.save(idea);
    }

    public int likeIdea(User user, Idea idea) {
        if (!idea.getLikedUsers().contains(user)) {
            idea.getLikedUsers().add(user);
            ideaRepository.save(idea);
        }
        return idea.getLikedUsers().size();
    }

    public List<Idea> getAllIdeasSortedByLikes() {
    	List<Idea> ideas = ideaRepository.findAll();
        for (Idea idea : ideas) {
            if (idea.getLikedUsers() == null) {
                idea.setLikedUsers(new ArrayList<>()); 
            }
        }
        return ideas;
    }
    
    public List<Idea> findAllIdeas() {
        List<Idea> ideas = ideaRepository.findAll();
        for (Idea idea : ideas) {
            if (idea.getLikedUsers() == null) {
                idea.setLikedUsers(new ArrayList<>()); 
            }
        }
        return ideas;
    }

    public Idea findIdeaById(Long id) {
        return ideaRepository.findById(id).orElse(null);
    }
    
    public void deleteIdea(Long ideaId) {
        ideaRepository.deleteById(ideaId);
    }

    public int getTotalLikesForUser(User user) {
        List<Idea> ideas = user.getIdeas(); // Assuming you have this method
        int totalLikes = 0;
        
        for (Idea idea : ideas) {
            if (idea.getLikedUsers() != null) {
                totalLikes += idea.getLikedUsers().size();
            }
        }
        
        return totalLikes;
    }

    public List<Idea> findIdeasForUser(User user) {
        if (user == null) {
            return new ArrayList<>(); 
        }
        return ideaRepository.findByUserId(user.getId()); 
    }

    public void updateIdea(Idea idea) {
        ideaRepository.save(idea); 
    }

    }
