# export SHELL = cmd.exe
# ------------------------------------------------
# @file		: Makefile
# @author	: yingchao
# @Update	: 2021-07-26
# @Note		: Generic Makefile (based on gcc)
#
# 	ChangeLog :
#   	2021-08-07 - first version
# ------------------------------------------------

######################################
# target
######################################
TARGET = template_project

Executable = run			# executable file name

######################################
# building variables
######################################
# debug build?
DEBUG = 1

# optimization
OPT = -O3

#######################################
# paths
#######################################
# Build path
BUILD_DIR = build

######################################
# source
######################################
# C sources
C_SOURCES =  \
User/Src/main.c \
User/Src/Data_conversion.c

# ASM sources
ASM_SOURCES =

#######################################
# Executable file
#######################################
PREFIX = 
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
ifdef GCC_PATH
CC = $(GCC_PATH)/$(PREFIX)gcc
AS = $(GCC_PATH)/$(PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_PATH)/$(PREFIX)objcopy
SZ = $(GCC_PATH)/$(PREFIX)size
AR = $(GCC_PATH)/$(PREFIX)ar -rcs
else
CC = $(PREFIX)gcc
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
AR = $(PREFIX)ar -rcs
endif

#######################################
# CFLAGS
#######################################

# macros for gcc
# AS defines
AS_DEFS =

# C defines
C_DEFS =  

# AS includes
AS_INCLUDES =

# C includes
C_INCLUDES =  \
-IUser/Inc

CFLAGS = $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

ifeq ($(DEBUG), 1)
CFLAGS += -g -gdwarf-2
endif

# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"

#######################################
# LDFLAGS
#######################################

# libraries
LIBS = -lc -lm
LIBDIR =
LDFLAGS = $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

# default action: build all
all: $(BUILD_DIR)/$(TARGET).$(Executable) # 執行檔附檔名 (自行變更)

#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR)
	@echo "    CC      "$@
	@$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	@echo "    CC      "$@
	@$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).$(Executable): $(OBJECTS) Makefile
	@echo "    CC      "$@
	@$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	@echo "    SZ      "$@
	@$(SZ) $@

$(BUILD_DIR):
	mkdir $@

#######################################
# clean up
#######################################
clean:
	-rm -rf $(BUILD_DIR)

#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***
