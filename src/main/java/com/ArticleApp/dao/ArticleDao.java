package com.ArticleApp.dao;

import com.ArticleApp.model.Article;

import java.util.List;

public interface ArticleDao {
void insert_article (Article article);
List<Article>selectAllArticles(String username);
List<Article>showAllArticles();
Article getArticle (int id);
void updateArticle(Article article);
void deleteArticle(int id);

}
