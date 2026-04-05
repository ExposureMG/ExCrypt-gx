CC = gcc
CXX = g++
AR = ar
CFLAGS = -O2 -Wall -Isrc -maes
CXXFLAGS = -O2 -Wall -Isrc -std=c++17 -maes
LDFLAGS = 

SRC_DIR = src
OBJ_DIR = obj

# Source files
C_SRCS = $(wildcard $(SRC_DIR)/*.c)
CPP_SRCS = $(wildcard $(SRC_DIR)/*.cpp)

# Object files
OBJS = $(C_SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o) $(CPP_SRCS:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

TARGET = libexcrypt.a

all: $(TARGET)

$(TARGET): $(OBJS)
	$(AR) rcs $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(TARGET)

.PHONY: all clean
