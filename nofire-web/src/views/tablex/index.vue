<template>
  <div class="app-container">
    <el-table
      v-loading="listLoading"
      :data="list"
      element-loading-text="Loading"
      border
      fit
      highlight-current-row
    >
      <el-table-column align="center" label="ID" width="95">
        <template slot-scope="scope">
          {{ scope.row.deviceId }}
        </template>
      </el-table-column>
      <el-table-column label="Name" width="110" align="center">
        <template slot-scope="scope">
          {{ scope.row.deviceName }}
        </template>
      </el-table-column>
      <el-table-column label="AlarmLevel" width="110" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.alarmLevel }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Address" align="center">
        <template slot-scope="scope">
          {{ scope.row.address }}
        </template>
      </el-table-column>
      <el-table-column class-name="status-col" label="Status" width="110" align="center">
        <template slot-scope="scope">
          <el-tag :type="scope.row.identification | statusFilter">{{ scope.row.identification }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="created_at" label="Dlarm Time" width="200">
        <template slot-scope="scope">
          <i class="el-icon-time" />
          <span>{{ scope.row.alarmTime }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Edit" width="110" align="center">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="success"
            @click="btn(scope.row.deviceId)"
          >处理</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  filters: {
    statusFilter(status) {
      const statusMap = {
        published: 'success',
        draft: 'gray',
        deleted: 'danger'
      }
      return statusMap[status]
    }
  },
  data() {
    return {
      list: null,
      listLoading: true
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      this.listLoading = true
      const _this = this
      axios.get('http://localhost:8081/ifp/getList')
        .then(function(response) {
          _this.list = response.data
          for (let i = 0; i < _this.list.length; i++) {
            if (_this.list[i].alarmLevel === 1) {
              _this.list[i].alarmLevel = '一级'
            } else if (_this.list[i].alarmLevel === 2) {
              _this.list[i].alarmLevel = '二级'
            } else {
              _this.list[i].alarmLevel = '三级'
            }
            if (_this.list[i].identification === 'y') {
              _this.list[i].identification = '已处理'
            } else {
              _this.list[i].identification = '未处理'
            }
          }
          console.log(_this.list)
          _this.listLoading = false
        })
    },
    btn(index) {
      const _this = this
      axios.get('http://localhost:8081/ifp/update?id=' + index)
        .then(function(response) {
          if (response.data === 'success') {
            console.log(response.data)
            _this.fetchData()
          }
        })
    }
  }
}
</script>
