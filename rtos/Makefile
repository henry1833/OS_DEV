CROSS   = aarch64-linux-gnu-
CC      = $(CROSS)gcc
LD      = $(CROSS)ld
OBJCOPY = $(CROSS)objcopy
ARCH    = $(CROSS)ar


BUILD_DIR       = build
RTOS_SOURCE_DIR = Source/
APP_SOURCE_DIR	= Application

CFLAGS  = -g -fPIC -Wall -Wextra -fno-stack-protector
CFLAGS	+= -I$(RTOS_SOURCE_DIR)/include/ -I$(RTOS_SOURCE_DIR)/portable/GCC/ARM_AARCH64/ -I$(APP_SOURCE_DIR)/include


LDFLAGS =  --no-dynamic-linker --gc-sections -Map=$(BUILD_DIR)/RTOSDemo.map
LDFLAGS += -L/usr/aarch64-linux-gnu/lib -lc

#CFLAGS += --specs=nosys.specs
#LDFLAGS += --specs=nosys.specs


SRCS =	$(APP_SOURCE_DIR)/main.c \
	$(APP_SOURCE_DIR)/FreeRTOS_tick_config.c \
	$(RTOS_SOURCE_DIR)/event_groups.c \
	$(RTOS_SOURCE_DIR)/list.c \
	$(RTOS_SOURCE_DIR)/queue.c \
	$(RTOS_SOURCE_DIR)/stream_buffer.c \
	$(RTOS_SOURCE_DIR)/tasks.c \
	$(RTOS_SOURCE_DIR)/timers.c \
	$(RTOS_SOURCE_DIR)/portable/MemMang/heap_4.c \
	$(RTOS_SOURCE_DIR)/portable/GCC/ARM_AARCH64/port.c

ASMS =	$(APP_SOURCE_DIR)/boot.S \
	$(APP_SOURCE_DIR)/vector.S \
	$(APP_SOURCE_DIR)/FreeRTOS_asm_vectors.S \
	$(RTOS_SOURCE_DIR)/portable/GCC/ARM_AARCH64/portASM.S

OBJS = $(SRCS:%.c=$(BUILD_DIR)/%.o) $(ASMS:%.S=$(BUILD_DIR)/%.o)
DEPS = $(SRCS:%.c=$(BUILD_DIR)/%.d) $(ASMS:%.S=$(BUILD_DIR)/%.d)

all: $(BUILD_DIR)/RTOSDemo.elf

$(BUILD_DIR)/RTOSDemo.elf: $(OBJS) linker.ld Makefile
	$(LD) $(LDFLAGS) -Tlinker.ld $(OBJS) -o $@

$(BUILD_DIR)/%.o: %.c Makefile
	@mkdir -p $(@D)
	$(CC) $(CPPFLAGS) $(CFLAGS) -MMD -MP -c $< -o $@

$(BUILD_DIR)/%.o: %.S Makefile
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

run: $(BUILD_DIR)/RTOSDemo.elf
	qemu-system-aarch64 -M virt -cpu cortex-a72 -m 1024  -serial mon:stdio -nographic -kernel $(BUILD_DIR)/RTOSDemo.elf -S -s

runasm: $(BUILD_DIR)/RTOSDemo.elf
	qemu-system-aarch64 -M virt -cpu cortex-a72 -m 1024 -serial mon:stdio -nographic -kernel $(BUILD_DIR)/RTOSDemo.elf -d in_asm -S -s

-include $(DEPS)
