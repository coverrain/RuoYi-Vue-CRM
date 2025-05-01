package com.ruoyi.statistics.mapper;

import java.util.List;
import com.ruoyi.statistics.domain.TransactionStatistics;

/**
 * 成交统计Mapper接口
 * 
 * @author ruoyi
 * @date 2025-05-01
 */
public interface TransactionStatisticsMapper 
{
    /**
     * 查询成交统计
     * 
     * @param statisticsId 成交统计主键
     * @return 成交统计
     */
    public TransactionStatistics selectTransactionStatisticsByStatisticsId(Long statisticsId);

    /**
     * 查询成交统计列表
     * 
     * @param transactionStatistics 成交统计
     * @return 成交统计集合
     */
    public List<TransactionStatistics> selectTransactionStatisticsList(TransactionStatistics transactionStatistics);

    /**
     * 新增成交统计
     * 
     * @param transactionStatistics 成交统计
     * @return 结果
     */
    public int insertTransactionStatistics(TransactionStatistics transactionStatistics);

    /**
     * 修改成交统计
     * 
     * @param transactionStatistics 成交统计
     * @return 结果
     */
    public int updateTransactionStatistics(TransactionStatistics transactionStatistics);

    /**
     * 删除成交统计
     * 
     * @param statisticsId 成交统计主键
     * @return 结果
     */
    public int deleteTransactionStatisticsByStatisticsId(Long statisticsId);

    /**
     * 批量删除成交统计
     * 
     * @param statisticsIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTransactionStatisticsByStatisticsIds(Long[] statisticsIds);
}
