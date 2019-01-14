project('libuv', 'c', version : '1.9.1')

version = '1.9.1'
legacy_meson = false

detect_meson_version = run_command('meson', '--version')
meson_ver = detect_meson_version.stdout()

if(meson_ver == '0.29.0\n')
  legacy_meson = true
elif(not meson.version().version_compare('>=0.40.0'))
  error('Meson 0.29.0 is last legacy version supported. Otherwise please upgrade to 0.40.0 or higher.')
endif

# Currently only support Linux x86-64 SSE build
src = [
'src/fs-poll.c',
'src/heap-inl.h',
'src/inet.c',
'src/queue.h',
'src/threadpool.c',
'src/uv-common.c',
'src/uv-common.h',
'src/version.c',
'src/unix/async.c',
'src/unix/atomic-ops.h',
'src/unix/core.c',
'src/unix/dl.c',
'src/unix/fs.c',
'src/unix/getaddrinfo.c',
'src/unix/getnameinfo.c',
'src/unix/loop-watcher.c',
'src/unix/loop.c',
'src/unix/pipe.c',
'src/unix/poll.c',
'src/unix/process.c',
'src/unix/signal.c',
'src/unix/spinlock.h',
'src/unix/stream.c',
'src/unix/tcp.c',
'src/unix/thread.c',
'src/unix/timer.c',
'src/unix/tty.c',
'src/unix/udp.c'
]

incdir = include_directories('./include/', './src/unix', './src')

osdet = host_machine.system()
os_c_flags = []
os_link_flags = []
os_deps = []

if osdet == 'darwin'
  os_c_flags = os_c_flags + ['-D_DARWIN_USE_64_BIT_INODE=1',
                             '-D_DARWIN_UNLIMITED_SELECT=1']
  src = src + [
  'src/unix/darwin.c',
   'src/unix/darwin-proctitle.c',
  'src/unix/fsevents.c',
  'src/unix/kqueue.c',
  'src/unix/proctitle.c',
  'src/unix/pthread-barrier.c']

elif osdet == 'bsd'
  src = src + ['src/unix/freebsd.c', 'src/unix/kqueue.c']
  pthread_dep = meson.get_compiler('c').find_library('pthread')
  os_deps = os_deps + [pthread_dep]

elif osdet == 'linux'

  if(legacy_meson)
    pthread_dep = find_library('pthread')
  else
    pthread_dep = meson.get_compiler('c').find_library('pthread')
  endif

  os_deps = os_deps + [pthread_dep]


  os_c_flags = '-D_GNU_SOURCE'
  src = src + ['src/unix/linux-core.c',
              'src/unix/linux-inotify.c',
              'src/unix/linux-syscalls.c',
              'src/unix/linux-syscalls.h',
              'src/unix/proctitle.c']
else
  error('Unsupported OS detected:' + osdet)
endif

if(legacy_meson)
  dl_dep = find_library('dl')
else
  dl_dep = meson.get_compiler('c').find_library('dl')
endif

os_deps = os_deps + [dl_dep]

lib = static_library('uv', sources: src,
 include_directories: incdir,
 dependencies : os_deps,
 version: version,
 c_args: os_c_flags,
 install: false)

libuv_dep = declare_dependency(include_directories : incdir,
      link_with : lib)
