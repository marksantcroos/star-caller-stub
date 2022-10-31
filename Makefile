LIB     = libastard.a
EXE     = main

SRC_DIR = src
LIB_SOURCES = $(SRC_DIR)/astard.c
EXE_SOURCES = $(SRC_DIR)/$(EXE).c
LIB_OBJECTS = $(LIB_SOURCES:.c=.o)
EXE_OBJECTS = $(EXE_SOURCES:.c=.o)
DEPS    = $(LIB_OBJECTS:.o=.d) $(EXE_OBJECTS:.o=.d)

CC      = gcc
CFLAGS  = -std=c99 -march=native -Wall -Wextra -Wpedantic \
          -Wformat=2 -Wshadow -Wwrite-strings -Wstrict-prototypes \
          -Wold-style-definition -Wredundant-decls -Wnested-externs \
          -Wmissing-include-dirs $(addprefix -D, $(OPTIONS))

.PHONY: all clean

all: $(EXE)

clean:
	rm -f $(LIB_OBJECTS) $(EXE_OBJECTS) $(DEPS) $(LIB) $(EXE)

$(LIB): $(LIB_OBJECTS)
	ar rcs $@ $^

-include $(DEPS)

%.o: %.c
	$(CC) $(CFLAGS) -MMD -o $@ -c $<

$(EXE): $(SRC_DIR)/$(EXE).o $(LIB)
	$(CC) $^ -o $@
