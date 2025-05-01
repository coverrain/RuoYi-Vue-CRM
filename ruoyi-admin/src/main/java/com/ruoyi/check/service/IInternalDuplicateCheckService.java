package com.ruoyi.check.service;

import java.util.List;
import com.ruoyi.check.domain.InternalDuplicateCheck;

/**
 * 内部查重Service接口
 * 
 * @author ruoyi
 * @date 2025-04-28
 */
public interface IInternalDuplicateCheckService 
{
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

    public List<InternalDuplicateCheck> selectInternalDuplicateCheckListWithCustomer(InternalDuplicateCheck internalDuplicateCheck);

    InternalDuplicateCheck selectInternalDuplicateCheckWithCustomerByCheckId(Long checkId);

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
     * 批量删除内部查重
     * 
     * @param checkIds 需要删除的内部查重主键集合
     * @return 结果
     */
    public int deleteInternalDuplicateCheckByCheckIds(Long[] checkIds);

    /**
     * 删除内部查重信息
     * 
     * @param checkId 内部查重主键
     * @return 结果
     */
    public int deleteInternalDuplicateCheckByCheckId(Long checkId);
}
