package com.psm.mapper;

import com.psm.dto.ClassDrom;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface ClassDromMapper extends Mapper<ClassDrom> {
    void deleteByDromIdAndClassId(@Param("dromId") Integer dromId,@Param("classId") Integer classId);
}