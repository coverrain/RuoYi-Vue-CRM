package com.ruoyi.statistics.controller;

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
import com.ruoyi.statistics.domain.TransactionStatistics;
import com.ruoyi.statistics.service.ITransactionStatisticsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 成交统计Controller
 * 
 * @author ruoyi
 * @date 2025-05-01
 */
@RestController
@RequestMapping("/statistics/statistics")
public class TransactionStatisticsController extends BaseController
{
    @Autowired
    private ITransactionStatisticsService transactionStatisticsService;

    /**
     * 查询成交统计列表
     */
    @PreAuthorize("@ss.hasPermi('statistics:statistics:list')")
    @GetMapping("/list")
    public TableDataInfo list(TransactionStatistics transactionStatistics)
    {
        startPage();
        List<TransactionStatistics> list = transactionStatisticsService.selectTransactionStatisticsList(transactionStatistics);
        return getDataTable(list);
    }

    /**
     * 导出成交统计列表
     */
    @PreAuthorize("@ss.hasPermi('statistics:statistics:export')")
    @Log(title = "成交统计", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TransactionStatistics transactionStatistics)
    {
        List<TransactionStatistics> list = transactionStatisticsService.selectTransactionStatisticsList(transactionStatistics);
        ExcelUtil<TransactionStatistics> util = new ExcelUtil<TransactionStatistics>(TransactionStatistics.class);
        util.exportExcel(response, list, "成交统计数据");
    }

    /**
     * 获取成交统计详细信息
     */
    @PreAuthorize("@ss.hasPermi('statistics:statistics:query')")
    @GetMapping(value = "/{statisticsId}")
    public AjaxResult getInfo(@PathVariable("statisticsId") Long statisticsId)
    {
        return success(transactionStatisticsService.selectTransactionStatisticsByStatisticsId(statisticsId));
    }

    /**
     * 新增成交统计
     */
    @PreAuthorize("@ss.hasPermi('statistics:statistics:add')")
    @Log(title = "成交统计", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TransactionStatistics transactionStatistics)
    {
        return toAjax(transactionStatisticsService.insertTransactionStatistics(transactionStatistics));
    }

    /**
     * 修改成交统计
     */
    @PreAuthorize("@ss.hasPermi('statistics:statistics:edit')")
    @Log(title = "成交统计", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TransactionStatistics transactionStatistics)
    {
        return toAjax(transactionStatisticsService.updateTransactionStatistics(transactionStatistics));
    }

    /**
     * 删除成交统计
     */
    @PreAuthorize("@ss.hasPermi('statistics:statistics:remove')")
    @Log(title = "成交统计", businessType = BusinessType.DELETE)
	@DeleteMapping("/{statisticsIds}")
    public AjaxResult remove(@PathVariable Long[] statisticsIds)
    {
        return toAjax(transactionStatisticsService.deleteTransactionStatisticsByStatisticsIds(statisticsIds));
    }
}
