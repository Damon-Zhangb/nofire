<template>
  <div class="dashboard-editor-container">
    <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:32px;">
      <barchart />
    </el-row>
    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <piechart />
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <raddarchart />
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <barchart2 />
        </div>
      </el-col>
    </el-row>
    <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:32px;">
      <linechart />
    </el-row>
    <div />
  </div>
</template>

<script>
import barchart2 from './components/barchart2'
import raddarchart from '@/views/dashboard/echartsMain/components/raddarchart'
import barchart from './components/barchart'
import piechart from './components/piechart'
import linechart from '@/views/dashboard/echartsMain/components/linechart'
export default {
  name: 'Echartsmain',
  components: { barchart, barchart2, piechart, linechart, raddarchart }
}
</script>

<style  lang="scss" scoped>
  .dashboard-editor-container {
    padding: 32px;
    background-color: rgb(240, 242, 245);
    position: relative;
  .chart-wrapper {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
  }
  }
</style>
