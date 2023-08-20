<template>
	<div><GltfModel :src="cdata"/></div>
</template>

<script>
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
  },
  mounted() {
  }
};
</script>

<style>
</style>