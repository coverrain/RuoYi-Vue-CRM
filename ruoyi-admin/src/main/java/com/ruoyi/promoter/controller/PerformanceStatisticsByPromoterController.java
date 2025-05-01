package com.ruoyi.promoter.controller;

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
import com.ruoyi.promoter.domain.PerformanceStatisticsByPromoter;
import com.ruoyi.promoter.service.IPerformanceStatisticsByPromoterService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 业绩统计（按推广人）Controller
 * 
 * @author ruoyi
 * @date 2025-05-01
 */
@RestController
@RequestMapping("/promoter/promoter")
public class PerformanceStatisticsByPromoterController extends BaseController
{
    @Autowired
    private IPerformanceStatisticsByPromoterService performanceStatisticsByPromoterService;

    /**
     * 查询业绩统计（按推广人）列表
     */
    @PreAuthorize("@ss.hasPermi('promoter:promoter:list')")
    @GetMapping("/list")
    public TableDataInfo list(PerformanceStatisticsByPromoter performanceStatisticsByPromoter)
    {
        startPage();
        List<PerformanceStatisticsByPromoter> list = performanceStatisticsByPromoterService.selectPerformanceStatisticsByPromoterList(performanceStatisticsByPromoter);
        return getDataTable(list);
    }

    /**
     * 导出业绩统计（按推广人）列表
     */
    @PreAuthorize("@ss.hasPermi('promoter:promoter:export')")
    @Log(title = "业绩统计（按推广人）", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PerformanceStatisticsByPromoter performanceStatisticsByPromoter)
    {
        List<PerformanceStatisticsByPromoter> list = performanceStatisticsByPromoterService.selectPerformanceStatisticsByPromoterList(performanceStatisticsByPromoter);
        ExcelUtil<PerformanceStatisticsByPromoter> util = new ExcelUtil<PerformanceStatisticsByPromoter>(PerformanceStatisticsByPromoter.class);
        util.exportExcel(response, list, "业绩统计（按推广人）数据");
    }

    /**
     * 获取业绩统计（按推广人）详细信息
     */
    @PreAuthorize("@ss.hasPermi('promoter:promoter:query')")
    @GetMapping(value = "/{performanceId}")
    public AjaxResult getInfo(@PathVariable("performanceId") Long performanceId)
    {
        return success(performanceStatisticsByPromoterService.selectPerformanceStatisticsByPromoterByPerformanceId(performanceId));
    }

    /**
     * 新增业绩统计（按推广人）
     */
    @PreAuthorize("@ss.hasPermi('promoter:promoter:add')")
    @Log(title = "业绩统计（按推广人）", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PerformanceStatisticsByPromoter performanceStatisticsByPromoter)
    {
        return toAjax(performanceStatisticsByPromoterService.insertPerformanceStatisticsByPromoter(performanceStatisticsByPromoter));
    }

    /**
     * 修改业绩统计（按推广人）
     */
    @PreAuthorize("@ss.hasPermi('promoter:promoter:edit')")
    @Log(title = "业绩统计（按推广人）", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PerformanceStatisticsByPromoter performanceStatisticsByPromoter)
    {
        return toAjax(performanceStatisticsByPromoterService.updatePerformanceStatisticsByPromoter(performanceStatisticsByPromoter));
    }

    /**
     * 删除业绩统计（按推广人）
     */
    @PreAuthorize("@ss.hasPermi('promoter:promoter:remove')")
    @Log(title = "业绩统计（按推广人）", businessType = BusinessType.DELETE)
	@DeleteMapping("/{performanceIds}")
    public AjaxResult remove(@PathVariable Long[] performanceIds)
    {
        return toAjax(performanceStatisticsByPromoterService.deletePerformanceStatisticsByPromoterByPerformanceIds(performanceIds));
    }
}
