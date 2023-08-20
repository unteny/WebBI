<template>
	<el-row style="height: 100%;width: 100%;" :gutter="20">
		<el-col ref="sidebar" :span="3" style="height: 100%; border-right: solid 1px var(--el-menu-border-color);">
			<MenuComponent cdata ="SELECT * FROM test4.menu WHERE menu.menu_name = 'datasetting'" cdb="张承宇本地"></MenuComponent>
		</el-col>
		
	  <el-col :span="3" 
		v-for="(Item, Index) in Connections" :index="Index" 
		:key="Index">
	    <el-card >
	      <img v-if="Item.type=='MySQL'" src="/src/assets/static/img//mysql.png" class="image" />
		  <img v-else src="/src/assets/static/img//oracle.png" class="image" />
	      <div style="padding: 10px">
	        <span>{{Item.conname}}</span>
	        <div class="bottom">
	          <el-button @click="editConnection(Item)" text class="button">编辑</el-button>
			  <span>{{Item.type}}</span>
	        </div>
	      </div>
	    </el-card>
	  </el-col>
	  <el-col :span="3">
	    <el-card >
	      <img @click="dialogVisible2 = true" src="/src/assets/static/img/add.png" class="image" />
	      <div style="padding: 10px">
	        <span>连接名</span>
	        <div class="bottom">
	          <el-button @click="editConnection(newdatapool)" text class="button">添加</el-button>
	  			  <span>类型</span>
	        </div>
	      </div>
	    </el-card>
	  </el-col>
	</el-row>
  <el-dialog
  		v-model="dialogVisible2"
  		:title="dataconname"
  		width="50%"
  		:before-close="handleClose"
  	>
  		<el-row :gutter="20">
  		  <el-col :span="4">
  			<el-select v-model="currdatapool.type" class="m-2" placeholder="选择数据库类型">
  			  <el-option
  			    v-for="item in options"
  			    :key="item.value"
  			    :label="item.label"
  			    :value="item.value"
  			  />
  			</el-select>
  		  </el-col>
		  
		  <el-col class="padding10" :span="8">
			  <el-input v-model="currdatapool.conname" placeholder="连接名"><template #prepend>连接名</template></el-input>
		  </el-col>
  		  <el-col :span="12">
  		  	<el-input v-model="currdatapool.constr" placeholder="请输入数据库连接串"><template #prepend>连接串</template></el-input>
  		  </el-col>
		  <el-col class="padding10" :span="6"><el-input v-model="currdatapool.inisize" placeholder="初始大小"><template #prepend>初始大小</template></el-input>
		  </el-col>
		  <el-col class="padding10" :span="6"><el-input v-model="currdatapool.maxactive" placeholder="最大活跃数"><template #prepend>最大活跃</template></el-input>
		  </el-col>
		  <el-col class="padding10" :span="6"><el-input v-model="currdatapool.maxwait" placeholder="最大等待时间" ><template #prepend>最大等待时间</template></el-input>
		  </el-col>
		  <el-col class="padding10" :span="6"><el-input v-model="currdatapool.minidle" placeholder="最小等待数量"><template #prepend>最小等待数</template></el-input>
		  </el-col>
  		  <el-col class="padding10" :span="8">
  			<el-input v-model="currdatapool.user" placeholder="用户名" ><template #prepend>用户名</template></el-input>
  		  </el-col>
  		  <el-col class="padding10" :span="10">
  			<el-input v-model="currdatapool.pwd" placeholder="密码"><template #prepend>密码</template></el-input>
  		  </el-col>
		  <el-col class="padding10" :span="6"><el-input v-model="currdatapool.istest" placeholder="是否验证"><template #prepend>是否验证</template></el-input>
		  </el-col>
		  <el-col class="padding10" :span="12"><el-input v-model="currdatapool.testsql" placeholder="验证sql"><template #prepend>验证sql</template></el-input>
		  </el-col>
  		  
  		</el-row>
  		<template #footer>
  		<span class="dialog-footer">
  			<el-button @click="dialogVisible2 = false">Cancel</el-button>
			<el-button v-if="currdatapool.id===null" type="primary" @click="saveConn()">
			添加
			</el-button>
			<el-button v-if="currdatapool.id!=null"   type="danger" @click="deletConn()">
			删除
			</el-button>
  			<el-button v-if="currdatapool.id!=null" type="primary" @click="saveConn()">
  			修改
  			</el-button>
  		</span>
  		</template>
  </el-dialog>
</template>

<script>
import { ElMessageBox } from 'element-plus';
import * as myfunction from '/common/function.js';
export default {
  components: { 
  },
  data() {
    return {
		Connections:[],
		curconn:'添加连接',
		dialogVisible:false,
		dialogVisible2:false,
		currdatapool:{},
		newdatapool:{"id": null,"conname":"新名称","constr":"新连接串","user":"用户名","pwd":"密码","type":"Oracle","inisize":1,"maxactive":10,"minidle":1,"maxwait":500,"istest":"1","testsql":"SELECT 1 FROM DUAL"},
		options : [
		  {
		    value: 'MySQL',
		    label: 'MySQL',
		  },
		  {
		    value: 'Oracle',
		    label: 'Oracle',
		  }
		],
		cryto:[]
    }
  },
  mounted() {
	  var self =this;
	  myfunction.api('alldata','GET').
	  then(result =>{
		  self.Connections = result;
	  }).
	  catch(error => {
  	    console.error(error); // 返回请求失败或未登录的错误信息
	  }); 
  },
  methods:{
	  refresh(){
		  myfunction.api('alldata','GET').
		  then(result =>{
		  	self.Connections = result;
			this.dialogVisible=false;
			this.dialogVisible2=false;
		  }).
		  catch(error => {
		    console.error(error); // 返回请求失败或未登录的错误信息
		  }); 
	  },
	  editConnection(e){
		  if(e.id ===null){
			  this.currdatapool=this.newdatapool
		  }else{
			  this.currdatapool =e
		  }
		  this.dialogVisible2=true
	  },
	  show(){this.dialogVisible=true},
	  hide(){this.dialogVisible=false},
	  saveConn(){
		  myfunction.apiwithpara('savePool','POST',JSON.stringify(this.currdatapool)).
		  then(result =>{
			  this.refresh();
			  alert(result);
		  }).
		  catch(error => {
		    console.error(error); // 返回请求失败或未登录的错误信息
		  }); 
	  },
	  deletConn(){
		  myfunction.apiwithpara('removePool','POST',`${this.dataconname}`).
		  then(result =>{
			this.refresh();
			alert(result);
		  }).
		  catch(error => {
		    alert(error); // 返回请求失败或未登录的错误信息
		  }); 
	  },
	  handleClose() {
		  this.dialogVisible=false
	  }
  }
}
</script>

<style scoped>
.bottom {
  margin-top: 13px;
  line-height: 12px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.button {
  padding: 0;
  min-height: auto;
}
.image {
  width: 100%;
  display: block;
}
.padding10{
	padding-top: 10px;
}
</style>