import { createApp } from 'vue';

import ImageComponent from '/src/components/Image.vue';
import ModelComponent from '/src/components/ModelOne.vue';
import StringComponent from '/src/components/String.vue';
import ChartComponent from '/src/components/Chart.vue';
import TableComponent from '/src/components/Table.vue';
import MenuComponent from '/src/components/Menu.vue'
import SlideVerify from '/src/components/SlideVerify.vue'
import SlideVerify2 from '/src/components/SlideVerify2.vue'
// Import other components similarly

// Create a new Vue app instance
const app = createApp({});

// Register components globally
app.component('ImageComponent', ImageComponent);
app.component('ModelComponent', ModelComponent);
app.component('StringComponent', StringComponent);
app.component('ChartComponent', ChartComponent);
app.component('TableComponent', TableComponent);
app.component('MenuComponent', MenuComponent);
app.component('SlideVerify', SlideVerify);
app.component('SlideVerify2', SlideVerify2);
// Register other components similarly

export default app;
