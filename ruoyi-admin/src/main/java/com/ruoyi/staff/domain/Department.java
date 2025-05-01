package com.ruoyi.staff.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 部门对象 department
 * 
 * @author ruoyi
 * @date 2025-04-24
 */
public class Department extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /**  */
    @Excel(name = "")
    private String deptName;

    /**  */
    @Excel(name = "")
    private String deptCode;

    /**  */
    @Excel(name = "")
    private String deptPhone;

    /**  */
    @Excel(name = "")
    private String deptManager;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setDeptName(String deptName) 
    {
        this.deptName = deptName;
    }

    public String getDeptName() 
    {
        return deptName;
    }

    public void setDeptCode(String deptCode) 
    {
        this.deptCode = deptCode;
    }

    public String getDeptCode() 
    {
        return deptCode;
    }

    public void setDeptPhone(String deptPhone) 
    {
        this.deptPhone = deptPhone;
    }

    public String getDeptPhone() 
    {
        return deptPhone;
    }

    public void setDeptManager(String deptManager) 
    {
        this.deptManager = deptManager;
    }

    public String getDeptManager() 
    {
        return deptManager;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("deptName", getDeptName())
            .append("deptCode", getDeptCode())
            .append("deptPhone", getDeptPhone())
            .append("deptManager", getDeptManager())
            .toString();
    }
}
