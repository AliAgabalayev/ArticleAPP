package com.ArticleApp.dao;

import com.ArticleApp.model.Article;
import com.ArticleApp.utils.ConnectionUtil;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public  class ArticleDaoImpl implements ArticleDao{
    @Override
    public void insert_article(Article article) {
        String INSERT_ARTICLE_SQL = "INSERT INTO Article (title, article, username) VALUES (?, ?, ?)";

        try {
            Connection connection = ConnectionUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(INSERT_ARTICLE_SQL);

            statement.setString(1, article.getTitle());
            statement.setString(2, article.getArticle());
            statement.setString(3, article.getUsername());

            statement.execute();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

    }

    @Override
    public List<Article> selectAllArticles(String username) {
        String SELECT_ALL_ARTICLES_SQL = "SELECT id, title, article, username, updated_at FROM Article WHERE username = ?";

        List<Article> articles = new ArrayList<>();
        try {
            Connection connection = ConnectionUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_ARTICLES_SQL);

                statement.setString(1, username);


            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Article article = new Article();
                article.setId(resultSet.getInt("id"));
                article.setTitle(resultSet.getString("title"));
                article.setArticle(resultSet.getString("article"));
                article.setUsername(resultSet.getString("username"));

                articles.add(article);
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return articles;
    }

    @Override
    public List<Article> showAllArticles() {
        List<Article> articles = new ArrayList<>();
        String SELECT_ALL_USER_ARTICLES_SQL = "SELECT * FROM Article";

        try {

            Connection connection = ConnectionUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_USER_ARTICLES_SQL);



            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("article");
                String username = resultSet.getString("username");
                Timestamp created_at=resultSet.getTimestamp("created_at");
                Article article = new Article();
                article.setId(id);
                article.setTitle(title);
                article.setArticle(content);
                article.setUsername(username);
                article.setCreatedAt(created_at);

                articles.add(article);
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return articles;
    }

    @Override
    public Article getArticle(int id) {
        String GET_ARTICLE_SQL = "SELECT id, title, article, username FROM Article WHERE id = ?";
        Article article = null;
        try {
            Connection connection = ConnectionUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(GET_ARTICLE_SQL);

            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                article = new Article();

                article.setId(resultSet.getInt("id"));
                article.setTitle(resultSet.getString("title"));
                article.setArticle(resultSet.getString("article"));
                article.setUsername(resultSet.getString("username"));
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return article;

    }

    @Override
    public void updateArticle(Article article) {
        String UPDATE_ARTICLE_SQL = "UPDATE Article SET title = ?, article = ? WHERE id = ?";

        try {
            Connection connection = ConnectionUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(UPDATE_ARTICLE_SQL);

            statement.setString(1, article.getTitle());
            statement.setString(2, article.getArticle());
            statement.setInt(3, article.getId());

            statement.executeUpdate();
            statement.close();
            connection.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    @Override
    public void deleteArticle(int id) {
        String DELETE_ARTICLE_SQL = "DELETE FROM Article WHERE id = ?";

        try {
            Connection connection = ConnectionUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(DELETE_ARTICLE_SQL);

            statement.setInt(1, id);

            statement.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }


    }
    }
