/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.dao;

import com.sg.blogcms.dto.Notification;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Travz
 */
public class MiscDaoDbImpl implements MiscDAOInterface {

    private JdbcTemplate jdbcTemplate;
    
  
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
   

    // Notifications
    private static final String SQL_INSERT_NOTIFICATION
            = "insert into `Notifications` (NotificationType, UserName, ID, NotificationBrief,  NotificationDate, NotificationClass) " + "values (?, ?, ?, ?, ?, ?)";

    private static final String SQL_DELETE_NOTIFICATION
            = "delete from `Notifications` where NotificationID = ?";

    private static final String SQL_UPDATE_NOTIFICATION
            = "update `Notifications` set NotificationID = ?, UserName = ?,  ID = ?, Notificationtype = ? " + " where NotificationID =  ?";

    private static final String SQL_SELECT_NOTIFICATION
            = "select * from `Notifications` where NotificationID = ?";

    private static final String SQL_SELECT_USER_NOTIFICATIONS
            = "select * from `Notifications` where Username = ?";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Notification addNotification(Notification notification) {
        jdbcTemplate.update(SQL_INSERT_NOTIFICATION,
                notification.getNotificationType(),
                notification.getUser(),
                1,
                notification.getNotificationBrief(),
                notification.getDate(),
                notification.getNotificationClass() 
        );

        int newId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);

        notification.setNotificationID(newId); 
        return notification;

    }

    @Override
    public void deleteNotification(int notificationId) {

        // first delete all authorities for this user
        jdbcTemplate.update(SQL_DELETE_NOTIFICATION, notificationId);

        // second delete the user
        jdbcTemplate.update(SQL_DELETE_NOTIFICATION, notificationId);
    }
    
    @Override
    public void updateNotification(Notification notification) {
        jdbcTemplate.update(SQL_UPDATE_NOTIFICATION,
                notification.getNotificationBrief(),
                notification.getUser(),
                notification.getNotificationID(),
                notification.getDate(),
                notification.getNotificationType()
        );
    }
    

    @Override
    public Notification getNotificationById(int notificationId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_NOTIFICATION,
                    new NotificationsMapper(), notificationId);
        } catch (EmptyResultDataAccessException ex) {
            return null;

        }
    }

    
    @Override
    public List<Notification> getUserNotifications(String username) {
        List<Notification> notify = jdbcTemplate.query(SQL_SELECT_USER_NOTIFICATIONS,
                new NotificationsMapper(), username);
        
        return notify;
    }

 
    private static final class NotificationsMapper implements RowMapper<Notification> {

        public Notification mapRow(ResultSet rs, int rowNum) throws SQLException {
       
            Notification notify = new Notification();
            notify.setNotificationID(rs.getInt("NotificationID"));
            notify.setNotificationType(rs.getString("NotificationType"));
            notify.setDate(rs.getDate("NotificationDate"));
            notify.setUser(rs.getString("Username"));
            notify.setNotificationClass(rs.getString("NotificationClass"));
            notify.setNotificationBrief(rs.getString("NotificationBrief"));
            return notify;
        }
    }

}
