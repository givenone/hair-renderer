#g++ src/Hair.cc src/shader.cpp src/controls.cpp src/objloader.cpp viewer.cpp -o hairviewer 
#-Iinclude -Ivendor/trimesh2/include 
#-lglfw -lglut -lGL -lGLU -lGLEW `pkg-config --cflags --libs opencv`

CC = g++
CFLAGS = -g -Wall
INC = -I./include -I./vendor/trimesh2/include
LDFLAGS = -lglfw -lglut -lGL -lGLU -lGLEW `pkg-config --cflags --libs opencv`
OBJS = src/Hair.o src/controls.o src/objloader.o src/shader.o viewer.o 
TARGET = hairviewer

.cc.o : $(CC) -c $(INC) $(LDFLAGS) -o $@ $<
.c.o : $(CC) -c $(INC) $(LDFLAGS) -o $@ $<

$(TARGET) : $(OBJS)
	$(CC) -o $@ $(OBJS) $(INC) $(LDFLAGS)