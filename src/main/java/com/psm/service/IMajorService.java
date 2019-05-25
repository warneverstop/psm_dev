package com.psm.service;

import com.psm.dto.MajorInfo;
import jdk.internal.dynalink.linker.LinkerServices;

import java.util.List;

/**
 * @author su
 * @creat: 2019/5/24 19:19
 **/
public interface IMajorService {
    List<MajorInfo> selectAll();

    MajorInfo selectById(Integer majorId);

    int insertMajor(MajorInfo majorInfo);

    int updateMajor(MajorInfo majorInfo);
}
