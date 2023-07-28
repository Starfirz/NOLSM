julia -e 'include("../matrix_io.jl"); 
          S = sprandsymposdef(1000,0.05); 
          write_matrix_txt("in_mat_1000", S);'

for CUs in 1 2 4 8 16 20; do
	export OMP_NUM_THREADS=$CUs
	export MKL_NUM_THREADS=$CUs
	../../build/mkl-matrix-inv 1000 in_mat_1000.txt out_mat_1000.txt >>output_1000.log
done

#julia -E 'include("../matrix_io.jl");
#          A = read_matrix_txt("in_mat_10000");
#          Ainv = read_matrix_txt("out_mat_10000");
#          maximum(abs, inv(Matrix(A)) .- Ainv)'
