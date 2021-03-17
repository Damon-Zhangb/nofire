<template>
  <div id="box" :class="className" :style="{height:height,width:width}" />
</template>

<script>
import echarts from 'echarts'
require('echarts/theme/macarons')

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

        backgroundColor: '#ffffff',
        title: {
          text: '火情处理情况',
          left: 'center',
          top: 20,
          textStyle: {
            color: 'rgba(50,131,201,0.25)'
          }
        },

        tooltip: {
          trigger: 'item',
          formatter: '{a} <br/>{b} : {c} ({d}%)'
        },

        visualMap: {
          show: false,
          min: 80,
          max: 600,
          inRange: {
            colorLightness: [0, 1]
          }
        },
        series: [
          {
            name: '处理信息',
            type: 'pie',
            radius: '55%',
            center: ['50%', '50%'],
            data: [
              { value: 335, name: '已处理' },
              { value: 310, name: '待监管' },
              { value: 274, name: '误报' },
              { value: 235, name: '已屏蔽' },
              { value: 400, name: '未处理' }
            ].sort(function(a, b) { return a.value - b.value }),
            roseType: 'radius',
            label: {
              color: 'rgba(3,20,102,0.3)'
            },
            labelLine: {
              lineStyle: {
                color: 'rgba(220,18,18,0.3)'
              },
              smooth: 0.2,
              length: 10,
              length2: 20
            },
            itemStyle: {
              color: '#0b89dc',
              shadowBlur: 200,
              shadowColor: 'rgba(0, 0, 0, 0.5)'
            },

            animationType: 'scale',
            animationEasing: 'elasticOut',
            animationDelay: function(idx) {
              return Math.random() * 200
            }
          }
        ]
      })
    }
  }
}
</script>3

<style scoped>

</style>
