<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入姓名"
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
      <el-form-item label="小红书 ID" prop="xiaohongshuId">
        <el-input
          v-model="queryParams.xiaohongshuId"
          placeholder="请输入小红书 ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="微信" prop="wechat">
        <el-input
          v-model="queryParams.wechat"
          placeholder="请输入微信"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="录单时间" prop="orderEntryTime">
        <el-date-picker clearable
          v-model="queryParams.orderEntryTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择录单时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="成交状态" prop="transactionStatus">
        <el-select v-model="queryParams.transactionStatus" placeholder="请选择成交状态" clearable>
          <el-option
            v-for="dict in dict.type.transaction_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="成交日期" prop="transactionDate">
        <el-date-picker clearable
          v-model="queryParams.transactionDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择成交日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="成交机构" prop="transactionOrganization">
        <el-input
          v-model="queryParams.transactionOrganization"
          placeholder="请输入成交机构"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="成交项目" prop="transactionProject">
        <el-input
          v-model="queryParams.transactionProject"
          placeholder="请输入成交项目"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="成交金额" prop="transactionAmount">
        <el-input
          v-model="queryParams.transactionAmount"
          placeholder="请输入成交金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="返点比例" prop="rebateRatio">
        <el-input
          v-model="queryParams.rebateRatio"
          placeholder="请输入返点比例"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="返点金额" prop="rebateAmount">
        <el-input
          v-model="queryParams.rebateAmount"
          placeholder="请输入返点金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="尾款" prop="balance">
        <el-input
          v-model="queryParams.balance"
          placeholder="请输入尾款"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="已补缴" prop="paidAmount">
        <el-input
          v-model="queryParams.paidAmount"
          placeholder="请输入已补缴"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="待补缴" prop="toBePaidAmount">
        <el-input
          v-model="queryParams.toBePaidAmount"
          placeholder="请输入待补缴"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客服账号 ID" prop="customerServiceAccountId">
        <el-input
          v-model="queryParams.customerServiceAccountId"
          placeholder="请输入客服账号 ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="渠道来源" prop="channelSource">
        <el-input
          v-model="queryParams.channelSource"
          placeholder="请输入渠道来源"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="推广人账号 ID" prop="promotionAccountId">
        <el-input
          v-model="queryParams.promotionAccountId"
          placeholder="请输入推广人账号 ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="销售人员账号 ID" prop="salespersonAccountId">
        <el-input
          v-model="queryParams.salespersonAccountId"
          placeholder="请输入销售人员账号 ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="录单人账号 ID" prop="recorderAccountId">
        <el-input
          v-model="queryParams.recorderAccountId"
          placeholder="请输入录单人账号 ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['statistics:statistics:add']"
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
          v-hasPermi="['statistics:statistics:edit']"
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
          v-hasPermi="['statistics:statistics:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['statistics:statistics:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="statisticsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="统计记录 ID" align="center" prop="statisticsId" />
      <el-table-column label="姓名" align="center" prop="name" />
      <el-table-column label="手机号" align="center" prop="phoneNumber" />
      <el-table-column label="小红书 ID" align="center" prop="xiaohongshuId" />
      <el-table-column label="微信" align="center" prop="wechat" />
      <el-table-column label="录单时间" align="center" prop="orderEntryTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderEntryTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="成交状态" align="center" prop="transactionStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.transaction_status" :value="scope.row.transactionStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="成交日期" align="center" prop="transactionDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.transactionDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="成交机构" align="center" prop="transactionOrganization">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.order_institution_group" :value="scope.row.transactionOrganization"/>
        </template>
      </el-table-column>
      <el-table-column label="成交项目" align="center" prop="transactionProject">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.consulting_project_type" :value="scope.row.transactionProject"/>
        </template>
      </el-table-column>
      <el-table-column label="成交金额" align="center" prop="transactionAmount" />
      <el-table-column label="返点比例" align="center" prop="rebateRatio" />
      <el-table-column label="返点金额" align="center" prop="rebateAmount" />
      <el-table-column label="尾款" align="center" prop="balance" />
      <el-table-column label="已补缴" align="center" prop="paidAmount" />
      <el-table-column label="待补缴" align="center" prop="toBePaidAmount" />
      <el-table-column label="类型" align="center" prop="type" />
      <el-table-column label="客服账号 ID" align="center" prop="customerServiceAccountId" />
      <el-table-column label="渠道来源" align="center" prop="channelSource">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.channel_source" :value="scope.row.channelSource"/>
        </template>
      </el-table-column>
      <el-table-column label="推广人账号 ID" align="center" prop="promotionAccountId" />
      <el-table-column label="销售人员账号 ID" align="center" prop="salespersonAccountId" />
      <el-table-column label="录单人账号 ID" align="center" prop="recorderAccountId" />
      <el-table-column label="关联的客户 ID" align="center" prop="customerId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['statistics:statistics:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['statistics:statistics:remove']"
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

    <!-- 添加或修改成交统计对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="手机号" prop="phoneNumber">
          <el-input v-model="form.phoneNumber" placeholder="请输入手机号" />
        </el-form-item>
        <el-form-item label="小红书 ID" prop="xiaohongshuId">
          <el-input v-model="form.xiaohongshuId" placeholder="请输入小红书 ID" />
        </el-form-item>
        <el-form-item label="微信" prop="wechat">
          <el-input v-model="form.wechat" placeholder="请输入微信" />
        </el-form-item>
        <el-form-item label="录单时间" prop="orderEntryTime">
          <el-date-picker clearable
            v-model="form.orderEntryTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择录单时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="成交状态" prop="transactionStatus">
          <el-radio-group v-model="form.transactionStatus">
            <el-radio
              v-for="dict in dict.type.transaction_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="成交日期" prop="transactionDate">
          <el-date-picker clearable
            v-model="form.transactionDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择成交日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="成交机构" prop="transactionOrganization">
          <el-input v-model="form.transactionOrganization" placeholder="请输入成交机构" />
        </el-form-item>
        <el-form-item label="成交项目" prop="transactionProject">
          <el-input v-model="form.transactionProject" placeholder="请输入成交项目" />
        </el-form-item>
        <el-form-item label="成交金额" prop="transactionAmount">
          <el-input v-model="form.transactionAmount" placeholder="请输入成交金额" />
        </el-form-item>
        <el-form-item label="返点比例" prop="rebateRatio">
          <el-input v-model="form.rebateRatio" placeholder="请输入返点比例" />
        </el-form-item>
        <el-form-item label="返点金额" prop="rebateAmount">
          <el-input v-model="form.rebateAmount" placeholder="请输入返点金额" />
        </el-form-item>
        <el-form-item label="尾款" prop="balance">
          <el-input v-model="form.balance" placeholder="请输入尾款" />
        </el-form-item>
        <el-form-item label="已补缴" prop="paidAmount">
          <el-input v-model="form.paidAmount" placeholder="请输入已补缴" />
        </el-form-item>
        <el-form-item label="待补缴" prop="toBePaidAmount">
          <el-input v-model="form.toBePaidAmount" placeholder="请输入待补缴" />
        </el-form-item>
        <el-form-item label="客服账号 ID" prop="customerServiceAccountId">
          <el-input v-model="form.customerServiceAccountId" placeholder="请输入客服账号 ID" />
        </el-form-item>
        <el-form-item label="渠道来源" prop="channelSource">
          <el-input v-model="form.channelSource" placeholder="请输入渠道来源" />
        </el-form-item>
        <el-form-item label="推广人账号 ID" prop="promotionAccountId">
          <el-input v-model="form.promotionAccountId" placeholder="请输入推广人账号 ID" />
        </el-form-item>
        <el-form-item label="销售人员账号 ID" prop="salespersonAccountId">
          <el-input v-model="form.salespersonAccountId" placeholder="请输入销售人员账号 ID" />
        </el-form-item>
        <el-form-item label="录单人账号 ID" prop="recorderAccountId">
          <el-input v-model="form.recorderAccountId" placeholder="请输入录单人账号 ID" />
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
import { listStatistics, getStatistics, delStatistics, addStatistics, updateStatistics } from "@/api/statistics/statistics";

export default {
  name: "Statistics",
  dicts: ['transaction_status'],
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
      // 成交统计表格数据
      statisticsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        phoneNumber: null,
        xiaohongshuId: null,
        wechat: null,
        orderEntryTime: null,
        transactionStatus: null,
        transactionDate: null,
        transactionOrganization: null,
        transactionProject: null,
        transactionAmount: null,
        rebateRatio: null,
        rebateAmount: null,
        balance: null,
        paidAmount: null,
        toBePaidAmount: null,
        type: null,
        customerServiceAccountId: null,
        channelSource: null,
        promotionAccountId: null,
        salespersonAccountId: null,
        recorderAccountId: null,
        customerId: null
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
    /** 查询成交统计列表 */
    getList() {
      this.loading = true;
      listStatistics(this.queryParams).then(response => {
        this.statisticsList = response.rows;
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
        statisticsId: null,
        name: null,
        phoneNumber: null,
        xiaohongshuId: null,
        wechat: null,
        orderEntryTime: null,
        transactionStatus: null,
        transactionDate: null,
        transactionOrganization: null,
        transactionProject: null,
        transactionAmount: null,
        rebateRatio: null,
        rebateAmount: null,
        balance: null,
        paidAmount: null,
        toBePaidAmount: null,
        type: null,
        customerServiceAccountId: null,
        channelSource: null,
        promotionAccountId: null,
        salespersonAccountId: null,
        recorderAccountId: null,
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
      this.ids = selection.map(item => item.statisticsId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加成交统计";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const statisticsId = row.statisticsId || this.ids
      getStatistics(statisticsId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改成交统计";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.statisticsId != null) {
            updateStatistics(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addStatistics(this.form).then(response => {
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
      const statisticsIds = row.statisticsId || this.ids;
      this.$modal.confirm('是否确认删除成交统计编号为"' + statisticsIds + '"的数据项？').then(function() {
        return delStatistics(statisticsIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('statistics/statistics/export', {
        ...this.queryParams
      }, `statistics_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
