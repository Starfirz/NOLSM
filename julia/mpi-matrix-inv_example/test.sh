julia -e 'include("../matrix_io.jl");
          S = sprandsymposdef(1000, 0.05);
          write_matrix_three_files("sprandsym-s1000-d1-c2-n1", S, Float64, Int32);'

for CUs in 1 2 4 8 16 20; do
	export OMP_NUM_THREADS=$CUs
	mpirun -n 2 ../../build/mpi-matrix-inv 1000 1 2 >>output_1000.log
done

# julia -E 'include("../matrix_io.jl");
#           A = read_matrix_three_files("sprandsym-s10000-d1-c2-n1", Float64, Int32);
#           Ainv = read_matrix_three_files("sprandsym-s10000-d1-c2-n1", Float64, Int32; outval=true);
#           maximum(abs, inv(Matrix(A)) .- Ainv);'
