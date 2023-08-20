<template>
	<el-row style="height: 100%;width: 100%;" :gutter="20">
		<el-col ref="sidebar" :span="3" style="height: 100%; border-right: solid 1px var(--el-menu-border-color);">
			<MenuComponent :cdata ="menusql" :cdb="db"></MenuComponent>
		</el-col>
		<el-col :span="21" style="height: 100%;">
			<el-tabs v-model="activeName" class="demo-tabs" @tab-click="handleClick">
			  <el-tab-pane label="User" name="first">User</el-tab-pane>
			  <el-tab-pane label="Config" name="second">Config</el-tab-pane>
			  <el-tab-pane label="Role" name="third">Role</el-tab-pane>
			  <el-tab-pane label="Task" name="fourth">Task</el-tab-pane>
			</el-tabs>
		</el-col>
	</el-row>
</template>

<script>

export default {
  data() {
    return {
		menusql :"SELECT * FROM test4.menu WHERE menu.menu_name = 'INDEX'",
		db:"张承宇本地",
		activeName:'first'
    }
  },
  methods:{
	handleClick(TabsPaneContext,Event){
		console.log(TabsPaneContext, Event)
	}
  }
}
</script>

<style>
</style>