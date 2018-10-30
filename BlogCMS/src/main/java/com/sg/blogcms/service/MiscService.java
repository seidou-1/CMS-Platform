/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.service;

import com.sg.blogcms.dto.Notification;
import java.util.List;

/**
 *
 * @author laptop
 */
public interface MiscService {

    public Notification addNotification(Notification notification);

    public void updateNotification(Notification notification);

    public void deleteNotification(int notificationId);

    public Notification getNotificationById(int notificationId);

    public List<Notification> getUserNotifications(String username);

    public List<Notification> getPendingNotifications();

    public List<Notification> getClosedNotifications();

}
