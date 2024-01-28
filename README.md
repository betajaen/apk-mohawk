# Mohawk (Myst and Riven) for AGA/RTG and modern platforms.

This is a port of [Myst and Riven](https://en.wikipedia.org/wiki/Myst_(series)) by for the [Commodore Amiga](https://en.wikipedia.org/wiki/Amiga) it also supports other modern platforms that implement SDL2.

This port is based upon the ScummVM 2.8 (or later) implementation of the ['Mohawk'](https://github.com/scummvm/scummvm/tree/master/engines/mohawk) engine only but does not use other parts of the ScummVM codebase.

## Required data files

This requires the original game data files to play which is the Windows Version. This project does not contain any of the original game data files.

The following files must be placed in the same drawer as the executable, which can be found from your MYST disks.

***To be determined***

## Port Status

### Input
  * [ ] Mouse
  * [ ] Hot Keys

### Audio
  * [ ] Sound Effects
  * [ ] Music

### Graphics
  * [ ] Graphics via graphics.library
  * [ ] Graphics via Real-time Graphics
  * [ ] Graphics via SDL2
  * [ ] Mouse Cursor images
  
### Save Games
  * [ ] Quick Load/Save
  * [ ] Load/Save via Requester

### Game Editions
  * [ ] Myst - Windows (256 Colour)
  * [ ] Myst - Amiga (256 Colour)
  * [ ] MystME - Windows
  * [ ] Riven - Windows

### Ports
  * [ ] Amiga OS 3.x on 68k
  * [ ] SDL2 for MacOS
  * [ ] SDL2 for Windows
  * [ ] SDL2 for Linux

### Enhancements
  * [ ] Controls
  * [ ] Reduced Memory usage
  * [ ] Amiga friendly formats

### Installer
  * [ ] Amiga Installer
  * [ ] MacOS Disk Image
  * [ ] Windows Setup

## State of the Game and Observations

### Amiga for AmigaOS 3 (68K)

* Port has not been started.

### SDL2 for MacOS

* Port has not been started.

### SDL2 for Windows

* Port has not been started.

### SDL2 for Linux

* Port has not been started.

## Game Differences

The Game uses enhanced controls, these replace the ones described in the manual.

### Enhanced Controls

| Key              | Option                 |
|------------------|------------------------|
| `Esc`            | Quick Game Immediately |
| `Space`          | Pause Game             |
| `Shift` and `F9` | Restart Game           |
| `F5`             | Quick Save             |
| `Shift` and `F5` | Save to File           |
| `F9`             | Quick Load             |
| `Shift` and `F9` | Load from File         |


## ScummVM differences

This codebase uses the 'Mohawk' engine source code only and therefore uses the same license as ScummVM GPL 3.0

Additional code such classes and Functions that are normally used in the ScummVM source code have been replicated by the Amiga Port Kit (APK) code and the contents of the Engine folder. Any modifications to the 'Mohawk' engine are documentated with the 'MOD:' sub-string in or near code as comments. These have been written by new authors that are not associated (see AUTHORS) with the ScummVM Project.
