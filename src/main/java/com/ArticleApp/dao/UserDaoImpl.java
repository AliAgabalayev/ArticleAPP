package com.ArticleApp.dao;

import com.ArticleApp.model.User;
import com.ArticleApp.utils.ConnectionUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDaoImpl implements  UserDao{

    @Override
    public void register(User user) {
        String USER_INSERT_SQL = "INSERT INTO user(first_name, last_name, username, password) values (?, ?, ?, ?);";

        try {
            Connection connection = ConnectionUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(USER_INSERT_SQL);
            statement.setString(1, user.getFirst_name());
            statement.setString(2, user.getLast_name());
            statement.setString(3, user.getUsername());
            statement.setString(4, user.getPassword());

            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public User getUser(String username, String password) {
        String GET_USER_SQL = "SELECT id, first_name ,last_name, username, password FROM user WHERE username = ? AND password = ?;";
        User user = null;

        try {
            Connection connection = ConnectionUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(GET_USER_SQL);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setFirst_name(resultSet.getString("first_name"));
                user.setLast_name(resultSet.getString("last_name"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return user;
    }
}

