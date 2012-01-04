# Author: Sean Yu
# Date: 1/3/2012

# fudge
### designed to keep your Cocoa DRY

## install

fudge is shell script, so make sure it's added to your $PATH.  Do this by editing /etc/paths, and adding the path containing fudge.

## usage

fudge is designed to automatically generate repetitious code.  For example:

**fudge generate model User NSString*:first_name,last_name,user_id BOOL:is_authenticated**

will create a User.h and a User.m file in a model directory.  

User.h will have the instance variables first_name, last_name, user_id of type NSString* and is_authenticated of type BOOL.  It will also have proper property declarations.

User.m will have the synthesized properties, as well as [varName release] for the proper instance variables.

