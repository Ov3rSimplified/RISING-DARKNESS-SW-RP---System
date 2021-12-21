# RDS-RP-Gameode
RDS:RP Gamemode

## Links
# generally Document: https://docs.google.com/document/d/1UYwQt2UaraNVx4hD9L-EfOIHxFxWYMxjpR4xZuEMeyY/edit?usp=sharing

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
Addon
  --> sh_index.lua -- Globals var or Tbls
   --> cl_init.lua -- to init a menu or something... Dont Write your Complete code!!!
   --> cl_YOURCLNAME.lua
   
   if you want:
   [Folder] -- NOT INIT!!
    --> cl_YOURCLNAME.lua
    --> sh_YOURSHNAME.lua
    --> sv_YOURSVNAME.lua
   
   
