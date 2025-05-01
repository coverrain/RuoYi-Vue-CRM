package com.ruoyi.statistics.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 成交统计对象 transaction_statistics
 * 
 * @author ruoyi
 * @date 2025-05-01
 */
public class TransactionStatistics extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 统计记录 ID */
    private Long statisticsId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String name;

    /** 手机号 */
    @Excel(name = "手机号")
    private String phoneNumber;

    /** 小红书 ID */
    @Excel(name = "小红书 ID")
    private String xiaohongshuId;

    /** 微信 */
    @Excel(name = "微信")
    private String wechat;

    /** 录单时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "录单时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date orderEntryTime;

    /** 成交状态 */
    @Excel(name = "成交状态")
    private String transactionStatus;

    /** 成交日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "成交日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date transactionDate;

    /** 成交机构 */
    @Excel(name = "成交机构")
    private String transactionOrganization;

    /** 成交项目 */
    @Excel(name = "成交项目")
    private String transactionProject;

    /** 成交金额 */
    @Excel(name = "成交金额")
    private BigDecimal transactionAmount;

    /** 返点比例 */
    @Excel(name = "返点比例")
    private BigDecimal rebateRatio;

    /** 返点金额 */
    @Excel(name = "返点金额")
    private BigDecimal rebateAmount;

    /** 尾款 */
    @Excel(name = "尾款")
    private BigDecimal balance;

    /** 已补缴 */
    @Excel(name = "已补缴")
    private BigDecimal paidAmount;

    /** 待补缴 */
    @Excel(name = "待补缴")
    private BigDecimal toBePaidAmount;

    /** 类型 */
    @Excel(name = "类型")
    private String type;

    /** 客服账号 ID */
    @Excel(name = "客服账号 ID")
    private Long customerServiceAccountId;

    /** 渠道来源 */
    @Excel(name = "渠道来源")
    private String channelSource;

    /** 推广人账号 ID */
    @Excel(name = "推广人账号 ID")
    private Long promotionAccountId;

    /** 销售人员账号 ID */
    @Excel(name = "销售人员账号 ID")
    private Long salespersonAccountId;

    /** 录单人账号 ID */
    @Excel(name = "录单人账号 ID")
    private Long recorderAccountId;

    /** 关联的客户 ID */
    @Excel(name = "关联的客户 ID")
    private Long customerId;

    public void setStatisticsId(Long statisticsId) 
    {
        this.statisticsId = statisticsId;
    }

    public Long getStatisticsId() 
    {
        return statisticsId;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public void setPhoneNumber(String phoneNumber) 
    {
        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber() 
    {
        return phoneNumber;
    }

    public void setXiaohongshuId(String xiaohongshuId) 
    {
        this.xiaohongshuId = xiaohongshuId;
    }

    public String getXiaohongshuId() 
    {
        return xiaohongshuId;
    }

    public void setWechat(String wechat) 
    {
        this.wechat = wechat;
    }

    public String getWechat() 
    {
        return wechat;
    }

    public void setOrderEntryTime(Date orderEntryTime) 
    {
        this.orderEntryTime = orderEntryTime;
    }

    public Date getOrderEntryTime() 
    {
        return orderEntryTime;
    }

    public void setTransactionStatus(String transactionStatus) 
    {
        this.transactionStatus = transactionStatus;
    }

    public String getTransactionStatus() 
    {
        return transactionStatus;
    }

    public void setTransactionDate(Date transactionDate) 
    {
        this.transactionDate = transactionDate;
    }

    public Date getTransactionDate() 
    {
        return transactionDate;
    }

    public void setTransactionOrganization(String transactionOrganization) 
    {
        this.transactionOrganization = transactionOrganization;
    }

    public String getTransactionOrganization() 
    {
        return transactionOrganization;
    }

    public void setTransactionProject(String transactionProject) 
    {
        this.transactionProject = transactionProject;
    }

    public String getTransactionProject() 
    {
        return transactionProject;
    }

    public void setTransactionAmount(BigDecimal transactionAmount) 
    {
        this.transactionAmount = transactionAmount;
    }

    public BigDecimal getTransactionAmount() 
    {
        return transactionAmount;
    }

    public void setRebateRatio(BigDecimal rebateRatio) 
    {
        this.rebateRatio = rebateRatio;
    }

    public BigDecimal getRebateRatio() 
    {
        return rebateRatio;
    }

    public void setRebateAmount(BigDecimal rebateAmount) 
    {
        this.rebateAmount = rebateAmount;
    }

    public BigDecimal getRebateAmount() 
    {
        return rebateAmount;
    }

    public void setBalance(BigDecimal balance) 
    {
        this.balance = balance;
    }

    public BigDecimal getBalance() 
    {
        return balance;
    }

    public void setPaidAmount(BigDecimal paidAmount) 
    {
        this.paidAmount = paidAmount;
    }

    public BigDecimal getPaidAmount() 
    {
        return paidAmount;
    }

    public void setToBePaidAmount(BigDecimal toBePaidAmount) 
    {
        this.toBePaidAmount = toBePaidAmount;
    }

    public BigDecimal getToBePaidAmount() 
    {
        return toBePaidAmount;
    }

    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }

    public void setCustomerServiceAccountId(Long customerServiceAccountId) 
    {
        this.customerServiceAccountId = customerServiceAccountId;
    }

    public Long getCustomerServiceAccountId() 
    {
        return customerServiceAccountId;
    }

    public void setChannelSource(String channelSource) 
    {
        this.channelSource = channelSource;
    }

    public String getChannelSource() 
    {
        return channelSource;
    }

    public void setPromotionAccountId(Long promotionAccountId) 
    {
        this.promotionAccountId = promotionAccountId;
    }

    public Long getPromotionAccountId() 
    {
        return promotionAccountId;
    }

    public void setSalespersonAccountId(Long salespersonAccountId) 
    {
        this.salespersonAccountId = salespersonAccountId;
    }

    public Long getSalespersonAccountId() 
    {
        return salespersonAccountId;
    }

    public void setRecorderAccountId(Long recorderAccountId) 
    {
        this.recorderAccountId = recorderAccountId;
    }

    public Long getRecorderAccountId() 
    {
        return recorderAccountId;
    }

    public void setCustomerId(Long customerId) 
    {
        this.customerId = customerId;
    }

    public Long getCustomerId() 
    {
        return customerId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("statisticsId", getStatisticsId())
            .append("name", getName())
            .append("phoneNumber", getPhoneNumber())
            .append("xiaohongshuId", getXiaohongshuId())
            .append("wechat", getWechat())
            .append("orderEntryTime", getOrderEntryTime())
            .append("transactionStatus", getTransactionStatus())
            .append("transactionDate", getTransactionDate())
            .append("transactionOrganization", getTransactionOrganization())
            .append("transactionProject", getTransactionProject())
            .append("transactionAmount", getTransactionAmount())
            .append("rebateRatio", getRebateRatio())
            .append("rebateAmount", getRebateAmount())
            .append("balance", getBalance())
            .append("paidAmount", getPaidAmount())
            .append("toBePaidAmount", getToBePaidAmount())
            .append("type", getType())
            .append("customerServiceAccountId", getCustomerServiceAccountId())
            .append("channelSource", getChannelSource())
            .append("promotionAccountId", getPromotionAccountId())
            .append("salespersonAccountId", getSalespersonAccountId())
            .append("recorderAccountId", getRecorderAccountId())
            .append("customerId", getCustomerId())
            .toString();
    }
}
