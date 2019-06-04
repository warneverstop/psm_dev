package com.psm.service;

import com.psm.dto.MessageInfo;

import java.util.List;

/**
 * @author su
 * @creat: 2019/5/30 17:58
 **/
public interface IMessageService {
    List<MessageInfo> selectByClassId(Integer classId);

    void reply(Integer messageId, String replyContent);

    List<MessageInfo> selectByUserName(String userName);

    int insert(MessageInfo messageInfo);
}
