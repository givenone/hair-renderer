#g++ src/Hair.cc src/shader.cpp src/controls.cpp src/objloader.cpp viewer.cpp -o hairviewer 
#-Iinclude -Ivendor/trimesh2/include 
#-lglfw -lglut -lGL -lGLU -lGLEW `pkg-config --cflags --libs opencv`

CC = g++
CFLAGS = -g -Wall
INC = -I./include -I./vendor/trimesh2/include
LDFLAGS = -lglfw -lglut -lGL -lGLU -lGLEW `pkg-config --cflags --libs opencv`
SOURCES = src/Hair.cc src/shader.cpp src/controls.cpp src/objloader.cpp src/texture.cpp viewer.cpp
OBJS = $(SOURCES:.cpp=.o)
TARGET = hairviewer

%.o : %.cc
	
%.o : %.cpp

$(TARGET) : $(OBJS)
	$(CC) $(SOURCES) -o $@ $(INC) $(LDFLAGS)