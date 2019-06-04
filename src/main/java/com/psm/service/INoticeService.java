package com.psm.service;

import com.psm.dto.NoticeInfo;

import java.util.List;

/**
 * @author su
 * @creat: 2019/5/30 12:28
 **/
public interface INoticeService {
    List<NoticeInfo> selectByClassId(Integer classId);

    NoticeInfo selectByNoticeId(Integer noticeId);

    int insert(NoticeInfo noticeInfo);

    int update(NoticeInfo noticeInfo);

    int delete(Integer noticeId);

    /**
     * 查询最新6条数据
     * @param classId
     * @return
     */
    List<NoticeInfo> selectByClassIdForParent(Integer classId);

    List<NoticeInfo> selectByClassIdAndCategory(Integer classId, String category);
}
