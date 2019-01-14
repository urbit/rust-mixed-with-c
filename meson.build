project('libh2o', 'c', version : '0.13.5')

version = meson.project_version()

legacy_meson = false

detect_meson_version = run_command('meson', '--version')
meson_ver = detect_meson_version.stdout()

if(meson_ver == '0.29.0\n')
  legacy_meson = true
elif(not meson.version().version_compare('>=0.40.0'))
  error('Meson 0.29.0 is last legacy version supported. ' +
        'Otherwise please upgrade to 0.40.0 or higher.')
endif

lib_src = [
  'deps/cloexec/cloexec.c',
  'deps/libgkc/gkc.c',
  'deps/libyrmcds/close.c',
  'deps/libyrmcds/connect.c',
  'deps/libyrmcds/recv.c',
  'deps/libyrmcds/send.c',
  'deps/libyrmcds/send_text.c',
  'deps/libyrmcds/socket.c',
  'deps/libyrmcds/strerror.c',
  'deps/libyrmcds/text_mode.c',
  'deps/picohttpparser/picohttpparser.c',
  'lib/common/cache.c',
  'lib/common/file.c',
  'lib/common/filecache.c',
  'lib/common/hostinfo.c',
  'lib/common/http1client.c',
  'lib/common/memcached.c',
  'lib/common/memory.c',
  'lib/common/multithread.c',
  'lib/common/serverutil.c',
  'lib/common/socket.c',
  'lib/common/socketpool.c',
  'lib/common/string.c',
  'lib/common/time.c',
  'lib/common/timeout.c',
  'lib/common/url.c',
  'lib/core/config.c',
  'lib/core/configurator.c',
  'lib/core/context.c',
  'lib/core/headers.c',
  'lib/core/logconf.c',
  'lib/core/proxy.c',
  'lib/core/request.c',
  'lib/core/token.c',
  'lib/core/util.c',
  'lib/handler/access_log.c',
  'lib/handler/chunked.c',
  'lib/handler/compress.c',
  'lib/handler/compress/gzip.c',
  'lib/handler/errordoc.c',
  'lib/handler/expires.c',
  'lib/handler/fastcgi.c',
  'lib/handler/file.c',
  'lib/handler/headers.c',
  'lib/handler/mimemap.c',
  'lib/handler/proxy.c',
  'lib/handler/redirect.c',
  'lib/handler/reproxy.c',
  'lib/handler/throttle_resp.c',
  'lib/handler/status.c',
  'lib/handler/headers_util.c',
  'lib/handler/status/events.c',
  'lib/handler/status/requests.c',
  'lib/handler/http2_debug_state.c',
  'lib/handler/status/durations.c',
  'lib/handler/configurator/access_log.c',
  'lib/handler/configurator/compress.c',
  'lib/handler/configurator/errordoc.c',
  'lib/handler/configurator/expires.c',
  'lib/handler/configurator/fastcgi.c',
  'lib/handler/configurator/file.c',
  'lib/handler/configurator/headers.c',
  'lib/handler/configurator/proxy.c',
  'lib/handler/configurator/redirect.c',
  'lib/handler/configurator/reproxy.c',
  'lib/handler/configurator/throttle_resp.c',
  'lib/handler/configurator/status.c',
  'lib/handler/configurator/http2_debug_state.c',
  'lib/handler/configurator/headers_util.c',
  'lib/http1.c',
  'lib/tunnel.c',
  'lib/http2/cache_digests.c',
  'lib/http2/casper.c',
  'lib/http2/connection.c',
  'lib/http2/frame.c',
  'lib/http2/hpack.c',
  'lib/http2/scheduler.c',
  'lib/http2/stream.c',
  'lib/http2/http2_debug_state.c'
]

osdet = host_machine.system()
cc = meson.get_compiler('c')

inc = include_directories([
  './include',
  './deps/cloexec/',
  './deps/brotli/enc/',
  './deps/golombset/',
  './deps/libgkc/',
  './deps/libyrmcds/',
  './deps/klib/',
  './deps/neverbleed/',
  './deps/picohttpparser/',
  './deps/picotest/',
  './deps/yaml/include',
  './deps/yoml'
])

libuv_dep = dependency('libuv', version: '>=1.8.0',
                       fallback:['libuv', 'libuv_dep'])
zlib_dep = dependency('zlib')

os_deps = []

if osdet == 'bsd'

  pthread_dep = cc.find_library('pthread')
  os_deps = os_deps + [pthread_dep]

elif osdet == 'linux'

  if(legacy_meson)
    pthread_dep = find_library('pthread')
  else
    pthread_dep = cc.find_library('pthread')
  endif

  os_deps = os_deps + [pthread_dep]

endif

if osdet == 'darwin'
  libcrypto = cc.find_library('crypto', dirs: ['/usr/local/opt/openssl/lib/'])
  libssl = cc.find_library('ssl', dirs: ['/usr/local/opt/openssl/lib/'])
  openssl_dep = declare_dependency(
    dependencies: [libcrypto, libssl],
    include_directories: include_directories('/usr/local/opt/openssl/include')
  )
else
  openssl_dep = dependency('openssl', version: '>=1.0.0')
endif

lib = static_library('h2o', sources: lib_src, version: version, install: false,
  include_directories: inc,
  c_args: ['-Wall', '-Wno-unused-value', '-Wno-unused-function'],
  dependencies: os_deps + [libuv_dep, zlib_dep, openssl_dep],
)

libh2o_dep = declare_dependency(include_directories: inc, link_with: lib)
