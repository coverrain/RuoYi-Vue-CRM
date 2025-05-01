package com.ruoyi.customer.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.customer.mapper.CustomerManagementMapper;
import com.ruoyi.customer.domain.CustomerManagement;
import com.ruoyi.customer.service.ICustomerManagementService;

/**
 * 客户管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-04-27
 */
@Service
public class CustomerManagementServiceImpl implements ICustomerManagementService 
{
    @Autowired
    private CustomerManagementMapper customerManagementMapper;

    /**
     * 查询客户管理
     * 
     * @param customerId 客户管理主键
     * @return 客户管理
     */
    @Override
    public CustomerManagement selectCustomerManagementByCustomerId(Long customerId)
    {
        return customerManagementMapper.selectCustomerManagementByCustomerId(customerId);
    }

    /**
     * 查询客户管理列表
     * 
     * @param customerManagement 客户管理
     * @return 客户管理
     */
    @Override
    public List<CustomerManagement> selectCustomerManagementList(CustomerManagement customerManagement)
    {
        return customerManagementMapper.selectCustomerManagementList(customerManagement);
    }

    /**
     * 新增客户管理
     * 
     * @param customerManagement 客户管理
     * @return 结果
     */
    @Override
    public int insertCustomerManagement(CustomerManagement customerManagement)
    {
        return customerManagementMapper.insertCustomerManagement(customerManagement);
    }

    /**
     * 修改客户管理
     * 
     * @param customerManagement 客户管理
     * @return 结果
     */
    @Override
    public int updateCustomerManagement(CustomerManagement customerManagement)
    {
        return customerManagementMapper.updateCustomerManagement(customerManagement);
    }

    /**
     * 批量删除客户管理
     * 
     * @param customerIds 需要删除的客户管理主键
     * @return 结果
     */
    @Override
    public int deleteCustomerManagementByCustomerIds(Long[] customerIds)
    {
        return customerManagementMapper.deleteCustomerManagementByCustomerIds(customerIds);
    }

    /**
     * 删除客户管理信息
     * 
     * @param customerId 客户管理主键
     * @return 结果
     */
    @Override
    public int deleteCustomerManagementByCustomerId(Long customerId)
    {
        return customerManagementMapper.deleteCustomerManagementByCustomerId(customerId);
    }
}
