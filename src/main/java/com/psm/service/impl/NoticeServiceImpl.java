package com.psm.service.impl;

import com.psm.dto.NoticeInfo;
import com.psm.mapper.NoticeInfoMapper;
import com.psm.service.INoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/30 12:30
 **/
@Service
public class NoticeServiceImpl implements INoticeService {
    @Autowired
    private NoticeInfoMapper noticeInfoMapper;
    @Override
    public List<NoticeInfo> selectByClassId(Integer classId) {
        return noticeInfoMapper.selectByClassId(classId);
    }

    @Override
    public NoticeInfo selectByNoticeId(Integer noticeId) {
        return noticeInfoMapper.selectByPrimaryKey(noticeId);
    }

    @Override
    public int insert(NoticeInfo noticeInfo) {
        return noticeInfoMapper.insert(noticeInfo);
    }

    @Override
    public int update(NoticeInfo noticeInfo) {
        return noticeInfoMapper.updateByPrimaryKey(noticeInfo);
    }

    @Override
    public int delete(Integer noticeId) {
        return noticeInfoMapper.deleteByPrimaryKey(noticeId);
    }

    @Override
    public List<NoticeInfo> selectByClassIdForParent(Integer classId) {
        return noticeInfoMapper.selectByClassIdForParent(classId);
    }

    @Override
    public List<NoticeInfo> selectByClassIdAndCategory(Integer classId, String category) {
        return noticeInfoMapper.selectByClassIdAndCategory(classId,category);
    }
}
