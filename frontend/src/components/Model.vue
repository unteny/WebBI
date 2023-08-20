<template>
  <Renderer ref="renderer" :alpha="true" antialias
  :orbit-ctrl="{ enableDamping: true }" resize
  >
    <Camera :position="{ x: 5, y: 0, z: 0 }" />
    <Scene background="#bebebe">
      <PointLight :intensity="1" 
	  color='#ffffff'
	  :position="{ x: 0, y: 10, z: 0 }" />
      <GltfModel :src="modelurl" />
    </Scene>
  </Renderer>
</template>

<script>
export default {
  components: {},
  props: {
    modelurl: {
      type: String,
      required: true,
    },
  },
  mounted() {
    this.init();
  },
  methods: {
    init() {
      // Any initialization code you want to add
    },
  },
};
</script>
