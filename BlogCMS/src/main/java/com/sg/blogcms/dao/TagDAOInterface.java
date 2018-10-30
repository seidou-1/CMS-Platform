
package com.sg.blogcms.dao;

import com.sg.blogcms.dto.Tag;
import java.util.List;

/**
 *
 * @author laptop
 */
public interface TagDAOInterface {
    
    public Tag addTag (Tag tag);
    
    public void updateTag (int tagId);
    
    public void deleteTag (int tagId);
    
    public List <Tag> getAllTags();
    
    public Tag getTagById (int tagId);

    public List<Tag> getTagByUser(int userId);
}
