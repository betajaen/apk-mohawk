CC=gcc
OPTIONS=

PLATFORM = sdl2
PROGRAM_DIR = ./install/
PROGRAM_NAME = mohawk
PROGRAM = $(PROGRAM_DIR)$(PROGRAM_NAME)
OBJ += \
	apk/pixel_format.cpp \
	mohawk/main.cpp \
	mohawk/bitmap.cpp


CXXFLAGS := -I. -D__AMIGADATE__="\"$(DATESTR)\""
LDFLAGS  :=

SDL2_OBJ		:= \
                   apk/sdl2/main.cpp \
                   apk/sdl2/bank.cpp \
                   apk/sdl2/bitmap.cpp \
                   apk/sdl2/compat.cpp \
                   apk/sdl2/file.cpp \
                   apk/sdl2/gfx.cpp \
                   apk/sdl2/memory.cpp \
                   apk/sdl2/requester.cpp \
                   apk/sdl2/ext/tinyfiledialogs.cpp

SDL2_CC			:= gcc
SDL2_DELETE		:= rm -f
SDL2_CXXFLAGS	+= -gdwarf-2 -std=c++17 -fno-exceptions -fno-rtti -fno-threadsafe-statics -DAPK_IS_SDL2
SDL2_LDFLAGS 	:=
SDL2_RUN		:= (cd $(PROGRAM_DIR) && $(PROGRAM_NAME))

AMIGA_OBJ       := \
                   apk/amiga/main.cpp \
                   apk/amiga/bank.cpp \
                   apk/amiga/compat.cpp \
                   apk/amiga/debug.cpp \
                   apk/amiga/entry.cpp \
                   apk/amiga/file.cpp \
                   apk/amiga/memory.cpp \
                   apk/amiga/requester.cpp \
                   apk/amiga/screen.cpp \
                   apk/amiga/window.cpp

AMIGA_CC		:= /opt/amiga/bin/m68k-amigaos-gcc
AMIGA_DELETE	:= rm -f
AMIGA_CXXFLAGS  := -g -std=c++17 -m68020 -Wall -noixemul -fno-exceptions -fno-rtti -fno-threadsafe-statics
AMIGA_LDFLAGS   := -noixemul -noixemul -fno-exceptions -fno-rtti -fno-threadsafe-statics
AMIGA_RUN 		:= 	fs-uae \
					--model=A1200 \
					--cpu=68030 \
					--zorro_iii_memory=16384 \
					--kickstart_file=./install/amigaos-3.2-a1200.rom \
					--hard_drive_0=./install/amigaos-3.2-a1200.hdf \
					--hard_drive_1=./install/ \
					--hard_drive_1_label="Mohawk" \
					--hard_drive_2=./install/data/MYST_UK \
					--hard_drive_2_label="MYST" \
					--hard_drive_3=./install/saves \
					--hard_drive_3_label="Saves" \
					--floppy_drive_volume=0 \
					--floppy_drive_volume_empty=0 \
					--smoothing=0 \
					--graphics_card=uaegfx \
					--fssa=0 \
					--texture_filter=nearest \
					--window_x=3001 \
					--window_y=-200 \
					--window_width=1400 \
					--window_height=1024 \
					--scale=2

ifeq ($(PLATFORM),aga)
  OBJ		  += $(AMIGA_OBJ)
  CC		  := $(AMIGA_CC)
  DELETE	  := $(AMIGA_DELETE)
  CXXFLAGS    += $(AMIGA_CXXFLAGS) apk/amiga/gfx_aga.cpp -DAPK_IS_AGA
  LDFLAGS     := $(AMIGA_LDFLAGS)
else ifeq ($(PLATFORM),rtg)
  OBJ		  += $(AMIGA_OBJ)
  CC		  := $(AMIGA_CC)
  DELETE	  := $(AMIGA_DELETE)
  CXXFLAGS  += $(AMIGA_CXXFLAGS) apk/amiga/gfx_rtg.cpp -DAPK_IS_RTG
  LDFLAGS   := $(AMIGA_LDFLAGS)
else ifeq ($(PLATFORM),sdl2)
  OBJ		  += $(SDL2_OBJ)
  CC		  := $(SDL2_CC)
  DELETE	  := $(SDL2_DELETE)
  CXXFLAGS  += $(SDL2_CXXFLAGS)
  LDFLAGS   := $(SDL2_LDFLAGS)
  UNAME_S := $(shell uname -s)
 
  ifeq ($(UNAME_S),Darwin)
    CXXFLAGS += -lSDL2 -I/opt/homebrew/include -L/opt/homebrew/lib
  else
    $(error Unknown SDL2 platform $(UNAME_S))
  endif
else
  $(error Invalid PLATFORM value. PLATFORM must be rtg, aga, or sdl2)
endif

all: $(PROGRAM)

$(PROGRAM): $(OBJ)
	$(DELETE) $(PROGRAM) || exit 1
	if $(CC) $(CXXFLAGS) $(OBJ) -o $(PROGRAM) $(LDFLAGS); then \
		echo "Compiled to $(PROGRAM)"; \
	else \
	  	echo "Compilation failed."; \
	fi

%.o: %.cpp
	$(CC) $(CXX) -c $< -o $@

clean .IGNORE:
	$(DELETE) *.o
	$(DELETE) $(PROGRAM)

run:
	@HUNK_COOKIE="000003F3"; \
	if hexdump -n 4 -e '4/1 "%02X"' $(PROGRAM) | grep -q "$$HUNK_COOKIE"; then \
		$(AMIGA_RUN); \
	else \
		$(SDL2_RUN); \
	fi

.PHONY: $(PROGRAM) run run_amiga