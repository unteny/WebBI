import { createRouter, createWebHistory } from 'vue-router'
import imageview from '../views/ImageView.vue'
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('../views/HomeView.vue')
    },
	{
	  path: '/editview',
	  name: 'editview',
	  component: () => import('../views/EditView.vue')
	},
    {
      path: '/databank',
      name: 'databank',
      component: () => import('../views/DataBank.vue')
    },
    {
      path: '/datasetting',
      name: 'datasetting',
      component: () => import('../views/DataSetting.vue')
    },
    {
      path: '/about',
      name: 'about',
      component: () => import('../views/AboutView.vue')
    },
    {
      path: '/report',
      name: 'report',
      component: () => import('../views/ReportView.vue')
    },
	{
	  path: '/screen',
	  name: 'screen',
	  component: () => import('../views/ScreenView.vue')
	},
	{
		path:'/imageview',
		name:'imageview',
		component: imageview
	},
	{
	  path: '/test',
	  name: 'test',
	  component: () => import('../views/test.vue')
	},
	{
	  path: '/editpage',
	  name: 'editpage',
	  component: () => import('../views/EditPage.vue')
	},
	{
	  path: '/editpost',
	  name: 'editpost',
	  component: () => import('../views/EditPost.vue')
	},
	{
	  path: '/showview',
	  name: 'showview',
	  component: () => import('../views/ShowView.vue')
	},
	{
	  path: '/showpost',
	  name: 'showpost',
	  component: () => import('../views/ShowPost.vue')
	}
  ]
})

export default router
