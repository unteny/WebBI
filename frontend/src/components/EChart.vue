<template>
  <div ref="chart" style="height: 400px;"></div>
</template>

<script>
import * as echarts from 'echarts'
export default {
  name: 'EChart',
  props: {
    data: {
      type: Array,
      required: true
    }
  },
  mounted() {
    this.drawChart()
  },
  methods: {
    drawChart() {
      const chart = echarts.init(this.$refs.chart)

      const option = {
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        xAxis: {
          type: 'category',
          data: this.data.map(item => item.name)
        },
        yAxis: {
          type: 'value'
        },
        series: [{
          data: this.data.map(item => item.value),
          type: 'bar'
        }]
      }

      chart.setOption(option)
    }
  }
}
</script>
