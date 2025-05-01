package com.ruoyi.promoter.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 业绩统计（按推广人）对象 performance_statistics_by_promoter
 * 
 * @author ruoyi
 * @date 2025-05-01
 */
public class PerformanceStatisticsByPromoter extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 业绩统计记录 ID */
    private Long performanceId;

    /** 推广人账号 ID */
    @Excel(name = "推广人账号 ID")
    private Long promoterAccountId;

    /** 部门ID */
    @Excel(name = "部门ID")
    private Long departmentId;

    /** 线索量 */
    @Excel(name = "线索量")
    private Long leadQuantity;

    /** 重单量 */
    @Excel(name = "重单量")
    private Long duplicateOrderQuantity;

    /** 重单率 */
    @Excel(name = "重单率")
    private BigDecimal duplicateOrderRate;

    /** 添加量 */
    @Excel(name = "添加量")
    private Long additionQuantity;

    /** 添加率 */
    @Excel(name = "添加率")
    private BigDecimal additionRate;

    /** 成交量 */
    @Excel(name = "成交量")
    private Long transactionQuantity;

    /** 成交率 */
    @Excel(name = "成交率")
    private BigDecimal transactionRate;

    /** 成交金额 */
    @Excel(name = "成交金额")
    private BigDecimal transactionAmount;

    /** 返款金额 */
    @Excel(name = "返款金额")
    private BigDecimal rebateAmount;

    /** 统计时间段 */
    @Excel(name = "统计时间段")
    private String statisticalTimePeriod;

    public void setPerformanceId(Long performanceId) 
    {
        this.performanceId = performanceId;
    }

    public Long getPerformanceId() 
    {
        return performanceId;
    }

    public void setPromoterAccountId(Long promoterAccountId) 
    {
        this.promoterAccountId = promoterAccountId;
    }

    public Long getPromoterAccountId() 
    {
        return promoterAccountId;
    }

    public void setDepartmentId(Long departmentId) 
    {
        this.departmentId = departmentId;
    }

    public Long getDepartmentId() 
    {
        return departmentId;
    }

    public void setLeadQuantity(Long leadQuantity) 
    {
        this.leadQuantity = leadQuantity;
    }

    public Long getLeadQuantity() 
    {
        return leadQuantity;
    }

    public void setDuplicateOrderQuantity(Long duplicateOrderQuantity) 
    {
        this.duplicateOrderQuantity = duplicateOrderQuantity;
    }

    public Long getDuplicateOrderQuantity() 
    {
        return duplicateOrderQuantity;
    }

    public void setDuplicateOrderRate(BigDecimal duplicateOrderRate) 
    {
        this.duplicateOrderRate = duplicateOrderRate;
    }

    public BigDecimal getDuplicateOrderRate() 
    {
        return duplicateOrderRate;
    }

    public void setAdditionQuantity(Long additionQuantity) 
    {
        this.additionQuantity = additionQuantity;
    }

    public Long getAdditionQuantity() 
    {
        return additionQuantity;
    }

    public void setAdditionRate(BigDecimal additionRate) 
    {
        this.additionRate = additionRate;
    }

    public BigDecimal getAdditionRate() 
    {
        return additionRate;
    }

    public void setTransactionQuantity(Long transactionQuantity) 
    {
        this.transactionQuantity = transactionQuantity;
    }

    public Long getTransactionQuantity() 
    {
        return transactionQuantity;
    }

    public void setTransactionRate(BigDecimal transactionRate) 
    {
        this.transactionRate = transactionRate;
    }

    public BigDecimal getTransactionRate() 
    {
        return transactionRate;
    }

    public void setTransactionAmount(BigDecimal transactionAmount) 
    {
        this.transactionAmount = transactionAmount;
    }

    public BigDecimal getTransactionAmount() 
    {
        return transactionAmount;
    }

    public void setRebateAmount(BigDecimal rebateAmount) 
    {
        this.rebateAmount = rebateAmount;
    }

    public BigDecimal getRebateAmount() 
    {
        return rebateAmount;
    }

    public void setStatisticalTimePeriod(String statisticalTimePeriod) 
    {
        this.statisticalTimePeriod = statisticalTimePeriod;
    }

    public String getStatisticalTimePeriod() 
    {
        return statisticalTimePeriod;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("performanceId", getPerformanceId())
            .append("promoterAccountId", getPromoterAccountId())
            .append("departmentId", getDepartmentId())
            .append("leadQuantity", getLeadQuantity())
            .append("duplicateOrderQuantity", getDuplicateOrderQuantity())
            .append("duplicateOrderRate", getDuplicateOrderRate())
            .append("additionQuantity", getAdditionQuantity())
            .append("additionRate", getAdditionRate())
            .append("transactionQuantity", getTransactionQuantity())
            .append("transactionRate", getTransactionRate())
            .append("transactionAmount", getTransactionAmount())
            .append("rebateAmount", getRebateAmount())
            .append("statisticalTimePeriod", getStatisticalTimePeriod())
            .toString();
    }
}
