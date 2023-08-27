package com.ArticleApp.servlets;
import com.ArticleApp.dao.UserDaoImpl;
import com.ArticleApp.dao.UserDaoImpl;
import com.ArticleApp.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.io.IOException;
@WebServlet(name = "ArticleServlet",value ="/user/article")
public class ArticleServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/ArticleForm.jsp").forward(req,
                resp);
    }
}
