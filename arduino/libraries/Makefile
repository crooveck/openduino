
list:
	@echo h: $(shell find `pwd` -name *.h)
	@echo c: $(shell find `pwd` -name *.c)
	@echo cpp: $(shell find `pwd` -name *.cpp)

CPP_SRC=$(shell find -name *.cpp)
OBJ_FILES=$(CPP_SRC:.cpp=.cpp.o)
	

%.cpp.o: %.cpp
	@echo "KOMPILUJE PLIK:" $< "DO PLIKU:" $@
	
all: $(OBJ_FILES)
	@echo "--------- buduje biblioteki ----------" $< 
	
clean:
	@echo "--------- czyszcze biblioteki ----------"