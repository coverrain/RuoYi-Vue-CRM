package com.ruoyi.check.controller;

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
import com.ruoyi.check.domain.InternalDuplicateCheck;
import com.ruoyi.check.service.IInternalDuplicateCheckService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 内部查重Controller
 * 
 * @author ruoyi
 * @date 2025-04-28
 */
@RestController
@RequestMapping("/check/check")
public class InternalDuplicateCheckController extends BaseController
{
    @Autowired
    private IInternalDuplicateCheckService internalDuplicateCheckService;

    /**
     * 查询内部查重列表
     */
    @PreAuthorize("@ss.hasPermi('check:check:list')")
    @GetMapping("/list")
    public TableDataInfo list(InternalDuplicateCheck internalDuplicateCheck)
    {
        startPage();
        List<InternalDuplicateCheck> list = internalDuplicateCheckService.selectInternalDuplicateCheckList(internalDuplicateCheck);
        return getDataTable(list);
    }

    /**
     * 导出内部查重列表
     */
    @PreAuthorize("@ss.hasPermi('check:check:export')")
    @Log(title = "内部查重", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, InternalDuplicateCheck internalDuplicateCheck)
    {
        List<InternalDuplicateCheck> list = internalDuplicateCheckService.selectInternalDuplicateCheckList(internalDuplicateCheck);
        ExcelUtil<InternalDuplicateCheck> util = new ExcelUtil<InternalDuplicateCheck>(InternalDuplicateCheck.class);
        util.exportExcel(response, list, "内部查重数据");
    }

    /**
     * 获取内部查重详细信息
     */
    @PreAuthorize("@ss.hasPermi('check:check:query')")
    @GetMapping(value = "/{checkId}")
    public AjaxResult getInfo(@PathVariable("checkId") Long checkId)
    {
        return success(internalDuplicateCheckService.selectInternalDuplicateCheckByCheckId(checkId));
    }

    /**
     * 新增内部查重
     */
    @PreAuthorize("@ss.hasPermi('check:check:add')")
    @Log(title = "内部查重", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody InternalDuplicateCheck internalDuplicateCheck)
    {
        return toAjax(internalDuplicateCheckService.insertInternalDuplicateCheck(internalDuplicateCheck));
    }

    /**
     * 修改内部查重
     */
    @PreAuthorize("@ss.hasPermi('check:check:edit')")
    @Log(title = "内部查重", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody InternalDuplicateCheck internalDuplicateCheck)
    {
        return toAjax(internalDuplicateCheckService.updateInternalDuplicateCheck(internalDuplicateCheck));
    }

    /**
     * 删除内部查重
     */
    @PreAuthorize("@ss.hasPermi('check:check:remove')")
    @Log(title = "内部查重", businessType = BusinessType.DELETE)
	@DeleteMapping("/{checkIds}")
    public AjaxResult remove(@PathVariable Long[] checkIds)
    {
        return toAjax(internalDuplicateCheckService.deleteInternalDuplicateCheckByCheckIds(checkIds));
    }
    @PreAuthorize("@ss.hasPermi('check:check:list')")
    @GetMapping("/listWithCustomer")
    public TableDataInfo listWithCustomer(InternalDuplicateCheck internalDuplicateCheck) {
        startPage();
        List<InternalDuplicateCheck> list = internalDuplicateCheckService.selectInternalDuplicateCheckListWithCustomer(internalDuplicateCheck);
        return getDataTable(list);
    }
    @PreAuthorize("@ss.hasPermi('check:check:query')")
    @GetMapping("/withCustomer/{checkId}")
    //@GetMapping("/withCustomer/{checkId}")
    public AjaxResult getInfoWithCustomer(@PathVariable("checkId") Long checkId) {
        return success(internalDuplicateCheckService.selectInternalDuplicateCheckWithCustomerByCheckId(checkId));
    }
}
