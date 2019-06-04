package com.psm.service;

import com.psm.dto.ClassDrom;
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

    /**
     * 根据班级id查找本班级的所有宿舍
     * @param classId
     * @return
     */
    List<DromInfo> selectByClassId(Integer classId);

    void delectByDromIdAndClassId(Integer dromId, Integer classId);

    int insertDromForclass(ClassDrom classDrom);
}
