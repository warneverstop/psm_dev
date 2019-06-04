package com.psm.service.impl;

import com.psm.dto.MessageInfo;
import com.psm.mapper.MessageInfoMapper;
import com.psm.service.IMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author: su
 * @creat: 2019/5/30 17:59
 **/
@Service
public class MessageServiceImpl implements IMessageService {
    @Autowired
    private MessageInfoMapper messageInfoMapper;
    @Override
    public List<MessageInfo> selectByClassId(Integer classId) {
        return messageInfoMapper.selectByClassId(classId);
    }

    @Override
    public void reply(Integer messageId, String replyContent) {
        MessageInfo messageInfo = messageInfoMapper.selectByPrimaryKey(messageId);
        messageInfo.setReplyContent(replyContent);
        messageInfo.setState(1);
        messageInfo.setReplyTime(new Date());
        messageInfoMapper.updateByPrimaryKey(messageInfo);
    }

    @Override
    public List<MessageInfo> selectByUserName(String userName) {
        return messageInfoMapper.selectByUserName(userName);
    }

    @Override
    public int insert(MessageInfo messageInfo) {
        return messageInfoMapper.insert(messageInfo);
    }
}
