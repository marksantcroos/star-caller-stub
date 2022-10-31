SRC_DIR = src
SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(SOURCES:.c=.o)
DEPS    = $(OBJECTS:.o=.d)
LIB     = libastard.a
EXE     = main

CC      = gcc
CFLAGS  = -std=c99 -march=native -Wall -Wextra -Wpedantic \
          -Wformat=2 -Wshadow -Wwrite-strings -Wstrict-prototypes \
          -Wold-style-definition -Wredundant-decls -Wnested-externs \
          -Wmissing-include-dirs $(addprefix -D, $(OPTIONS))

.PHONY: all clean

all: $(EXE)

clean:
	rm -f $(OBJECTS) $(DEPS) $(LIB) $(EXE)

$(LIB): $(OBJECTS)
	ar rcs $@ $^

-include $(DEPS)

%.o: %.c
	$(CC) $(CFLAGS) -MMD -o $@ -c $<

$(EXE): $(SRC_DIR)/main.o $(LIB)
	$(CC) $^ -o $@
