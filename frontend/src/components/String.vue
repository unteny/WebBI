<!-- ImageComponent.vue -->
<template>
	<el-text style="width: 100%; height: 100%;">{{text}}</el-text>
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
		text:""
	}
  },
  mounted() {
	  if(this.cdatatype =='sql'){
		  var modifiedStr = this.cfulldata.replace(/'/g, "\"");
		  let x = JSON.parse(modifiedStr) ;
		  this.text=x[0].DATA;
	  }else{
		  this.text=this.cfulldata;
	  }
  }
};
</script>

<style scoped>
</style>
