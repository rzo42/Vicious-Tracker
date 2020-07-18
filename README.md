# Vicious-Tracker
A music tracker for the Commodore Vic-20.

*SONG FILE FORMAT HAS UNDERGONE BREAKING CHANGE. SONGS WRITTEN WITH PREVIOUS RELEASES WILL NEED TO BE REFORMATED TO RUN WITH THE NEW BUILD. A "converter" program is included in all file packages to convert old song files to the new format. 

Vicious Tracker Beta Version 3.1

By: Ryan Liston 

Date: Jul 15, 2020

System: Comodore Vic-20 with 16k+ expanion

Code: Iterface (basic), Irq music player(assembly)

About:A music tracker for the Vic 20. The main goal was to create a tracker for the Vic that can easily export song files and irq from basic to disk file for easy use with basic program.
Designed primarily for biginners to have an easy way to produce music irqs to accompany their basic programs. 

Secondary goal is to provide well organized, labeled and commented source code. Open sourced and easy for more advanced user to cut/add features, resize or reorganize tables, and change addresing of files.

Features:
-versions for 16k, 24k and 32k expansion
-save songs files to disk and over write song files
-song files will run on all expanions
-exports song modules for user use at 16k, 24k and 32k expansion areas.
-arrangment up to 128 patterns long.
-16 patterns per channel (4 voices and volume).
-16 patterns for pitch modulation.
-16 patterns for amplitude modulation.
-speed control (timer runs each sound slice making total speed (speed*sound length).
-Volume switch (0 allows amp mod 1-f amp mod of.)
-repeat on/off toggle.
-independent voice channels can be toggled on/off to make it easy to use along in game sound fx.
-true interval note table for smoother harmonizing. 

to dos
-testing
-possible bug fixes
-create detailed pdf manual


Converter: directions
-have "converter" file and and old song file "0"to"7" on the same disk/disk image or in the primary directory on sd card for sd2iec.
-load"converter",8,1
-run
-select file 0 to 7
-after file has been converted name the file.
-file is now saved and can be laoded into the new interface by file name.

Interface:
The interface is disigned with CBM PRG STUDIO and written in basic.

Loading
-load"vt16k",8,1 for 16k 
-load"vt24k",8,1 for 24k
-load"vt32k",8,1 for 16k

Controls and page layout:

-arrow up, down, left and right moves cursor

-F1-settings
	-l=load song file
	-s=save file
	-n=new blank file
	-e=export song and player to module
	-song length and speed (input 0-f, max len $7f)
	-pattern length, song length and volume (input 0-f, 
	  volume 0=amp mod on, 1-f=volume level (amp mod off)
	-repeat, low, mid, high and noise (0=off, 1=on) 
	
	*Players and exported song files will only be useable at the address it is 	         saved from. I.e. a 32k player or exported song module will only at the 
	 32k area not 24k or 16k.

	*Saved (not exported) song files can be used with provided memory 	configuration.

-f2-arranger
	-input (0-f) points to pattern for given channel
	-(+ and -)navigate subpages

-f3-pattern editor
	-t=tune (0-1) 0=whole tone, 1=half tone up.
	-n=note (0-b) 0=c, 1=c#, 2=d, 3=d#, 4=e, 5=f, 6=f#, 7=g, 
	8=g#, 9=a, a=a#, b=b
	-o=octave (0-3) 0=note off, 1-2=octave 1-3
	-s=sound (0-f) points to sound pattern
	-v=volume (0-f)points to volume patterns
	-(+ and -)navigate subpages

*note value is put into registers with the formula 
{note value}={oct}+({tune}*8)+({note}*16)

-f4-pitch modulation (added to pattern values for note table addressing. 
	-t=tune(0-1)
	-n=note(0-11)
	-o=octave(0-4) 4 will be note off of the pattern octave 	value is > 0   
	-(+ and -)navigate subpages

*pitch mod value uses the same formula as note value.
*note table address={note value}+{pitch mod value}

-f5/f6-amplitude modulation
	-input(0-f) 0=sound off, f=loudest
	
*-volume control from tracker is set up to not interfere with the vics aux color.

-f7/f8 plays song. Hit any key to exit player.
-------------------------------------------------------------------------------------

USING EXPRTED AND SAVED SONG FILES IN YOUR OWN PROGRAMS.

Exports:
Exported song modules contain the song data, player, initializer and note table all in one file. They can only be used at the adress they were initiall saved from. Once a module is loaded other songs can be loaded in individualy.

Before you load the 24k or 16k module you will have to lower the top of the Vics basic area to make space for the modules.
To do this the following code into your program. The clr command clears out variable so you will want to place this towards the beggining of your code before any variable declaration.

	16k:	poke55,31:poke56,80:clr

	24k:	poke55,31:poke56,112:clr

To Load an exported file:
Exported files are forced saved and forced loaded with address. Use the following in your code to load an exprted song module of any memory configuration. 

		sys57809("file name"),8,1:poke780,0:sys65493

Once the module has been loaded you will have to initialize the player.

	16k: 	sys24169

	24k: 	sys32361

	32k:	sys48745

Once initialized you can control song play with song control registor. Poke values are 0 for stop, 1 for play and 2 for restart.
Poke location for the control registor are as follows.

	16k: 	24572

	24k: 	32764

	32k: 	49148


LOADING SONGS INTO A LOADED MODULE:

Start by pokeing your control bit to 0. Song files are force saved allowing you to use the following command if you are using them with the memory configuration they were saved from.
To force load song:

		sys57809("file name"),8,1:poke780,0:sys65493

To load song to a different address the commands are

	16k:	sys57809("file name"),8:poke780,0:poke781,31:poke782,80:sys65493

	24k:	sys57809("file name"),8:poke780,0:poke781,31:poke782,112:sys65493

	32k:	sys57809("file name"),8:poke780,0:poke781,31:poke782,176:sys65493

 
Once the new song has been loaded into the module poke 2 into the control registor to clear the song counters and start the new song from the begining.

*PLEASE CONTACT ME WITH ANY QUESTIONS, INPUT OR ISSUES. IT WILL BE OF GREAT HELP TO ME IN IMPROVING THIS PROJECT. THANK YOU. 


