package com.ruoyi.customer.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.customer.domain.CustomerManagement;
import com.ruoyi.customer.service.ICustomerManagementService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 客户管理Controller
 * 
 * @author ruoyi
 * @date 2025-04-27
 */
@RestController
@RequestMapping("/customer/customerManagement")
public class CustomerManagementController extends BaseController
{
    @Autowired
    private ICustomerManagementService customerManagementService;

    /**
     * 查询客户管理列表
     */
    @PreAuthorize("@ss.hasPermi('customer:customerManagement:list')")
    @GetMapping("/list")
    public TableDataInfo list(CustomerManagement customerManagement)
    {
        startPage();
        List<CustomerManagement> list = customerManagementService.selectCustomerManagementList(customerManagement);
        return getDataTable(list);
    }

    /**
     * 导出客户管理列表
     */
    @PreAuthorize("@ss.hasPermi('customer:customerManagement:export')")
    @Log(title = "客户管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CustomerManagement customerManagement)
    {
        List<CustomerManagement> list = customerManagementService.selectCustomerManagementList(customerManagement);
        ExcelUtil<CustomerManagement> util = new ExcelUtil<CustomerManagement>(CustomerManagement.class);
        util.exportExcel(response, list, "客户管理数据");
    }

    /**
     * 获取客户管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('customer:customerManagement:query')")
    @GetMapping(value = "/{customerId}")
    public AjaxResult getInfo(@PathVariable("customerId") Long customerId)
    {
        return success(customerManagementService.selectCustomerManagementByCustomerId(customerId));
    }

    /**
     * 新增客户管理
     */
    @PreAuthorize("@ss.hasPermi('customer:customerManagement:add')")
    @Log(title = "客户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CustomerManagement customerManagement)
    {
        return toAjax(customerManagementService.insertCustomerManagement(customerManagement));
    }

    /**
     * 修改客户管理
     */
    @PreAuthorize("@ss.hasPermi('customer:customerManagement:edit')")
    @Log(title = "客户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CustomerManagement customerManagement)
    {
        return toAjax(customerManagementService.updateCustomerManagement(customerManagement));
    }

    /**
     * 删除客户管理
     */
    @PreAuthorize("@ss.hasPermi('customer:customerManagement:remove')")
    @Log(title = "客户管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{customerIds}")
    public AjaxResult remove(@PathVariable Long[] customerIds)
    {
        return toAjax(customerManagementService.deleteCustomerManagementByCustomerIds(customerIds));
    }
}
