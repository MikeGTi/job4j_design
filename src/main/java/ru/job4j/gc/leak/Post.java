package ru.job4j.gc.leak;

import java.util.List;
import java.util.Objects;

public class Post {

    private Integer id;

    private String text;

    private List<Comment> comments;

    public Post(Integer id, String text, List<Comment> comments) {
        this.id = id;
        this.text = text;
        this.comments = comments;
    }

    public Post(String text, List<Comment> comments) {
        this.text = text;
        this.comments = comments;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Post post)) {
            return false;
        }
        return Objects.equals(getId(), post.getId()) && Objects.equals(getText(), post.getText());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getText());
    }
}