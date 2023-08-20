<template>
<el-row style="height: 100%;width: 100%;" :gutter="20">
	<el-col ref="sidebar" :span="3" style="height: 100%; border-right: solid 1px var(--el-menu-border-color);">
		<el-menu style="border-right: 0;height: 100%;"
		default-active="4"
		class="el-menu-vertical-demo"
		>
		<el-menu-item index="1">
			<el-icon><House /></el-icon>
			<span><RouterLink to="/">首页</RouterLink></span>
		</el-menu-item>
		<el-menu-item index="2" >
			<el-icon><EditPen /></el-icon>
			<span><RouterLink to="/edit">编辑</RouterLink></span>
		</el-menu-item>
		<el-menu-item index="3" >
			<el-icon><Wallet /></el-icon>
			<span><RouterLink to="/imageview">静态资源</RouterLink></span>
		</el-menu-item>
		<el-menu-item index="4" >
			<el-icon><Wallet /></el-icon>
			<span><RouterLink to="/databank">数据集</RouterLink></span>
		</el-menu-item>
		<el-menu-item index="5" >
			<el-icon><Coin /></el-icon>
			<span><RouterLink to="/datasetting">数据源</RouterLink></span>
		</el-menu-item>
		<el-menu-item index="6" >
			<el-icon><Orange /></el-icon>
			<span><RouterLink to="/screen">测试</RouterLink></span>
		</el-menu-item>
		</el-menu>
	</el-col>
</el-row>
</template>

<script>
</script>

<style>
</style>