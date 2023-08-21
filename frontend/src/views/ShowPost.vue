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
					  	<el-input v-model="newpost" placeholder="新文章" />
					  </el-col>
					  <el-button type="primary" @click="addview()">
					    添加新文章<el-icon class="el-icon--right"><Upload /></el-icon>
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
		imgs: [],
		curimg:'',
		curcarts:'',
		imgcarts:[],
		imgcart:'',
		imgname:'',
		imgfilename:'',
		columns:[
			{key:"id",title:'ID',dataKey:'id',align: 'center',width:50},
			{key:"post_name",title:'文章名',dataKey:'post_name',align: 'center',width:250},
			{key:"author",title:'作者',dataKey:'author',align: 'center',width:200},
			{key:"cart",title:'类别',dataKey:'cart',align: 'center',width:200},
			{key:"update_time",title:'创建时间',dataKey:'update_time',align: 'center',width:200},
		],
		newpost:"",
    };
  },
  mounted() {
    var self = this;
    myfunction.apiwithpara('query','GET','select * from test4.post -张承宇本地').
    then(result => {
      self.imgs=result;
    }).
    catch(error => {
        console.error(error); // 返回请求失败或未登录的错误信息
    });
  },
  methods: {
	showDetial(index,row){
		const url = myfunction.indexurl+'editpost?postname=' + row.post_name;  
		window.open(url, '_blank');
	},
	editview(index,row){
		const url = myfunction.indexurl+'editpost?postname=' + row.post_name;  
		window.open(url, '_blank');
	},
	addview(){
		if(this.newpost.trim()===""){
			alert("新文章名不可为空");
		}else
		{
			myfunction.apiwithpara('nonquery','POST',`insert into test4.post(post_name) value('${this.newpost.trim()}') -张承宇本地`).
			then(result => {
			  console.log(result)
			  if(result===1){
				  const url = myfunction.indexurl+'editpost?postname=' + this.newpost.trim();
				  window.open(url, '_blank');
			  }
			}).
			catch(error => {
			    console.error(error); // 返回请求失败或未登录的错误信息
			});
		}
	}
  }
};
</script>

<style>
</style>