import * as base64 from 'js-base64';  // 引入 js-base64 库
import CryptoJS from 'crypto-js';
import axios from 'axios';

export const newview = {id:0,viewname:"修改组件名称",frefid:"fnew",refid:"new",settings:" ", type:"image", data:"http://127.0.0.1:9088/images/add.png", style:"height: 25%; width: 25%;border: 1px solid red;z-index=3", datatype:"str", db:" ", fulldata:"http://127.0.0.1:9088/images/add.png"}
const DESIV = CryptoJS.enc.Utf8.parse(import.meta.env.VITE_APP_DES_IV);
const key = CryptoJS.enc.Utf8.parse(import.meta.env.VITE_APP_DES_KEY);
export const baseurl = import.meta.env.VITE_APP_BASE_URL;
export const indexurl = import.meta.env.VITE_APP_INDEX_URL;
export function DESEncrypt(originalValue) {
  const encrypted = CryptoJS.DES.encrypt(originalValue, key, {
    iv: DESIV,
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7
  });
  return encrypted.toString();
}
export function DESDecrypt(encryptedValue) {
  const decrypted = CryptoJS.DES.decrypt(encryptedValue, key, {
    iv: DESIV,
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7
  });
  return decrypted.toString(CryptoJS.enc.Utf8);
}

export function api(apiname, meth) {
  const url = `${baseurl}${apiname}/`;
  return axios({
    method: meth,
    url: url,
  }).then((response) => {
    return response.data;
  }).catch((error) => {
    console.error(error);
    return -1;
  });
}

export function apiwithpara(apiname, meth, p1) {
  const encodedP1 = base64.encode(DESEncrypt(p1));
  const url = `${baseurl}${apiname}/?p1=${encodedP1}`;
  return axios({
    method: meth,
    url: url
  }).then((response) => {
    return response.data;
  }).catch((error) => {
    console.error(error);
    return -1;
  });
}
export function apihead(apiname, meth, p1) {
  const encodedP1 = base64.encode(DESEncrypt(p1));
  const url = `${baseurl}${apiname}/?p1=${encodedP1}`;
  return axios({
    method: meth,
    url: url,
	// headers: {
	//     "Content-Type": "application/x-www-form-urlencoded",
	// // 重点处：请求的 header 头里塞入自定义参数
	//     "satoken": localStorage.getItem("satoken")
	// }
  }).then((response) => {
    return response;
  }).catch((error) => {
    console.error(error);
    return -1;
  });
}

export function uploadFile(apiname,meth,p1) {
  return new Promise((resolve, reject) => {
    const url = `${baseurl}${apiname}`;
    fetch(url, { method: meth ,body:p1})
      .then(response => response.text())
      .then(data => {
        resolve(data);
      })
      .catch(error => {
        resolve(-1);
      });
  });
}

export function getjsonby(js,n1,n2){
	var reval;
	for (const obj of js) {
	  if (obj[n1] === n2) {
	    reval = obj;
	    break;
	  }
	}
	return reval;
}

export function createFunctionFromString(str) {
  const functionBody = `return ${str}`;
  return new Function(functionBody)();
}
