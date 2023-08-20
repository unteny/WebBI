<template>
	<el-menu style="border-right: 0;height: 100%;"
	default-active="1"
	class="el-menu-vertical-demo">
		<el-menu-item v-for="m in menus" :index="m.order">
			<el-icon><component :is="m.icon"/></el-icon>
			<span><RouterLink :to="m.link">{{m.name}}</RouterLink></span>
		</el-menu-item>
	</el-menu>
</template>

<script>
import { ElMessage } from 'element-plus';
import * as myfunction from '/common/function.js';
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
  data(){
	  return{
		  menus:[]
	  }
  },
  mounted() {
	myfunction.apiwithpara('query','GET', this.cdata+'-'+this.cdb).
	then(re =>{
		this.menus = re;
	}).catch((err) => {
		console.log(err);
    });
	
  }
};
</script>

<style scoped>
</style>