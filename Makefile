

TARGET_EXEC ?= comp

BUILD_DIR ?= ./build

SRC_DIRS ?= ./src

SRCS := $(shell find $(SRC_DIRS) -name *.cpp -or -name *.c -or -name *.s)
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))
# -I          Search for header files in include directories

CPPFLAGS ?= $(INC_FLAGS) -MMD -MP

CXXFLAGS=-g -std=c++11 -Wall
# -g          Enable extra debugging information for GDB
# -std=c++11  Enable C++11
# -Wall       Enable all warning flags

$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS)
	$(CXX) $(OBJS) -o $(TARGET_EXEC) $(LDFLAGS)

# Assembly
$(BUILD_DIR)/%.s.o: %.s
	$(MKDIR_P) $(dir $@)
	$(AS) $(ASFLAGS) -c $< -o $@

# C source
$(BUILD_DIR)/%.c.o: %.c
	$(MKDIR_P) $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

# C++ source
$(BUILD_DIR)/%.cpp.o: %.cpp
	$(MKDIR_P) $(dir $@)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@


.PHONY: clean

clean:
	$(RM) -r $(BUILD_DIR) $(TARGET_EXEC)

-include $(DEPS)

MKDIR_P ?= mkdir -p
