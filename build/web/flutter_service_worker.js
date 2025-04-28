'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "027855b692638fcabc6fd7ada92c85da",
"version.json": "cc132570d6d238130e38adc59e1f998d",
"index.html": "5b1e9dd547a14013fa47a97f8f632006",
"/": "5b1e9dd547a14013fa47a97f8f632006",
"main.dart.js": "0d0558f7b1baa4df22cf8b22d44c3ab1",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "afbad595473125d9919e55440bb9d114",
"assets/AssetManifest.json": "14b6a1acb4cb4a1014c3956710f071ce",
"assets/NOTICES": "ac259d3b3ecfdc36340f57c7ff5a12e2",
"assets/FontManifest.json": "3d0c2dc2c3fc0d163ac3d47efd15c262",
"assets/AssetManifest.bin.json": "b6defb5a881d46370657307d5f2bf9a2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "271f830175d1f0b56cb41c59c1f45907",
"assets/fonts/MaterialIcons-Regular.otf": "a31c70a03961ce35ac38c672c938b079",
"assets/assets/images/work_showcase/fresh_cut/freshcut_2.png": "377b67a4f3e564bb02417b6ad1b8d831",
"assets/assets/images/work_showcase/fresh_cut/freshcut_3.png": "4ce3a695cefa53ec700aa3d08ddc61e5",
"assets/assets/images/work_showcase/fresh_cut/freshcut_1.jpg": "d912ef839cb700df38fdbda76d3f7a2a",
"assets/assets/images/work_showcase/fresh_cut/freshcut_4.jpg": "cb97ae0c990afae8ec74ca8719a5f849",
"assets/assets/images/work_showcase/fresh_cut/freshcut_5.jpg": "24f68a17a44b0f03fb9d46134c0ed166",
"assets/assets/images/work_showcase/fresh_cut/freshcut_7.jpg": "fb8b1f180acec08bbc5abe111f35c01d",
"assets/assets/images/work_showcase/fresh_cut/freshcut_6.png": "5e29732281031969316546b89a8c687e",
"assets/assets/images/work_showcase/fresh_cut/freshcut_8.jpg": "c7886f078aafbbf43d3ea6261be4f7b7",
"assets/assets/images/work_showcase/idexx/idexx_2.png": "6cc303f7187b1797d69c6c131e37a45b",
"assets/assets/images/work_showcase/idexx/idexx_3.png": "a30d06150f398678d20d839ceec9590a",
"assets/assets/images/work_showcase/idexx/idexx_1.png": "2a42843f0715d14071f6c9ac654a57a8",
"assets/assets/images/work_showcase/idexx/idexx_4.png": "9e8e11db569834b9382dd04d6e0bdbc7",
"assets/assets/images/work_showcase/idexx/idexx_5.png": "5993a5f14adaeba24932e2322501d543",
"assets/assets/images/work_showcase/locals/locals_6.PNG": "78014a4fe084faf92968352d46490c18",
"assets/assets/images/work_showcase/locals/locals_7.PNG": "ac1f11b9d81988602333ad7296120d23",
"assets/assets/images/work_showcase/locals/locals_5.PNG": "b5db8971de2249144eae7fa225481021",
"assets/assets/images/work_showcase/locals/locals_4.PNG": "73acdffc94ed4e36d1ce4c9ed7ef5d6d",
"assets/assets/images/work_showcase/locals/locals_1.PNG": "189047babb940c52c055781595ffe50d",
"assets/assets/images/work_showcase/locals/locals_3.PNG": "9bdc41eaba78912f1c24d8d42a5b641b",
"assets/assets/images/work_showcase/locals/locals_2.PNG": "d48389124becd48399d3a49b06131c8e",
"assets/assets/images/work_showcase/locals/locals_9.PNG": "ff63125b13c9a38e04f6ece977055a4e",
"assets/assets/images/work_showcase/locals/locals_10.PNG": "dd472394fb0e53efd9a50efa253cf80b",
"assets/assets/images/work_showcase/locals/locals_8.PNG": "38a664b1c50ab3d9696f18ce0e427c7b",
"assets/assets/images/work_showcase/pluto_tv/pluto_6.png": "2ba6b465142116c07b3dae859ea2ee0d",
"assets/assets/images/work_showcase/pluto_tv/pluto_5.png": "8e4e31b32e1dc9b7b499855bce76b2cf",
"assets/assets/images/work_showcase/pluto_tv/pluto_4.png": "7060435d1475dca1053757cd68769fd1",
"assets/assets/images/work_showcase/pluto_tv/pluto_1.png": "c5cd79f247d041e2d5351408b6e1416b",
"assets/assets/images/work_showcase/pluto_tv/pluto_3.png": "638719f53414695f08f320a88a5ad793",
"assets/assets/images/work_showcase/pluto_tv/pluto_2.png": "6759f9f6897364ad5b24f44dd7558785",
"assets/assets/images/profile_photo.jpeg": "e99de5721eef3d335c457fd228ecc5d4",
"assets/assets/images/icons/github.svg": "1bb027109345a90a9eab1e929d8669c2",
"assets/assets/images/icons/X_icon.svg": "d2124694c288f2957bd276c46a010f94",
"assets/assets/images/icons/linkedIn.svg": "5b238434e2862c877f08572b96c0ef7b",
"assets/assets/cv/cv.pdf": "e29c33350750b9b76985bcf371f03593",
"assets/assets/fonts/Poppins-ExtraLight.ttf": "6f8391bbdaeaa540388796c858dfd8ca",
"assets/assets/fonts/Poppins-ThinItalic.ttf": "01555d25092b213d2ea3a982123722c9",
"assets/assets/fonts/Poppins-ExtraLightItalic.ttf": "a9bed017984a258097841902b696a7a6",
"assets/assets/fonts/Poppins-BoldItalic.ttf": "19406f767addf00d2ea82cdc9ab104ce",
"assets/assets/fonts/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/Poppins-SemiBoldItalic.ttf": "9841f3d906521f7479a5ba70612aa8c8",
"assets/assets/fonts/Poppins-ExtraBoldItalic.ttf": "8afe4dc13b83b66fec0ea671419954cc",
"assets/assets/fonts/Poppins-ExtraBold.ttf": "d45bdbc2d4a98c1ecb17821a1dbbd3a4",
"assets/assets/fonts/Poppins-BlackItalic.ttf": "e9c5c588e39d0765d30bcd6594734102",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/Poppins-LightItalic.ttf": "0613c488cf7911af70db821bdd05dfc4",
"assets/assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/Poppins-Black.ttf": "14d00dab1f6802e787183ecab5cce85e",
"assets/assets/fonts/Poppins-Thin.ttf": "9ec263601ee3fcd71763941207c9ad0d",
"assets/assets/fonts/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"assets/assets/fonts/Poppins-MediumItalic.ttf": "cf5ba39d9ac24652e25df8c291121506",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
