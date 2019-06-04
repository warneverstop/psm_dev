package com.psm.mapper;

import com.psm.dto.NoticeInfo;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface NoticeInfoMapper extends Mapper<NoticeInfo> {
    List<NoticeInfo> selectByClassId(Integer classId);

    List<NoticeInfo> selectByClassIdForParent(Integer classId);

    List<NoticeInfo> selectByClassIdAndCategory(@Param("classId") Integer classId,@Param("category") String category);
}