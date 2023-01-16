CXX = g++
#CXX = x86_64-w64-mingw32-g++
CXXFLAGS = -g -Wall
FOPT = -O3 -flto -march=native -ftree-vectorize

all:
	$(CXX) $(CXXFLAGS) -c main.cpp -J obj/ -o obj/main.o
	$(CXX) $(CXXFLAGS) -c -FPIC triangle_area.cpp -J obj/ -o obj/triangle_area.o
	$(CXX) $(CXXFLAGS) $(FOPT) -o bin/main ./obj/main.o obj/triangle_area.o

clean:
		rm -rf obj/*
		rm -rf bin/*

run:
	cd ./bin; ./main;
	cat bin/output.txt

