--[[ -- g915 Binds -- 

Loads From User/g915.lua

Additional binds you may want to change.
Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key



]]

	-- g915 Keyboard Binds
	if player.name == "Olymoly" then
		-- WAR
		if player.main_job == "WAR" then
			windower.send_command('exec Olymoly/war/g915/m1/default.txt;exec Olymoly/war/g915/m2/default.txt;exec Olymoly/war/g915/m3/default.txt;exec Olymoly/war/g13/m1/default.txt;exec Olymoly/war/g13/m2/default.txt;exec Olymoly/war/g13/m3/default.txt')
		-- MNK
		elseif player.main_job == "MNK" then
			windower.send_command('exec Olymoly/mnk/g915/m1/default.txt;exec Olymoly/mnk/g915/m2/default.txt;exec Olymoly/mnk/g915/m3/default.txt;exec Olymoly/mnk/g13/m1/default.txt;exec Olymoly/mnk/g13/m2/default.txt;exec Olymoly/mnk/g13/m3/default.txt')
		-- WHM
		elseif player.main_job == "WHM" then
			windower.send_command('exec Olymoly/whm/g915/m1/default.txt;exec Olymoly/whm/g915/m2/default.txt;exec Olymoly/whm/g915/m3/default.txt;exec Olymoly/whm/g13/m1/default.txt;exec Olymoly/whm/g13/m2/default.txt;exec Olymoly/whm/g13/m3/default.txt')
		-- BLM
		elseif player.main_job == "BLM" then
			windower.send_command('exec Olymoly/blm/g915/m1/default.txt;exec Olymoly/blm/g915/m2/default.txt;exec Olymoly/blm/g915/m3/default.txt;exec Olymoly/blm/g13/m1/default.txt;exec Olymoly/blm/g13/m2/default.txt;exec Olymoly/blm/g13/m3/default.txt')
		-- RDM
		elseif player.main_job == "RDM" then
			windower.send_command('exec Olymoly/rdm/g915/m1/default.txt;exec Olymoly/rdm/g915/m2/default.txt;exec Olymoly/rdm/g915/m3/default.txt;exec Olymoly/rdm/g13/m1/default.txt;exec Olymoly/rdm/g13/m2/default.txt;exec Olymoly/rdm/g13/m3/default.txt')
		-- THF
		elseif player.main_job == "THF" then
			windower.send_command('exec Olymoly/thf/g915/m1/default.txt;exec Olymoly/thf/g915/m2/default.txt;exec Olymoly/thf/g915/m3/default.txt;exec Olymoly/thf/g13/m1/default.txt;exec Olymoly/thf/g13/m2/default.txt;exec Olymoly/thf/g13/m3/default.txt')
		-- PLD
		elseif player.main_job == "PLD" then
			windower.send_command('exec Olymoly/pld/g915/m1/default.txt;exec Olymoly/pld/g915/m2/default.txt;exec Olymoly/pld/g915/m3/default.txt;exec Olymoly/pld/g13/m1/default.txt;exec Olymoly/pld/g13/m2/default.txt;exec Olymoly/pld/g13/m3/default.txt')
		-- DRK
		elseif player.main_job == "DRK" then
			windower.send_command('exec Olymoly/drk/g915/m1/default.txt;exec Olymoly/drk/g915/m2/default.txt;exec Olymoly/drk/g915/m3/default.txt;exec Olymoly/drk/g13/m1/default.txt;exec Olymoly/drk/g13/m2/default.txt;exec Olymoly/drk/g13/m3/default.txt')
		-- BST
		elseif player.main_job == "BST" then 
			windower.send_command('exec Olymoly/bst/g915/m1/default.txt;exec Olymoly/bst/g915/m2/default.txt;exec Olymoly/bst/g915/m3/default.txt;exec Olymoly/bst/g13/m1/default.txt;exec Olymoly/bst/g13/m2/default.txt;exec Olymoly/bst/g13/m3/default.txt')
		-- BRD 
		elseif player.main_job == "BRD" then
			windower.send_command('exec Olymoly/brd/g915/m1/default.txt;exec Olymoly/brd/g915/m2/default.txt;exec Olymoly/brd/g915/m3/default.txt;exec Olymoly/brd/g13/m1/default.txt;exec Olymoly/brd/g13/m2/default.txt;exec Olymoly/brd/g13/m3/default.txt')
		-- RNG
		elseif player.main_job == "RNG" then
			windower.send_command('exec Olymoly/rng/g915/m1/default.txt;exec Olymoly/rng/g915/m2/default.txt;exec Olymoly/rng/g915/m3/default.txt;exec Olymoly/rng/g13/m1/default.txt;exec Olymoly/rng/g13/m2/default.txt;exec Olymoly/rng/g13/m3/default.txt')
		-- SAM
		elseif player.main_job == "SAM" then
			windower.send_command('exec Olymoly/sam/g915/m1/default.txt;exec Olymoly/sam/g915/m2/default.txt;exec Olymoly/sam/g915/m3/default.txt;exec Olymoly/sam/g13/m1/default.txt;exec Olymoly/sam/g13/m2/default.txt;exec Olymoly/sam/g13/m3/default.txt')
		-- NIN
		elseif player.main_job == "NIN" then
			windower.send_command('exec Olymoly/nin/g915/m1/default.txt;exec Olymoly/nin/g915/m2/default.txt;exec Olymoly/nin/g915/m3/default.txt;exec Olymoly/nin/g13/m1/default.txt;exec Olymoly/nin/g13/m2/default.txt;exec Olymoly/nin/g13/m3/default.txt')
		-- DRG 
		elseif player.main_job == "DRG" then
			windower.send_command('exec Olymoly/drg/g915/m1/default.txt;exec Olymoly/drg/g915/m2/default.txt;exec Olymoly/drg/g915/m3/default.txt;exec Olymoly/drg/g13/m1/default.txt;exec Olymoly/drg/g13/m2/default.txt;exec Olymoly/drg/g13/m3/default.txt')
		-- SMN
		elseif player.main_job == "SMN" then
			windower.send_command('exec Olymoly/smn/g915/m1/default.txt;exec Olymoly/smn/g915/m2/default.txt;exec Olymoly/smn/g915/m3/default.txt;exec Olymoly/smn/g13/m1/default.txt;exec Olymoly/smn/g13/m2/default.txt;exec Olymoly/smn/g13/m3/default.txt')
		-- BLU
		elseif player.main_job == "BLU" then
			windower.send_command('exec Olymoly/blu/g915/m1/default.txt;exec Olymoly/blu/g915/m2/default.txt;exec Olymoly/blu/g915/m3/default.txt;exec Olymoly/blu/g13/m1/default.txt;exec Olymoly/blu/g13/m2/default.txt;exec Olymoly/blu/g13/m3/default.txt')
		-- COR
		elseif player.main_job == "COR" then
			windower.send_command('exec Olymoly/cor/g915/m1/default.txt;exec Olymoly/cor/g915/m2/default.txt;exec Olymoly/cor/g915/m3/default.txt;exec Olymoly/cor/g13/m1/default.txt;exec Olymoly/cor/g13/m2/default.txt;exec Olymoly/cor/g13/m3/default.txt')
		-- PUP
		elseif player.main_job == "PUP" then
			windower.send_command('exec Olymoly/pup/g915/m1/default.txt;exec Olymoly/pup/g915/m2/default.txt;exec Olymoly/pup/g915/m3/default.txt;exec Olymoly/pup/g13/m1/default.txt;exec Olymoly/pup/g13/m2/default.txt;exec Olymoly/pup/g13/m3/default.txt')
		-- SCH
		elseif player.main_job == "SCH" then
			windower.send_command('exec Olymoly/sch/g915/m1/default.txt;exec Olymoly/sch/g915/m2/default.txt;exec Olymoly/sch/g915/m3/default.txt;exec Olymoly/sch/g13/m1/default.txt;exec Olymoly/sch/g13/m2/default.txt;exec Olymoly/sch/g13/m3/default.txt')
		-- DNC
		elseif player.main_job == "DNC" then
			windower.send_command('exec Olymoly/dnc/g915/m1/default.txt;exec Olymoly/dnc/g915/m2/default.txt;exec Olymoly/dnc/g915/m3/default.txt;exec Olymoly/dnc/g13/m1/default.txt;exec Olymoly/dnc/g13/m2/default.txt;exec Olymoly/dnc/g13/m3/default.txt')
		-- GEO
		elseif player.main_job == "GEO" then
			windower.send_command('exec Olymoly/geo/g915/m1/default.txt;exec Olymoly/geo/g915/m2/default.txt;exec Olymoly/geo/g915/m3/default.txt;exec Olymoly/geo/g13/m1/default.txt;exec Olymoly/geo/g13/m2/default.txt;exec Olymoly/geo/g13/m3/default.txt')
		-- RUN
		elseif player.main_job == "RUN" then
			windower.send_command('exec Olymoly/run/g915/m1/default.txt;exec Olymoly/run/g915/m2/default.txt;exec Olymoly/run/g915/m3/default.txt;exec Olymoly/run/g13/m1/default.txt;exec Olymoly/run/g13/m2/default.txt;exec Olymoly/run/g13/m3/default.txt')
		end
	end
	
	if player.name == "Dasmir" then
		-- WAR
		if player.main_job == "WAR" then
			windower.send_command('exec Dasmir/war/g915/m1/default.txt;exec Dasmir/war/g915/m2/default.txt;exec Dasmir/war/g915/m3/default.txt;exec Dasmir/war/g13/m1/default.txt;exec Dasmir/war/g13/m2/default.txt;exec Dasmir/war/g13/m3/default.txt')
		-- MNK
		elseif player.main_job == "MNK" then
			windower.send_command('exec Dasmir/mnk/g915/m1/default.txt;exec Dasmir/mnk/g915/m2/default.txt;exec Dasmir/mnk/g915/m3/default.txt;exec Dasmir/mnk/g13/m1/default.txt;exec Dasmir/mnk/g13/m2/default.txt;exec Dasmir/mnk/g13/m3/default.txt')
		-- WHM
		elseif player.main_job == "WHM" then
			windower.send_command('exec Dasmir/whm/g915/m1/default.txt;exec Dasmir/whm/g915/m2/default.txt;exec Dasmir/whm/g915/m3/default.txt;exec Dasmir/whm/g13/m1/default.txt;exec Dasmir/whm/g13/m2/default.txt;exec Dasmir/whm/g13/m3/default.txt')
		-- BLM
		elseif player.main_job == "BLM" then
			windower.send_command('exec Dasmir/blm/g915/m1/default.txt;exec Dasmir/blm/g915/m2/default.txt;exec Dasmir/blm/g915/m3/default.txt;exec Dasmir/blm/g13/m1/default.txt;exec Dasmir/blm/g13/m2/default.txt;exec Dasmir/blm/g13/m3/default.txt')
		-- RDM
		elseif player.main_job == "RDM" then
			windower.send_command('exec Dasmir/rdm/g915/m1/default.txt;exec Dasmir/rdm/g915/m2/default.txt;exec Dasmir/rdm/g915/m3/default.txt;exec Dasmir/rdm/g13/m1/default.txt;exec Dasmir/rdm/g13/m2/default.txt;exec Dasmir/rdm/g13/m3/default.txt')
		-- THF
		elseif player.main_job == "THF" then
			windower.send_command('exec Dasmir/thf/g915/m1/default.txt;exec Dasmir/thf/g915/m2/default.txt;exec Dasmir/thf/g915/m3/default.txt;exec Dasmir/thf/g13/m1/default.txt;exec Dasmir/thf/g13/m2/default.txt;exec Dasmir/thf/g13/m3/default.txt')
		-- PLD
		elseif player.main_job == "PLD" then
			windower.send_command('exec Dasmir/pld/g915/m1/default.txt;exec Dasmir/pld/g915/m2/default.txt;exec Dasmir/pld/g915/m3/default.txt;exec Dasmir/pld/g13/m1/default.txt;exec Dasmir/pld/g13/m2/default.txt;exec Dasmir/pld/g13/m3/default.txt')
		-- DRK
		elseif player.main_job == "DRK" then
			windower.send_command('exec Dasmir/drk/g915/m1/default.txt;exec Dasmir/drk/g915/m2/default.txt;exec Dasmir/drk/g915/m3/default.txt;exec Dasmir/drk/g13/m1/default.txt;exec Dasmir/drk/g13/m2/default.txt;exec Dasmir/drk/g13/m3/default.txt')
		-- BST
		elseif player.main_job == "BST" then 
			windower.send_command('exec Dasmir/bst/g915/m1/default.txt;exec Dasmir/bst/g915/m2/default.txt;exec Dasmir/bst/g915/m3/default.txt;exec Dasmir/bst/g13/m1/default.txt;exec Dasmir/bst/g13/m2/default.txt;exec Dasmir/bst/g13/m3/default.txt')
		-- BRD 
		elseif player.main_job == "BRD" then
			windower.send_command('exec Dasmir/brd/g915/m1/default.txt;exec Dasmir/brd/g915/m2/default.txt;exec Dasmir/brd/g915/m3/default.txt;exec Dasmir/brd/g13/m1/default.txt;exec Dasmir/brd/g13/m2/default.txt;exec Dasmir/brd/g13/m3/default.txt')
		-- RNG
		elseif player.main_job == "RNG" then
			windower.send_command('exec Dasmir/rng/g915/m1/default.txt;exec Dasmir/rng/g915/m2/default.txt;exec Dasmir/rng/g915/m3/default.txt;exec Dasmir/rng/g13/m1/default.txt;exec Dasmir/rng/g13/m2/default.txt;exec Dasmir/rng/g13/m3/default.txt')
		-- SAM
		elseif player.main_job == "SAM" then
			windower.send_command('exec Dasmir/sam/g915/m1/default.txt;exec Dasmir/sam/g915/m2/default.txt;exec Dasmir/sam/g915/m3/default.txt;exec Dasmir/sam/g13/m1/default.txt;exec Dasmir/sam/g13/m2/default.txt;exec Dasmir/sam/g13/m3/default.txt')
		-- NIN
		elseif player.main_job == "NIN" then
			windower.send_command('exec Dasmir/nin/g915/m1/default.txt;exec Dasmir/nin/g915/m2/default.txt;exec Dasmir/nin/g915/m3/default.txt;exec Dasmir/nin/g13/m1/default.txt;exec Dasmir/nin/g13/m2/default.txt;exec Dasmir/nin/g13/m3/default.txt')
		-- DRG 
		elseif player.main_job == "DRG" then
			windower.send_command('exec Dasmir/drg/g915/m1/default.txt;exec Dasmir/drg/g915/m2/default.txt;exec Dasmir/drg/g915/m3/default.txt;exec Dasmir/drg/g13/m1/default.txt;exec Dasmir/drg/g13/m2/default.txt;exec Dasmir/drg/g13/m3/default.txt')
		-- SMN
		elseif player.main_job == "SMN" then
			windower.send_command('exec Dasmir/smn/g915/m1/default.txt;exec Dasmir/smn/g915/m2/default.txt;exec Dasmir/smn/g915/m3/default.txt;exec Dasmir/smn/g13/m1/default.txt;exec Dasmir/smn/g13/m2/default.txt;exec Dasmir/smn/g13/m3/default.txt')
		-- BLU
		elseif player.main_job == "BLU" then
			windower.send_command('exec Dasmir/blu/g915/m1/default.txt;exec Dasmir/blu/g915/m2/default.txt;exec Dasmir/blu/g915/m3/default.txt;exec Dasmir/blu/g13/m1/default.txt;exec Dasmir/blu/g13/m2/default.txt;exec Dasmir/blu/g13/m3/default.txt')
		-- COR
		elseif player.main_job == "COR" then
			windower.send_command('exec Dasmir/cor/g915/m1/default.txt;exec Dasmir/cor/g915/m2/default.txt;exec Dasmir/cor/g915/m3/default.txt;exec Dasmir/cor/g13/m1/default.txt;exec Dasmir/cor/g13/m2/default.txt;exec Dasmir/cor/g13/m3/default.txt')
		-- PUP
		elseif player.main_job == "PUP" then
			windower.send_command('exec Dasmir/pup/g915/m1/default.txt;exec Dasmir/pup/g915/m2/default.txt;exec Dasmir/pup/g915/m3/default.txt;exec Dasmir/pup/g13/m1/default.txt;exec Dasmir/pup/g13/m2/default.txt;exec Dasmir/pup/g13/m3/default.txt')
		-- SCH
		elseif player.main_job == "SCH" then
			windower.send_command('exec Dasmir/sch/g915/m1/default.txt;exec Dasmir/sch/g915/m2/default.txt;exec Dasmir/sch/g915/m3/default.txt;exec Dasmir/sch/g13/m1/default.txt;exec Dasmir/sch/g13/m2/default.txt;exec Dasmir/sch/g13/m3/default.txt')
		-- DNC
		elseif player.main_job == "DNC" then
			windower.send_command('exec Dasmir/dnc/g915/m1/default.txt;exec Dasmir/dnc/g915/m2/default.txt;exec Dasmir/dnc/g915/m3/default.txt;exec Dasmir/dnc/g13/m1/default.txt;exec Dasmir/dnc/g13/m2/default.txt;exec Dasmir/dnc/g13/m3/default.txt')
		-- GEO
		elseif player.main_job == "GEO" then
			windower.send_command('exec Dasmir/geo/g915/m1/default.txt;exec Dasmir/geo/g915/m2/default.txt;exec Dasmir/geo/g915/m3/default.txt;exec Dasmir/geo/g13/m1/default.txt;exec Dasmir/geo/g13/m2/default.txt;exec Dasmir/geo/g13/m3/default.txt')
		-- RUN
		elseif player.main_job == "RUN" then
			windower.send_command('exec Dasmir/run/g915/m1/default.txt;exec Dasmir/run/g915/m2/default.txt;exec Dasmir/run/g915/m3/default.txt;exec Dasmir/run/g13/m1/default.txt;exec Dasmir/run/g13/m2/default.txt;exec Dasmir/run/g13/m3/default.txt')
		end
	end
	
	if player.name == "Ayooo" then
		-- WAR
		if player.main_job == "WAR" then
			windower.send_command('exec Ayooo/war/g915/m1/default.txt;exec Ayooo/war/g915/m2/default.txt;exec Ayooo/war/g915/m3/default.txt;exec Ayooo/war/g13/m1/default.txt;exec Ayooo/war/g13/m2/default.txt;exec Ayooo/war/g13/m3/default.txt')
		-- MNK
		elseif player.main_job == "MNK" then
			windower.send_command('exec Ayooo/mnk/g915/m1/default.txt;exec Ayooo/mnk/g915/m2/default.txt;exec Ayooo/mnk/g915/m3/default.txt;exec Ayooo/mnk/g13/m1/default.txt;exec Ayooo/mnk/g13/m2/default.txt;exec Ayooo/mnk/g13/m3/default.txt')
		-- WHM
		elseif player.main_job == "WHM" then
			windower.send_command('exec Ayooo/whm/g915/m1/default.txt;exec Ayooo/whm/g915/m2/default.txt;exec Ayooo/whm/g915/m3/default.txt;exec Ayooo/whm/g13/m1/default.txt;exec Ayooo/whm/g13/m2/default.txt;exec Ayooo/whm/g13/m3/default.txt')
		-- BLM
		elseif player.main_job == "BLM" then
			windower.send_command('exec Ayooo/blm/g915/m1/default.txt;exec Ayooo/blm/g915/m2/default.txt;exec Ayooo/blm/g915/m3/default.txt;exec Ayooo/blm/g13/m1/default.txt;exec Ayooo/blm/g13/m2/default.txt;exec Ayooo/blm/g13/m3/default.txt')
		-- RDM
		elseif player.main_job == "RDM" then
			windower.send_command('exec Ayooo/rdm/g915/m1/default.txt;exec Ayooo/rdm/g915/m2/default.txt;exec Ayooo/rdm/g915/m3/default.txt;exec Ayooo/rdm/g13/m1/default.txt;exec Ayooo/rdm/g13/m2/default.txt;exec Ayooo/rdm/g13/m3/default.txt')
		-- THF
		elseif player.main_job == "THF" then
			windower.send_command('exec Ayooo/thf/g915/m1/default.txt;exec Ayooo/thf/g915/m2/default.txt;exec Ayooo/thf/g915/m3/default.txt;exec Ayooo/thf/g13/m1/default.txt;exec Ayooo/thf/g13/m2/default.txt;exec Ayooo/thf/g13/m3/default.txt')
		-- PLD
		elseif player.main_job == "PLD" then
			windower.send_command('exec Ayooo/pld/g915/m1/default.txt;exec Ayooo/pld/g915/m2/default.txt;exec Ayooo/pld/g915/m3/default.txt;exec Ayooo/pld/g13/m1/default.txt;exec Ayooo/pld/g13/m2/default.txt;exec Ayooo/pld/g13/m3/default.txt')
		-- DRK
		elseif player.main_job == "DRK" then
			windower.send_command('exec Ayooo/drk/g915/m1/default.txt;exec Ayooo/drk/g915/m2/default.txt;exec Ayooo/drk/g915/m3/default.txt;exec Ayooo/drk/g13/m1/default.txt;exec Ayooo/drk/g13/m2/default.txt;exec Ayooo/drk/g13/m3/default.txt')
		-- BST
		elseif player.main_job == "BST" then 
			windower.send_command('exec Ayooo/bst/g915/m1/default.txt;exec Ayooo/bst/g915/m2/default.txt;exec Ayooo/bst/g915/m3/default.txt;exec Ayooo/bst/g13/m1/default.txt;exec Ayooo/bst/g13/m2/default.txt;exec Ayooo/bst/g13/m3/default.txt')
		-- BRD 
		elseif player.main_job == "BRD" then
			windower.send_command('exec Ayooo/brd/g915/m1/default.txt;exec Ayooo/brd/g915/m2/default.txt;exec Ayooo/brd/g915/m3/default.txt;exec Ayooo/brd/g13/m1/default.txt;exec Ayooo/brd/g13/m2/default.txt;exec Ayooo/brd/g13/m3/default.txt')
		-- RNG
		elseif player.main_job == "RNG" then
			windower.send_command('exec Ayooo/rng/g915/m1/default.txt;exec Ayooo/rng/g915/m2/default.txt;exec Ayooo/rng/g915/m3/default.txt;exec Ayooo/rng/g13/m1/default.txt;exec Ayooo/rng/g13/m2/default.txt;exec Ayooo/rng/g13/m3/default.txt')
		-- SAM
		elseif player.main_job == "SAM" then
			windower.send_command('exec Ayooo/sam/g915/m1/default.txt;exec Ayooo/sam/g915/m2/default.txt;exec Ayooo/sam/g915/m3/default.txt;exec Ayooo/sam/g13/m1/default.txt;exec Ayooo/sam/g13/m2/default.txt;exec Ayooo/sam/g13/m3/default.txt')
		-- NIN
		elseif player.main_job == "NIN" then
			windower.send_command('exec Ayooo/nin/g915/m1/default.txt;exec Ayooo/nin/g915/m2/default.txt;exec Ayooo/nin/g915/m3/default.txt;exec Ayooo/nin/g13/m1/default.txt;exec Ayooo/nin/g13/m2/default.txt;exec Ayooo/nin/g13/m3/default.txt')
		-- DRG 
		elseif player.main_job == "DRG" then
			windower.send_command('exec Ayooo/drg/g915/m1/default.txt;exec Ayooo/drg/g915/m2/default.txt;exec Ayooo/drg/g915/m3/default.txt;exec Ayooo/drg/g13/m1/default.txt;exec Ayooo/drg/g13/m2/default.txt;exec Ayooo/drg/g13/m3/default.txt')
		-- SMN
		elseif player.main_job == "SMN" then
			windower.send_command('exec Ayooo/smn/g915/m1/default.txt;exec Ayooo/smn/g915/m2/default.txt;exec Ayooo/smn/g915/m3/default.txt;exec Ayooo/smn/g13/m1/default.txt;exec Ayooo/smn/g13/m2/default.txt;exec Ayooo/smn/g13/m3/default.txt')
		-- BLU
		elseif player.main_job == "BLU" then
			windower.send_command('exec Ayooo/blu/g915/m1/default.txt;exec Ayooo/blu/g915/m2/default.txt;exec Ayooo/blu/g915/m3/default.txt;exec Ayooo/blu/g13/m1/default.txt;exec Ayooo/blu/g13/m2/default.txt;exec Ayooo/blu/g13/m3/default.txt')
		-- COR
		elseif player.main_job == "COR" then
			windower.send_command('exec Ayooo/cor/g915/m1/default.txt;exec Ayooo/cor/g915/m2/default.txt;exec Ayooo/cor/g915/m3/default.txt;exec Ayooo/cor/g13/m1/default.txt;exec Ayooo/cor/g13/m2/default.txt;exec Ayooo/cor/g13/m3/default.txt')
		-- PUP
		elseif player.main_job == "PUP" then
			windower.send_command('exec Ayooo/pup/g915/m1/default.txt;exec Ayooo/pup/g915/m2/default.txt;exec Ayooo/pup/g915/m3/default.txt;exec Ayooo/pup/g13/m1/default.txt;exec Ayooo/pup/g13/m2/default.txt;exec Ayooo/pup/g13/m3/default.txt')
		-- SCH
		elseif player.main_job == "SCH" then
			windower.send_command('exec Ayooo/sch/g915/m1/default.txt;exec Ayooo/sch/g915/m2/default.txt;exec Ayooo/sch/g915/m3/default.txt;exec Ayooo/sch/g13/m1/default.txt;exec Ayooo/sch/g13/m2/default.txt;exec Ayooo/sch/g13/m3/default.txt')
		-- DNC
		elseif player.main_job == "DNC" then
			windower.send_command('exec Ayooo/dnc/g915/m1/default.txt;exec Ayooo/dnc/g915/m2/default.txt;exec Ayooo/dnc/g915/m3/default.txt;exec Ayooo/dnc/g13/m1/default.txt;exec Ayooo/dnc/g13/m2/default.txt;exec Ayooo/dnc/g13/m3/default.txt')
		-- GEO
		elseif player.main_job == "GEO" then
			windower.send_command('exec Ayooo/geo/g915/m1/default.txt;exec Ayooo/geo/g915/m2/default.txt;exec Ayooo/geo/g915/m3/default.txt;exec Ayooo/geo/g13/m1/default.txt;exec Ayooo/geo/g13/m2/default.txt;exec Ayooo/geo/g13/m3/default.txt')
		-- RUN
		elseif player.main_job == "RUN" then
			windower.send_command('exec Ayooo/run/g915/m1/default.txt;exec Ayooo/run/g915/m2/default.txt;exec Ayooo/run/g915/m3/default.txt;exec Ayooo/run/g13/m1/default.txt;exec Ayooo/run/g13/m2/default.txt;exec Ayooo/run/g13/m3/default.txt')
		end
	end
	
	if player.name == "Oasus" then
		-- WAR
		if player.main_job == "WAR" then
			windower.send_command('exec Oasus/war/g915/m1/default.txt;exec Oasus/war/g915/m2/default.txt;exec Oasus/war/g915/m3/default.txt;exec Oasus/war/g13/m1/default.txt;exec Oasus/war/g13/m2/default.txt;exec Oasus/war/g13/m3/default.txt')
		-- MNK
		elseif player.main_job == "MNK" then
			windower.send_command('exec Oasus/mnk/g915/m1/default.txt;exec Oasus/mnk/g915/m2/default.txt;exec Oasus/mnk/g915/m3/default.txt;exec Oasus/mnk/g13/m1/default.txt;exec Oasus/mnk/g13/m2/default.txt;exec Oasus/mnk/g13/m3/default.txt')
		-- WHM
		elseif player.main_job == "WHM" then
			windower.send_command('exec Oasus/whm/g915/m1/default.txt;exec Oasus/whm/g915/m2/default.txt;exec Oasus/whm/g915/m3/default.txt;exec Oasus/whm/g13/m1/default.txt;exec Oasus/whm/g13/m2/default.txt;exec Oasus/whm/g13/m3/default.txt')
		-- BLM
		elseif player.main_job == "BLM" then
			windower.send_command('exec Oasus/blm/g915/m1/default.txt;exec Oasus/blm/g915/m2/default.txt;exec Oasus/blm/g915/m3/default.txt;exec Oasus/blm/g13/m1/default.txt;exec Oasus/blm/g13/m2/default.txt;exec Oasus/blm/g13/m3/default.txt')
		-- RDM
		elseif player.main_job == "RDM" then
			windower.send_command('exec Oasus/rdm/g915/m1/default.txt;exec Oasus/rdm/g915/m2/default.txt;exec Oasus/rdm/g915/m3/default.txt;exec Oasus/rdm/g13/m1/default.txt;exec Oasus/rdm/g13/m2/default.txt;exec Oasus/rdm/g13/m3/default.txt')
		-- THF
		elseif player.main_job == "THF" then
			windower.send_command('exec Oasus/thf/g915/m1/default.txt;exec Oasus/thf/g915/m2/default.txt;exec Oasus/thf/g915/m3/default.txt;exec Oasus/thf/g13/m1/default.txt;exec Oasus/thf/g13/m2/default.txt;exec Oasus/thf/g13/m3/default.txt')
		-- PLD
		elseif player.main_job == "PLD" then
			windower.send_command('exec Oasus/pld/g915/m1/default.txt;exec Oasus/pld/g915/m2/default.txt;exec Oasus/pld/g915/m3/default.txt;exec Oasus/pld/g13/m1/default.txt;exec Oasus/pld/g13/m2/default.txt;exec Oasus/pld/g13/m3/default.txt')
		-- DRK
		elseif player.main_job == "DRK" then
			windower.send_command('exec Oasus/drk/g915/m1/default.txt;exec Oasus/drk/g915/m2/default.txt;exec Oasus/drk/g915/m3/default.txt;exec Oasus/drk/g13/m1/default.txt;exec Oasus/drk/g13/m2/default.txt;exec Oasus/drk/g13/m3/default.txt')
		-- BST
		elseif player.main_job == "BST" then 
			windower.send_command('exec Oasus/bst/g915/m1/default.txt;exec Oasus/bst/g915/m2/default.txt;exec Oasus/bst/g915/m3/default.txt;exec Oasus/bst/g13/m1/default.txt;exec Oasus/bst/g13/m2/default.txt;exec Oasus/bst/g13/m3/default.txt')
		-- BRD 
		elseif player.main_job == "BRD" then
			windower.send_command('exec Oasus/brd/g915/m1/default.txt;exec Oasus/brd/g915/m2/default.txt;exec Oasus/brd/g915/m3/default.txt;exec Oasus/brd/g13/m1/default.txt;exec Oasus/brd/g13/m2/default.txt;exec Oasus/brd/g13/m3/default.txt')
		-- RNG
		elseif player.main_job == "RNG" then
			windower.send_command('exec Oasus/rng/g915/m1/default.txt;exec Oasus/rng/g915/m2/default.txt;exec Oasus/rng/g915/m3/default.txt;exec Oasus/rng/g13/m1/default.txt;exec Oasus/rng/g13/m2/default.txt;exec Oasus/rng/g13/m3/default.txt')
		-- SAM
		elseif player.main_job == "SAM" then
			windower.send_command('exec Oasus/sam/g915/m1/default.txt;exec Oasus/sam/g915/m2/default.txt;exec Oasus/sam/g915/m3/default.txt;exec Oasus/sam/g13/m1/default.txt;exec Oasus/sam/g13/m2/default.txt;exec Oasus/sam/g13/m3/default.txt')
		-- NIN
		elseif player.main_job == "NIN" then
			windower.send_command('exec Oasus/nin/g915/m1/default.txt;exec Oasus/nin/g915/m2/default.txt;exec Oasus/nin/g915/m3/default.txt;exec Oasus/nin/g13/m1/default.txt;exec Oasus/nin/g13/m2/default.txt;exec Oasus/nin/g13/m3/default.txt')
		-- DRG 
		elseif player.main_job == "DRG" then
			windower.send_command('exec Oasus/drg/g915/m1/default.txt;exec Oasus/drg/g915/m2/default.txt;exec Oasus/drg/g915/m3/default.txt;exec Oasus/drg/g13/m1/default.txt;exec Oasus/drg/g13/m2/default.txt;exec Oasus/drg/g13/m3/default.txt')
		-- SMN
		elseif player.main_job == "SMN" then
			windower.send_command('exec Oasus/smn/g915/m1/default.txt;exec Oasus/smn/g915/m2/default.txt;exec Oasus/smn/g915/m3/default.txt;exec Oasus/smn/g13/m1/default.txt;exec Oasus/smn/g13/m2/default.txt;exec Oasus/smn/g13/m3/default.txt')
		-- BLU
		elseif player.main_job == "BLU" then
			windower.send_command('exec Oasus/blu/g915/m1/default.txt;exec Oasus/blu/g915/m2/default.txt;exec Oasus/blu/g915/m3/default.txt;exec Oasus/blu/g13/m1/default.txt;exec Oasus/blu/g13/m2/default.txt;exec Oasus/blu/g13/m3/default.txt')
		-- COR
		elseif player.main_job == "COR" then
			windower.send_command('exec Oasus/cor/g915/m1/default.txt;exec Oasus/cor/g915/m2/default.txt;exec Oasus/cor/g915/m3/default.txt;exec Oasus/cor/g13/m1/default.txt;exec Oasus/cor/g13/m2/default.txt;exec Oasus/cor/g13/m3/default.txt')
		-- PUP
		elseif player.main_job == "PUP" then
			windower.send_command('exec Oasus/pup/g915/m1/default.txt;exec Oasus/pup/g915/m2/default.txt;exec Oasus/pup/g915/m3/default.txt;exec Oasus/pup/g13/m1/default.txt;exec Oasus/pup/g13/m2/default.txt;exec Oasus/pup/g13/m3/default.txt')
		-- SCH
		elseif player.main_job == "SCH" then
			windower.send_command('exec Oasus/sch/g915/m1/default.txt;exec Oasus/sch/g915/m2/default.txt;exec Oasus/sch/g915/m3/default.txt;exec Oasus/sch/g13/m1/default.txt;exec Oasus/sch/g13/m2/default.txt;exec Oasus/sch/g13/m3/default.txt')
		-- DNC
		elseif player.main_job == "DNC" then
			windower.send_command('exec Oasus/dnc/g915/m1/default.txt;exec Oasus/dnc/g915/m2/default.txt;exec Oasus/dnc/g915/m3/default.txt;exec Oasus/dnc/g13/m1/default.txt;exec Oasus/dnc/g13/m2/default.txt;exec Oasus/dnc/g13/m3/default.txt')
		-- GEO
		elseif player.main_job == "GEO" then
			windower.send_command('exec Oasus/geo/g915/m1/default.txt;exec Oasus/geo/g915/m2/default.txt;exec Oasus/geo/g915/m3/default.txt;exec Oasus/geo/g13/m1/default.txt;exec Oasus/geo/g13/m2/default.txt;exec Oasus/geo/g13/m3/default.txt')
		-- RUN
		elseif player.main_job == "RUN" then
			windower.send_command('exec Oasus/run/g915/m1/default.txt;exec Oasus/run/g915/m2/default.txt;exec Oasus/run/g915/m3/default.txt;exec Oasus/run/g13/m1/default.txt;exec Oasus/run/g13/m2/default.txt;exec Oasus/run/g13/m3/default.txt')
		end
	end
	
	if player.name == "Yerp" then
		-- WAR
		if player.main_job == "WAR" then
			windower.send_command('exec Yerp/war/g915/m1/default.txt;exec Yerp/war/g915/m2/default.txt;exec Yerp/war/g915/m3/default.txt;exec Yerp/war/g13/m1/default.txt;exec Yerp/war/g13/m2/default.txt;exec Yerp/war/g13/m3/default.txt')
		-- MNK
		elseif player.main_job == "MNK" then
			windower.send_command('exec Yerp/mnk/g915/m1/default.txt;exec Yerp/mnk/g915/m2/default.txt;exec Yerp/mnk/g915/m3/default.txt;exec Yerp/mnk/g13/m1/default.txt;exec Yerp/mnk/g13/m2/default.txt;exec Yerp/mnk/g13/m3/default.txt')
		-- WHM
		elseif player.main_job == "WHM" then
			windower.send_command('exec Yerp/whm/g915/m1/default.txt;exec Yerp/whm/g915/m2/default.txt;exec Yerp/whm/g915/m3/default.txt;exec Yerp/whm/g13/m1/default.txt;exec Yerp/whm/g13/m2/default.txt;exec Yerp/whm/g13/m3/default.txt')
		-- BLM
		elseif player.main_job == "BLM" then
			windower.send_command('exec Yerp/blm/g915/m1/default.txt;exec Yerp/blm/g915/m2/default.txt;exec Yerp/blm/g915/m3/default.txt;exec Yerp/blm/g13/m1/default.txt;exec Yerp/blm/g13/m2/default.txt;exec Yerp/blm/g13/m3/default.txt')
		-- RDM
		elseif player.main_job == "RDM" then
			windower.send_command('exec Yerp/rdm/g915/m1/default.txt;exec Yerp/rdm/g915/m2/default.txt;exec Yerp/rdm/g915/m3/default.txt;exec Yerp/rdm/g13/m1/default.txt;exec Yerp/rdm/g13/m2/default.txt;exec Yerp/rdm/g13/m3/default.txt')
		-- THF
		elseif player.main_job == "THF" then
			windower.send_command('exec Yerp/thf/g915/m1/default.txt;exec Yerp/thf/g915/m2/default.txt;exec Yerp/thf/g915/m3/default.txt;exec Yerp/thf/g13/m1/default.txt;exec Yerp/thf/g13/m2/default.txt;exec Yerp/thf/g13/m3/default.txt')
		-- PLD
		elseif player.main_job == "PLD" then
			windower.send_command('exec Yerp/pld/g915/m1/default.txt;exec Yerp/pld/g915/m2/default.txt;exec Yerp/pld/g915/m3/default.txt;exec Yerp/pld/g13/m1/default.txt;exec Yerp/pld/g13/m2/default.txt;exec Yerp/pld/g13/m3/default.txt')
		-- DRK
		elseif player.main_job == "DRK" then
			windower.send_command('exec Yerp/drk/g915/m1/default.txt;exec Yerp/drk/g915/m2/default.txt;exec Yerp/drk/g915/m3/default.txt;exec Yerp/drk/g13/m1/default.txt;exec Yerp/drk/g13/m2/default.txt;exec Yerp/drk/g13/m3/default.txt')
		-- BST
		elseif player.main_job == "BST" then 
			windower.send_command('exec Yerp/bst/g915/m1/default.txt;exec Yerp/bst/g915/m2/default.txt;exec Yerp/bst/g915/m3/default.txt;exec Yerp/bst/g13/m1/default.txt;exec Yerp/bst/g13/m2/default.txt;exec Yerp/bst/g13/m3/default.txt')
		-- BRD 
		elseif player.main_job == "BRD" then
			windower.send_command('exec Yerp/brd/g915/m1/default.txt;exec Yerp/brd/g915/m2/default.txt;exec Yerp/brd/g915/m3/default.txt;exec Yerp/brd/g13/m1/default.txt;exec Yerp/brd/g13/m2/default.txt;exec Yerp/brd/g13/m3/default.txt')
		-- RNG
		elseif player.main_job == "RNG" then
			windower.send_command('exec Yerp/rng/g915/m1/default.txt;exec Yerp/rng/g915/m2/default.txt;exec Yerp/rng/g915/m3/default.txt;exec Yerp/rng/g13/m1/default.txt;exec Yerp/rng/g13/m2/default.txt;exec Yerp/rng/g13/m3/default.txt')
		-- SAM
		elseif player.main_job == "SAM" then
			windower.send_command('exec Yerp/sam/g915/m1/default.txt;exec Yerp/sam/g915/m2/default.txt;exec Yerp/sam/g915/m3/default.txt;exec Yerp/sam/g13/m1/default.txt;exec Yerp/sam/g13/m2/default.txt;exec Yerp/sam/g13/m3/default.txt')
		-- NIN
		elseif player.main_job == "NIN" then
			windower.send_command('exec Yerp/nin/g915/m1/default.txt;exec Yerp/nin/g915/m2/default.txt;exec Yerp/nin/g915/m3/default.txt;exec Yerp/nin/g13/m1/default.txt;exec Yerp/nin/g13/m2/default.txt;exec Yerp/nin/g13/m3/default.txt')
		-- DRG 
		elseif player.main_job == "DRG" then
			windower.send_command('exec Yerp/drg/g915/m1/default.txt;exec Yerp/drg/g915/m2/default.txt;exec Yerp/drg/g915/m3/default.txt;exec Yerp/drg/g13/m1/default.txt;exec Yerp/drg/g13/m2/default.txt;exec Yerp/drg/g13/m3/default.txt')
		-- SMN
		elseif player.main_job == "SMN" then
			windower.send_command('exec Yerp/smn/g915/m1/default.txt;exec Yerp/smn/g915/m2/default.txt;exec Yerp/smn/g915/m3/default.txt;exec Yerp/smn/g13/m1/default.txt;exec Yerp/smn/g13/m2/default.txt;exec Yerp/smn/g13/m3/default.txt')
		-- BLU
		elseif player.main_job == "BLU" then
			windower.send_command('exec Yerp/blu/g915/m1/default.txt;exec Yerp/blu/g915/m2/default.txt;exec Yerp/blu/g915/m3/default.txt;exec Yerp/blu/g13/m1/default.txt;exec Yerp/blu/g13/m2/default.txt;exec Yerp/blu/g13/m3/default.txt')
		-- COR
		elseif player.main_job == "COR" then
			windower.send_command('exec Yerp/cor/g915/m1/default.txt;exec Yerp/cor/g915/m2/default.txt;exec Yerp/cor/g915/m3/default.txt;exec Yerp/cor/g13/m1/default.txt;exec Yerp/cor/g13/m2/default.txt;exec Yerp/cor/g13/m3/default.txt')
		-- PUP
		elseif player.main_job == "PUP" then
			windower.send_command('exec Yerp/pup/g915/m1/default.txt;exec Yerp/pup/g915/m2/default.txt;exec Yerp/pup/g915/m3/default.txt;exec Yerp/pup/g13/m1/default.txt;exec Yerp/pup/g13/m2/default.txt;exec Yerp/pup/g13/m3/default.txt')
		-- SCH
		elseif player.main_job == "SCH" then
			windower.send_command('exec Yerp/sch/g915/m1/default.txt;exec Yerp/sch/g915/m2/default.txt;exec Yerp/sch/g915/m3/default.txt;exec Yerp/sch/g13/m1/default.txt;exec Yerp/sch/g13/m2/default.txt;exec Yerp/sch/g13/m3/default.txt')
		-- DNC
		elseif player.main_job == "DNC" then
			windower.send_command('exec Yerp/dnc/g915/m1/default.txt;exec Yerp/dnc/g915/m2/default.txt;exec Yerp/dnc/g915/m3/default.txt;exec Yerp/dnc/g13/m1/default.txt;exec Yerp/dnc/g13/m2/default.txt;exec Yerp/dnc/g13/m3/default.txt')
		-- GEO
		elseif player.main_job == "GEO" then
			windower.send_command('exec Yerp/geo/g915/m1/default.txt;exec Yerp/geo/g915/m2/default.txt;exec Yerp/geo/g915/m3/default.txt;exec Yerp/geo/g13/m1/default.txt;exec Yerp/geo/g13/m2/default.txt;exec Yerp/geo/g13/m3/default.txt')
		-- RUN
		elseif player.main_job == "RUN" then
			windower.send_command('exec Yerp/run/g915/m1/default.txt;exec Yerp/run/g915/m2/default.txt;exec Yerp/run/g915/m3/default.txt;exec Yerp/run/g13/m1/default.txt;exec Yerp/run/g13/m2/default.txt;exec Yerp/run/g13/m3/default.txt')
		end
	end
	
	if player.name == "Helyah" then
		-- WAR
		if player.main_job == "WAR" then
			windower.send_command('exec Helyah/war/g915/m1/default.txt;exec Helyah/war/g915/m2/default.txt;exec Helyah/war/g915/m3/default.txt;exec Helyah/war/g13/m1/default.txt;exec Helyah/war/g13/m2/default.txt;exec Helyah/war/g13/m3/default.txt')
		-- MNK
		elseif player.main_job == "MNK" then
			windower.send_command('exec Helyah/mnk/g915/m1/default.txt;exec Helyah/mnk/g915/m2/default.txt;exec Helyah/mnk/g915/m3/default.txt;exec Helyah/mnk/g13/m1/default.txt;exec Helyah/mnk/g13/m2/default.txt;exec Helyah/mnk/g13/m3/default.txt')
		-- WHM
		elseif player.main_job == "WHM" then
			windower.send_command('exec Helyah/whm/g915/m1/default.txt;exec Helyah/whm/g915/m2/default.txt;exec Helyah/whm/g915/m3/default.txt;exec Helyah/whm/g13/m1/default.txt;exec Helyah/whm/g13/m2/default.txt;exec Helyah/whm/g13/m3/default.txt')
		-- BLM
		elseif player.main_job == "BLM" then
			windower.send_command('exec Helyah/blm/g915/m1/default.txt;exec Helyah/blm/g915/m2/default.txt;exec Helyah/blm/g915/m3/default.txt;exec Helyah/blm/g13/m1/default.txt;exec Helyah/blm/g13/m2/default.txt;exec Helyah/blm/g13/m3/default.txt')
		-- RDM
		elseif player.main_job == "RDM" then
			windower.send_command('exec Helyah/rdm/g915/m1/default.txt;exec Helyah/rdm/g915/m2/default.txt;exec Helyah/rdm/g915/m3/default.txt;exec Helyah/rdm/g13/m1/default.txt;exec Helyah/rdm/g13/m2/default.txt;exec Helyah/rdm/g13/m3/default.txt')
		-- THF
		elseif player.main_job == "THF" then
			windower.send_command('exec Helyah/thf/g915/m1/default.txt;exec Helyah/thf/g915/m2/default.txt;exec Helyah/thf/g915/m3/default.txt;exec Helyah/thf/g13/m1/default.txt;exec Helyah/thf/g13/m2/default.txt;exec Helyah/thf/g13/m3/default.txt')
		-- PLD
		elseif player.main_job == "PLD" then
			windower.send_command('exec Helyah/pld/g915/m1/default.txt;exec Helyah/pld/g915/m2/default.txt;exec Helyah/pld/g915/m3/default.txt;exec Helyah/pld/g13/m1/default.txt;exec Helyah/pld/g13/m2/default.txt;exec Helyah/pld/g13/m3/default.txt')
		-- DRK
		elseif player.main_job == "DRK" then
			windower.send_command('exec Helyah/drk/g915/m1/default.txt;exec Helyah/drk/g915/m2/default.txt;exec Helyah/drk/g915/m3/default.txt;exec Helyah/drk/g13/m1/default.txt;exec Helyah/drk/g13/m2/default.txt;exec Helyah/drk/g13/m3/default.txt')
		-- BST
		elseif player.main_job == "BST" then 
			windower.send_command('exec Helyah/bst/g915/m1/default.txt;exec Helyah/bst/g915/m2/default.txt;exec Helyah/bst/g915/m3/default.txt;exec Helyah/bst/g13/m1/default.txt;exec Helyah/bst/g13/m2/default.txt;exec Helyah/bst/g13/m3/default.txt')
		-- BRD 
		elseif player.main_job == "BRD" then
			windower.send_command('exec Helyah/brd/g915/m1/default.txt;exec Helyah/brd/g915/m2/default.txt;exec Helyah/brd/g915/m3/default.txt;exec Helyah/brd/g13/m1/default.txt;exec Helyah/brd/g13/m2/default.txt;exec Helyah/brd/g13/m3/default.txt')
		-- RNG
		elseif player.main_job == "RNG" then
			windower.send_command('exec Helyah/rng/g915/m1/default.txt;exec Helyah/rng/g915/m2/default.txt;exec Helyah/rng/g915/m3/default.txt;exec Helyah/rng/g13/m1/default.txt;exec Helyah/rng/g13/m2/default.txt;exec Helyah/rng/g13/m3/default.txt')
		-- SAM
		elseif player.main_job == "SAM" then
			windower.send_command('exec Helyah/sam/g915/m1/default.txt;exec Helyah/sam/g915/m2/default.txt;exec Helyah/sam/g915/m3/default.txt;exec Helyah/sam/g13/m1/default.txt;exec Helyah/sam/g13/m2/default.txt;exec Helyah/sam/g13/m3/default.txt')
		-- NIN
		elseif player.main_job == "NIN" then
			windower.send_command('exec Helyah/nin/g915/m1/default.txt;exec Helyah/nin/g915/m2/default.txt;exec Helyah/nin/g915/m3/default.txt;exec Helyah/nin/g13/m1/default.txt;exec Helyah/nin/g13/m2/default.txt;exec Helyah/nin/g13/m3/default.txt')
		-- DRG 
		elseif player.main_job == "DRG" then
			windower.send_command('exec Helyah/drg/g915/m1/default.txt;exec Helyah/drg/g915/m2/default.txt;exec Helyah/drg/g915/m3/default.txt;exec Helyah/drg/g13/m1/default.txt;exec Helyah/drg/g13/m2/default.txt;exec Helyah/drg/g13/m3/default.txt')
		-- SMN
		elseif player.main_job == "SMN" then
			windower.send_command('exec Helyah/smn/g915/m1/default.txt;exec Helyah/smn/g915/m2/default.txt;exec Helyah/smn/g915/m3/default.txt;exec Helyah/smn/g13/m1/default.txt;exec Helyah/smn/g13/m2/default.txt;exec Helyah/smn/g13/m3/default.txt')
		-- BLU
		elseif player.main_job == "BLU" then
			windower.send_command('exec Helyah/blu/g915/m1/default.txt;exec Helyah/blu/g915/m2/default.txt;exec Helyah/blu/g915/m3/default.txt;exec Helyah/blu/g13/m1/default.txt;exec Helyah/blu/g13/m2/default.txt;exec Helyah/blu/g13/m3/default.txt')
		-- COR
		elseif player.main_job == "COR" then
			windower.send_command('exec Helyah/cor/g915/m1/default.txt;exec Helyah/cor/g915/m2/default.txt;exec Helyah/cor/g915/m3/default.txt;exec Helyah/cor/g13/m1/default.txt;exec Helyah/cor/g13/m2/default.txt;exec Helyah/cor/g13/m3/default.txt')
		-- PUP
		elseif player.main_job == "PUP" then
			windower.send_command('exec Helyah/pup/g915/m1/default.txt;exec Helyah/pup/g915/m2/default.txt;exec Helyah/pup/g915/m3/default.txt;exec Helyah/pup/g13/m1/default.txt;exec Helyah/pup/g13/m2/default.txt;exec Helyah/pup/g13/m3/default.txt')
		-- SCH
		elseif player.main_job == "SCH" then
			windower.send_command('exec Helyah/sch/g915/m1/default.txt;exec Helyah/sch/g915/m2/default.txt;exec Helyah/sch/g915/m3/default.txt;exec Helyah/sch/g13/m1/default.txt;exec Helyah/sch/g13/m2/default.txt;exec Helyah/sch/g13/m3/default.txt')
		-- DNC
		elseif player.main_job == "DNC" then
			windower.send_command('exec Helyah/dnc/g915/m1/default.txt;exec Helyah/dnc/g915/m2/default.txt;exec Helyah/dnc/g915/m3/default.txt;exec Helyah/dnc/g13/m1/default.txt;exec Helyah/dnc/g13/m2/default.txt;exec Helyah/dnc/g13/m3/default.txt')
		-- GEO
		elseif player.main_job == "GEO" then
			windower.send_command('exec Helyah/geo/g915/m1/default.txt;exec Helyah/geo/g915/m2/default.txt;exec Helyah/geo/g915/m3/default.txt;exec Helyah/geo/g13/m1/default.txt;exec Helyah/geo/g13/m2/default.txt;exec Helyah/geo/g13/m3/default.txt')
		-- RUN
		elseif player.main_job == "RUN" then
			windower.send_command('exec Helyah/run/g915/m1/default.txt;exec Helyah/run/g915/m2/default.txt;exec Helyah/run/g915/m3/default.txt;exec Helyah/run/g13/m1/default.txt;exec Helyah/run/g13/m2/default.txt;exec Helyah/run/g13/m3/default.txt')
		end
	end