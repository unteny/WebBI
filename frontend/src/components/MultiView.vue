<!-- ImageComponent.vue -->
<template>
	<el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">
	  <el-tab-pane v-for="v in views" label="v.lab" name="v.order"><View :cdata='v.name'></View></el-tab-pane>
	</el-tabs>
</template>
<script>
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
  data() {
  	return{
		views:[],
		activeName:'1'
	}
  },
  mounted() {
	  if(this.cdata.trim() !=''){
		  this.views =JSON.parse(this.cdata) 
	  }
  }
};
</script>

<style scoped>
</style>
