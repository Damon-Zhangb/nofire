<template>
  <div :class="className" :style="{height:height,width:width}" />
</template>

<script>
import echarts from 'echarts'
require('echarts/theme/macarons') // echarts theme

const animationDuration = 3000

export default {

  props: {
    className: {
      type: String,
      default: 'chart'
    },
    width: {
      type: String,
      default: '100%'
    },
    height: {
      type: String,
      default: '300px'
    }
  },
  data() {
    return {
      chart: null
    }
  },
  mounted() {
    this.initChart()
  },
  methods: {
    initChart() {
      this.chart = echarts.init(this.$el, 'macarons')

      this.chart.setOption({
        tooltip: {
          trigger: 'axis',
          axisPointer: { // 坐标轴指示器，坐标轴触发有效
            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
          }
        },
        radar: {
          radius: '66%',
          center: ['50%', '42%'],
          splitNumber: 8,
          splitArea: {
            areaStyle: {
              color: 'rgba(127,95,132,.3)',
              opacity: 1,
              shadowBlur: 45,
              shadowColor: 'rgba(0,0,0,.5)',
              shadowOffsetX: 0,
              shadowOffsetY: 15
            }
          },
          indicator: [
            { name: '设备在线量', max: 10000 },
            { name: '日总报警量', max: 20000 },
            { name: '异常率', max: 20000 },
            { name: '误报率', max: 20000 },
            { name: '巡查量', max: 20000 },
            { name: '调度量', max: 20000 }
          ]
        },
        legend: {
          left: 'center',
          bottom: '10',
          data: ['海口', '儋州', '三亚']
        },
        series: [{
          type: 'radar',
          symbolSize: 0,
          areaStyle: {
            normal: {
              shadowBlur: 13,
              shadowColor: 'rgba(0,0,0,.2)',
              shadowOffsetX: 0,
              shadowOffsetY: 10,
              opacity: 1
            }
          },
          data: [
            {
              value: [5000, 7000, 12000, 11000, 15000, 14000],
              name: '海口'
            },
            {
              value: [4000, 9000, 15000, 15000, 13000, 11000],
              name: '儋州'
            },
            {
              value: [5500, 11000, 12000, 15000, 12000, 12000],
              name: '三亚'
            }
          ],
          animationDuration: animationDuration
        }]
      })
    }
  }
}
</script>
