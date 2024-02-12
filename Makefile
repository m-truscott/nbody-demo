CXX = icpx
COMPFLAGS =  -g -std=c++11 -O2 -qopenmp
OPTFLAGS =

REPFLAGS =
INCLUDES =

CXXFLAGS = $(COMPFLAGS) $(OPTFLAGS) $(REPFLAGS)

VERSION ?= 
DIRECTORY := ver$(VERSION)/

SOURCES = $(DIRECTORY)GSimulation.cpp $(DIRECTORY)main.cpp

ADVPRJ = "./adv-ver"$(VERSION)

.SUFFIXES: .o .cpp

##########################################
OBJSC = $(SOURCES:.cpp=.o)
##########################################

EXEC=nbody.x

all: cpu

%.o: %.cpp
	$(info )
	$(info Compiling the object file for CPU: )
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@ 

cpu: $(OBJSC)
	$(info )
	$(info Linking the CPU executable:)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -o $(EXEC) $(OBJSC)
	
run: 
	$(info )
	$(info Run the default test case on CPU: )
	./nbody.x 
	
clean: 
	rm -f $(OBJSC) nbody.x *.optrpt
