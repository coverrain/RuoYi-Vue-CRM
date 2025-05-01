package com.ruoyi.customer.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 客户管理对象 customer_management
 * 
 * @author ruoyi
 * @date 2025-04-27
 */
public class CustomerManagement extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 客户 ID */
    private Long customerId;

    /** 客户姓名 */
    @Excel(name = "客户姓名")
    private String customerName;

    /** 手机号 */
    @Excel(name = "手机号")
    private String phoneNumber;

    /** 微信号 */
    @Excel(name = "微信号")
    private String wechatId;

    /** 小红书 ID */
    @Excel(name = "小红书 ID")
    private String xiaohongshuId;

    /** 抖音 ID */
    @Excel(name = "抖音 ID")
    private String douyinId;

    /** 类型 */
    @Excel(name = "类型")
    private String type;

    /** 推广人员账号 ID */
    @Excel(name = "推广人员账号 ID")
    private Long promotionAccountId;

    /** 客服人员账号 ID */
    @Excel(name = "客服人员账号 ID")
    private Long customerServiceAccountId;

    /** 销售人员账号 ID */
    @Excel(name = "销售人员账号 ID")
    private Long salespersonAccountId;

    /** 派单机构 */
    @Excel(name = "派单机构")
    private String dispatchOrganization;

    /** 最近派单时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最近派单时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lastDispatchTime;

    /** 所在地 */
    @Excel(name = "所在地")
    private String location;

    /** 咨询项目 */
    @Excel(name = "咨询项目")
    private String consultingProject;

    /** 咨询详情 */
    @Excel(name = "咨询详情")
    private String consultingDetails;

    /** 客户意愿 */
    @Excel(name = "客户意愿")
    private String customerIntention;

    /** 录单人账号 ID */
    @Excel(name = "录单人账号 ID")
    private Long recorderAccountId;

    /** 录单时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "录单时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date recordTime;

    /** 渠道来源 */
    @Excel(name = "渠道来源")
    private String channelSource;

    /** 是否助推  */
    @Excel(name = "是否助推 ")
    private String boostStatus;

    /** 客服添加 */
    @Excel(name = "客服添加")
    private String serviceStatus;

    /** 销售添加 */
    @Excel(name = "销售添加")
    private String saleStatus;

    public void setCustomerId(Long customerId) 
    {
        this.customerId = customerId;
    }

    public Long getCustomerId() 
    {
        return customerId;
    }

    public void setCustomerName(String customerName) 
    {
        this.customerName = customerName;
    }

    public String getCustomerName() 
    {
        return customerName;
    }

    public void setPhoneNumber(String phoneNumber) 
    {
        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber() 
    {
        return phoneNumber;
    }

    public void setWechatId(String wechatId) 
    {
        this.wechatId = wechatId;
    }

    public String getWechatId() 
    {
        return wechatId;
    }

    public void setXiaohongshuId(String xiaohongshuId) 
    {
        this.xiaohongshuId = xiaohongshuId;
    }

    public String getXiaohongshuId() 
    {
        return xiaohongshuId;
    }

    public void setDouyinId(String douyinId) 
    {
        this.douyinId = douyinId;
    }

    public String getDouyinId() 
    {
        return douyinId;
    }

    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }

    public void setPromotionAccountId(Long promotionAccountId) 
    {
        this.promotionAccountId = promotionAccountId;
    }

    public Long getPromotionAccountId() 
    {
        return promotionAccountId;
    }

    public void setCustomerServiceAccountId(Long customerServiceAccountId) 
    {
        this.customerServiceAccountId = customerServiceAccountId;
    }

    public Long getCustomerServiceAccountId() 
    {
        return customerServiceAccountId;
    }

    public void setSalespersonAccountId(Long salespersonAccountId) 
    {
        this.salespersonAccountId = salespersonAccountId;
    }

    public Long getSalespersonAccountId() 
    {
        return salespersonAccountId;
    }

    public void setDispatchOrganization(String dispatchOrganization) 
    {
        this.dispatchOrganization = dispatchOrganization;
    }

    public String getDispatchOrganization() 
    {
        return dispatchOrganization;
    }

    public void setLastDispatchTime(Date lastDispatchTime) 
    {
        this.lastDispatchTime = lastDispatchTime;
    }

    public Date getLastDispatchTime() 
    {
        return lastDispatchTime;
    }

    public void setLocation(String location) 
    {
        this.location = location;
    }

    public String getLocation() 
    {
        return location;
    }

    public void setConsultingProject(String consultingProject) 
    {
        this.consultingProject = consultingProject;
    }

    public String getConsultingProject() 
    {
        return consultingProject;
    }

    public void setConsultingDetails(String consultingDetails) 
    {
        this.consultingDetails = consultingDetails;
    }

    public String getConsultingDetails() 
    {
        return consultingDetails;
    }

    public void setCustomerIntention(String customerIntention) 
    {
        this.customerIntention = customerIntention;
    }

    public String getCustomerIntention() 
    {
        return customerIntention;
    }

    public void setRecorderAccountId(Long recorderAccountId) 
    {
        this.recorderAccountId = recorderAccountId;
    }

    public Long getRecorderAccountId() 
    {
        return recorderAccountId;
    }

    public void setRecordTime(Date recordTime) 
    {
        this.recordTime = recordTime;
    }

    public Date getRecordTime() 
    {
        return recordTime;
    }

    public void setChannelSource(String channelSource) 
    {
        this.channelSource = channelSource;
    }

    public String getChannelSource() 
    {
        return channelSource;
    }

    public void setBoostStatus(String boostStatus) 
    {
        this.boostStatus = boostStatus;
    }

    public String getBoostStatus() 
    {
        return boostStatus;
    }

    public void setServiceStatus(String serviceStatus) 
    {
        this.serviceStatus = serviceStatus;
    }

    public String getServiceStatus() 
    {
        return serviceStatus;
    }

    public void setSaleStatus(String saleStatus) 
    {
        this.saleStatus = saleStatus;
    }

    public String getSaleStatus() 
    {
        return saleStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("customerId", getCustomerId())
            .append("customerName", getCustomerName())
            .append("phoneNumber", getPhoneNumber())
            .append("wechatId", getWechatId())
            .append("xiaohongshuId", getXiaohongshuId())
            .append("douyinId", getDouyinId())
            .append("type", getType())
            .append("promotionAccountId", getPromotionAccountId())
            .append("customerServiceAccountId", getCustomerServiceAccountId())
            .append("salespersonAccountId", getSalespersonAccountId())
            .append("dispatchOrganization", getDispatchOrganization())
            .append("lastDispatchTime", getLastDispatchTime())
            .append("location", getLocation())
            .append("consultingProject", getConsultingProject())
            .append("consultingDetails", getConsultingDetails())
            .append("customerIntention", getCustomerIntention())
            .append("recorderAccountId", getRecorderAccountId())
            .append("recordTime", getRecordTime())
            .append("channelSource", getChannelSource())
            .append("boostStatus", getBoostStatus())
            .append("serviceStatus", getServiceStatus())
            .append("saleStatus", getSaleStatus())
            .toString();
    }
}
