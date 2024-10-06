package com.soloproject.BrightIdeasBlog.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.soloproject.BrightIdeasBlog.Models.Idea;
import com.soloproject.BrightIdeasBlog.Models.User;

@Repository
public interface IdeaRepository extends JpaRepository<Idea, Long> {   
   
    List<Idea> findAllByOrderByLikedUsersDesc();
    
    List<Idea> findAllByUser(User user);

    Idea findById(long id);
    
    List<Idea> findByUserId(Long userId);

	List<Idea> findByLikedUsersContaining(User user);
   
    
}