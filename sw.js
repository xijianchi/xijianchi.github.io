/* ===========================================================
 * docsify sw.js
 * ===========================================================
 * 为柒么斯的飞地网站提供离线访问支持
 * 优化版本：使用本地资源，不依赖外部CDN
 * ========================================================== */

const RUNTIME = 'docsify-offline';
const CACHE_NAME = 'docsify-cache-v1';

// 只缓存来自本站的资源
const HOSTNAME_WHITELIST = [
  self.location.hostname
];

// 需要缓存的静态资源列表
const STATIC_RESOURCES = [
  '/',
  '/index.html',
  '/README.md',
  '/_coverpage.md',
  '/_sidebar.md',
  '/manifest.json',
  '/lib/docsify.min.js',
  '/lib/vue.css',
  '/lib/search.min.js',
  '/lib/sidebar.min.css',
  '/lib/docsify-sidebar-collapse.min.js',
  '/lib/docsify-copy-code.min.js',
  '/_media/favicon.ico',
  '/_media/apple-touch-icon.png'
];

// 修正URL，确保使用HTTPS并添加缓存破坏参数
const getFixedUrl = (req) => {
  const now = Date.now();
  const url = new URL(req.url);
  
  // 确保使用与页面相同的协议
  url.protocol = self.location.protocol;
  
  // 为来自本站的资源添加缓存破坏参数
  if (url.hostname === self.location.hostname) {
    url.search += (url.search ? '&' : '?') + 'cache-bust=' + now;
  }
  
  return url.href;
};

// 安装事件：预缓存核心资源
self.addEventListener('install', event => {
  self.skipWaiting();
  
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        // 尝试缓存每个资源，但忽略失败的资源
        return Promise.allSettled(
          STATIC_RESOURCES.map(url => 
            cache.add(url).catch(err => {
              console.warn(`无法缓存资源: ${url}`, err);
              return null; // 继续处理其他资源
            })
          )
        );
      })
  );
});

// 激活事件：清理旧缓存
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.filter(cacheName => {
          return cacheName !== CACHE_NAME;
        }).map(cacheName => {
          return caches.delete(cacheName);
        })
      );
    }).then(() => self.clients.claim())
  );
});

// 拦截所有网络请求
self.addEventListener('fetch', event => {
  // 只处理GET请求
  if (event.request.method !== 'GET') return;
  
  const url = new URL(event.request.url);
  
  // 只处理来自白名单主机的请求和相对路径
  if (HOSTNAME_WHITELIST.indexOf(url.hostname) === -1) return;
  
  // 网络优先策略，适合频繁更新的内容
  const networkFirst = async () => {
    try {
      // 尝试从网络获取
      const networkResponse = await fetch(event.request);
      
      // 如果成功获取，更新缓存
      const cache = await caches.open(CACHE_NAME);
      cache.put(event.request, networkResponse.clone());
      
      return networkResponse;
    } catch (err) {
      // 网络失败，尝试从缓存获取
      const cachedResponse = await caches.match(event.request);
      return cachedResponse || caches.match('/index.html');
    }
  };
  
  // 缓存优先策略，适合静态资源
  const cacheFirst = async () => {
    const cachedResponse = await caches.match(event.request);
    if (cachedResponse) return cachedResponse;
    
    try {
      // 缓存中没有，从网络获取
      const networkResponse = await fetch(event.request);
      
      // 缓存响应
      const cache = await caches.open(CACHE_NAME);
      cache.put(event.request, networkResponse.clone());
      
      return networkResponse;
    } catch (err) {
      // 如果网络也失败，返回首页
      return caches.match('/index.html');
    }
  };
  
  // 对于HTML和Markdown文件使用网络优先策略，其他资源使用缓存优先
  const isContentRequest = url.pathname.endsWith('.md') || 
                          url.pathname.endsWith('.html') || 
                          url.pathname === '/' ||
                          url.pathname === '';
  
  if (isContentRequest) {
    event.respondWith(networkFirst());
  } else {
    event.respondWith(cacheFirst());
  }
});