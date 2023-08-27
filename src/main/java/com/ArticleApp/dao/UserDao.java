package com.ArticleApp.dao;
import com.ArticleApp.model.User;

public interface UserDao {
    void register(User user);
    User getUser(String username, String password);
}
