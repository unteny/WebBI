<template >
	<el-button-group class="ml-4" style="position: fixed;top: 5px;right: 5px;z-index: 9999;">
		<el-button type="primary"
		v-for="tool in toolComponents"
		:key="tool.id"
		draggable="true"
		:data-component="tool"
		@dragstart="dragStart(tool)"
		>{{tool.frefid}}</el-button>
		
		<el-button type="primary" icon="Expand" @click="navset" /> 
		<el-button type="primary" icon="Upload" @click="update" />
		<el-button type="primary" icon="Plus" @click="addview"/>
		<el-button type="primary" icon="Delete" @click="delview"/>
	</el-button-group>
<div class="main-panel" @dragover="dragOver" @drop="drop">
	<component id="ff" v-drag @click="setItem(item)"
	v-for="item in comps"
	:key="item.id"
	:is="item.type"
	:ref="item.frefid"
	:style="item.style"
	style="border: 1px solid blue;"
	:cdata="item.data"
	:cdatatype="item.datatype"
	:csettings="item.settings"
	:crefid="item.refid"
	:cfulldata="item.fulldata"
	></component>
</div>

<el-tabs v-show="navopen" class="fixed-tabs" v-model="activeName" @tab-click="handleClick">
  <el-tab-pane label="样式" name="first">
	大屏名称
	<el-input v-model="currviewname" placeholder="大屏名称" autosize type="textarea" />
	元素属性
	<el-input v-model="elstyle" placeholder="元素属性" autosize type="textarea" 
	 />
	数据库元素属性
	<el-input v-model="currstyle" @change="setdata" placeholder="数据库元素属性" autosize type="textarea" />
	父元素ref
	<el-input v-model="currfrefid" @change="setdata" placeholder="父元素ref" autosize type="textarea" />
	控件ref
	<el-input v-model="currrefid" @change="setdata" placeholder="控件ref" autosize type="textarea" />
	颜色选择
	<el-color-picker v-model="color" show-alpha />
	
  </el-tab-pane>
  <el-tab-pane label="数据" name="second">
	控件设置
	<el-input v-model="currsettings" @change="setdata" placeholder="控件设置" autosize type="textarea" />
	控件数据
	<el-input v-model="currdata" @change="setdata" placeholder="控件数据" autosize type="textarea" />
	控件类型
	<el-select v-model="currtype" @change="setdata" class="m-2" placeholder="控件类型">
	  <el-option
	    v-for="item in types"
	    :key="item"
	    :label="item"
	    :value="item"
	  />
	</el-select>
	数据库
	<el-select v-model="currdb" @change="setdata" class="m-2" placeholder="连接池名">
	  <el-option
	    v-for="item in dbpool"
	    :key="item.conname"
	    :label="item.conname"
	    :value="item.conname"
	  />
	</el-select>
	控件数据类型
	<el-select v-model="currdatatype" @change="setdata" class="m-2" placeholder="数据类型">
	  <el-option
	    v-for="item in datatypes"
	    :key="item"
	    :label="item"
	    :value="item"
	  />
	</el-select>
  </el-tab-pane>
</el-tabs>
</template>

<script>
import { ElNotification,ElMessage } from 'element-plus'

import * as echarts from 'echarts';
import * as myfunction from '/common/function.js';
import *  as THREE from 'three';
import {
  PointLight ,
  Camera,
  GltfModel,
  Renderer,
  Scene,
} from 'troisjs';

export default {
  components: {
	  PointLight,
	  Camera,
	  GltfModel,
	  Renderer,
	  Scene
  },
  data() {
    return {
	navopen:true,
	drawer:false,
	gltfModel: null,
	bgcolor:'rgba(255, 255, 255, 1)',
	curcolor:'rgba(19, 206, 102, 0.8)',
	activeName:'first',
	color:'rgba(19, 206, 102, 0.8)',
	dbpool:[],
	types:[],
	datatypes:[],
	toolComponents: [],
	comps:[],
	currcomp:null,
	currel:null,
	elstyle:'',
	currstyle:'',
	currsettings:'',
	currtype:'',
	currdata:'',
	currdatatype:'',
	currrefid:'',
	currfrefid:'',
	currdb:"",
	currviewname:'',
	saveviewname:''
    }
  },
  mounted() {
	this.getdata();
	this.gettools();
	myfunction.api('alldata','GET').
	then(result =>{
		this.dbpool = result;
	}).
	catch(error => {
	  console.error(error); // 返回请求失败或未登录的错误信息
	});
	myfunction.api('getalldatatype','POST').
	then(result =>{
		this.datatypes = result;
	}).
	catch(error => {
	  console.error(error); // 返回请求失败或未登录的错误信息
	});
	myfunction.api('getalltype','POST').
	then(result =>{
		this.types = result;
	}).
	catch(error => {
	  console.error(error); // 返回请求失败或未登录的错误信息
	});
  },
  methods:{
	handleSelect(key,keyPath){
	},
	setSetting(TabsPaneContext,Event){
	},
	getdata() {
		const params = this.$route.query;
		if(params !=null){
			try{
				myfunction.apiwithpara('view','POST',params.viewname).
				then( result =>{
					this.comps = result
					this.currviewname = params.viewname;
				}).
				catch(error=>{
					console.log(error);
				});
			}catch(e){
				//TODO handle the exception
				ElMessage.error(e)
			}
		}
	},
	gettools(){
		try{
			myfunction.apiwithpara('view','POST','tools').
			then( result =>{
				this.toolComponents = result
			}).
			catch(error=>{
				console.log(error);
			});
		}catch(e){
			//TODO handle the exception
			ElMessage.error(e)
		}
	},//设置元素
	setItem(item){
		let el  =this.$refs[item.frefid][0].$el;
		let currjson = myfunction.getjsonby(this.comps,'refid',item.refid)
		this.currel = el;
		this.currcomp = currjson;
		this.elstyle = undefined?'': el.style.cssText;
		
		this.currstyle = currjson.style;
		this.currsettings = currjson.settings;
		this.currtype = currjson.type;
		this.currdata = currjson.data;
		this.currdatatype = currjson.datatype;
		this.currfrefid =currjson.frefid;
		this.currrefid =currjson.refid;
		this.currdb = currjson.db;
		//this.currviewname = currjson.viewname
		console.log(currjson);
	},
	onCilck3d(e){
		console.log(e)
	},//设置数据
	setdata(){
		try{
			if(this.currtype=='ChartComponent'){
				var option =JSON.parse(this.currsettings.replace(/'/g, '"'));
			}
		}catch(error){
			//TODO handle the exception
			ElMessage.error('设置有问题')
			return;
		}
		let curIndex = this.comps.findIndex(item => item  == this.currcomp);
		this.currcomp.style = this.currstyle;
		this.currcomp.settings = this.currsettings;
		this.currcomp.type = this.currtype;
		this.currcomp.data = this.currdata;
		this.currcomp.datatype = this.currdatatype;
		
		this.currcomp.frefid =this.currfrefid;
		this.currcomp.refid =this.currrefid;
		this.currcomp.db = this.currdb;
		this.currcomp.viewname = this.currviewname
		console.log(this.currcomp.viewname )
		if (curIndex !== -1) {
		  this.comps[curIndex] = this.currcomp;
		  this.$refs[this.currfrefid][0].$el.style.cssText = this.currcomp.style;
		}
	},
	navset(){
		if(this.navopen){
			this.navopen = false;
		}
		else{this.navopen = true;}
	},
	update(){
		var jsonString = JSON.stringify(this.comps);
		myfunction.apiwithpara('updateviews','POST',jsonString).
		then(re=>{
			ElNotification({
			  title: '!',
			  message: re,
			  position: 'top-left',
			})
		});
	},
	addview(){
		let v =myfunction.newview
		if(this.comps[0].viewname!=null){
			v.viewname = this.comps[0].viewname;
		}
		this.comps.push(myfunction.newview)
	},
	delview(){
		
	},
	dragStart(component) {
		// Set the dragged component's data
		let comp =JSON.stringify(component);
	    event.dataTransfer.setData("text/plain", JSON.stringify(component));
	},
	dragOver(event) {
		// Prevent default to allow dropping
		event.preventDefault();
	},
	drop(event) {
		// Get the dragged component's data
		const component = JSON.parse(event.dataTransfer.getData("text/plain"));
		// Add the component to the main panel
		component.viewname = this.currviewname;
		this.comps.push(component);
	}
  }
}
</script>
<style scoped>
.fixed-tabs {
  z-index: 9999;
  width: 15%;
  position: fixed;
  top: 5%;
  right: 0;
  height: 80%;
  background-color: rgba(0, 255, 255, 0.4);
}
.main-panel{
	width: 100%;
	height: 100%;
}
</style>






