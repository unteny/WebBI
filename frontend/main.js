const { app, BrowserWindow } = require('electron');
const path = require('path');

function createWindow() {
  // 创建 BrowserWindow
  const win = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js')
    }
  });

  // 加载Vue应用程序
  win.loadFile('/index.html');
}

// 跟Electron架构一样，此事件将在应用程序启动后调用，此时所有准备工作均已完成。
app.whenReady().then(() => {
  createWindow();

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow();
    }
  });
});

// 在所有窗口关闭时退出。
app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});