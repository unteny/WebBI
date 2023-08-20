<template >
<div style="position: fixed;z-index: 0;height: 100%;width: 100%;background-color: rgba(255, 255, 255, 0.0);">
<component id="ff" v-drag @click="setItem(item)"
v-for="item in comps"
:key="item.id"
:is="item.type"

:ref="item.frefid"
:style="item.style"
:cdata="item.data"
:cdatatype="item.datatype"
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
</template>

<script>
import * as echarts from 'echarts';
import * as myfunction from '/common/function.js';
export default {
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
		const params = this.$route.query;
		if(params !=null){
			try{
				var comps=[]
				var models=[]
				var all =[]
				myfunction.apiwithpara('view','POST',params.viewname).
				then( result =>{
					all = result
					all.forEach(item => {
						var ob = all.pop()
						if (item.itemType==='ModelComponent') {
							models.push(ob);
						}else{
							comps.push(ob)
						}
					});
					this.comps  = comps
					this.models = models
					console.log(models )
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

