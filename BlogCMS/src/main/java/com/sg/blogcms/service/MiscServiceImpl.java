/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sg.blogcms.service;

import com.sg.blogcms.dao.MiscDAOInterface;
import com.sg.blogcms.dto.Notification;
import java.util.List;
import javax.inject.Inject;


public class MiscServiceImpl implements MiscService {
    
     private MiscDAOInterface miscDao;
    
    @Inject
    public MiscServiceImpl(MiscDAOInterface miscDao) {
        this.miscDao = miscDao;
    }


    @Override
    public Notification addNotification(Notification notification) {
         return miscDao.addNotification(notification);
    }

    @Override
    public void updateNotification(Notification notification) {
         miscDao.updateNotification(notification);
    }

    @Override
    public void deleteNotification(int notificationId) {
        miscDao.deleteNotification(notificationId);
    }

    @Override
    public Notification getNotificationById(int notificationId) {
        return miscDao.getNotificationById(notificationId);
    }

    @Override
    public List<Notification> getUserNotifications(String username) {
        return miscDao.getUserNotifications(username);
    }

}
