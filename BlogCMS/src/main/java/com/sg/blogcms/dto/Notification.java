/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.dto;

import java.sql.Date;

/**
 *
 * @author Travz
 */
public class Notification {

    private int notificationID;
    private String notificationType;
    private String notificationClass;
    private String notificationBrief;
    private String user;
    private boolean viewed;
    private Date date;

    public Notification(int notificationID, String notificationType, String notificationBrief, String user, boolean viewed, Date date) {
        this.notificationID = notificationID;
        this.notificationType = notificationType;
        this.notificationBrief = notificationBrief;
        this.user = user;
        this.viewed = viewed;
        this.date = date;
    }

    public String getNotificationClass() {
        return notificationClass;
    }

    public void setNotificationClass(String notificationClass) {
        this.notificationClass = notificationClass;
    }

    public Notification() {
    }

    public int getNotificationID() {
        return notificationID;
    }

    public void setNotificationID(int notificationID) {
        this.notificationID = notificationID;
    }

    public String getNotificationType() {
        return notificationType;
    }

    public void setNotificationType(String notificationType) {
        this.notificationType = notificationType;
    }

    public String getNotificationBrief() {
        return notificationBrief;
    }

    public void setNotificationBrief(String notificationBrief) {
        this.notificationBrief = notificationBrief;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public boolean isViewed() {
        return viewed;
    }

    public void setViewed(boolean viewed) {
        this.viewed = viewed;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

}
