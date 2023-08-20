<script setup lang="ts">
import { onMounted, reactive, toRefs } from 'vue'

const emit = defineEmits(['success','error'])
const props = defineProps({
  top:{
    type:Number,
    default:30
  }
})


const data = reactive({
  left:0,
  btnLeft:0,
  btnRef:null,
  maxImgRef:null,
  minImgRef:null,
  offsetLeft:0,
  top:props.top
})

// 定义节点ref,也可以使用composition api中的ref来定义
const {btnRef,maxImgRef,minImgRef} = toRefs(data)




onMounted(()=>{
  // 初始化获取按钮距离左边的宽度，防止滑动的时候闪烁
  data.offsetLeft = data.btnRef.offsetLeft
})

const reset = () =>{
  data.left = 0
}

const btnDown = (e:any)=>{
  // 鼠标按下的时候获取按钮距离左边的坐标
  data.btnLeft = e.pageX - data.btnRef.offsetLeft

  // 鼠标按下的时候绑定鼠标滑动和鼠标松开事件
  document.body.addEventListener('mousemove',btnMousemove)
  document.body.addEventListener('mouseup',btnMouseup)

}

const btnMousemove = (e:any)=>{
  // 鼠标距离左边的坐标 - 节点距离左边的距离 - 最开始鼠标按下时候距离左边的距离
  let x = e.pageX - data.offsetLeft - data.btnLeft

  // 获取最大可以滑动多远
  let maxLeft = data.maxImgRef.parentNode.offsetWidth - data.maxImgRef.offsetWidth

  // 判断临界值，保证不滑出框内
  if(x <=0){
    x = 0
  }else if(x>=maxLeft){
    x = maxLeft
  }
  data.left = x
}

const btnMouseup = (e:any)=>{

  // 获取缺的那块的位置
  let minImgOffsetLeft = data.minImgRef.offsetLeft
  // 控制区间值
  let region = 5

  // 判断移动的最小区间
  let min = minImgOffsetLeft - region
  // 判断移动的最大区间
  let max = minImgOffsetLeft + region

  // 松开后判断是否验证通过，是不是在这个区间内
  if(data.left <= max && data.left>= min){
    emit('success')
  }else{
    reset()
    emit('error')
  }
  
  // 移除鼠标的滑动和松开鼠标事件
  document.body.removeEventListener('mousemove',btnMousemove)
  document.body.removeEventListener('mouseup',btnMouseup)
}





</script>

<template>
  <div class="imgCheck">
    <div class="box">
      <div class="box-content"></div>
      <div class="defect" 
        ref="minImgRef"
        :style="{
          top:data.top+'px'
        }"
      ></div>
      <div class="mimImg" 
        :style="{
          left:data.left+'px',
          top:data.top+'px'
        }" 
        ref="maxImgRef"
      ></div>
    </div>
    <div class="slider">
      <div class="line"></div>
      <div class="btn" 
        @mousedown="btnDown"
        ref="btnRef"
        :style="{
          left:data.left+'px'
        }"
      >
        |||
      </div>
    </div>

  </div>
  <button class="resetBtn" @click="reset">重置</button>
</template>

<style scoped>
  
  .imgCheck{
    width: 600px;
    height: 450px;
    border: 1px solid #ccc;
    margin: 100px auto 20px;
  }
  .title{
    height: 100px;
    line-height: 100px;
    font-size: 16px;
    font-weight: bold;
    text-align: center;
  }
  .box{
    height: 300px;
    background: goldenrod;
    position: relative;
  }
  .box-content{
    width: 100%;
    height: 100%;
    background: goldenrod;
  }

  .defect{
    width: 50px;
    height: 50px;
    background: #ccc;
    position: absolute;
    top: 80px;
    left: 520px;
  }
  .mimImg{
    width: 50px;
    height: 50px;
    background: green;
    position: absolute;
    top: 80px;
    left: 0;
  }

  .slider{
    position: relative;
    height: 50px;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .line{
    height: 10px;
    background: #ccc;
    width: 100%;
    border-radius: 10px;
    overflow: hidden;
    display: inline-block;

  }
  .btn{
    position: absolute;
    top: 50%;
    left: 0;
    background: rgb(131, 131, 241);
    width: 40px;
    height: 16px;
    margin-top: -8px;
    border-radius: 10px;
    color: #fff;
    display: flex;
    justify-content: center;
    font-size: 12px;
    align-items: center;
    cursor: pointer;
    letter-spacing: 5px;
  }


</style>

