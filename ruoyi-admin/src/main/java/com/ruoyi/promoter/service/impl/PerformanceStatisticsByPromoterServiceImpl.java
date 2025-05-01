package com.ruoyi.promoter.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.promoter.mapper.PerformanceStatisticsByPromoterMapper;
import com.ruoyi.promoter.domain.PerformanceStatisticsByPromoter;
import com.ruoyi.promoter.service.IPerformanceStatisticsByPromoterService;

/**
 * 业绩统计（按推广人）Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-05-01
 */
@Service
public class PerformanceStatisticsByPromoterServiceImpl implements IPerformanceStatisticsByPromoterService 
{
    @Autowired
    private PerformanceStatisticsByPromoterMapper performanceStatisticsByPromoterMapper;

    /**
     * 查询业绩统计（按推广人）
     * 
     * @param performanceId 业绩统计（按推广人）主键
     * @return 业绩统计（按推广人）
     */
    @Override
    public PerformanceStatisticsByPromoter selectPerformanceStatisticsByPromoterByPerformanceId(Long performanceId)
    {
        return performanceStatisticsByPromoterMapper.selectPerformanceStatisticsByPromoterByPerformanceId(performanceId);
    }

    /**
     * 查询业绩统计（按推广人）列表
     * 
     * @param performanceStatisticsByPromoter 业绩统计（按推广人）
     * @return 业绩统计（按推广人）
     */
    @Override
    public List<PerformanceStatisticsByPromoter> selectPerformanceStatisticsByPromoterList(PerformanceStatisticsByPromoter performanceStatisticsByPromoter)
    {
        return performanceStatisticsByPromoterMapper.selectPerformanceStatisticsByPromoterList(performanceStatisticsByPromoter);
    }

    /**
     * 新增业绩统计（按推广人）
     * 
     * @param performanceStatisticsByPromoter 业绩统计（按推广人）
     * @return 结果
     */
    @Override
    public int insertPerformanceStatisticsByPromoter(PerformanceStatisticsByPromoter performanceStatisticsByPromoter)
    {
        return performanceStatisticsByPromoterMapper.insertPerformanceStatisticsByPromoter(performanceStatisticsByPromoter);
    }

    /**
     * 修改业绩统计（按推广人）
     * 
     * @param performanceStatisticsByPromoter 业绩统计（按推广人）
     * @return 结果
     */
    @Override
    public int updatePerformanceStatisticsByPromoter(PerformanceStatisticsByPromoter performanceStatisticsByPromoter)
    {
        return performanceStatisticsByPromoterMapper.updatePerformanceStatisticsByPromoter(performanceStatisticsByPromoter);
    }

    /**
     * 批量删除业绩统计（按推广人）
     * 
     * @param performanceIds 需要删除的业绩统计（按推广人）主键
     * @return 结果
     */
    @Override
    public int deletePerformanceStatisticsByPromoterByPerformanceIds(Long[] performanceIds)
    {
        return performanceStatisticsByPromoterMapper.deletePerformanceStatisticsByPromoterByPerformanceIds(performanceIds);
    }

    /**
     * 删除业绩统计（按推广人）信息
     * 
     * @param performanceId 业绩统计（按推广人）主键
     * @return 结果
     */
    @Override
    public int deletePerformanceStatisticsByPromoterByPerformanceId(Long performanceId)
    {
        return performanceStatisticsByPromoterMapper.deletePerformanceStatisticsByPromoterByPerformanceId(performanceId);
    }
}
