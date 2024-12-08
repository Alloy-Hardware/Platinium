CXX := g++
CXXFLAGS := -Wall -g # ┬─> Need to improve the flags later for freestanding with freestanding
LD_FLAGS := -lstdc++ # ┘   components of the STL and for raw binary

OBJ_DIR := obj/
BIN_DIR := bin/
SRC_DIR := src/

BIN_NAME := platinium.bin

SRC_FILES := $(wildcard $(SRC_DIR)*.cpp)
HDR_FILES := $(wildcard $(SRC_DIR)*.hpp)
OBJ_FILES := $(patsubst $(SRC_DIR)%.cpp,$(OBJ_DIR)%.o,$(SRC_FILES))

.PHONY: all clean

all: $(BIN_DIR)$(BIN_NAME)

$(BIN_DIR)$(BIN_NAME): $(OBJ_FILES)
	@if [ ! -d $(BIN_DIR) ]; then mkdir -p $(BIN_DIR); fi
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LD_FLAGS)

$(OBJ_DIR)%.o: $(SRC_DIR)%.cpp $(SRC_FILES) $(HDR_FILES)
	@if [ ! -d $(OBJ_DIR) ]; then mkdir -p $(OBJ_DIR); fi
	$(CXX) $(CXXFLAGS) -c -o $@ $< $(LD_FLAGS)

clean:
	rm -rf $(OBJ_DIR)* $(BIN_DIR)*
