<template>
  <div class="login-container">
    <el-card class="login-card">
      <div class="login-form">
        <h2 class="login-title">Login</h2>
        <el-form :model="loginForm" ref="loginForm" :rules="rules" label-width="80px">
          <el-form-item label="用户名" prop="username">
            <el-input v-model="loginForm.username"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password">
            <el-input type="password" v-model="loginForm.password"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="login">登录</el-button>
			<el-button type="primary" @click="test">test</el-button>
          </el-form-item>
        </el-form>
      </div>
    </el-card>
  </div>
</template>

<script>
import { ref } from 'vue';
import * as myfunction from '/common/function.js';
export default {
  name: 'Login',
  data() {
    const loginForm = ref({
      username: '',
      password: '',
    });

    const rules = {
      username: [{ required: true, message: 'Please enter your username', trigger: 'blur' }],
      password: [{ required: true, message: 'Please enter your password', trigger: 'blur' }],
    };

    return {
      loginForm,
      rules,
    };
  },
  methods: {
    login() {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
		  myfunction.apihead('doLogin','POST',JSON.stringify(this.loginForm)).
		  then(re =>{
			  console.log(re.headers)
		  }).
		  catch(err =>{
			  console.error(err);
		  })
        } else {
          console.log('Validation failed');
        }
      });
    },
	test(){
		myfunction.api('isLogin','GET').
		then(re =>{
			console.log(re);
		}).
		catch(err =>{
			console.error(err);
		})
	}
  },
};
</script>

<style>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f7fa;
}

.login-card {
  width: 400px;
}

.login-title {
  font-size: 24px;
  margin-bottom: 20px;
}

.login-form {
  padding: 20px;
}
</style>
