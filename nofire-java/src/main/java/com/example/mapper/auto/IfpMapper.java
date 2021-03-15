package com.example.mapper.auto;

import com.example.model.auto.Ifp;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author astupidcoder
 * @since 2020-12-28
 */
@Mapper
@Repository
public interface IfpMapper extends BaseMapper<Ifp> {

}
