import { createApp } from 'vue'
import mavonEditor from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'
import ElementPlus from 'element-plus';
//import GlobalComponents from '/src/assets/global-component.js'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import 'element-plus/theme-chalk/index.css';
import * as THREE from 'three';
import { TroisJSVuePlugin } from 'troisjs';
import './assets/main.css'
import App from './App.vue'
import router from './router'

import ImageComponent from '/src/components/Image.vue';
import ModelComponent from '/src/components/ModelOne.vue';
import StringComponent from '/src/components/String.vue';
import ChartComponent from '/src/components/Chart.vue';
import TableComponent from '/src/components/Table.vue';
import MenuComponent from '/src/components/Menu.vue'
import SlideVerify from '/src/components/SlideVerify.vue'
import SlideVerify2 from '/src/components/SlideVerify2.vue'
import Login from '/src/components/Login.vue'


// the base module 
import Handsontable from 'handsontable/base'; 
import * as HandsontableVue from '@handsontable/vue3';
import 'handsontable/dist/handsontable.full.css';
// cell type modules 
import { AutocompleteCellType, CheckboxCellType, DateCellType, DropdownCellType, HandsontableCellType, NumericCellType, PasswordCellType, TextCellType, TimeCellType, } from 'handsontable/cellTypes'; 
// renderer modules 
import { baseRenderer, autocompleteRenderer, checkboxRenderer, htmlRenderer, numericRenderer, passwordRenderer, textRenderer, } from 'handsontable/renderers'; 
// editor modules 
import { AutocompleteEditor, BaseEditor, CheckboxEditor, DateEditor, DropdownEditor, HandsontableEditor, NumericEditor, PasswordEditor, SelectEditor, TextEditor, } from 'handsontable/editors'; 
// validator modules 
import { autocompleteValidator, dateValidator, numericValidator, timeValidator, } from 'handsontable/validators'; 
// plugin modules 
import { AutoColumnSize, AutoRowSize, Autofill, BasePlugin, BindRowsWithHeaders, CollapsibleColumns, ColumnSorting, ColumnSummary, Comments, ContextMenu, CopyPaste, CustomBorders, DragToScroll, DropdownMenu, ExportFile, Filters, Formulas, HiddenColumns, HiddenRows, ManualColumnFreeze, ManualColumnMove, ManualColumnResize, ManualRowMove, ManualRowResize, MergeCells, MultiColumnSorting, MultipleSelectionHandles, NestedHeaders, NestedRows, PersistentState, Search, TouchScroll, TrimRows, UndoRedo, } from 'handsontable/plugins'; 
// translation modules 
import { registerLanguageDictionary,zhCN, } from 'handsontable/i18n'; 
// registering functions that let you quickly register all modules at once 
import { registerAllCellTypes, registerAllRenderers, registerAllEditors, registerAllValidators, registerAllPlugins, registerAllModules, } from 'handsontable/registry' 
// register all cell types at once 
registerAllCellTypes(); 
// register all renderers at once 
registerAllRenderers(); 
// register all editors at once 
registerAllEditors(); 
// register all validators at once 
registerAllValidators(); 
// register all plugins at once 
registerAllPlugins(); 
// register individual translations 
registerLanguageDictionary(zhCN);  
// or, register all of Handsontable's modules at once 
registerAllModules();

const app = createApp(App)
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}

Object.keys(HandsontableVue).forEach(componentName => {
  app.component(componentName, HandsontableVue[componentName]);
});

app.component('ImageComponent', ImageComponent);
app.component('ModelComponent', ModelComponent);
app.component('StringComponent', StringComponent);
app.component('ChartComponent', ChartComponent);
app.component('TableComponent', TableComponent);
app.component('MenuComponent', MenuComponent);
app.component('SlideVerify', SlideVerify);
app.component('SlideVerify2', SlideVerify2);
app.component('Login', Login);

app.directive('drag',{
        mounted(el){
      el.style.position='absolute';
            el.onmousedown = e => {
        let startLeft = parseInt(el.style.left) || 0;
        let startTop = parseInt(el.style.top) || 0;
                let disX = e.clientX;
                let disY = e.clientY;
                document.onmousemove = e => {
                    let left = e.clientX - disX + startLeft;
                    let top = e.clientY - disY + startTop;
                    el.style.left = left + "px";
                    el.style.top = top + "px";
                };
                document.onmouseup  = function ()  {
                    document.onmousemove = null;
					document.onmouseup = null;
                };
            };
        }
    }
)
app.use(router)
app.use(ElementPlus)
app.use(TroisJSVuePlugin)
app.use(mavonEditor) 
//app.config.globalProperties.$_vueCompatMode = true; 
app.mount('#app')
