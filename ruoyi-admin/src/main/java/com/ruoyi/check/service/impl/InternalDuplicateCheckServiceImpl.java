package com.ruoyi.check.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.check.mapper.InternalDuplicateCheckMapper;
import com.ruoyi.check.domain.InternalDuplicateCheck;
import com.ruoyi.check.service.IInternalDuplicateCheckService;

/**
 * 内部查重Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-04-28
 */
@Service
public class InternalDuplicateCheckServiceImpl implements IInternalDuplicateCheckService {
    @Autowired
    private InternalDuplicateCheckMapper internalDuplicateCheckMapper;

    /**
     * 查询内部查重
     * 
     * @param checkId 内部查重主键
     * @return 内部查重
     */
    @Override
    public InternalDuplicateCheck selectInternalDuplicateCheckByCheckId(Long checkId)
    {
        return internalDuplicateCheckMapper.selectInternalDuplicateCheckByCheckId(checkId);
    }

    /**
     * 查询内部查重列表
     * 
     * @param internalDuplicateCheck 内部查重
     * @return 内部查重
     */
    @Override
    public List<InternalDuplicateCheck> selectInternalDuplicateCheckList(InternalDuplicateCheck internalDuplicateCheck)
    {
        return internalDuplicateCheckMapper.selectInternalDuplicateCheckList(internalDuplicateCheck);
    }

    /**
     * 查询内部查重列表
     * 
     * @param internalDuplicateCheck 内部查重
     * @return 内部查重
     */
    @Override
    public List<InternalDuplicateCheck> selectInternalDuplicateCheckListWithCustomer(InternalDuplicateCheck internalDuplicateCheck) {
        return internalDuplicateCheckMapper.selectInternalDuplicateCheckListWithCustomer(internalDuplicateCheck);
    }
    
    @Override
    public InternalDuplicateCheck selectInternalDuplicateCheckWithCustomerByCheckId(Long checkId) {
        return internalDuplicateCheckMapper.selectInternalDuplicateCheckWithCustomerByCheckId(checkId);
    }

    /**
     * 新增内部查重
     * 
     * @param internalDuplicateCheck 内部查重
     * @return 结果
     */
    @Override
    public int insertInternalDuplicateCheck(InternalDuplicateCheck internalDuplicateCheck)
    {
        return internalDuplicateCheckMapper.insertInternalDuplicateCheck(internalDuplicateCheck);
    }

    /**
     * 修改内部查重
     * 
     * @param internalDuplicateCheck 内部查重
     * @return 结果
     */
    @Override
    public int updateInternalDuplicateCheck(InternalDuplicateCheck internalDuplicateCheck)
    {
        return internalDuplicateCheckMapper.updateInternalDuplicateCheck(internalDuplicateCheck);
    }

    /**
     * 批量删除内部查重
     * 
     * @param checkIds 需要删除的内部查重主键
     * @return 结果
     */
    @Override
    public int deleteInternalDuplicateCheckByCheckIds(Long[] checkIds)
    {
        return internalDuplicateCheckMapper.deleteInternalDuplicateCheckByCheckIds(checkIds);
    }

    /**
     * 删除内部查重信息
     * 
     * @param checkId 内部查重主键
     * @return 结果
     */
    @Override
    public int deleteInternalDuplicateCheckByCheckId(Long checkId)
    {
        return internalDuplicateCheckMapper.deleteInternalDuplicateCheckByCheckId(checkId);
    }
}
