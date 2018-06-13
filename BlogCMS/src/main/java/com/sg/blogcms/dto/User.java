/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Objects;

/**
 *
 * @author laptop
 */
public class User {

    private int userId;
    private String username;
    private String email;
    private String userPassword;
    private String userAvatar;
    private Date lastActive;
    private boolean enabled;

    public User(int userId, String username, String email, String userPassword, String userAvatar) {
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.userPassword = userPassword;
        this.userAvatar = userAvatar;
    }

    public User() {
        this.userId = 2434;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public Date getLastActive() {
        return lastActive;
    }

    public void setLastActive(Date lastActive) {
        this.lastActive = lastActive;
    }

    private ArrayList<String> authorities = new ArrayList<>();

    public ArrayList<String> getAuthorities() {
        return authorities;
    }

    public void setAuthorities(ArrayList<String> authorities) {
        this.authorities = authorities;
    }

    public void addAuthority(String authority) {
        authorities.add(authority);
    }
 
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 59 * hash + this.userId;
        hash = 59 * hash + Objects.hashCode(this.username);
        hash = 59 * hash + Objects.hashCode(this.email);
        hash = 59 * hash + Objects.hashCode(this.userPassword);
        hash = 59 * hash + Objects.hashCode(this.userAvatar);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final User other = (User) obj;
        if (this.userId != other.userId) {
            return false;
        }
        if (!Objects.equals(this.username, other.username)) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.userPassword, other.userPassword)) {
            return false;
        }
        if (!Objects.equals(this.userAvatar, other.userAvatar)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return this.username;
    }

}
