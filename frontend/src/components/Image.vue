<!-- ImageComponent.vue -->
<template>
  <img :ref="crefid"  :src="cdata" alt="Image" />
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
  	},
  }
};
</script>

<style scoped>
/* Add any component-specific styles here */
</style>
