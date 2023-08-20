<template>
	<div >
	  <hot-table :settings="hotSettings" style="width: 500px; height: 300px;">
	    <hot-column title="First column header">
	    </hot-column>
	    <hot-column :settings="secondColumnSettings" read-only="true">
	    </hot-column>
	  </hot-table>
	</div>
</template>

<script>
export default {
  props: {},
  data() {
    return {
      hotSettings: {
        data: [
          ['A1', 'B1'],
          ['A2', 'B2'],
          ['A3', 'B3'],
          ['A4', 'B4'],
          ['A5', 'B5'],
          ['A6', 'B6'],
          ['A7', 'B7'],
          ['A8', 'B8'],
          ['A9', 'B9'],
          ['A10', 'B10'],
        ],
        height: 'auto',
        licenseKey: 'non-commercial-and-evaluation',
      },
      secondColumnSettings: {
        title: 'Second column header',
      },
    };
  }
};
</script>

<style>
</style>