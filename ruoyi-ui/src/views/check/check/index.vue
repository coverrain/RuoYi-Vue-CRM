<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="查重记录 ID" prop="checkId">
        <el-input
          v-model="queryParams.checkId"
          placeholder="请输入查重记录 ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号" prop="phoneNumber">
        <el-input
          v-model="queryParams.phoneNumber"
          placeholder="请输入手机号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="微信号" prop="wechatId">
        <el-input
          v-model="queryParams.wechatId"
          placeholder="请输入微信号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="抖音 ID" prop="douyinId">
        <el-input
          v-model="queryParams.douyinId"
          placeholder="请输入抖音 ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="机构名称" prop="organizationName">
        <el-input
          v-model="queryParams.organizationName"
          placeholder="请输入机构名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="统一社会信用代码" prop="creditCode">
        <el-input
          v-model="queryParams.creditCode"
          placeholder="请输入统一社会信用代码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="查重时间" prop="checkTime">
        <el-date-picker clearable
          v-model="queryParams.checkTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择查重时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="关联的客户 ID" prop="customerId">
        <el-input
          v-model="queryParams.customerId"
          placeholder="请输入关联的客户 ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['check:check:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['check:check:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['check:check:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['check:check:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="checkList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="查重记录ID" align="center" prop="checkId" />
      <el-table-column label="客户手机号">
        <template slot-scope="{row}">
          {{ row.customer.phoneNumber }}
        </template>
      </el-table-column>
      <el-table-column label="客户微信号">
        <template slot-scope="{row}">
          {{ row.customer.wechatId }}
        </template>
      </el-table-column>
      <el-table-column label="客户抖音ID">
        <template slot-scope="{row}">
          {{ row.customer.douyinId }}
        </template>
      </el-table-column>
      <el-table-column label="客户小红书ID">
        <template slot-scope="{row}">
          {{ row.customer.xiaohongshuId }}
        </template>
      </el-table-column>
      <el-table-column label="客户类型">
        <template slot-scope="{row}">
          {{ row.customer.type }}
        </template>
      </el-table-column>
      <el-table-column label="推广人员账号ID">
        <template slot-scope="{row}">
          {{ row.customer.promotionAccountId }}
        </template>
      </el-table-column>
      <el-table-column label="客服人员账号ID">
        <template slot-scope="{row}">
          {{ row.customer.customerServiceAccountId }}
        </template>
      </el-table-column>
      <el-table-column label="销售人员账号ID">
        <template slot-scope="{row}">
          {{ row.customer.salespersonAccountId }}
        </template>
      </el-table-column>
      <el-table-column label="派单机构">
        <template slot-scope="{row}">
          {{ row.customer.dispatchOrganization }}
        </template>
      </el-table-column>
      <el-table-column label="最近派单时间" align="center" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.customer.lastDispatchTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="所在地">
        <template slot-scope="{row}">
          {{ row.customer.location }}
        </template>
      </el-table-column>
      <el-table-column label="咨询项目">
        <template slot-scope="{row}">
          {{ row.customer.consultingProject }}
        </template>
      </el-table-column>
      <el-table-column label="咨询详情">
        <template slot-scope="{row}">
          {{ row.customer.consultingDetails }}
        </template>
      </el-table-column>
      <el-table-column label="客户意愿">
        <template slot-scope="{row}">
          {{ row.customer.customerIntention }}
        </template>
      </el-table-column>
      <el-table-column label="录单人账号ID">
        <template slot-scope="{row}">
          {{ row.customer.recorderAccountId }}
        </template>
      </el-table-column>
      <el-table-column label="录单时间" align="center" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.customer.recordTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="渠道来源">
        <template slot-scope="{row}">
          {{ row.customer.channelSource }}
        </template>
      </el-table-column>
      <el-table-column label="是否助推">
        <template slot-scope="{row}">
          {{ row.customer.boostStatus === '1'? '是' : '否' }}
        </template>
      </el-table-column>
      <el-table-column label="客服添加">
        <template slot-scope="{row}">
          {{ row.customer.serviceStatus === '1'? '是' : '否' }}
        </template>
      </el-table-column>
      <el-table-column label="销售添加">
        <template slot-scope="{row}">
          {{ row.customer.saleStatus === '1'? '是' : '否' }}
        </template>
      </el-table-column>
      <el-table-column label="查重时间" align="center" prop="checkTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.checkTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="客户名称">
        <template slot-scope="{row}">
          {{ row.customer.customerName }}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['check:check:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['check:check:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改内部查重对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="手机号" prop="phoneNumber">
          <el-input v-model="form.phoneNumber" placeholder="请输入手机号" />
        </el-form-item>
        <el-form-item label="微信号" prop="wechatId">
          <el-input v-model="form.wechatId" placeholder="请输入微信号" />
        </el-form-item>
        <el-form-item label="抖音 ID" prop="douyinId">
          <el-input v-model="form.douyinId" placeholder="请输入抖音 ID" />
        </el-form-item>
        <el-form-item label="机构名称" prop="organizationName">
          <el-input v-model="form.organizationName" placeholder="请输入机构名称" />
        </el-form-item>
        <el-form-item label="统一社会信用代码" prop="creditCode">
          <el-input v-model="form.creditCode" placeholder="请输入统一社会信用代码" />
        </el-form-item>
        <el-form-item label="查重时间" prop="checkTime">
          <el-date-picker clearable
            v-model="form.checkTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择查重时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="关联的客户 ID" prop="customerId">
          <el-input v-model="form.customerId" placeholder="请输入关联的客户 ID" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCheck, getCheck, delCheck, addCheck, updateCheck } from "@/api/check/check";

export default {
  name: "Check",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 内部查重表格数据
      checkList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        checkId: null,
        phoneNumber: null,
        wechatId: null,
        douyinId: null,
        organizationName: null,
        creditCode: null,
        checkTime: null,
        customerId: null,
        //customerName: null,
        customer:null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询内部查重列表 */
    getList() {
      this.loading = true;
      listCheck(this.queryParams).then(response => {
        this.checkList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        checkId: null,
        phoneNumber: null,
        wechatId: null,
        douyinId: null,
        organizationName: null,
        creditCode: null,
        checkTime: null,
        customerId: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.checkId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加内部查重";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const checkId = row.checkId || this.ids
      getCheck(checkId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改内部查重";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.checkId != null) {
            updateCheck(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCheck(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const checkIds = row.checkId || this.ids;
      this.$modal.confirm('是否确认删除内部查重编号为"' + checkIds + '"的数据项？').then(function() {
        return delCheck(checkIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('check/check/export', {
        ...this.queryParams
      }, `check_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
