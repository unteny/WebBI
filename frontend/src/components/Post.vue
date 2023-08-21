<template>
	<mavon-editor 
	:toolbarsFlag='false' 
	:subfield='false' 
	:defaultOpen ="'preview'"
	:editable='false'
	:ref="crefid"
	 v-model="value" :navigation='true'  
	 :readonly="true"/>
</template>
<script>
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
  data() {
  	return{
		value:""
	}
  },
  mounted() {
	  this.init()
  },
  methods:{
	init(){
	  	if(this.cdata !=null){
	  		try{
	  			myfunction.apiwithpara('query','GET',`SELECT id,post_name,author,update_time, CONVERT(content USING utf8) content FROM test4.post where post_name = '${this.cdata }'`+'-'+ '张承宇本地').
	  			then( result =>{
	  			this.value= myfunction.DESDecrypt(result[0].content)
	  				console.log(this.value)
	  			}).
	  			catch(error=>{
	  				console.log(error);
	  			});
	  		}catch(e){
	  			//TODO handle the exception
	  			console.log(e);
	  		}
	  	}
	}
  }
};
</script>

<style scoped>
</style>
