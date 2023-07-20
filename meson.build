project('nolsm',
  'c', 'cpp',
  version: '1.0.0',
  meson_version: '>= 0.64.0',
  default_options: [
    'buildtype=release',
    # 'buildtype=debug',
    'b_ndebug=if-release',
    'c_std=c99',
    'cpp_std=c++14',
    ])

cc = meson.get_compiler('c')
cxx = meson.get_compiler('cpp')

mpi = dependency('impi')
mkl = dependency('mkl-sdl')
omp = dependency('openmp')

progs = {
  'mpi-matrix-inv': ['mpi-matrix-inv.c'],
  'mkl-matrix-inv': ['mkl-matrix-inv.c', 'matrix_io.cpp', 'timespec_subtract.c'],
  'matlab-to-csc': ['matlab-to-csc.c', 'matrix_io.cpp'],
  'csc-to-matlab': ['csc-to-matlab.c', 'matrix_io.cpp'],
  }

foreach name, sources : progs
  executable(name, sources, dependencies: [mpi, mkl, omp])
endforeach
