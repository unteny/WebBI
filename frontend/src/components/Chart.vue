<!-- ImageComponent.vue -->
<template>
  <div style="width: 100%;height: 100%;" :ref="crefid"></div>
</template>

<script>
import * as echarts from 'echarts';
import { ElMessage } from 'element-plus';
export default {
  props: {
    cdata: {
      type: String,
      default: '',
    },
    cstyle: {
      type: String,
      default: '',
    },
	crefid:{
	  type: String,
	  default: '',
	},
	csettings: {
	  type: String,
	  default: '',
	},
	cdatatype: {
	  type: String,
	  default: '',
	},
	cdb: {
	  type: String,
	  default: '',
	},
	cfulldata: {
	  type: String,
	  default: '',
	}
  },
  mounted() {
	var chart = echarts.init(this.$refs[this.crefid],'dark');
	try{
		var option =JSON.parse(this.csettings.replace(/'/g, '"'));
		option.dataset.source =JSON.parse(this.cfulldata.replace(/'/g, '"')) ;
		chart.setOption(option);
	}catch(e){
		//TODO handle the exception
		ElMessage.error('Oops, 请检查设置与数据是否正确')
	}
	
  }
};
</script>

<style scoped>
</style>
