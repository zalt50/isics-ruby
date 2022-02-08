require 'mkmf'
isics_src = arg_config('--isics-src', 'aekn_v1_1.tar.gz')
system("tar xvf #{isics_src} --strip-components 1 -C #{__dir__}") or abort
system("swig -c++ -ruby -autorename #{__dir__}/isics.i") or abort
create_makefile('isics/isics')
