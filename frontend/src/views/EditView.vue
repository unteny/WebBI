<template >
<div class="container ">
<div class="row">
	<el-button-group class="ml-4" style="position: fixed;top: 5px;right: 5px;z-index: 9999;">
		<el-button type="primary" icon="Expand" @click="navset" /> 
		<el-button type="primary" icon="Upload" @click="update" />
		<el-button type="primary" icon="Plus" 
		 @dragend="dragEnd" draggable="true"/>
		<el-button type="primary" icon="Delete" @click="delview"/>
	</el-button-group>
<component id="ff" v-drag @click="setItem(item)"
v-for="item in comps"
:key="item.id"
:is="item.type"
:ref="item.frefid"
:style="item.style"
style="border: 1px solid blue;"
:class="item.classname"
:cdata="item.data"
:cdatatype="item.datatype"
:cdb="item.db"
:csettings="item.settings"
:crefid="item.refid"
:cfulldata="item.fulldata"
></component>

<div style="position: fixed;z-index: -1;height: 100%;width: 100%; background-color: rgba(255, 255, 255, 0.0);">
<Renderer style="height: 100%;width: 100%;" ref="renderer" :alpha="true" antialias
:orbit-ctrl="{ enableDamping: true }" resize
>
  <Camera :position="{ x: 5, y: 0, z: 0 }" />
  <Scene >
    <PointLight :intensity="1" 
	  color='#ffffff'
	  :position="{ x: 0, y: 10, z: 0 }" />
    <component
    v-for="item in models"
    :key="item.id"
    :is="item.type"
	:style="item.style"
    :cdata="item.data"
    :csettings="item.settings"
    :crefid="item.refid"
    :cfulldata="item.fulldata"
    ></component>
  </Scene>
</Renderer>
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
	数据库Class属性
	<el-input v-model="currclassname" @change="setdata" placeholder="数据库Class属性" autosize type="textarea" />
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
	<el-card v-show="istoolshow" ref="tools" :style="cardStyle">
	    <div  v-for="item in allDafaultComps" :key="item.id" @click="addview(item)" class="text item">{{ item.frefid +'类型:'+ item.type}}</div>
	</el-card>
  </div>
</div>
</template>

<script>
import * as echarts from 'echarts';
import * as myfunction from '/common/function.js';
import { ElNotification } from 'element-plus';
export default {
  components: {},
  data() {
    return {
	navopen:true,
	istoolshow:false,
	bgcolor:'rgba(255, 255, 255, 1)',
	curcolor:'rgba(19, 206, 102, 0.8)',
	activeName:'first',
	color:'rgba(19, 206, 102, 0.8)',
	dbpool:[],
	types:[],
	datatypes:[],
	allDafaultComps: [],
	comps:[],
	models:[],
	currcomp:null,
	currel:null,
	elstyle:'',
	currstyle:'',
	currclassname:'',
	currsettings:'',
	currtype:'',
	currdata:'',
	currdatatype:'',
	currrefid:'',
	currfrefid:'',
	currdb:"",
	currviewname:'',
	saveviewname:'',
	cardStyle: {
	  position: 'fixed',
	  left: '0',
	  top: '0',
	  zindex: '1000',
	  //pointerEvents: 'none' // Prevent the card from blocking mouse events
	}
    }
  },
  mounted() {
	this.getdata();
	this.gettools();
	myfunction.api('alldata','GET').
	then(result =>{
		this.dbpool = result
	}).
	catch(error => {
	  console.error(error); // 返回请求失败或未登录的错误信息
	});
	myfunction.api('getalldatatype','POST').
	then(result =>{
		this.datatypes = result
	}).
	catch(error => {
	  console.error(error); // 返回请求失败或未登录的错误信息
	});
	myfunction.api('getalltype','POST').
	then(result =>{
		this.types = result
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
				then(result =>{
					this.comps=[]
					this.models=[]
					result.forEach(item => {
						if (item.itemType=='ModelComponent') {
							this.models.push(item);
						}else{
							this.comps.push(item)
						}
					});
				}).
				catch(error=>{
					console.log(error);
				});
			}catch(e){
				//TODO handle the exception
				console.log(e)
			}
		}
	},
	gettools(){
		try{
			myfunction.apiwithpara('view','POST','tools').
			then( result =>{
				this.allDafaultComps = result
			}).
			catch(error=>{
				console.log(error);
			});
		}catch(e){
			//TODO handle the exception
			ElementPlus.ElMessage.error(e)
		}
	},
	dragEnd() {
		this.cardStyle.left = event.clientX + 'px'
		this.cardStyle.top = event.clientY + 'px'
		this.istoolshow = true
	},
	setItem(item){
		let el  =this.$refs[item.frefid][0].$el;
		let currjson = myfunction.getjsonby(this.comps,'refid',item.refid)
		console.log(currjson);
		this.currel = el;
		this.currcomp = currjson;
		this.elstyle = el.style.cssText;
		
		this.currstyle = currjson.style;
		this.currclassname = currjson.classname;
		this.currsettings = currjson.settings;
		this.currtype = currjson.type;
		this.currdata = currjson.data;
		this.currdatatype = currjson.datatype;
		this.currfrefid =currjson.frefid;
		this.currrefid =currjson.refid;
		this.currdb = currjson.db;
		this.currviewname = currjson.viewname
	},
	onCilck3d(e){
		console.log(e)
	},
	setdata(){
		try{
			if(this.currtype=='ChartComponent'){
				var option =JSON.parse(this.currsettings.replace(/'/g, '"'));
			}
		}catch(error){
			//TODO handle the exception
			ElementPlus.ElMessage.error('设置有问题')
			return;
		}
		console.log(this.currsettings)
		let curIndex = this.comps.findIndex(item => item  == this.currcomp);
		this.currcomp.style = this.currstyle;
		this.currcomp.class = this.currclassname;
		this.currcomp.settings = this.currsettings;
		this.currcomp.type = this.currtype;
		this.currcomp.data = this.currdata;
		this.currcomp.datatype = this.currdatatype;
		
		this.currcomp.frefid =this.currfrefid;
		this.currcomp.refid =this.currrefid;
		this.currcomp.db = this.currdb;
		this.currcomp.viewname = this.currviewname
		
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
			  title: '上传成功',
			  message: re,
			  position: 'top-left',
			})
			this.getdata()
		});
	},
	addview(item){
		let v =item
		if(this.$route.query.viewname!=null){
			v.viewname = this.$route.query.viewname;
			v.frefid = v.frefid + this.comps.length;
			v.refid = v.refid + this.comps.length;
			v.style = "height: 25%; width: 25%;  position: absolute;" +'left:'+ event.clientX + 'px;top:'+event.clientY + 'px;'
			this.comps.push(v)
		}
		console.log(this.comps)
		this.istoolshow = false
	},
	delview(){
		if(this.currcomp!=null){
			myfunction.apiwithpara('delByFrefid','POST',JSON.stringify(this.currcomp)).
			then(re=>{
				ElNotification({
				  title: '删除成功',
				  message: re,
				  position: 'top-left',
				})
				this.getdata()
			});
		}
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
.item {
  margin-bottom: 10px; /* 设置下边距为 10px */
  padding: 10px; /* 设置内边距为 10px */
  border-bottom: 1px solid #ccc;
}
</style>
