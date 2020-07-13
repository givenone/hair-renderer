g++ src/Hair.cc src/shader.cpp src/controls.cpp viewer.cpp -o hairviewer -Iinclude -Ivendor/trimesh2/include -lglut -lGL -lGLU -lGLEW `pkg-config --static --libs glfw3`
