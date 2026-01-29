function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','Refresh','Regen','DT')
	state.Weapons:options('None', 'Dagger', 'Sword','DualDaggers','DualSwords')--'Aeneas', Carn','Twashtar','Mandau',
	-- Whether to use Carn (or song daggers in general) under a certain threshhold even when weapons are locked.
	state.CarnMode = M{'Always','300','1000','Never'}
	
	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = "Daurdabla"
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
	-- Capes 
	gear.tp_jse_back = { 	name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.DW_jse_back = { 	name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.wsd_jse_back = { 	name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	gear.SB_jse_back = { 	name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	gear.AE_jse_back = {	name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	gear.FC_jse_back = {	name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}}
	
	--
	gear.Instrument_Idle = {name="Linos", augments={'Attack+20','"Store TP"+4','Quadruple Attack +3',}}
	-- Snowdim Acc leafslit double atk  dusktip quad attack
	gear.Instrument_TP = {name="Linos", augments={'Attack+20','"Store TP"+4','Quadruple Attack +3',}}
	-- Snowslit atk/acc leaftip wsd Dusksslit Save TP
	gear.Instrument_WSD = {name="Linos", augments={'Accuracy+14 Attack+14','Weapon skill damage +1%','Quadruple Attack +3',}}
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` gs c cycle ExtraSongsMode')
	send_command('bind @` gs c cycle ExtraSongsMode')
	send_command('bind @!^` input /pcmd leave')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoBuffMode')
		
	-- Songs Scrits 
	-- nt = Nitro
	-- H = March  
	-- A = Minuet
	-- B = Ballad
	-- M = Madrigal
	-- P = Prelude
	-- D = Minne
	
-- dummy songs
	send_command('alias dum exec songs/dummy.txt')
	-- Dummy 5 Songs
	send_command('alias dumm exec songs/dummy2.txt')
	send_command('alias dum5 exec songs/dummy2.txt')
	send_command('alias ccdum exec songs/dummy2.txt')
	
	-- NT 5 Songs
	
	-- NT 4 Songs
	send_command('alias ntHHMM exec songs/ntHHMM')
	send_command('alias ntHMMA exec songs/ntHMMA')
	send_command('alias ntHHAA exec songs/ntHHAA')
	-- Mad/Minuet
	send_command('alias ntHHMA exec songs/ntHHMA')
	-- Prelude
	send_command('alias ntPPAA exec songs/ntPPAA')
	-- Minne
	send_command('alias ntHHDD exec songs/ntHHDD')
	-- Mambo x2
	send_command('alias ntHHEE exec songs/ntHVEE')
	-- Minet x3
	send_command('alias ntHAAA exec songs/ntHAAA')
	
	-- 4 Songs
	send_command('alias HHMM exec songs/HHMM')
	send_command('alias HHBB exec songs/HHBB')
	send_command('alias HHMA exec songs/HHMA')
	send_command('alias HHAA exec songs/HHAA')
	send_command('alias HHDD exec songs/HHDD')
	send_command('alias PPAA exec songs/PPAA')	
	send_command('alias HHEE exec songs/HVEE')	
	
	send_command('alias p2 input /pcmd leave;wait 1;input /tell Bigtymer invite;')
		
	select_default_macro_book()
	user_job_lockstyle()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Single 
	-- Dagger
	sets.weapons.Dagger = {main="Tauret", sub="Genmei Shield"}
	--sets.weapons.Aeneas = {main="Aeneas", sub="Genmei Shield"}
	--sets.weapons.Carn = {main="Kali", sub="Genmei Shield"}
	--sets.weapons.Twashtar = {main="Twashtar", sub="Genmei Shield"}
	--sets.weapons.Mandau = {main="Mandau", sub="Genmei Shield"}
	-- Sword
	sets.weapons.Sword = {main="Naegling", sub="Genmei Shield"}
	
	-- Dual
	-- Daggers
	sets.weapons.DualDaggers = {main="Tauret", sub="Blurred Knife +1"}
	-- Malevolence Levente Dagger
	sets.weapons.DualNukeWeapons = {main="Tauret",sub="Kaja Knife"}
	-- Swords
	sets.weapons.DualSwords = {main="Naegling", sub="Blurred Knife +1"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {main="Kali",
		--main="Oranyan", sub="Clerisy Strap +1",
		-- neck="Voltsurge Torque", rear="Enchntr. Earring +1",
		head="Vanya Hood", lear="Loquac. Earring",
		-- lring="Prolix Ring", rring="Kishar Ring",
		body="Inyanga Jubbah +2",  hands="Leyline Gloves", lring="Gelatinous Ring +1", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Volte Gaiters"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		--rear="Mendi. Earring",
		back=gear.FC_jse_back, legs="Kaykaus Tights +1", feet="Kaykaus Boots +1" })

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

	sets.precast.FC.BardSong = {main="Kali", range="Gjallarhorn",
		-- main="Oranyan", sub="Clerisy Strap +1",
		-- neck="Voltsurge Torque",  rear="Enchntr. Earring +1",
		head="Fili Calot +1", lear="Loquac. Earring",
		--    rring="Kishar Ring",
		body="Inyanga Jubbah +2", hands="Leyline Gloves", lring="Gelatinous Ring +1", rring="Defending Ring",
        back=gear.FC_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Bihu Slippers +3"}
	
	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Magic Finale'] = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Horde Lullaby'] = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby'].AoE = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby II'] = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby II'].Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC['Horde Lullaby II'].AoE = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Miracle Cheer"})	
	--sets.precast.FC.Mambo = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})	
	sets.precast.FC.Finale = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})	
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	
	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
	
	-- Precast sets to enhance JAs	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps. +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ranged=gear.Instrument_WSD,
		-- Nyame
		head="Bihu Roundlet +3",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Bihu Jstcorps. +3",hands="Bihu Cuffs +3",ring1="Epaminondas's Ring",ring2="Ilabrat Ring",
		back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Bihu Cannions +3",feet="Bihu Slippers +3"}
		
	sets.precast.WS.Acc = {ranged=gear.Instrument_WSD,
		head="Bihu Roundlet +3", neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Bihu Jstcorps. +3", hands="Bihu Cuffs +3", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Bihu Cannions +3", feet="Bihu Slippers +3"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {ranged=gear.Instrument_WSD,
		-- Nyame Mail rear="Balder's Earring",
		head="Bihu Roundlet +3", neck="Fotia Gorget", lear="Brutal Earring", rear="Ishvara Earring",
		-- hands="Bunzi's Gloves", lring="Petrov Ring"
		body="Ayanmo Corazza +2", hands="Bihu Cuffs +3", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		--  waist="Fotia Belt",  Nyame Flanchard Nyame Sollerets
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Bihu Cannions +3", feet="Bihu Slippers +3"})
	
	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ranged=gear.Instrument_WSD,
		-- Blistering Sallet +1 lear="Balder Earring +1"
		head="Bihu Roundlet +3", neck="Fotia Gorget", lear="Moonshade Earring", rear="Brutal Earring",
		-- Bunzi Gloves Hetairoi Ring Begrudging Ring 
		body="Ayanmo Corazza +2", hands="Bihu Cuffs +3", lring="Epaminondas's Ring", 
		-- gear.crit_jse_back Kentarch Belt +1 waist="Fotia Belt", Nyame Flanchard Nyame Sollerets
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Bihu Cannions +3", feet="Bihu Slippers +3"})
	
	sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {ranged=gear.Instrument_WSD,
		-- Nyame Helm  lear="Ifrit's Pearl", rear="Ishvara Earring",
		head="Bihu Roundlet +3", lear="Brutal Earring",
		-- Nyame Mail Nyame Gauntlets
		body="Bihu Jstcorps. +3", hands="Bihu Cuffs +3", lring="Epaminondas's Ring", rring="Rajas Ring",
		-- Nyame Flanchard Nyame Sollerets
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Bihu Cannions +3", feet="Bihu Slippers +3"})
		
	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ranged=gear.Instrument_WSD,
		-- Nyame Helm Bard's Charm +2 A 
		head="Bihu Roundlet +3", lear="Moonshade Earring", rear="Mache Earring +1",
		-- Nyame Gauntlets rring="Ilabrat Ring",
		body="Bihu Jstcorps. +3", hands="Bihu Cuffs +3", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		-- Kentarch Belt +1 Nyame Flanchard  Nyame Sollerets 
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Bihu Cannions +3", feet="Bihu Slippers +3"})
		
	sets.precast.WS["Mordant Rime"] = set_combine(sets.precast.WS, {ranged=gear.Instrument_WSD,
		-- Nyame Helm Bard's Charm +3
		head="Bihu Roundlet +3", neck="Mnbw. Whistle +1", lear="Ishvara Earring", rear="Regal Earring",
		-- Nyame Mail Nyama Gauntlets rring="Metamor. Ring +1"
		body="Bihu Jstcorps. +3", hands="Bihu Cuffs +3", lring="Epaminondas's Ring", rring="Ilabrat Ring",
		-- Kentarch Belt +1
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Bihu Cannions +3", feet="Bihu Slippers +3"})
	
	sets.precast.WS["Aeolian Edge"] = set_combine(sets.precast.WS, {ranged=gear.Instrument_WSD,
		-- C. Palug Crown Baetyl Pendant
		head="Bihu Roundlet +3", lear="Moonshade Earring", rear="Friomisi Earring",
		-- Nyama Gauntlets rring="Shiva Ring +1"
		body="Bihu Jstcorps. +3", hands="Bihu Cuffs +3", lring="Epaminondas's Ring", 
		-- Nyame Flanchard Nyame Sollerets
		back=gear.AE_jse_back, waist="Orpheus's Sash", legs="Bihu Cannions +3", feet="Bihu Slippers +3"})
		
	-- Sword
	sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {ranged=gear.Instrument_WSD,
		-- Nyame Helm Bard's Charm +2 Vulcan's Pearl
		head="Bihu Roundlet +3", neck="Rep. Plat. Medal", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Nyame Gauntlets Sroda Ring 
		body="Bihu Jstcorps. +3", hands="Bihu Cuffs +3", lring="Epaminondas's Ring", rring="Rajas Ring",
		-- Nyame Flanchard  Nyame Sollerets 
		back=gear.SB_jse_back, waist="Sailfi Belt +1", legs="Bihu Cannions +3", feet="Bihu Slippers +3"})
	
	sets.precast.WS["Circle Blade"] = set_combine(sets.precast.WS, {ranged=gear.Instrument_WSD,
		-- Nyame Helm Vulcan's Pearl
		head="Bihu Roundlet +3", neck="Bard's Charm +1", lear="Moonshade Earring", rear="Ishvara Earring",
		-- Nyame Gauntlets
		body="Bihu Jstcorps. +3", hands="Bihu Cuffs +3", lring="Epaminondas's Ring", rring="Rajas Ring",
		-- Nyame Flanchard  Nyame Sollerets 
		back=gear.SB_jse_back, waist="Sailfi Belt +1", legs="Bihu Cannions +3", feet="Bihu Slippers +3"})
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {lear="Cessance Earring", rear="Brutal Earring"}
	sets.AccMaxTP = {lear="Cessance Earring", rear="Brutal Earring"}	
	
	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main="Kali", 
		--main="Oranyan", sub="Clerisy Strap +1",
		--neck="Voltsurge Torque", rear="Enchntr. Earring +1",
		head="Vanya Hood", lear="Loquac. Earring",
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Prolix Ring", rring="Kishar Ring",
		back=gear.FC_jse_back, waist="Sailfi Belt +1", legs="Aya. Cosciales +2", feet="Volte Gaiters"}

	sets.midcast.FastRecast.BardSong = {main="Kali", 
		--main="Oranyan", sub="Clerisy Strap +1",
		-- neck="Voltsurge Torque", rear="Enchntr. Earring +1",
		head="Vanya Hood", lear="Loquac. Earring",
		body="Inyanga Jubbah +2", hands="Gende. Gages +1", lring="Prolix Ring", rring="Kishar Ring",
		back=gear.FC_jse_back, waist="Tempus Fugit", legs="Aya. Cosciales +2", feet="Bihu Slippers +3"}
		
	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {} -- legs="Fili Rhingrave +1"
	sets.midcast['Foe Lullaby'] = {main="Kali", sub="Ammurapi Shield", range="Marsyas",
		-- Digni. Earring Regal Earring
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1", lear="Gwati Earring",
		body="Fili Hongreline +1", hands="Brioso Cuffs +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.FC_jse_back, waist="Acuity Belt +1", legs="Inyanga Shalwar +2", feet="Brioso Slippers +3"}
	sets.midcast['Foe Lullaby II'] = {main="Kali", sub="Ammurapi Shield", range="Marsyas", 
		-- Digni. Earring Regal Earring
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1", lear="Gwati Earring",
		body="Fili Hongreline +1", hands="Brioso Cuffs +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.FC_jse_back, waist="Acuity Belt +1", legs="Inyanga Shalwar +2", feet="Brioso Slippers +3"}
	-- Max Acc
	sets.midcast['Horde Lullaby'] = {main="Kali", sub="Ammurapi Shield", range="Marsyas", 
		-- Digni. Earring Regal Earring
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1", lear="Gwati Earring", 
		body="Fili Hongreline +1", hands="Brioso Cuffs +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.FC_jse_back, waist="Acuity Belt +1", legs="Inyanga Shalwar +2", feet="Brioso Slippers +3"} 
	-- 425 base - Goal 648 String Skill
	-- 7 Yalms 	
	sets.midcast['Horde Lullaby II'] = {main="Kali", sub="Ammurapi Shield", range="Daurdabla",
		-- neck="Incanter's Torque", rear="Darkside Earring",
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1", lear="Gersemi Earring", rear="Musical Earring",
		body="Brioso Justau. +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1", 
		--back="Erato's Cape", waist="Hafner's Sash", 
		back=gear.FC_jse_back, waist="Acuity Belt +1", legs="Inyanga Shalwar +2", feet="Bihu Slippers +3"}
	--[[
	-- Master Lvl20
	sets.midcast['Horde Lullaby II'] = {main="Kali", sub="Ammurapi Shield", range="Daurdabla",
		-- Carn
		-- rear="Darkside Earring",
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1", lear="Gersemi Earring", rear="Musical Earring",
		body="Brioso Justau. +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1", 
		--back="Erato's Cape", waist="Hafner's Sash", 
		back="", waist="", legs="Inyanga Shalwar +2", feet="Bihu Slippers +3"}
	-- Master Lvl 24
	sets.midcast['Horde Lullaby II'] = {main="Kali", sub="Ammurapi Shield", range="Daurdabla",
		-- rear="Darkside Earring",
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1", lear="Gersemi Earring", rear="Musical Earring",
		body="Brioso Justau. +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1", 
		--back="Erato's Cape", waist="Hafner's Sash", 
		back="", waist="", legs="Inyanga Shalwar +2", feet="Bihu Slippers +3"}
	-- Master lvl 29
	sets.midcast['Horde Lullaby II'] = {main="Kali", sub="Ammurapi Shield", range="Daurdabla",
		-- rear="Darkside Earring",
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1", lear="Gersemi Earring", rear="Musical Earring",
		body="Brioso Justau. +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1", 
		--back="Erato's Cape", waist="Hafner's Sash", 
		back="", waist="", legs="Inyanga Shalwar +2", feet="Bihu Slippers +3"}
	-- Master lvl 34
	sets.midcast['Horde Lullaby II'] = {main="Kali", sub="Ammurapi Shield", range="Daurdabla",
		-- Carn
		-- rear="Regal Earring",
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1", lear="Gersemi Earring", rear="Musical Earring",
		body="Brioso Justau. +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1", 
		--waist="Hafner's Sash", 
		back=gear.FC_jse_back, waist="Acuity Belt +1", legs="Inyanga Shalwar +2", feet="Bihu Slippers +3"}
	-- Master lvl 48
	sets.midcast['Horde Lullaby II'] = {main="Kali", sub="Ammurapi Shield", range="Daurdabla",
		-- Carn
		-- rear="Regal Earring",
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1", lear="Gersemi Earring", rear="Musical Earring",
		body="Brioso Justau. +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1", 
		back=gear.FC_jse_back, waist="Acuity Belt +1", legs="Inyanga Shalwar +2", feet="Bihu Slippers +3"}
	]]
	sets.midcast.Madrigal = {head="Fili Calot +1", feet="Fili Cothurnes +1"}
	sets.midcast.Paeon = {head="Brioso Roundlet +3"}
	sets.midcast.Etude = {} -- head="Mousai Turban"
	sets.midcast.Mambo = {} -- feet="Mousai Crackows"
	sets.midcast.Minne = {legs="Mousai Seraweels"} 
	sets.midcast.Threnody = {} -- body="Mousai Manteel"
	sets.midcast.Mazurka = {range="Miracle Cheer"} 
	sets.midcast.March = {hands="Fili Manchettes +1"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March, {range="Marsyas"})	
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Carol = {} -- hands="Mousai Gages"
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
	sets.midcast['Magic Finale'] = {}
	sets.midcast.Prelude = {feet="Fili Cothurnes +1"}
	
	-- Merited Songs
	sets.midcast.Dirge = {}
	sets.midcast.Sirvente = {}
	
	-- For song buffs (Full Duration, AF3 set bonus, DT)
	sets.midcast.SongEffect = {main="Kali", sub="Genmei Shield", range="Gjallarhorn",
		head="Fili Calot +1", neck="Mnbw. Whistle +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Fili Hongreline +1", hands="Fili Manchettes +1", lring="Gelatinous Ring +1", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Flume Belt", legs="Inyanga Shalwar +2", feet="Brioso Slippers +3"}

	sets.midcast.SongEffect.DW = {main="Kali", sub="Genmei Shield", range="Gjallarhorn",
		-- Carn/Kai
		-- lear="Genbu's Earring", 
		head="Fili Calot +1", neck="Mnbw. Whistle +1", lear="Odnowa Earring +1", ear="Etiolation Earring",
		body="Fili Hongreline +1", hands="Fili Manchettes +1", lring="Gelatinous Ring +1", rring="Defending Ring",
		back=gear.FC_jse_back, waist="Flume Belt", legs="Inyanga Shalwar +2", feet="Brioso Slippers +3"}

	-- For song debuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Kali", sub="Ammurapi Shield", 
		-- Carn
		-- lear="Digni. Earring", rear="Regal Earring", 
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1", lear="Gwati Earring",
		-- Fili Hongreline +3 Fili Manchettes +3 Metamor. Ring +1
		body="Brioso Justau. +3", hands="Brioso Cuffs +3", lring="Stikini ring +1", rring="Stikini ring +1",
		-- Fili Rhingrave +3
		back=gear.FC_jse_back, waist="Acuity Belt +1", legs="Brioso Cannions +3", feet="Brioso Slippers +3"}

	-- For song debuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = {main="Tauret", sub="Ammurapi Shield",
		-- Carn
		-- lear="Digni. Earring", rear="Regal Earring",
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1", lear="Gwati Earring",
		body="Brioso Justau. +3", hands="Brioso Cuffs +3", lring="Stikini ring +1", rring="Stikini ring +1",
		back=gear.FC_jse_back, waist="Acuity Belt +1", legs="Brioso Cannions +3", feet="Brioso Slippers +3"}

	sets.midcast.SongDebuff.DW = {main="Kali", sub="Ammurapi Shield",
		-- lear="Digni. Earring", rear="Regal Earring",
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1", lear="Gwati Earring",
		body="Brioso Justau. +3", hands="Brioso Cuffs +3", lring="Stikini ring +1", rring="Stikini ring +1",
		back=gear.FC_jse_back, waist="Acuity Belt +1", legs="Brioso Cannions +3", feet="Brioso Slippers +3"}
	
	-- Song-specific recast reduction
	sets.midcast.SongRecast = {
		--  neck="Voltsurge Torque", rear="Enchntr. Earring +1",
		head="Vanya Hood", lear="Loquac. Earring",
		-- Leyline Gloves rring="Kishar Ring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Prolix Ring", 
		back=gear.FC_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet=gear.telchine_feet_Song}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {main="Iridal Staff", --sub="Clerisy Strap +1", ammo="Pemphredo Tathlum",
		--neck="Reti Pendant", lear="Calamitous Earring", rear="Magnetic Earring", 
		head="Kaykaus Mitra +1", neck="Loricate Torque +1", lear="Gifted Earring", rear="Novia Earring",
		-- Metamor. Ring +1
		body="Kaykaus Bliaut +1", hands=gear.telchine_hands_Cure, lring="Stikini Ring +1", rring="Mephitas's Ring +1",
		-- back="Aurist's Cape +1",
		back=gear.FC_jse_back, waist="Shinjutsu-no-Obi +1", legs="Kaykaus Tights +1", feet="Kaykaus Boots +1"}
		
	-- Weather/Day
	sets.midcast.LightWeatherCure = {main="Iridal Staff", --sub="Clerisy Strap +1",
		--neck="Incanter's Torque",  rear="Mendi. Earring",
		head="Kaykaus Mitra +1", neck="Loricate Torque +1", lear="Gifted Earring", rear="Novia Earring",
		body="Kaykaus Bliaut +1", hands=gear.telchine_hands_Cure, lring="Stikini Ring +1", rring="Stikini ring +1",
		--back="Tempered Cape +1",
		back=gear.FC_jse_back, waist="Shinjutsu-no-Obi +1", legs="Kaykaus Tights +1", feet="Kaykaus Boots +1"}
	sets.midcast.LightDayCure = {main="Iridal Staff", --sub="Clerisy Strap +1",
		--neck="Incanter's Torque",  rear="Mendi. Earring",
		head="Kaykaus Mitra +1", neck="Loricate Torque +1", lear="Gifted Earring", rear="Novia Earring",
		body="Kaykaus Bliaut +1", hands=gear.telchine_hands_Cure, lring="Stikini Ring +1", rring="Stikini ring +1",
		--back="Tempered Cape +1",
		back=gear.FC_jse_back, waist="Shinjutsu-no-Obi +1", legs="Kaykaus Tights +1", feet="Kaykaus Boots +1"}
	sets.midcast.Curaga = {main="Iridal Staff", --sub="Clerisy Strap +1",
		--neck="Incanter's Torque",  rear="Mendi. Earring",
		head="Kaykaus Mitra +1", neck="Loricate Torque +1", lear="Gifted Earring", rear="Novia Earring",
		body="Kaykaus Bliaut +1", hands=gear.telchine_hands_Cure, lring="Stikini Ring +1", rring="Stikini ring +1",
		--back="Tempered Cape +1",
		back=gear.FC_jse_back, waist="Shinjutsu-no-Obi +1", legs="Kaykaus Tights +1", feet="Kaykaus Boots +1"}

	sets.midcast.LightWeatherCuraga = {main="Iridal Staff", --sub="Clerisy Strap +1",
		--neck="Incanter's Torque",  rear="Mendi. Earring",
		head="Kaykaus Mitra +1", neck="Loricate Torque +1", lear="Gifted Earring", rear="Novia Earring",
		body="Kaykaus Bliaut +1", hands=gear.telchine_hands_Cure, lring="Stikini Ring +1", rring="Stikini ring +1",
		--back="Tempered Cape +1",
		back=gear.FC_jse_back, waist="Shinjutsu-no-Obi +1", legs="Kaykaus Tights +1", feet="Kaykaus Boots +1"}

	sets.midcast.LightDayCuraga = {main="Iridal Staff", --sub="Clerisy Strap +1",
		--neck="Incanter's Torque",  rear="Mendi. Earring",
		head="Kaykaus Mitra +1", neck="Loricate Torque +1", lear="Gifted Earring", rear="Novia Earring",
		body="Kaykaus Bliaut +1", hands=gear.telchine_hands_Cure, lring="Stikini Ring +1", rring="Stikini ring +1",
		--back="Tempered Cape +1",
		back=gear.FC_jse_back, waist="Shinjutsu-no-Obi +1", legs="Kaykaus Tights +1", feet="Kaykaus Boots +1"}
	
	sets.midcast.Cure.DT = {main="Iridal Staff", --sub="Clerisy Strap +1",
		--neck="Incanter's Torque",  rear="Mendi. Earring",
		head="Kaykaus Mitra +1", neck="Loricate Torque +1", lear="Gifted Earring", rear="Novia Earring",
		body="Kaykaus Bliaut +1", hands=gear.telchine_hands_Cure, lring="Stikini Ring +1", rring="Stikini ring +1",
		--back="Tempered Cape +1",
		back=gear.FC_jse_back, waist="Shinjutsu-no-Obi +1", legs="Kaykaus Tights +1", feet="Kaykaus Boots +1"}
		
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = { waist="Gishdubar Sash"}-- ack="Grapevine Cape",
	
	sets.midcast.Cursna = {
		head="Kaykaus Mitra +1", neck="Debilis Medallion", lear="Meili Earring", rear="Beatific Earring",
		hands="Inyanga Dastanas +2", ring1="Haoma's Ring",ring2="Haoma's Ring",
		--back="Oretan. Cape +1", waist="Bishop's Sash", 
		feet="Gende. Galosh. +1"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})--main="Marin Staff +1",sub="Clemency Grip"
	
	sets.midcast['Enfeebling Magic'] = {main="Tauret", sub="Ammurapi Shield",
		-- lear="Digni. Earring", rear="Regal Earring",
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1", lear="Gwati Earring", 
		body="Brioso Justau. +3", hands="Brioso Cuffs +3", lring="Stikini ring +1", rring="Stikini ring +1",
		back=gear.FC_jse_back, waist="Acuity Belt +1", legs="Brioso Cannions +3", feet="Brioso Slippers +3"} 
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Tauret", sub="Ammurapi Shield",
		-- lear="Digni. Earring", rear="Regal Earring",
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1", lear="Gwati Earring", 
		body="Brioso Justau. +3", hands="Brioso Cuffs +3", lring="Stikini ring +1", rring="Stikini ring +1",
		back=gear.FC_jse_back, waist="Acuity Belt +1", legs="Brioso Cannions +3", feet="Brioso Slippers +3"} 
		
	sets.midcast['Enhancing Magic'] = {main="Sangoma", sub="Ammurapi Shield",
		-- ear2="Enchntr. Earring +1",
		head=gear.telchine_head_Duration, neck="Melic Torque", ear1="Andoaa Earring", ear2="Mimir Earring",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini ring +1", rring="Stikini ring +1",
		back=gear.FC_jse_back, waist="Embla Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}
	
	sets.midcast.BarElement = {-- main="Exemplar", sub="Fulcio Grip", ammo="Pemphredo Tathlum",
		-- neck="Incanter's Torque",
		head="Umuthi Hat", neck="Melic Torque", lear="Andoaa Earring",  rear="Mimir Earring",
		body=gear.telchine_body_Duration, hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		--  Fi Follet Cape +1 Olympus Sash Shedir Seraweels
		back=gear.fastcast_jse_back, waist="Embla Sash", legs=gear.telchine_legs_Duration, feet="Kaykaus Boots +1"}
	sets.midcast.BarStatus = {-- main="Exemplar", sub="Fulcio Grip", ammo="Pemphredo Tathlum",
		-- neck="Incanter's Torque",
		head="Umuthi Hat", neck="Melic Torque", lear="Andoaa Earring",  rear="Mimir Earring",
		body=gear.telchine_body_Duration, hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		--  Fi Follet Cape +1 Olympus Sash Shedir Seraweels
		back=gear.fastcast_jse_back, waist="Embla Sash", legs=gear.telchine_legs_Duration, feet="Kaykaus Boots +1"}

	sets.midcast.Phalanx = {
		head=gear.chirionic_phalanx_head, neck="Melic Torque", ear1="Andoaa Earring", ear2="Mimir Earring",
		body=gear.chirionic_phalanx_body, hands=gear.chirionic_phalanx_hands,lring="Stikini ring +1", rring="Stikini ring +1",
		-- Fi Follet Cape +1 gear.chirionic_phalanx_legs gear.chirionic_phalanx_feet
		back=gear.FC_jse_back, waist="Embla Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		sub="Ammurapi Shield",		
		-- ear2="Earthcry Earring",
		head="Chironic Hat", neck="Nodens Gorget",
		-- legs="Shedir Seraweels"
		waist="Siegel Sash"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast.Stonekskin,{waist="Emphatikos Rope"})
		
	sets.midcast['Elemental Magic'] = {main="Tauret", sub="Ammurapi Shield",
		-- lear="Digni. Earring", rear="Regal Earring",
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1",
		body="Brioso Justau. +3", hands="Brioso Cuffs +3", lring="Stikini ring +1", rring="Stikini ring +1",
		back=gear.FC_jse_back, waist="Acuity Belt +1", legs="Brioso Cannions +3", feet="Brioso Slippers +3"} 
	sets.midcast['Elemental Magic'].Resistant = {main="Tauret", sub="Ammurapi Shield",
		-- lear="Digni. Earring", rear="Regal Earring",
		head="Brioso Roundlet +3", neck="Mnbw. Whistle +1",
		body="Brioso Justau. +3", hands="Brioso Cuffs +3",  lring="Stikini ring +1", rring="Stikini ring +1",
		back=gear.FC_jse_back, waist="Acuity Belt +1", legs="Brioso Cannions +3", feet="Brioso Slippers +3"} 
		
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder
		
	-- Sets to return to when not performing an action.
	sets.Sheltered = {ring2="Sheltered Ring"}
	sets.RREar = {ear2="Reraise Earring"}
	
	-- Resting sets
	sets.resting = {main="Sangoma", sub="Genmei Shield", range=gear.Instrument_Idle,
		head="Inyanga Tiara +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back=gear.FC_jse_back, waist="Flume Belt", legs="Assid. Pants +1", feet="Bihu Slippers +3"}
	
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Sangoma", sub="Genmei Shield", range=gear.Instrument_Idle,
		-- rear="Etiolation Earring",
		head="Volte Tiara", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Odnowa Earring +1",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back=gear.FC_jse_back, waist="Flume Belt", legs="Brioso Cannions +3", feet="Volte Gaiters"}

	sets.idle.Weak = {main="Mafic Cudgel", sub="Genmei Shield", range=gear.Instrument_Idle,
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Odnowa Earring +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back=gear.FC_jse_back, waist="Flume Belt", legs="Aya. Cosciales +2", feet="Volte Gaiters"}
	
	sets.idle.Refresh = {main="Sangoma", sub="Genmei Shield", range=gear.Instrument_Idle,
		head="Volte Tiara", neck="Loricate Torque +1",  lear="Ethereal Earring", rear="Odnowa Earring +1",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		--back="Shadow Mantle", 
		back=gear.FC_jse_back, waist="Flume Belt", legs="Assid. Pants +1", feet="Volte Gaiters"}
	
	sets.idle.Regen = {main="Mafic Cudgel", sub="Genmei Shield", range=gear.Instrument_Idle,
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Odnowa Earring +1",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", ring1="Chirich Ring +1", ring2="Chirich Ring +1",
		--back="Shadow Mantle", 
		back=gear.FC_jse_back,  waist="Flume Belt", legs="Aya. Cosciales +2", feet="Bihu Slippers +3"}
	
	sets.idle.DT = {main="Mafic Cudgel", sub="Genmei Shield", range=gear.Instrument_Idle,
		head="Inyanga Tiara +2",neck="Loricate Torque +1", lear="Ethereal Earring", rear="Odnowa Earring +1",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Gelatinous Ring +1", ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Flume Belt",legs="Inyanga Shalwar +2", feet="Volte Gaiters"}
	
	-- Defense sets
	sets.defense.PDT = {main="Mafic Cudgel", sub="Genmei Shield", range=gear.Instrument_Idle,
		head="Volte Tiara", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Odnowa Earring +1",
		body="Bihu Jstcorps. +3", hands="Bihu Cuffs +3", ring1="Gelatinous Ring +1", ring2="Defending Ring",
		--back="Shadow Mantle", 
		back=gear.FC_jse_back,  waist="Flume Belt", legs="Brioso Cannions +3", feet="Bihu Slippers +3"}
	
	sets.defense.MDT = {main="Mafic Cudgel", sub="Genmei Shield", range=gear.Instrument_Idle,
		head="Volte Tiara", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Odnowa Earring +1",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		-- Carrier's Sash
		back=gear.FC_jse_back,waist="Flume Belt",legs="Brioso Cannions +3", feet="Volte Gaiters"}

	sets.Kiting = {lring="Shneddick Ring"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {main="Naegling", sub="Genmei Shield", ranged=gear.Instrument_TP,
		-- head="Bunzi's Hat", neck="Bard's Charm +2", lear="Telos Earring", rear="Cessance Earring",
		head="Volte Tiara", neck="Sanctity Necklace", lear="Mache Earring +1", rear="Mache Earring +1",
		-- Ashera Harness hands="Bunzi's Gloves",
		body="Ayanmo Corazza +2", hands="Bihu Cuffs +3", lring="Moonlight Ring", rring="Moonlight Ring",
		-- Volte Tights
		back=gear.tp_jse_back, waist="Sailfi Belt +1", legs="Aya. Cosciales +2", feet="Bihu Slippers +3"}
	
	sets.engaged.Acc = {main="Naegling",sub="Genmei Shield", ranged=gear.Instrument_TP,
		-- head="Bunzi's Hat", neck="Bard's Charm +2", lear="Telos Earring", rear="Cessance Earring",
		head="Volte Tiara", neck="Sanctity Necklace", lear="Mache Earring +1", rear="Mache Earring +1",
		-- Ashera Harness hands="Bunzi's Gloves",
		body="Ayanmo Corazza +2", hands="Bihu Cuffs +3", lring="Moonlight Ring", rring="Moonlight Ring",
		-- Volte Tights Volte Spats
		back=gear.tp_jse_back, waist="Sailfi Belt +1", legs="Aya. Cosciales +2", feet="Bihu Slippers +3"}
	
	sets.engaged.DW = {main="Naegling", sub="Ternion Dagger", ranged=gear.Instrument_TP,
		-- head="Bunzi's Hat", neck="Bard's Charm +2", lear="Telos Earring", rear="Ebani Earring",
		head="Volte Tiara", neck="Sanctity Necklace", lear="Mache Earring +1", rear="Mache Earring +1",
		-- Ashera Harness hands="Bunzi's Gloves",
		body="Ayanmo Corazza +2", hands="Bihu Cuffs +3", lring="Moonlight Ring", rring="Moonlight Ring",
		-- Reiki Belt Volte Tights Volte Spats
		back=gear.tp_jse_back, waist="Sailfi Belt +1", legs="Aya. Cosciales +2", feet="Bihu Slippers +3"}
	
	sets.engaged.DW.Acc = {main="Naegling",sub="Ternion Dagger",ranged=gear.Instrument_TP,
		-- head="Bunzi's Hat", neck="Bard's Charm +2", lear="Telos Earring", rear="Ebani Earring",
		head="Volte Tiara", neck="Sanctity Necklace", lear="Mache Earring +1", rear="Mache Earring +1",
		-- Ashera Harness hands="Bunzi's Gloves",
		body="Ayanmo Corazza +2", hands="Bihu Cuffs +3", lring="Moonlight Ring", rring="Moonlight Ring",
		-- Reiki Belt Volte Tights Volte Spats
		back=gear.tp_jse_back, waist="Sailfi Belt +1", legs="Aya. Cosciales +2", feet="Bihu Slippers +3"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	if world.area:contains("Dynamis") then
		set_macro_page(8, 4)
	else
		set_macro_page(1, 4)
	end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 004')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

	state.ExtraSongsMode = M{['description']='Extra Songs','None','Dummy','DummyLock','FullLength','FullLengthLock','Cheer','CheerLock'}
	-- Whether to use Carn (or song daggers in general) under a certain tp threshhold even when weapons are locked.
	state.AutoDummyMode = M(false, 'Auto Dummy Mode')
	state.CarnMode = M{'Default','Always','300','1000','Never'}
	state.Pianissimode = M(false, 'Use Miracle Cheer when Pianissimo is active.')

	state.Buff['Pianissimo'] = buffactive['Pianissimo'] or false
	state.Buff['Nightingale'] = buffactive['Nightingale'] or false
	state.Buff['Soul Voice'] =  buffactive['Soul Voice'] or false
	state.Buff['Clarion Call'] = buffactive['Clarion Call'] or false

	autows = "Savage Blade"
	autofood = 'Pear Crepe'
	
	state.AutoSongMode = M(false, 'Auto Song Mode')
	
	brd_buff_ids = S{
	195,196,197,198,199,200,201,202,203,204,205,206,
	207,208,209,210,211,212,213,214,215,216,218,219,
	220,221,222,223
	}
	
	function set_current_brd_buffs()
		current_brd_buffs = 0
		for _,buff in ipairs(player.buff_details) do
			if brd_buff_ids:contains(buff.id) then
				current_brd_buffs = current_brd_buffs + 1
			end
		end
	end

	current_brd_buffs = 0
	set_current_brd_buffs()

	init_job_states({"Capacity","AutoFoodMode","AutoTrustMode","AutoSongMode","AutoDummyMode","AutoWSMode","AutoNukeMode","AutoShadowMode","AutoStunMode","AutoDefenseMode"},{"AutoBuffMode","AutoSambaMode","AutoRuneMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","ExtraSongsMode","CastingMode","CarnMode","TreasureMode",})
end


autows_list = {
		['None']='Shark Bite',
		['Sword']='Savage Blade',		
		['Dagger']='Evisceration',
		['Staff']='Rock Crusher'}

