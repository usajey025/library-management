package com.nagarro.LibraryManagement.repository;

import org.springframework.data.repository.CrudRepository;

import com.nagarro.LibraryManagement.model.User;

public interface UserRepository extends CrudRepository<User, Integer> {
public User findByUsernameAndPassword(String username,String password);
}

