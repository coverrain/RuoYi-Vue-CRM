package com.ruoyi.customer.service;

import java.util.List;
import com.ruoyi.customer.domain.CustomerManagement;

/**
 * 客户管理Service接口
 * 
 * @author ruoyi
 * @date 2025-04-27
 */
public interface ICustomerManagementService 
{
    /**
     * 查询客户管理
     * 
     * @param customerId 客户管理主键
     * @return 客户管理
     */
    public CustomerManagement selectCustomerManagementByCustomerId(Long customerId);

    /**
     * 查询客户管理列表
     * 
     * @param customerManagement 客户管理
     * @return 客户管理集合
     */
    public List<CustomerManagement> selectCustomerManagementList(CustomerManagement customerManagement);

    /**
     * 新增客户管理
     * 
     * @param customerManagement 客户管理
     * @return 结果
     */
    public int insertCustomerManagement(CustomerManagement customerManagement);

    /**
     * 修改客户管理
     * 
     * @param customerManagement 客户管理
     * @return 结果
     */
    public int updateCustomerManagement(CustomerManagement customerManagement);

    /**
     * 批量删除客户管理
     * 
     * @param customerIds 需要删除的客户管理主键集合
     * @return 结果
     */
    public int deleteCustomerManagementByCustomerIds(Long[] customerIds);

    /**
     * 删除客户管理信息
     * 
     * @param customerId 客户管理主键
     * @return 结果
     */
    public int deleteCustomerManagementByCustomerId(Long customerId);
}
