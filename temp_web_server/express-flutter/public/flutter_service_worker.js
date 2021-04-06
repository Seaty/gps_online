'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "1fb81465c629b8c48118137fa191213e",
"assets/assets/data/historyData.json": "a444e615a90b6b455128e1801b67bd79",
"assets/assets/fonts/Kanit-Bold.ttf": "d204df3d775c0c90d1773a97743a77b5",
"assets/assets/fonts/Kanit-ExtraBold.ttf": "17da18f7f5bc05b5efba36a066c99e53",
"assets/assets/fonts/Kanit-Italic.ttf": "dc367df0fa268ab11b47a22f78fc832e",
"assets/assets/fonts/Kanit-Regular.ttf": "b935eb6769e902b3b0086459a7c55a05",
"assets/assets/icon/gift-box-with-a-ribbon.svg": "d38c041775236b95ea67724e2b73a7ba",
"assets/assets/icon/paper-clip.svg": "c0e843009fb0943cc5c049c0e605233d",
"assets/assets/icon/serviceman.svg": "bc85064875be186f36f193b85af54de3",
"assets/assets/images/%25E0%25B8%2582%25E0%25B8%25B1%25E0%25B9%2589%25E0%25B8%2599%25E0%25B8%2595%25E0%25B8%25AD%25E0%25B8%2599%25E0%25B8%2581%25E0%25B8%25B2%25E0%25B8%25A3%25E0%25B8%25AA%25E0%25B8%25B1%25E0%25B9%2588%25E0%25B8%2587%25E0%25B8%258B%25E0%25B8%25B7%25E0%25B9%2589%25E0%25B8%25AD-edit.jpg": "1e24798f9db0d7412e5ef50a4bbb74b0",
"assets/assets/images/%25E0%25B8%2595%25E0%25B8%25B4%25E0%25B8%2594%25E0%25B8%2595%25E0%25B9%2588%25E0%25B8%25AD%25E0%25B8%25AA%25E0%25B8%25AD%25E0%25B8%259A%25E0%25B8%2596%25E0%25B8%25B2%25E0%25B8%25A1%25E0%25B8%2597%25E0%25B8%25B2%25E0%25B8%2587%25E0%25B9%2584%25E0%25B8%25A5%25E0%25B8%2599%25E0%25B9%258C.png": "29ff7cff6879a58072f191eb88c8cc8c",
"assets/assets/images/%25E0%25B8%259B%25E0%25B8%25B8%25E0%25B9%2588%25E0%25B8%25A1%25E0%25B9%2582%25E0%25B8%2597%25E0%25B8%25A3.jpg": "6ba688ffb98fbf86276084ee6d4844af",
"assets/assets/images/bbl_icon.png": "ab68296d338642aabf3b4b9803cef710",
"assets/assets/images/GPS-Blue-Box-04.jpg": "35292af8e7b74786f73afc4edd7fde7e",
"assets/assets/images/GPS-Blue-Box-2-01.jpg": "b618453b04927f1f29b62aa409e80255",
"assets/assets/images/GPS-Blue-Box-2-02.jpg": "b1acc74102472f4de48a7e8d6d79fb60",
"assets/assets/images/GPS-Blue-Box-2-03.jpg": "441a16c9ada6cdaf8bd34d568445b1d3",
"assets/assets/images/GPS-Blue-Box-2-05.jpg": "f8c8724324b0c6974d586810aceac247",
"assets/assets/images/GPS-Blue-Box-2-06.jpg": "fa9f83517961fc773c4f5007625581bf",
"assets/assets/images/GPS-Blue-Box-2-07.jpg": "72e3a09f8e7ba09da3ceaed09b3c24e5",
"assets/assets/images/GPS-Blue-Box-2-08.jpg": "222a1e97530f7f4be42ecbadec04bac5",
"assets/assets/images/line.png": "8ad7bf2de6c9a6fa5ab1305d5849e417",
"assets/assets/images/noimg.png": "5261fd4f3309cc2a739380ce875cc159",
"assets/assets/images/promotion.png": "01536f41e7eb4da74f27c1e1d3428aaf",
"assets/assets/images/route.png": "670ca2855cbb36eeefa60f56c4ddf5be",
"assets/assets/videos/bluebox.mp4": "f046693f18a39c13dace947e6f30bda3",
"assets/assets/videos/dlt-export.mp4": "6e0e6e0e3ca5f23b5df805bc464ac9a5",
"assets/FontManifest.json": "f90ae0d16d141dfec9969e6fc0a06368",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/NOTICES": "bcca047258d70af11dff0d060cf657f6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/im_stepper/assets/me.jpg": "487511e754834bdf2e6771376d59707e",
"assets/packages/wakelock_web/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "81ebe573392f54a1c795acb13e5cd0fa",
"/": "81ebe573392f54a1c795acb13e5cd0fa",
"main.dart.js": "9d5ceb0a0745ebd9230c4a7e4ba3f984",
"manifest.json": "7fffdef9e8b0b773c4f6726b38c0013b",
"version.json": "e13108bf361b233b44d4c121eb774c68"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
