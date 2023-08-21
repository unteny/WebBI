<template >
<div class="container ">
<div class="row">
<component id="ff"
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
</div>
</div>
</template>

<script>
import * as echarts from 'echarts';
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
    return {
	bgcolor:'rgba(255, 255, 255, 1)',
	comps:[],
	models:[]
    }
  },
  mounted() {
	this.getdata()
	setInterval(() => {
		this.getdata() ;
	}, 5000);
  },
  methods:{
	getdata() {
		const params = this.cdata;
		if(params !=null){
			try{
				myfunction.apiwithpara('view','POST',params).
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
	onCilck3d(e){
		console.log(e)
	}
  }
}
</script>

