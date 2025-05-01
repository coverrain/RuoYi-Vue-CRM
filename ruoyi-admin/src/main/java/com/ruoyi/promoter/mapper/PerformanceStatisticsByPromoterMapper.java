package com.ruoyi.promoter.mapper;

import java.util.List;
import com.ruoyi.promoter.domain.PerformanceStatisticsByPromoter;

/**
 * 业绩统计（按推广人）Mapper接口
 * 
 * @author ruoyi
 * @date 2025-05-01
 */
public interface PerformanceStatisticsByPromoterMapper 
{
    /**
     * 查询业绩统计（按推广人）
     * 
     * @param performanceId 业绩统计（按推广人）主键
     * @return 业绩统计（按推广人）
     */
    public PerformanceStatisticsByPromoter selectPerformanceStatisticsByPromoterByPerformanceId(Long performanceId);

    /**
     * 查询业绩统计（按推广人）列表
     * 
     * @param performanceStatisticsByPromoter 业绩统计（按推广人）
     * @return 业绩统计（按推广人）集合
     */
    public List<PerformanceStatisticsByPromoter> selectPerformanceStatisticsByPromoterList(PerformanceStatisticsByPromoter performanceStatisticsByPromoter);

    /**
     * 新增业绩统计（按推广人）
     * 
     * @param performanceStatisticsByPromoter 业绩统计（按推广人）
     * @return 结果
     */
    public int insertPerformanceStatisticsByPromoter(PerformanceStatisticsByPromoter performanceStatisticsByPromoter);

    /**
     * 修改业绩统计（按推广人）
     * 
     * @param performanceStatisticsByPromoter 业绩统计（按推广人）
     * @return 结果
     */
    public int updatePerformanceStatisticsByPromoter(PerformanceStatisticsByPromoter performanceStatisticsByPromoter);

    /**
     * 删除业绩统计（按推广人）
     * 
     * @param performanceId 业绩统计（按推广人）主键
     * @return 结果
     */
    public int deletePerformanceStatisticsByPromoterByPerformanceId(Long performanceId);

    /**
     * 批量删除业绩统计（按推广人）
     * 
     * @param performanceIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePerformanceStatisticsByPromoterByPerformanceIds(Long[] performanceIds);
}
