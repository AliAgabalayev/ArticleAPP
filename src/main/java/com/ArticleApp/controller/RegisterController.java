package com.ArticleApp.controller;

import com.ArticleApp.dao.UserDaoImpl;
import com.ArticleApp.dao.UserDaoImpl;
import com.ArticleApp.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import java.io.IOException;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {

    private UserDaoImpl userDao;

    @Override
    public void init() {
        userDao = new UserDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect("registration.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        register(request, response);
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String first_name = request.getParameter("firstName");
        String  last_name= request.getParameter("lastName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User();
        user.setFirst_name(first_name);
        user.setLast_name(last_name);
        user.setUsername(username);
        user.setPassword(password);

        try {
            userDao.register(user);
            request.getSession().setAttribute("first_name", first_name);
            request.getSession().setAttribute("username", username);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        response.sendRedirect("user/article");
    }
}
