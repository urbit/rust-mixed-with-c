project('secp256k1', 'c', version : '0.1.0')

version = meson.project_version()

src = [
'src/gen_context.c',
'src/secp256k1.c',
# 'src/bench_ecdh.c',
# 'src/bench_internal.c',
# 'src/bench_sign.c',
# 'src/bench_verify.c',
# 'src/bench_ecmult.c'
]

osdet = host_machine.system()

if osdet == 'openbsd'
  include_dirs = include_directories('src/', '/usr/local/include')
else
  include_dirs = include_directories('src/')
endif

lib = static_library('secp256k1',
	sources: src,
	include_directories : include_dirs,
	version: version,
	c_args : ['-Wall',
		   '-DHAVE_CONFIG_H',
		   	  # '-DUSE_NUM_GMP',
			  # '-DUSE_SCALAR_INV_BUILTIN',
			  # '-DUSE_FIELD_10X26',
			  # '-DUSE_FIELD_INV_BUILTIN',
			  # '-DUSE_SCALAR_4X64'
		],
		# , '-DHAVE_CONFIG_H', '-DSECP256K1_BUILD' ],
	install: false)

secp256k1_dep = declare_dependency(include_directories : include_dirs, link_with : lib)
