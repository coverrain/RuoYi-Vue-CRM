package com.ruoyi.check.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.customer.domain.CustomerManagement;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 内部查重对象 internal_duplicate_check
 * 
 * @author ruoyi
 * @date 2025-04-28
 */
public class InternalDuplicateCheck extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 查重记录 ID */
    @Excel(name = "查重记录 ID")
    private Long checkId;


    /** 查重时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "查重时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date checkTime;

    /** 关联的客户 ID */
    @Excel(name = "关联的客户 ID")
    private Long customerId;

    private CustomerManagement customer;

    public void setCheckId(Long checkId) 
    {
        this.checkId = checkId;
    }

    public Long getCheckId() 
    {
        return checkId;
    }



    public void setCheckTime(Date checkTime) 
    {
        this.checkTime = checkTime;
    }

    public Date getCheckTime() 
    {
        return checkTime;
    }

    public void setCustomerId(Long customerId) 
    {
        this.customerId = customerId;
    }

    public Long getCustomerId() {
        return customerId;
    }



    public CustomerManagement getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerManagement customer) {
        this.customer = customer;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("checkId", getCheckId())
            .append("checkTime", getCheckTime())
            .append("customerId", getCustomerId())
            .toString();
    }
}
