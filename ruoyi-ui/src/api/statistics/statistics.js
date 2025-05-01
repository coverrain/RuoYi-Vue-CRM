import request from '@/utils/request'

// 查询成交统计列表
export function listStatistics(query) {
  return request({
    url: '/statistics/statistics/list',
    method: 'get',
    params: query
  })
}

// 查询成交统计详细
export function getStatistics(statisticsId) {
  return request({
    url: '/statistics/statistics/' + statisticsId,
    method: 'get'
  })
}

// 新增成交统计
export function addStatistics(data) {
  return request({
    url: '/statistics/statistics',
    method: 'post',
    data: data
  })
}

// 修改成交统计
export function updateStatistics(data) {
  return request({
    url: '/statistics/statistics',
    method: 'put',
    data: data
  })
}

// 删除成交统计
export function delStatistics(statisticsId) {
  return request({
    url: '/statistics/statistics/' + statisticsId,
    method: 'delete'
  })
}
