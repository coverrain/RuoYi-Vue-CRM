import request from '@/utils/request'

// 查询内部查重列表
export function listCheck(query) {
  return request({
    url: '/check/check/listWithCustomer',
    method: 'get',
    params: query
  })
}

// 查询内部查重详细
export function getCheck(checkId) {
  return request({
    url: '/check/check/' + checkId,
    method: 'get'
  })
}

// 新增内部查重
export function addCheck(data) {
  return request({
    url: '/check/check',
    method: 'post',
    data: data
  })
}

// 修改内部查重
export function updateCheck(data) {
  return request({
    url: '/check/check',
    method: 'put',
    data: data
  })
}

// 删除内部查重
export function delCheck(checkId) {
  return request({
    url: '/check/check/' + checkId,
    method: 'delete'
  })
}
