package com.ArticleApp.controller;

import com.ArticleApp.dao.ArticleDaoImpl;
import com.ArticleApp.dao.UserDaoImpl;
import com.ArticleApp.model.Article;
import com.ArticleApp.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@WebServlet(name = "ArticleController",value = "/user/article/actions")
public class ArticleController extends HttpServlet {
private ArticleDaoImpl articleDao;
    @Override
    public void init()  {articleDao=new ArticleDaoImpl();}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action=request.getParameter("action");
                if(action==null){
                    request.getRequestDispatcher("/addarticle.jsp").forward(request,response);
                }
                else {
                    try {
                        switch (action){
                            case "new":
                                request.getRequestDispatcher("/addarticle.jsp").forward(request,response);
                                break;
                            case "viewMyArticles":
                                showMyArticles(request,response);
                                break;
                            case "viewAllArticles":
                                showAllArticles(request,response);
                                break;
                            case "insert":
                                insertArticle(request,response);
                                break;
                            case "edit":
                                showEditArticle(request,response);
                                break;
                            case "update":
                                updateArticle(request,response);
                                break;
                            case "delete":
                                deleteArticle(request,response);
                                break;
                            default:
                                response.sendRedirect("login.jsp");

                        }
                    } catch (ServletException e) {
                        throw new RuntimeException(e);
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                }
    }
    private void insertArticle(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String username = (String) request.getSession().getAttribute("username");

        String title = request.getParameter("title");
        String content = request.getParameter("article");

        Article article = new Article();
        article.setTitle(title);
        article.setArticle(content);
        article.setUsername(username);


        articleDao.insert_article(article);

        response.sendRedirect(request.getContextPath() + "/user/article");
    }




    private void updateArticle(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        String title = request.getParameter("title");
        String content = request.getParameter("article");

        Article article = articleDao.getArticle(id);
        article.setTitle(title);
        article.setArticle(content);

        articleDao.updateArticle(article);
        response.sendRedirect(request.getContextPath() + "/user/article");
    }
    private void showEditArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Article article = articleDao.getArticle(id);

        request.setAttribute("article", article);

        request.getRequestDispatcher("/addarticle.jsp").forward(request, response);
    }
    private void showMyArticles(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("username");

        List<Article> articlesByUsername = articleDao.selectAllArticles(username);
        request.setAttribute("articleList", articlesByUsername);

        request.getRequestDispatcher("/my-article-form.jsp").forward(request, response);
    }

    private void showAllArticles(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Article> articles = articleDao.showAllArticles();

        request.setAttribute("allArticleList", articles);

        request.getRequestDispatcher("/all-article-form.jsp").forward(request, response);
    }
    private void deleteArticle(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        articleDao.deleteArticle(id);
        response.sendRedirect(request.getContextPath() + "/user/article");
    }
}
