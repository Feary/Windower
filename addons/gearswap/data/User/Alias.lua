--[[-- Alias-- 

Loads From User/Alias.lua

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

-- Global Alias
send_command('alias geodes exec geodes.txt')
send_command('alias key input /item "Forbidden Key" <stnpc>')

-- Casting Lots
send_command('alias la send @all tr lotall')
send_command('alias pall send @all tr passall')
send_command('alias l1 send @all lua load lottery')
send_command('alias l2 send @all lua unload lottery')
send_command('alias pool lua load treasurepool')
send_command('alias unpool lua load treasurepool')

send_command('alias ld send @all /pcmd leader Olymoly')
send_command('alias ld0 send @all /pcmd leader Olymoly')
send_command('alias ld1 send @all /pcmd leader Dasmir')
send_command('alias ld3 send @all /pcmd leader Helyah')
send_command('alias ld2 send @all /pcmd leader Oasus')
send_command('alias ld4 send @all /pcmd leader Yerp')
send_command('alias ld5 send @all /pcmd leader Ayooo')

-- Typos
send_command('alias logout input /logout')
send_command('alias sendpost input /sendpost')
send_command('alias deliverybox input /deliverybox')
send_command('alias dbox input /deliverybox')
send_command('alias hpa hp a')
send_command('alias hpp hp')
send_command('alias hppa hp a')

-- Gearing from Slips
send_command('alias getslip exec '..player.name..'/get_slips.txt')
send_command('alias putslip exec '..player.name..'/put_slips.txt') 
send_command('alias getslips exec '..player.name..'/get_slips.txt')
send_command('alias putslips exec '..player.name..'/put_slips.txt') 

-- Get and Pull Gear Per Job
send_command('alias gear exec '..player.name..'/gear'..player.main_job..'.txt')
send_command('alias ungear gs equip naked;exec '..player.name..'/ungear'..player.main_job..'.txt')
-- Get and Pull Gear Per Job
send_command('alias gearup exec '..player.name..'/gear'..player.main_job..'.txt')
send_command('alias geardown gs equip naked;exec '..player.name..'/ungear'..player.main_job..'.txt')

-- PortPacker
send_command('alias store lua load enternity;wait 1;ungear;wait 1;naked;wait 1;po store '..player.main_job..';wait 20;lua unload enternity')
send_command('alias unstore lua load enternity;wait 1;po unpack '..player.main_job..';wait 1;gear;wait 20;lua unload enternity')

--Sparks Aliases
send_command('alias loadsparks lua load sparks;wait 1;lua load sellnpc;wait 1;sellnpc Acheron Shield;wait 1;sparks buyall Acheron Shield')

-- Naked
send_command('alias naked gs equip naked')

-- Jobs
send_command('alias si send @all sneak;wait .5;send @all invisible')
-- rnghelper
send_command('alias rh1 send @cor gs rh enable; wait .5; ra <t>')
send_command('alias rh2 send @cor gs rh disable')
-- Embrava
send_command('alias emb input /ja "Light Arts" <me>;wait 1.5;input /ja "Tabula Rasa" <me>;wait 2;input /ja "Perpetuance" <me>;wait 2;input /ja "Accession" <me>;wait 3;input /ma "Embrava" <stpc>;wait 4;input /ja "Accession" <me>;wait 3;input /ma "Regen V" <stpc>')
-- Kaustra
send_command('alias kau gs c set elementalmode earth;wait 1;input /ja "Tabula Rasa" <me>;wait 1;input /ja "Dark Arts" <me>;wait 1;input /ja "Addendum: Black" <me>;wait 2.5;gs c elemental skillchain2;wait 15;input /ja "Focalization" <me>;wait 1;input /ja "Ebullience" <me>;wait 2.5;input /ma "Kaustra" <t>')
-- Pro/shell
send_command('alias pro input /ma "Accession" <me>;wait 1;input /ma "Shell V" <me>;wait 5;input /ma "Accession" <me>;wait 1;input /ma "Protect V" <me>;')

-- Crafting Related
send_command('alias crafting exec '..player.name..'/gear_craft.txt')
send_command('alias ucrafting exec '..player.name..'/ungear_craft.txt')
send_command('alias icraft exec '..player.name..'/gear_craft.txt')
send_command('alias ucraft exec '..player.name..'/ungear_craft.txt')
send_command('alias crest exec craft/reset.txt')
send_command('alias creset exec craft/reset.txt')

-- Fast Follow 
send_command('alias fol send @others follow '..player.name..'')
send_command('alias ufol send @others exec unfollow.txt')


send_command('alias idleregen gs c set IdleMode Regen')
send_command('alias idlerefresh gs c set IdleMode Refresh')
send_command('alias kite gs c toggle Kiting')
send_command('alias bolt send @cor boltersroll;wait 1;send @dnc chocobo jig ii;wait 1;send @brd Chocobo Mazurka')

-- invite
send_command('alias invall input /pcmd add Olymoly;wait 1;input /pcmd add oasus;wait 2;input /pcmd add Dasmir;wait 3;input /pcmd add Helyah;wait 4;input /pcmd add Yerp')
send_command('alias inviteall input /pcmd add Olymoly;wait 1;input /pcmd add oasus;wait 2;input /pcmd add Dasmir;wait 3;input /pcmd add Helyah;wait 4;input /pcmd add Yerp')

-- Send all Target
-- everyone do action
send_command('alias sa send @all')
send_command('alias sac send @all gs c')
send_command('alias sae send @all exec')

-- everyone target
send_command('alias tar sat alltarget;wait 1;input /echo All Target')
-- everyone 
send_command('alias as sat allcommand')
send_command('alias ac sat allcommand')
send_command('alias allatt sat allattack')
send_command('alias ass sat alltarget;wait 1;sat allcommand assault')

send_command('alias off send @all /attackoff')

send_command('alias ta input /targetnpc')
send_command('alias at input /targetnpc; wait 1; input /attack <t>')

-- Pulling 
send_command('alias puller gs c toggle Kiting;wait 1;gs c ')
--send_command('alias ageo exec aniyah/geo.txt')
--send_command('alias tank input /ja "Pianissimo" <me>;wait 2;input /ma "Foe Sirvante" <p1>')

-- Corsair
send_command('alias coron send @cor roller on')
send_command('alias coroff send @cor roller off')

-- Embrava
send_command('alias emb input /ja "Light Arts" <me>;wait 1.5;input /ja "Tabula Rasa" <me>;wait 2;input /ja "Perpetuance" <me>;wait 2;input /ja "Accession" <me>;wait 3;input /ma "Embrava" <stpc>;wait 4;input /ja "Accession" <me>;wait 3;input /ma "Regen V" <stpc>')
-- Kaustra
send_command('alias kau gs c set elementalmode earth;wait 1;input /ja "Tabula Rasa" <me>;wait 1;input /ja "Dark Arts" <me>;wait 1;input /ja "Addendum: Black" <me>;wait 2.5;gs c elemental skillchain2;wait 15;input /ja "Focalization" <me>;wait 1;input /ja "Ebullience" <me>;wait 2.5;input /ma "Kaustra" <t>')
-- Pro/shell
send_command('alias pro input /ma "Accession" <me>;wait 1;input /ma "Shell V" <me>;wait 5;input /ma "Accession" <me>;wait 1;input /ma "Protect V" <me>;')

-- Base Buffs
send_command('alias allbuffs send @cor exec buffs/cor_basebuffs.txt;wait 1;send @brd exec buffs/brd_basebuffs;wait 1;send @whm exec buffs/whm_basebuffs;wait 1;send @sch exec buffs/sch/_basebuffs')
send_command('alias idlebuffs send @all exec buffs/'..player.main_job..'_idlebuffs.txt')

send_command('alias aoecorbuffs send @cor roller roll1 exp;wait 1;send @cor roller roll2 blm;wait 1;send @cor roller on')


















