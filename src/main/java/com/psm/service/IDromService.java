package com.psm.service;

import com.psm.dto.DromInfo;

import java.util.List;

/**
 * @author su
 * @creat: 2019/5/24 18:57
 **/
public interface IDromService {
    List<DromInfo> selectAll();

    DromInfo selectById(Integer dromId);

    int updateDrom(DromInfo dromInfo);

    int insertDrom(DromInfo dromInfo);

}
