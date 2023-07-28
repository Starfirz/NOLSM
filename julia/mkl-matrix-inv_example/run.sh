julia -e 'include("../matrix_io.jl"); 
          S = sprandsymposdef(10000,0.001); 
          write_matrix_txt("in_mat_10000", S);'

../../build/mkl-matrix-inv 10000 in_mat_10000.txt out_mat_10000.txt >output.log

#julia -E 'include("../matrix_io.jl");
#          A = read_matrix_txt("in_mat_10000");
#          Ainv = read_matrix_txt("out_mat_10000");
#          maximum(abs, inv(Matrix(A)) .- Ainv)'
