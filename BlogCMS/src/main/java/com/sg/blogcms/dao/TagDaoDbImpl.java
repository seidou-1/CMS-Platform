/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.dao;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.sg.blogcms.dto.Tag;
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
 * @author Blackfox
 */
public class TagDaoDbImpl implements TagDAOInterface {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String SQL_INSERT_TAG
            = "INSERT INTO TAGS (TagName. Tag, TagID, UserID, Category)\n"
            + "VALUES (?, ? ,? , ?, ?)";

    private static final String SQL_DELETE_TAG
            = "DELETE FROM 'TAGS' WHERE TAGID = ?";

    //Select the Tags from
    private static final String SQL_SELECT_TAG_BY_TAGID
            = "Select TagID, TagName from tags where tagID = '?'";

    private static final String SQL_UPDATE_TAG
            = "UPDATE `Tags` SET TagName = 'New Title' WHERE TagID = '?'";

    private static final String SQL_SELECT_ALL_TAGS
            = "SELECT * FROM TAGS ";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)

    public Tag addTag(Tag tag) {
        jdbcTemplate.update(SQL_INSERT_TAG,
                tag.getTagName());

        int newId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);

        // This creates a new set id tag object and returns it
        tag.setTagId(newId);
        return tag;
    }

    @Override
    public void updateTag(int tagId) {

    }

    @Override
    public void deleteTag(int tagId) {
        jdbcTemplate.update(SQL_DELETE_TAG, tagId);
    }

    @Override
    public List<Tag> getAllTags() {
        return jdbcTemplate.query(SQL_SELECT_ALL_TAGS, new TagMapper());

    }

    @Override
    public Tag getTagById(int tagId) {
        jdbcTemplate.update(SQL_DELETE_TAG, tagId);

        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_TAG_BY_TAGID,
                    new TagMapper(), tagId);

        } catch (EmptyResultDataAccessException ex) {

            return null;
        }
    }

    // This creates the Mapper
    private static final class TagMapper implements RowMapper<Tag> {

        @Override
        public Tag mapRow(ResultSet rs, int i) throws SQLException {

            Tag myTag = new Tag();
            myTag.setTagId(rs.getInt("TagID"));
            myTag.setTagName(rs.getString("TagName"));

            return myTag;

        }

    }

}
