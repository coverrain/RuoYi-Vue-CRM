import request from '@/utils/request'

// 查询业绩统计（按推广人）列表
export function listPromoter(query) {
  return request({
    url: '/promoter/promoter/list',
    method: 'get',
    params: query
  })
}

// 查询业绩统计（按推广人）详细
export function getPromoter(performanceId) {
  return request({
    url: '/promoter/promoter/' + performanceId,
    method: 'get'
  })
}

// 新增业绩统计（按推广人）
export function addPromoter(data) {
  return request({
    url: '/promoter/promoter',
    method: 'post',
    data: data
  })
}

// 修改业绩统计（按推广人）
export function updatePromoter(data) {
  return request({
    url: '/promoter/promoter',
    method: 'put',
    data: data
  })
}

// 删除业绩统计（按推广人）
export function delPromoter(performanceId) {
  return request({
    url: '/promoter/promoter/' + performanceId,
    method: 'delete'
  })
}
