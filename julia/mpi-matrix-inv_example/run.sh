julia -e 'include("../matrix_io.jl");
          S = sprandsymposdef(100, 0.05);
          write_matrix_three_files("sprandsym-s100-d1-c2-n1", S, Float64, Int32);'

mpirun -n 2 ../../build/mpi-matrix-inv 100 1 2 >output.log

# julia -E 'include("../matrix_io.jl");
#           A = read_matrix_three_files("sprandsym-s10000-d1-c2-n1", Float64, Int32);
#           Ainv = read_matrix_three_files("sprandsym-s10000-d1-c2-n1", Float64, Int32; outval=true);
#           maximum(abs, inv(Matrix(A)) .- Ainv);'
