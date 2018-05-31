/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.dao;

import com.sg.blogcms.dto.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public class UserDaoDBImpl implements UserDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Sighting prepared statements
    private static final String SQL_INSERT_USER
            = "insert into `Users` ( UserID, UserTypeID, UserName, UserEmail, UserPassword, UserAvatar) " + "values (?, ?, ?, ?, ?, ?)";

    private static final String SQL_DELETE_USER
            = "delete from `Users` where UserID = ?";

    private static final String SQL_UPDATE_USER
            = "update `Users` set UserID = ?, UserTypeID = ?, UserName = ?,  UserEmail = ?, UserPassword = ?, UserAvatar = ? " + " where UserID =  ?";

    private static final String SQL_SELECT_USER
            = "select * from `Users` where UserID = ?";

    private static final String SQL_SELECT_ALL_USERS
            = "select * from `Users`";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public User addUser(User user) {
        jdbcTemplate.update(SQL_INSERT_USER,
                user.getUserType(),
                user.getUsername(),
                user.getEmail(),
                user.getUserPassword(),
                user.getUserAvatar(),
                user.getUserId());

        int newId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);

        user.setUserId(newId);
        return user;

    }

    @Override
    public void deleteUser(int userId) {
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
            return jdbcTemplate.queryForObject(SQL_SELECT_ALL_USERS,
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
            user.setUserType(rs.getInt("UserTypeID"));
            user.setEmail(rs.getString("UserEmail"));
            user.setUserPassword(rs.getString("UserPassword"));
            user.setUserAvatar(rs.getString("UserAvatar"));
            return user;

        }
    }

}
