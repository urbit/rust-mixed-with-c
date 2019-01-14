project('sniproxy', 'c', version : '0.5.0')

version = meson.project_version()

sources = ['src/tls.c']
inc = include_directories('src/')

lib = static_library('sni', sources: sources, version: version,
include_directories : inc,
c_args: ['-Wall', '-ffast-math'],
install: false)

libsni_dep = declare_dependency(include_directories : inc,
  link_with : lib)
