package com.ruoyi.check.mapper;

import java.util.List;
import com.ruoyi.check.domain.InternalDuplicateCheck;
import org.apache.ibatis.annotations.Mapper;

/**
 * 内部查重Mapper接口
 * 
 * @author ruoyi
 * @date 2025-04-28
 */
@Mapper
public interface InternalDuplicateCheckMapper {
    /**
     * 查询内部查重
     * 
     * @param checkId 内部查重主键
     * @return 内部查重
     */
    public InternalDuplicateCheck selectInternalDuplicateCheckByCheckId(Long checkId);

    /**
     * 查询内部查重列表
     * 
     * @param internalDuplicateCheck 内部查重
     * @return 内部查重集合
     */
    public List<InternalDuplicateCheck> selectInternalDuplicateCheckList(InternalDuplicateCheck internalDuplicateCheck);

    /**
     * 新增内部查重
     * 
     * @param internalDuplicateCheck 内部查重
     * @return 结果
     */
    public int insertInternalDuplicateCheck(InternalDuplicateCheck internalDuplicateCheck);

    /**
     * 修改内部查重
     * 
     * @param internalDuplicateCheck 内部查重
     * @return 结果
     */
    public int updateInternalDuplicateCheck(InternalDuplicateCheck internalDuplicateCheck);

    /**
     * 删除内部查重
     * 
     * @param checkId 内部查重主键
     * @return 结果
     */
    public int deleteInternalDuplicateCheckByCheckId(Long checkId);

    /**
     * 批量删除内部查重
     * 
     * @param checkIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteInternalDuplicateCheckByCheckIds(Long[] checkIds);

    /**
     * 关联客户表查询内部查重列表
     */
    public List<InternalDuplicateCheck> selectInternalDuplicateCheckListWithCustomer(InternalDuplicateCheck internalDuplicateCheck);
    
    /**
     * 关联客户表查询单个内部查重
     */
    public InternalDuplicateCheck selectInternalDuplicateCheckWithCustomerByCheckId(Long checkId);
}
