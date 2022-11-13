THIS IS NOT A GAMEMODE, ITS ONLY A ADDON! 
THATS WAS MY OLD SERVER SCRIPT FOR DARKRP!! SW:RP

## Colors
```
_RDS:Color("COLORNAME", 255)
```

## Notify

#### Modes
- "success"
- "error"
- "warning"
- "info"

### Clientside
```
_RDS:Notify(mode, title, body, duration)
```
### Serverside
```
_RDS:Notify(mode, ply, title, body, duration)
```

## File Structure

### Simple Module
```
[YOURMODULENAME]
  --> sh_index.lua -- Important for Init and Load the Module
   --> cl_init.lua -- to init a menu or something... Dont Write your Complete code!!!
   --> cl_YOURCLNAME.lua
   
   if you want:
   [Folder] -- NOT INIT!!
    --> cl_YOURCLNAME.lua
    --> sh_YOURSHNAME.lua
    --> sv_YOURSVNAME.lua
```
   
