cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON . 
make clang-tidy 
make -j $(nproc --ignore=1) lands-of-xim
