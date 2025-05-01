<template>
  <div>
    <el-row :gutter="15">
      <!-- 基本信息 Card -->
      <el-col :span="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>基本信息</span>
          </div>
          <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px" label-position="left">
            <el-row type="flex" justify="start" align="middle" :gutter="15">
              <el-col :span="12">
                <el-form-item label="微信" prop="field105">
                  <el-input v-model="formData.field105" placeholder="请输入微信" clearable :style="{width: '100%'}"></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="抖音ID" prop="field106">
                  <el-input v-model="formData.field106" placeholder="请输入抖音ID" clearable :style="{width: '100%'}"></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="小红书IP" prop="field107">
                  <el-input v-model="formData.field107" placeholder="请输入小红书IP" clearable :style="{width: '100%'}"></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="小红书ID" prop="field108">
                  <el-input v-model="formData.field108" placeholder="请输入小红书ID" clearable :style="{width: '100%'}"></el-input>
                </el-form-item>
              </el-col>
            </el-row>
          </el-form>
        </el-card>
      </el-col>

      <!-- 渠道信息 Card -->
      <el-col :span="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>渠道信息</span>
          </div>
          <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px" label-position="left">
            <el-row type="flex" justify="start" align="top" :gutter="15">
              <el-col :span="12">
                <el-form-item label="渠道" prop="field121">
                  <el-select v-model="formData.field121" placeholder="请选择渠道" clearable :style="{width: '100%'}">
                    <el-option v-for="(item, index) in field121Options" :key="index" :label="item.label" :value="item.value" :disabled="item.disabled"></el-option>
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="类型" prop="field123">
                  <el-select v-model="formData.field123" placeholder="请选择类型" clearable :style="{width: '100%'}">
                    <el-option v-for="(item, index) in field123Options" :key="index" :label="item.label" :value="item.value" :disabled="item.disabled"></el-option>
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="推广" prop="field124">
                  <el-select v-model="formData.field124" placeholder="请选择推广" clearable :style="{width: '100%'}">
                    <el-option v-for="(item, index) in field124Options" :key="index" :label="item.label" :value="item.value" :disabled="item.disabled"></el-option>
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="录单人" prop="field125">
                  <el-select v-model="formData.field125" placeholder="请选择录单人" clearable :style="{width: '100%'}">
                    <el-option v-for="(item, index) in field125Options" :key="index" :label="item.label" :value="item.value" :disabled="item.disabled"></el-option>
                  </el-select>
                </el-form-item>
              </el-col>
            </el-row>
          </el-form>
        </el-card>
      </el-col>

      <!-- 咨询详情 Card -->
      <el-col :span="24">
        <el-card class="box-card" >
          <div slot="header" class="clearfix">
            <span>咨询详情</span>
          </div>
          <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px" label-position="left">
            <el-row type="flex" justify="start" align="top" :gutter="15">
              <el-col :span="12">
                <el-form-item label="咨询项目" prop="field128">
                  <el-select v-model="formData.field128" placeholder="请选择咨询项目" clearable :style="{width: '100%'}">
                    <el-option v-for="(item, index) in field128Options" :key="index" :label="item.label" :value="item.value" :disabled="item.disabled"></el-option>
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="客户意向" prop="field132">
                  <el-select v-model="formData.field132" placeholder="请选择客户意向" clearable :style="{width: '100%'}">
                    <el-option v-for="(item, index) in field132Options" :key="index" :label="item.label" :value="item.value" :disabled="item.disabled"></el-option>
                  </el-select>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="咨询地区" prop="field131">
                  <el-input v-model="formData.field131" placeholder="请输入咨询地区" clearable :style="{width: '100%'}"></el-input>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row type="flex" justify="start" align="top" :gutter="15">
              <el-col :span="12">
                <el-form-item label="咨询详情" prop="field134">
                  <el-input v-model="formData.field134" type="textarea" placeholder="请输入咨询详情" :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="12">
                <el-form-item label="微信二维码" prop="field137">
                  <el-button type="primary" icon="el-icon-search" size="medium"> 选择微信二维码 </el-button>
                </el-form-item>
              </el-col>
            </el-row>
            <el-row type="flex" justify="end" align="middle" :gutter="15">
              <el-col :span="24">
                <el-form-item size="large">
                  <el-button style="width: 1500px;text-align: center" type="success" @click="nextStep">下一步</el-button>
                </el-form-item>
              </el-col>
            </el-row>
          </el-form>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>


<script>
export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        field105: undefined,
        field106: undefined,
        field107: undefined,
        field108: undefined,
        field121: undefined,
        field123: undefined,
        field124: undefined,
        field125: undefined,
        field128: undefined,
        field132: undefined,
        field131: undefined,
        field134: undefined,
        field137: '',
      },
      rules: {
        field105: [{
          required: true,
          message: '请输入微信',
          trigger: 'blur'
        }],
        field106: [],
        field107: [],
        field108: [],
        field121: [],
        field123: [{
          required: true,
          message: '请选择类型',
          trigger: 'change'
        }],
        field124: [{
          required: true,
          message: '请选择推广',
          trigger: 'change'
        }],
        field125: [{
          required: true,
          message: '请选择录单人',
          trigger: 'change'
        }],
        field128: [{
          required: true,
          message: '请选择咨询项目',
          trigger: 'change'
        }],
        field132: [{
          required: true,
          message: '请选择客户意向',
          trigger: 'change'
        }],
        field131: [{
          required: true,
          message: '请输入咨询地区',
          trigger: 'blur'
        }],
        field134: [{
          required: true,
          message: '请输入咨询详情',
          trigger: 'blur'
        }],
      },
      field121Options: [{
        "label": "选项一",
        "value": 1
      }, {
        "label": "选项二",
        "value": 2
      }],
      field123Options: [{
        "label": "选项一",
        "value": 1
      }, {
        "label": "选项二",
        "value": 2
      }],
      field124Options: [{
        "label": "选项一",
        "value": 1
      }, {
        "label": "选项二",
        "value": 2
      }],
      field125Options: [{
        "label": "选项一",
        "value": 1
      }, {
        "label": "选项二",
        "value": 2
      }],
      field128Options: [{
        "label": "选项一",
        "value": 1
      }, {
        "label": "选项二",
        "value": 2
      }],
      field132Options: [{
        "label": "选项一",
        "value": 1
      }, {
        "label": "选项二",
        "value": 2
      }],
    }
  },
  computed: {},
  watch: {},
  created() {},
  mounted() {},
  methods: {
    submitForm() {
      this.$refs['elForm'].validate(valid => {
        if (!valid) return
        // TODO 提交表单
      })
    },
    resetForm() {
      this.$refs['elForm'].resetFields()
    },
    nextStep() {
      // TODO 实现下一步逻辑
      this.$router.push('/customerManagement/')
      this.$message.success('下一步');
    },
  }
}
</script>

<style>
.el-form-item__label {
  font-size: 14px;
}
.box-card  {
  width: 100%;
  margin: 40px;
}
</style>
