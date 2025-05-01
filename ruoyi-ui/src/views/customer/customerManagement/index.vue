<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px" style="margin-top: 10px">
      <el-form-item label="客户姓名" prop="customerName">
        <el-input
          v-model="queryParams.customerName"
          placeholder="请输入客户姓名"
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
      <el-form-item label="小红书 ID" prop="xiaohongshuId">
        <el-input
          v-model="queryParams.xiaohongshuId"
          placeholder="请输入小红书 ID"
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
      <el-form-item label="推广人员账号 ID" prop="promotionAccountId">
        <el-input
          v-model="queryParams.promotionAccountId"
          placeholder="请输入推广人员账号 ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客服人员账号 ID" prop="customerServiceAccountId">
        <el-input
          v-model="queryParams.customerServiceAccountId"
          placeholder="请输入客服人员账号 ID"
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
      <el-form-item label="派单机构" prop="dispatchOrganization">
        <el-select v-model="queryParams.dispatchOrganization" placeholder="请选择派单机构" clearable>
          <el-option
            v-for="dict in dict.type.order_institution_group"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="最近派单时间" prop="lastDispatchTime">
        <el-date-picker clearable
          v-model="queryParams.lastDispatchTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择最近派单时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="所在地" prop="location">
        <el-input
          v-model="queryParams.location"
          placeholder="请输入所在地"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="咨询项目" prop="consultingProject">
        <el-select v-model="queryParams.consultingProject" placeholder="请选择咨询项目" clearable>
          <el-option
            v-for="dict in dict.type.consulting_project_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="客户意愿" prop="customerIntention">
        <el-select v-model="queryParams.customerIntention" placeholder="请选择客户意愿" clearable>
          <el-option
            v-for="dict in dict.type.customer_intention_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="录单人账号 ID" prop="recorderAccountId">
        <el-input
          v-model="queryParams.recorderAccountId"
          placeholder="请输入录单人账号 ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="录单时间" prop="recordTime">
        <el-date-picker clearable
          v-model="queryParams.recordTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择录单时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="渠道来源" prop="channelSource">
        <el-select v-model="queryParams.channelSource" placeholder="请选择渠道来源" clearable>
          <el-option
            v-for="dict in dict.type.channel_source"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="是否助推 " prop="boostStatus">
        <el-select v-model="queryParams.boostStatus" placeholder="请选择是否助推 " clearable>
          <el-option
            v-for="dict in dict.type.sys_yes_no"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="客服添加" prop="serviceStatus">
        <el-select v-model="queryParams.serviceStatus" placeholder="请选择客服添加" clearable>
          <el-option
            v-for="dict in dict.type.add_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="销售添加" prop="saleStatus">
        <el-select v-model="queryParams.saleStatus" placeholder="请选择销售添加" clearable>
          <el-option
            v-for="dict in dict.type.add_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-button style="margin-bottom: 20px" type="primary" icon="el-icon-arrow-down" size="mini" @click="toggleSearch">{{ showSearch ? '收起' : '展开' }}搜索</el-button>


    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['customer:customerManagement:add']"
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
          v-hasPermi="['customer:customerManagement:edit']"
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
          v-hasPermi="['customer:customerManagement:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['customer:customerManagement:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="customerManagementList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="客户 ID" align="center" prop="customerId" width="100" />
      <el-table-column label="客户姓名" align="center" prop="customerName" width="120" />
      <el-table-column label="手机号" align="center" prop="phoneNumber" width="150" />
      <el-table-column label="微信号" align="center" prop="wechatId" width="150" />
      <el-table-column label="是否助推" align="center" prop="boostStatus" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_yes_no" :value="scope.row.boostStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="客服添加" align="center" prop="serviceStatus" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.add_status" :value="scope.row.serviceStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="销售添加" align="center" prop="saleStatus" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.add_status" :value="scope.row.saleStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="小红书 ID" align="center" prop="xiaohongshuId" width="150" />
      <el-table-column label="抖音 ID" align="center" prop="douyinId" width="150" />
      <el-table-column label="类型" align="center" prop="type" width="100" />
      <el-table-column label="推广人员" align="center" prop="promotionAccountId" width="120" />
      <el-table-column label="客服人员" align="center" prop="customerServiceAccountId" width="120" />
      <el-table-column label="销售人员" align="center" prop="salespersonAccountId" width="120" />
      <el-table-column label="派单机构" align="center" prop="dispatchOrganization" width="150">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.order_institution_group" :value="scope.row.dispatchOrganization"/>
        </template>
      </el-table-column>
      <el-table-column label="最近派单时间" align="center" prop="lastDispatchTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.lastDispatchTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="所在地" align="center" prop="location" width="150" />
      <el-table-column label="咨询项目" align="center" prop="consultingProject" width="150">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.consulting_project_type" :value="scope.row.consultingProject"/>
        </template>
      </el-table-column>
      <el-table-column label="咨询详情" align="center" prop="consultingDetails" width="200" />
      <el-table-column label="客户意愿" align="center" prop="customerIntention" width="150">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.customer_intention_type" :value="scope.row.customerIntention"/>
        </template>
      </el-table-column>
      <el-table-column label="录单人账号" align="center" prop="recorderAccountId" width="120" />
      <el-table-column label="录单时间" align="center" prop="recordTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.recordTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="渠道来源" align="center" prop="channelSource" width="150">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.channel_source" :value="scope.row.channelSource"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="150">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['customer:customerManagement:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['customer:customerManagement:remove']"
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

    <!-- 添加或修改客户管理对话框 -->
    <!-- 添加或修改客户管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px" :inline="true">
        <el-form-item label="客户姓名" prop="customerName">
          <el-input v-model="form.customerName" placeholder="请输入客户姓名" style="width: 200px;" />
        </el-form-item>
        <el-form-item label="手机号" prop="phoneNumber">
          <el-input v-model="form.phoneNumber" placeholder="请输入手机号" style="width: 200px;" />
        </el-form-item>
        <el-form-item label="微信号" prop="wechatId">
          <el-input v-model="form.wechatId" placeholder="请输入微信号" style="width: 200px;" />
        </el-form-item>
        <el-form-item label="小红书 ID" prop="xiaohongshuId">
          <el-input v-model="form.xiaohongshuId" placeholder="请输入小红书 ID" style="width: 200px;" />
        </el-form-item>
        <el-form-item label="抖音 ID" prop="douyinId">
          <el-input v-model="form.douyinId" placeholder="请输入抖音 ID" style="width: 200px;" />
        </el-form-item>
        <el-form-item label="推广人员账号 ID" prop="promotionAccountId">
          <el-input v-model="form.promotionAccountId" placeholder="请输入推广人员账号 ID" style="width: 200px;" />
        </el-form-item>
        <el-form-item label="客服人员账号 ID" prop="customerServiceAccountId">
          <el-input v-model="form.customerServiceAccountId" placeholder="请输入客服人员账号 ID" style="width: 200px;" />
        </el-form-item>
        <el-form-item label="销售人员账号 ID" prop="salespersonAccountId">
          <el-input v-model="form.salespersonAccountId" placeholder="请输入销售人员账号 ID" style="width: 200px;" />
        </el-form-item>
        <el-form-item label="派单机构" prop="dispatchOrganization">
          <el-select v-model="form.dispatchOrganization" placeholder="请选择派单机构" style="width: 200px;">
            <el-option
              v-for="dict in dict.type.order_institution_group"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="最近派单时间" prop="lastDispatchTime">
          <el-date-picker clearable
                          v-model="form.lastDispatchTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择最近派单时间"
                          style="width: 200px;">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="所在地" prop="location">
          <el-input v-model="form.location" placeholder="请输入所在地" style="width: 200px;" />
        </el-form-item>
        <el-form-item label="咨询项目" prop="consultingProject">
          <el-select v-model="form.consultingProject" placeholder="请选择咨询项目" style="width: 200px;">
            <el-option
              v-for="dict in dict.type.consulting_project_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="咨询详情" prop="consultingDetails">
          <el-input v-model="form.consultingDetails" type="textarea" placeholder="请输入内容" style="width: 500px;" />
        </el-form-item>
        <el-form-item label="客户意愿" prop="customerIntention">
          <el-select v-model="form.customerIntention" placeholder="请选择客户意愿" style="width: 200px;">
            <el-option
              v-for="dict in dict.type.customer_intention_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="录单人账号 ID" prop="recorderAccountId">
          <el-input v-model="form.recorderAccountId" placeholder="请输入录单人账号 ID" style="width: 200px;" />
        </el-form-item>
        <el-form-item label="录单时间" prop="recordTime">
          <el-date-picker clearable
                          v-model="form.recordTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择录单时间"
                          style="width: 200px;">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="渠道来源" prop="channelSource">
          <el-select v-model="form.channelSource" placeholder="请选择渠道来源" style="width: 200px;">
            <el-option
              v-for="dict in dict.type.channel_source"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否助推 " prop="boostStatus">
          <el-radio-group v-model="form.boostStatus">
            <el-radio
              v-for="dict in dict.type.sys_yes_no"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="客服添加" prop="serviceStatus">
          <el-radio-group v-model="form.serviceStatus">
            <el-radio
              v-for="dict in dict.type.add_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="销售添加" prop="saleStatus">
          <el-radio-group v-model="form.saleStatus">
            <el-radio
              v-for="dict in dict.type.add_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
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
import { listCustomerManagement, getCustomerManagement, delCustomerManagement, addCustomerManagement, updateCustomerManagement } from "@/api/customer/customerManagement";

export default {
  name: "CustomerManagement",
  dicts: ['consulting_project_type', 'customer_intention_type', 'channel_source', 'add_status', 'order_institution_group','sys_yes_no'],
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
      // 客户管理表格数据
      customerManagementList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        customerName: null,
        phoneNumber: null,
        wechatId: null,
        xiaohongshuId: null,
        douyinId: null,
        type: null,
        promotionAccountId: null,
        customerServiceAccountId: null,
        salespersonAccountId: null,
        dispatchOrganization: null,
        lastDispatchTime: null,
        location: null,
        consultingProject: null,
        consultingDetails: null,
        customerIntention: null,
        recorderAccountId: null,
        recordTime: null,
        channelSource: null,
        boostStatus: null,
        serviceStatus: null,
        saleStatus: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        customerName: [
          { required: true, message: "客户姓名不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询客户管理列表 */
    getList() {
      this.loading = true;
      listCustomerManagement(this.queryParams).then(response => {
        this.customerManagementList = response.rows;
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
        customerId: null,
        customerName: null,
        phoneNumber: null,
        wechatId: null,
        xiaohongshuId: null,
        douyinId: null,
        type: null,
        promotionAccountId: null,
        customerServiceAccountId: null,
        salespersonAccountId: null,
        dispatchOrganization: null,
        lastDispatchTime: null,
        location: null,
        consultingProject: null,
        consultingDetails: null,
        customerIntention: null,
        recorderAccountId: null,
        recordTime: null,
        channelSource: null,
        boostStatus: null,
        serviceStatus: null,
        saleStatus: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    toggleSearch() {
      this.showSearch = !this.showSearch;
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.customerId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加客户管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const customerId = row.customerId || this.ids
      getCustomerManagement(customerId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改客户管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.customerId != null) {
            updateCustomerManagement(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCustomerManagement(this.form).then(response => {
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
      const customerIds = row.customerId || this.ids;
      this.$modal.confirm('是否确认删除客户管理编号为"' + customerIds + '"的数据项？').then(function() {
        return delCustomerManagement(customerIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('customer/customerManagement/export', {
        ...this.queryParams
      }, `customerManagement_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
