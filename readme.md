This is a script library for THE SETTLERS - Rise of a kingdom.

This library will extend upon the default QSB and extend it with additional
features. Components are all optional (expect for the core) and therefore not
always needed for a running map.

## Requirements

The script will run Lua code. You will need to install Lua on your PC. In the 
`bin` directory is a full version of Lua 5.1 for you to install. Follow the
instructions in the readme file. 
(You can also use any other Lua distribution but keep in mind that the game
uses Lua 5.1!)

In addition the lua package manager `luarocks` may be needed to install 
additional lua modules:

https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Windows

## Usage

#### Default

- Download latest release
- Import `s6communitylib` folder (inside archiv) in map archive
- Load `loader.lua` at the start of your scripts
  (both global and local)
- Use Require to load components AFTER that
- call `PrepareLibrary()` in Mission_FirstMapAction

#### Single File

- Download latest release
- Use `mapscript.lua` and `localmapscript.lua` provided by the release
- import `questsystembehavior.lua` as usual
- Include `questsystembehavior.lua` as usual in Mission_FirstMapAction
- Include also in Mission_LocalOnMapStart (local script)
- call `PrepareLibrary()` in Mission_FirstMapAction