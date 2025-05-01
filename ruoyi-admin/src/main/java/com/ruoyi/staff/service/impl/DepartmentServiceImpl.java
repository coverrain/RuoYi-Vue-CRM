package com.ruoyi.staff.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.staff.mapper.DepartmentMapper;
import com.ruoyi.staff.domain.Department;
import com.ruoyi.staff.service.IDepartmentService;

/**
 * 部门Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-04-24
 */
@Service
public class DepartmentServiceImpl implements IDepartmentService 
{
    @Autowired
    private DepartmentMapper departmentMapper;

    /**
     * 查询部门
     * 
     * @param id 部门主键
     * @return 部门
     */
    @Override
    public Department selectDepartmentById(Long id)
    {
        return departmentMapper.selectDepartmentById(id);
    }

    /**
     * 查询部门列表
     * 
     * @param department 部门
     * @return 部门
     */
    @Override
    public List<Department> selectDepartmentList(Department department)
    {
        return departmentMapper.selectDepartmentList(department);
    }

    /**
     * 新增部门
     * 
     * @param department 部门
     * @return 结果
     */
    @Override
    public int insertDepartment(Department department)
    {
        return departmentMapper.insertDepartment(department);
    }

    /**
     * 修改部门
     * 
     * @param department 部门
     * @return 结果
     */
    @Override
    public int updateDepartment(Department department)
    {
        return departmentMapper.updateDepartment(department);
    }

    /**
     * 批量删除部门
     * 
     * @param ids 需要删除的部门主键
     * @return 结果
     */
    @Override
    public int deleteDepartmentByIds(Long[] ids)
    {
        return departmentMapper.deleteDepartmentByIds(ids);
    }

    /**
     * 删除部门信息
     * 
     * @param id 部门主键
     * @return 结果
     */
    @Override
    public int deleteDepartmentById(Long id)
    {
        return departmentMapper.deleteDepartmentById(id);
    }
}
