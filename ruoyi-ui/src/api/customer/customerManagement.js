import request from '@/utils/request'

// 查询客户管理列表
export function listCustomerManagement(query) {
  return request({
    url: '/customer/customerManagement/list',
    method: 'get',
    params: query
  })
}

// 查询客户管理详细
export function getCustomerManagement(customerId) {
  return request({
    url: '/customer/customerManagement/' + customerId,
    method: 'get'
  })
}

// 新增客户管理
export function addCustomerManagement(data) {
  return request({
    url: '/customer/customerManagement',
    method: 'post',
    data: data
  })
}

// 修改客户管理
export function updateCustomerManagement(data) {
  return request({
    url: '/customer/customerManagement',
    method: 'put',
    data: data
  })
}

// 删除客户管理
export function delCustomerManagement(customerId) {
  return request({
    url: '/customer/customerManagement/' + customerId,
    method: 'delete'
  })
}
