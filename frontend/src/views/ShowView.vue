<template>
<el-row style="height: 100%;width: 100%;" :gutter="20">
	<el-col ref="sidebar" :span="3" style="height: 100%; border-right: solid 1px var(--el-menu-border-color);">
		<MenuComponent cdata ="SELECT * FROM test4.menu WHERE menu.menu_name = 'imageview'" cdb="张承宇本地"/>
	</el-col>
	<el-col :span="21" style="height: 100%;">
		<el-row  :gutter="10" >
			<el-col :span="10">
				<el-input v-model="imgname" placeholder="文件名或图片名" />
			</el-col>
			<el-col :span="2" >
				<el-button >查询</el-button>
			</el-col>
			
			<el-row :span="12">
			    <el-col :span="20" style="height: 100%;width: 100%;">
			    <el-table :data="imgs" sticky-header
			    max-height="800"
			    >
			      <el-table-column 
			      v-for="(item ,index) in columns" 
			      :index="index" :key="index" 
			      :width="item.width" :prop="item.key" :label="item.title"
			      :align="item.align"
			      ></el-table-column>
			      <el-table-column fixed="right" label="操作" width="150">
			        <template #default="scope">
			        <el-button
			          type="primary"
			          size="small"
			          @click="showDetial(scope.$index, scope.row)"
			        >
			          详情
			        </el-button>
					<el-button
					  type="primary"
					  size="small"
					  @click="editview(scope.$index, scope.row)"
					>
					  编辑
					</el-button>
			        </template>
			      </el-table-column>
			      
			    </el-table>
			
			  </el-col>
			  <el-col :span="4" >
				  <el-row gutter="10">
					  <el-col :span="24">
					  	<el-input v-model="newview" placeholder="新视图" />
					  </el-col>
					  <el-button type="primary" @click="addview()">
					    添加新视图<el-icon class="el-icon--right"><Upload /></el-icon>
					  </el-button>
				  </el-row>
			  </el-col>
			</el-row>
		</el-row>
	</el-col>
</el-row>
</template>

<script>
import * as myfunction from '/common/function.js';
export default {
  data() {
    return {
		newview:"",
		imgs: [],
		curimg:'',
		curcarts:'',
		imgcarts:[],
		imgcart:'',
		imgname:'',
		imgfilename:'',
		columns:[
			{key:"id",title:'ID',dataKey:'id',align: 'center',width:50},
			{key:"viewName",title:'视图名',dataKey:'viewName',align: 'center',width:250},
			{key:"info",title:'描述',dataKey:'info',align: 'center',width:200},
			{key:"cart",title:'类别',dataKey:'cart',align: 'center',width:200},
			{key:"createTime",title:'创建时间',dataKey:'createTime',align: 'center',width:200},
		]
    };
  },
  mounted() {
    var self = this;
    myfunction.api('getAll','POST').
    then(result => {
      self.imgs=result;
    }).
    catch(error => {
        console.error(error); // 返回请求失败或未登录的错误信息
    });
  },
  methods: {
	showDetial(index,row){
		const url = 'http://localhost:5173/screen?viewname=' + row.viewName;  
		window.open(url, '_blank');
	},
	editview(index,row){
		const url = 'http://localhost:5173/editview?viewname=' + row.viewName;  
		window.open(url, '_blank');
	},
	addview(){
	}
  }
};
</script>

<style>
</style>