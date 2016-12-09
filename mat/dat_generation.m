src_file = 'dat/1/a05100';
dest_file = 'dat/a05100.dat';

[C, A, b] = loadfile(src_file);
createDatFileP(dest_file, C, A, b);
