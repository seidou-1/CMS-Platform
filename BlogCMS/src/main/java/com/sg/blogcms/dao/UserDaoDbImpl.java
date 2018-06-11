/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.dao;

import com.sg.blogcms.dto.Notification;
import com.sg.blogcms.dto.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public class UserDaoDbImpl implements UserDAOInterface {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Sighting prepared statements
    private static final String SQL_INSERT_USER
            = "insert into `Users` (UserName, UserEmail, UserPassword, UserAvatar) " + "values (?, ?, ?, ?, ?)";

    private static final String SQL_DELETE_USER
            = "delete from `Users` where UserID = ?";

    private static final String SQL_UPDATE_USER
            = "update `Users` set UserID = ?, UserName = ?,  UserEmail = ?, UserPassword = ?, UserAvatar = ? " + " where UserID =  ?";

    private static final String SQL_SELECT_USER
            = "select * from `Users` where UserID = ?";

    private static final String SQL_SELECT_ALL_USERS
            = "select * from `Users`";

    private static final String SQL_INSERT_AUTHORITY
            = "insert into authorities (username, authority) values (?, ?)";

    private static final String SQL_DELETE_AUTHORITIES
            = "delete from authorities where username = ?";

    // Notifications
    private static final String SQL_INSERT_NOTIFICATION
            = "insert into `Notifications` (NotificationType, UserName, ID) " + "values (?, ?, ?)";

    private static final String SQL_DELETE_NOTIFICATION
            = "delete from `Notifications` where NotificationID = ?";

    private static final String SQL_UPDATE_NOTIFICATION
            = "update `Notifications` set NotificationID = ?, UserName = ?,  ID = ?, Notificationtype = ? " + " where NotificationID =  ?";

    private static final String SQL_SELECT_NOTIFICATION
            = "select * from `Notifications` where NotificationID = ?";

    private static final String SQL_SELECT_ALL_NOTIFICATION
            = "select * from `Notifications`";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public User addUser(User user) {
        jdbcTemplate.update(SQL_INSERT_USER,
                user.getUserType(),
                user.getUsername(),
                user.getEmail(),
                user.getUserPassword(),
                user.getUserAvatar());

        int newId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);

        // now insert user's roles
        ArrayList<String> authorities = user.getAuthorities();
        for (String authority : authorities) {
            jdbcTemplate.update(SQL_INSERT_AUTHORITY,
                    user.getUsername(),
                    authority);
        }

        user.setUserId(newId);
        return user;

    }

    @Override
    public void deleteUser(int userId) {

        // first delete all authorities for this user
        jdbcTemplate.update(SQL_DELETE_AUTHORITIES, userId);

        // second delete the user
        jdbcTemplate.update(SQL_DELETE_USER, userId);
    }

    @Override
    public User updateUser(User user) {
        jdbcTemplate.update(SQL_UPDATE_USER,
                user.getUserType(),
                user.getUsername(),
                user.getEmail(),
                user.getUserPassword(),
                user.getUserAvatar(),
                user.getUserId());

        return user;
    }

    @Override
    public User getUserById(int userId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_USER,
                    new UsersMapper(), userId);
        } catch (EmptyResultDataAccessException ex) {
            return null;

        }
    }

    @Override
    public List<User> getAllUsers() {
        return jdbcTemplate.query(SQL_SELECT_ALL_USERS,
                new UsersMapper());
    }

    private static final class UsersMapper implements RowMapper<User> {

        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setUserId(rs.getInt("UserID"));
            user.setUsername(rs.getString("UserName"));
            user.setEmail(rs.getString("UserEmail"));
            user.setUserPassword(rs.getString("UserPassword"));
            user.setUserAvatar(rs.getString("UserAvatar"));
            return user;

        }
    }

    private static final class NotificationsMapper implements RowMapper<Notification> {

        public Notification mapRow(ResultSet rs, int rowNum) throws SQLException {
            Notification notify = new Notification();
            notify.setNotificationID(rs.getInt("NotificationID"));
            notify.setNotificationType(rs.getString("NotificationType"));
//            notify.setDate(rs.getDate("NotificationDate"));
            notify.setUser(rs.getString("NotificationUser"));
//            notify.setNotificationBrief(rs.getString("NotificationBrief"));

            return notify;

        }
    }

}
