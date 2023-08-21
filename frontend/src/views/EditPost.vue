<template>
	<mavon-editor ref="md" :defaultOpen ="preview" @imgAdd="$imgAdd" v-model="value" navigation='true' @save="save"/>
</template>

<script>
import * as myfunction from '/common/function.js';
export default {
  data() {
    return {
		value:""
    }
  },
  mounted() {
  	this.init()
  },
  methods:{
	  init(){
		  const params = this.$route.query;
		  if(params.postname !=null){
		  	try{
		  		myfunction.apiwithpara('query','GET',`SELECT id,post_name,author,update_time, CONVERT(content USING utf8) content FROM test4.post where post_name = '${params.postname}'`+'-'+ '张承宇本地').
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
	  },
	  save(){
		  const params = this.$route.query;
		  if(params.postname !=null){
		  	try{
		  		myfunction.apiwithpara('nonquery','POST',`update test4.post set content=CONVERT('${myfunction.DESEncrypt(this.value)}', BINARY)  where post_name= '${params.postname}'`+'-'+ '张承宇本地').
		  		then( result =>{
		  			console.log(result)
		  		}).
		  		catch(error=>{
		  			console.log(error);
		  		});
		  	}catch(e){
		  		//TODO handle the exception
		  		ElMessage.error(e)
		  	}
		  }
		  console.log(this.value)
	  },
	  $imgAdd(pos, $file){
		var formData = new FormData();
		formData.append("file", $file);
		myfunction.uploadFile('uploadOne','POST',formData).
		then(result => {
			this.$refs.md.$img2Url(pos, result);
			console.log(result)
		}).
		catch(error => {
			console.error(error); // 返回请求失败或未登录的错误信息
		});
	  }
  }
}
</script>

<style>
</style>