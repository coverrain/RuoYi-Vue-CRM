<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="推广人账号 ID" prop="promoterAccountId">
        <el-input
          v-model="queryParams.promoterAccountId"
          placeholder="请输入推广人账号 ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="部门ID" prop="departmentId">
        <el-input
          v-model="queryParams.departmentId"
          placeholder="请输入部门ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="线索量" prop="leadQuantity">
        <el-input
          v-model="queryParams.leadQuantity"
          placeholder="请输入线索量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="重单量" prop="duplicateOrderQuantity">
        <el-input
          v-model="queryParams.duplicateOrderQuantity"
          placeholder="请输入重单量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="重单率" prop="duplicateOrderRate">
        <el-input
          v-model="queryParams.duplicateOrderRate"
          placeholder="请输入重单率"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="添加量" prop="additionQuantity">
        <el-input
          v-model="queryParams.additionQuantity"
          placeholder="请输入添加量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="添加率" prop="additionRate">
        <el-input
          v-model="queryParams.additionRate"
          placeholder="请输入添加率"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="成交量" prop="transactionQuantity">
        <el-input
          v-model="queryParams.transactionQuantity"
          placeholder="请输入成交量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="成交率" prop="transactionRate">
        <el-input
          v-model="queryParams.transactionRate"
          placeholder="请输入成交率"
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
      <el-form-item label="返款金额" prop="rebateAmount">
        <el-input
          v-model="queryParams.rebateAmount"
          placeholder="请输入返款金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="统计时间段" prop="statisticalTimePeriod">
        <el-input
          v-model="queryParams.statisticalTimePeriod"
          placeholder="请输入统计时间段"
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
          v-hasPermi="['promoter:promoter:add']"
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
          v-hasPermi="['promoter:promoter:edit']"
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
          v-hasPermi="['promoter:promoter:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['promoter:promoter:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="promoterList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="业绩统计记录 ID" align="center" prop="performanceId" />
      <el-table-column label="推广人账号 ID" align="center" prop="promoterAccountId" />
      <el-table-column label="部门ID" align="center" prop="departmentId" />
      <el-table-column label="线索量" align="center" prop="leadQuantity" />
      <el-table-column label="重单量" align="center" prop="duplicateOrderQuantity" />
      <el-table-column label="重单率" align="center" prop="duplicateOrderRate" />
      <el-table-column label="添加量" align="center" prop="additionQuantity" />
      <el-table-column label="添加率" align="center" prop="additionRate" />
      <el-table-column label="成交量" align="center" prop="transactionQuantity" />
      <el-table-column label="成交率" align="center" prop="transactionRate" />
      <el-table-column label="成交金额" align="center" prop="transactionAmount" />
      <el-table-column label="返款金额" align="center" prop="rebateAmount" />
      <el-table-column label="统计时间段" align="center" prop="statisticalTimePeriod" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['promoter:promoter:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['promoter:promoter:remove']"
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

    <!-- 添加或修改业绩统计（按推广人）对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="推广人账号 ID" prop="promoterAccountId">
          <el-input v-model="form.promoterAccountId" placeholder="请输入推广人账号 ID" />
        </el-form-item>
        <el-form-item label="部门ID" prop="departmentId">
          <el-input v-model="form.departmentId" placeholder="请输入部门ID" />
        </el-form-item>
        <el-form-item label="线索量" prop="leadQuantity">
          <el-input v-model="form.leadQuantity" placeholder="请输入线索量" />
        </el-form-item>
        <el-form-item label="重单量" prop="duplicateOrderQuantity">
          <el-input v-model="form.duplicateOrderQuantity" placeholder="请输入重单量" />
        </el-form-item>
        <el-form-item label="重单率" prop="duplicateOrderRate">
          <el-input v-model="form.duplicateOrderRate" placeholder="请输入重单率" />
        </el-form-item>
        <el-form-item label="添加量" prop="additionQuantity">
          <el-input v-model="form.additionQuantity" placeholder="请输入添加量" />
        </el-form-item>
        <el-form-item label="添加率" prop="additionRate">
          <el-input v-model="form.additionRate" placeholder="请输入添加率" />
        </el-form-item>
        <el-form-item label="成交量" prop="transactionQuantity">
          <el-input v-model="form.transactionQuantity" placeholder="请输入成交量" />
        </el-form-item>
        <el-form-item label="成交率" prop="transactionRate">
          <el-input v-model="form.transactionRate" placeholder="请输入成交率" />
        </el-form-item>
        <el-form-item label="成交金额" prop="transactionAmount">
          <el-input v-model="form.transactionAmount" placeholder="请输入成交金额" />
        </el-form-item>
        <el-form-item label="返款金额" prop="rebateAmount">
          <el-input v-model="form.rebateAmount" placeholder="请输入返款金额" />
        </el-form-item>
        <el-form-item label="统计时间段" prop="statisticalTimePeriod">
          <el-input v-model="form.statisticalTimePeriod" placeholder="请输入统计时间段" />
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
import { listPromoter, getPromoter, delPromoter, addPromoter, updatePromoter } from "@/api/promoter/promoter";

export default {
  name: "Promoter",
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
      // 业绩统计（按推广人）表格数据
      promoterList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        promoterAccountId: null,
        departmentId: null,
        leadQuantity: null,
        duplicateOrderQuantity: null,
        duplicateOrderRate: null,
        additionQuantity: null,
        additionRate: null,
        transactionQuantity: null,
        transactionRate: null,
        transactionAmount: null,
        rebateAmount: null,
        statisticalTimePeriod: null
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
    /** 查询业绩统计（按推广人）列表 */
    getList() {
      this.loading = true;
      listPromoter(this.queryParams).then(response => {
        this.promoterList = response.rows;
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
        performanceId: null,
        promoterAccountId: null,
        departmentId: null,
        leadQuantity: null,
        duplicateOrderQuantity: null,
        duplicateOrderRate: null,
        additionQuantity: null,
        additionRate: null,
        transactionQuantity: null,
        transactionRate: null,
        transactionAmount: null,
        rebateAmount: null,
        statisticalTimePeriod: null
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
      this.ids = selection.map(item => item.performanceId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加业绩统计（按推广人）";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const performanceId = row.performanceId || this.ids
      getPromoter(performanceId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改业绩统计（按推广人）";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.performanceId != null) {
            updatePromoter(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPromoter(this.form).then(response => {
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
      const performanceIds = row.performanceId || this.ids;
      this.$modal.confirm('是否确认删除业绩统计（按推广人）编号为"' + performanceIds + '"的数据项？').then(function() {
        return delPromoter(performanceIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('promoter/promoter/export', {
        ...this.queryParams
      }, `promoter_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
