<template>
<el-row style="height: 100%;width: 100%;" :gutter="20">
	<el-col ref="sidebar" :span="3" style="height: 100%; border-right: solid 1px var(--el-menu-border-color);">
		<MenuComponent cdata ="SELECT * FROM test4.menu WHERE menu.menu_name = 'imageview'" cdb="张承宇本地"/>
	</el-col>
	<el-col :span="21" style="height: 100%;">
		<el-row  :gutter="10" >
			<el-col :span="2">图片分类</el-col>
		    <el-col :span="8" >
				<el-select style="width: 100%;" v-model="curcarts" clearable placeholder="图片分类"
				@change="getCartImgs(curcarts)"
				>
				<el-option
				v-for="outerItem in imgcarts" :index="outerIndex" 
				:key="outerIndex"
					:label="outerItem"
					:value="outerItem"
				/>
				</el-select>
			</el-col>
			<el-col :span="10">
				<el-input v-model="imgname" placeholder="文件名或图片名" />
			</el-col>
			<el-col :span="2" >
				<el-button >查询</el-button>
			</el-col>
			
			<el-row :span="24">
			    <el-col :span="16" style="height: 100%;width: 100%;">
			    <el-table :data="imgs" sticky-header
			    max-height="800"
			    >
			      <el-table-column 
			      v-for="(item ,index) in columns" 
			      :index="index" :key="index" 
			      :width="item.width" :prop="item.key" :label="item.title"
			      :align="item.align"
			      ></el-table-column>
			      <el-table-column fixed="right" label="操作" width="100">
			        <template #default="scope">
			        <el-button
			          type="primary"
			          size="small"
			          @click="showDetial(scope.$index, scope.row)"
			        >
			          详情
			        </el-button>
			        </template>
			      </el-table-column>
			      
			    </el-table>
			
			  </el-col>
			  <el-col :span="8" >
				  <el-row gutter="10">
					  <el-col :span="6">
					  	图片名
					  </el-col>
					  <el-col :span="18">
					  	<el-input v-model="imgname" placeholder="选择后修改图片名" />
					  </el-col>
					  <el-col :span="6">
					  	图片分类
					  </el-col>
					  <el-col :span="18">
					  	<el-input v-model="imgcart" placeholder="选择后修改图片分类" />
					  </el-col>
					  <el-col :span="6">
					  	文件名：
					  </el-col>
					  <el-col :span="6">
					  	{{imgfilename}}
					  </el-col>
					  <el-col :span="6">
					  </el-col>
					  <el-button type="primary" @click="saveImage()">
					    保存<el-icon class="el-icon--right"><Upload /></el-icon>
					  </el-button>
					  
					  <el-col :span="24">
						  <img style="width: 100%;" v-if="curimg.endsWith('.png')"  :src="curimg"/>
						  <img style="width: 100%;" v-else-if="curimg.endsWith('.jpg')"  :src="curimg"/>
						  <Model style="width: 100%;" v-else-if="curimg.endsWith('.glb')" :modelurl="curimg" />
						  <video ref="videoPlayer" v-else-if="curimg.endsWith('.mp4')" 
						  :src="curimg" :controls="controls" @play="onPlay" @pause="onPause"></video>
					  </el-col>
					  <el-col :span="24">
					  	  <el-upload
					  	    drag
					  	    action="http://101.43.139.84:19888/uploadOne"
					  	    multiple
					  	    :on-success="handleSuccess"
					  	    :on-error="handleError"
					  	  >
					  	    <el-icon class="el-icon--upload"><upload-filled /></el-icon>
					  	    <div class="el-upload__text">
					  	      Drop file here or <em>click to upload</em>
					  	    </div>
					  	    <template #tip>
					  	      <div class="el-upload__tip">
					  	        文件大小不超过15mb
					  	      </div>
					  	    </template>
					  	  </el-upload>
					  </el-col>
			
				  </el-row>
			  </el-col>
			</el-row>
		</el-row>
	</el-col>
</el-row>
</template>

<script>
import Model from '/src/components/Model.vue';
import * as myfunction from '/common/function.js';
export default {
	components:{
		Model
	},
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
			{key:"filename",title:'文件名',dataKey:'filename',align: 'center',width:250},
			{key:"name",title:'名称',dataKey:'name',align: 'center',width:200},
			{key:"cart",title:'类别',dataKey:'cart',align: 'center',width:200},
		]
    };
  },
  mounted() {
    this.init()
  },
  methods: {
	init(){
		var self = this;
		myfunction.api('allimages','POST').
		then(result => {
		  self.imgs=result;
		}).
		catch(error => {
		    console.error(error); // 返回请求失败或未登录的错误信息
		});
		myfunction.api('allimagecarts','POST').
		then(result => {
			self.imgcarts=result;
		}).
		catch(error => {
			console.error(error); // 返回请求失败或未登录的错误信息
		});
	},
    getCartImgs(curcarts){
		myfunction.apiwithpara('getImgByCart','POST',curcarts).
		then(result => {
			this.imgs=result;
			console.log(result);
		}).
		catch(error => {
			console.error(error); // 返回请求失败或未登录的错误信息
		});
    },
	showDetial(index,row){
		this.curimg  = myfunction.baseurl+'images/'+row.filename;
		console.log(this.curimg);
		this.imgcart = row.cart;
		this.imgname = row.name;
		this.imgfilename = row.filename;
	},
	saveImage(){
		myfunction.apiwithpara('editImgByName','POST',this.imgname+'-'+this.imgcart+'-'+this.imgfilename).
		then(result => {
			alert(result);
		}).
		catch(error => {
			console.error(error); // 返回请求失败或未登录的错误信息
		});
	},
	handleSuccess(response, file, fileList) {
		this.init()
		ElementPlus.ElNotification({
		  title: '!',
		  message: re,
		  position: 'top-left',
		})
	},
	handleError(error, file, fileList) {
	  alert('Upload error:', error);
	}
  }
};
</script>

<style>
</style>