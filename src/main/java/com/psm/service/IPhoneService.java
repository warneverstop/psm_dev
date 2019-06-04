package com.psm.service;

import com.psm.dto.PhoneInfo;

import java.util.List;

/**
 * @author su
 * @creat: 2019/5/30 10:47
 **/
public interface IPhoneService {
    List<PhoneInfo> selectAll();

    PhoneInfo selectById(Integer phoneId);

    int insert(PhoneInfo phoneInfo);

    int update(PhoneInfo phoneInfo);

    int delete(Integer phoneId);
}
