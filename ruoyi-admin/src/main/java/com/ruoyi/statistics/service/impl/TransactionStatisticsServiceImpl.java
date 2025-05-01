package com.ruoyi.statistics.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.statistics.mapper.TransactionStatisticsMapper;
import com.ruoyi.statistics.domain.TransactionStatistics;
import com.ruoyi.statistics.service.ITransactionStatisticsService;

/**
 * 成交统计Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-05-01
 */
@Service
public class TransactionStatisticsServiceImpl implements ITransactionStatisticsService 
{
    @Autowired
    private TransactionStatisticsMapper transactionStatisticsMapper;

    /**
     * 查询成交统计
     * 
     * @param statisticsId 成交统计主键
     * @return 成交统计
     */
    @Override
    public TransactionStatistics selectTransactionStatisticsByStatisticsId(Long statisticsId)
    {
        return transactionStatisticsMapper.selectTransactionStatisticsByStatisticsId(statisticsId);
    }

    /**
     * 查询成交统计列表
     * 
     * @param transactionStatistics 成交统计
     * @return 成交统计
     */
    @Override
    public List<TransactionStatistics> selectTransactionStatisticsList(TransactionStatistics transactionStatistics)
    {
        return transactionStatisticsMapper.selectTransactionStatisticsList(transactionStatistics);
    }

    /**
     * 新增成交统计
     * 
     * @param transactionStatistics 成交统计
     * @return 结果
     */
    @Override
    public int insertTransactionStatistics(TransactionStatistics transactionStatistics)
    {
        return transactionStatisticsMapper.insertTransactionStatistics(transactionStatistics);
    }

    /**
     * 修改成交统计
     * 
     * @param transactionStatistics 成交统计
     * @return 结果
     */
    @Override
    public int updateTransactionStatistics(TransactionStatistics transactionStatistics)
    {
        return transactionStatisticsMapper.updateTransactionStatistics(transactionStatistics);
    }

    /**
     * 批量删除成交统计
     * 
     * @param statisticsIds 需要删除的成交统计主键
     * @return 结果
     */
    @Override
    public int deleteTransactionStatisticsByStatisticsIds(Long[] statisticsIds)
    {
        return transactionStatisticsMapper.deleteTransactionStatisticsByStatisticsIds(statisticsIds);
    }

    /**
     * 删除成交统计信息
     * 
     * @param statisticsId 成交统计主键
     * @return 结果
     */
    @Override
    public int deleteTransactionStatisticsByStatisticsId(Long statisticsId)
    {
        return transactionStatisticsMapper.deleteTransactionStatisticsByStatisticsId(statisticsId);
    }
}
