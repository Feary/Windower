function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','Crepuscular'}
	state.Weapons:options('None','Sword','Axe','Farsha', 'Club', 'Polearm','Chango','Bravura','DualWeapons','DualAxe','Ragnarok','Greatsword','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana','ProcClub','ProcStaff','ProcAxe')

	gear.da_jse_back 	= 	{name="Cichol's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10'}}
	gear.strws_jse_back = 	{name="Cichol's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.vitws_jse_back = 	{name="Cichol's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	-- HP Macc Fc
	gear.fc_jse_back 	= 	{name="Cichol's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	--send_command('bind !r gs c weapons Greatsword;gs c update')
	
	select_default_macro_book()
	user_job_lockstyle()
	
	-- Zerg Rotations
	-- hasso, retailiation berserk aggressor retraints, pop, MS, ws ws warcry
	-- great axe hasso retailion berserk aggreesor restrain, pop, MS full break, ws ws warcry
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	
    sets.Enmity = {ammo="Sapience Orb",
		-- Sakpata's Helm ear2="Trux Earring",
		head="Pummeler's Mask +3", neck="Moonlight Necklace", ear1="Cryptic Earring",
		-- ring1="Apeile Ring",
		body="Souv. Cuirass +1", hands="Pumm. Mufflers +3", ring1="Petrov Ring", ring2="Apeile Ring +1",
		back="Reiki Cloak",waist="Goading Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}
	sets.Knockback = {}
	sets.passive.Crepuscular = {head="Crepuscular Helm",body="Crepuscular Mail"}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = {body="Pumm. Lorica +3", back="Cichol's Mantle", feet="Agoge Calligae +3"}
	sets.precast.JA['Warcry'] = {head="Agoge Mask +1"}
	sets.precast.JA['Defender'] = {hands="Agoge Mufflers +1"}
	sets.precast.JA['Aggressor'] = {head="Pummeler's Mask +3", gbody="Agoge Lorica +1"}
	sets.precast.JA['Mighty Strikes'] = {hands="Agoge Mufflers +1"}
	sets.precast.JA["Warrior's Charge"] = {legs="Agoge Cuisses +1"}
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk"}
	sets.precast.JA['Retaliation'] = {hands="Pumm. Mufflers +3", feet="Boii Calligae +1"}
	sets.precast.JA['Restraint'] = {hands="Boii Mufflers +1"}
	sets.precast.JA['Blood Rage'] = {body="Boii Lorica +1"}
	sets.precast.JA['Brazen Rush'] = {}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Sapience Orb",
		-- Sakpata's Helm
		neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		-- ring1="Rahab Ring",
		body="Sacro Breastplate",hands="Leyline Gloves",ring2="Prolix Ring",
		back="Moonbeam Cape",waist="Goading Belt",legs=gear.odyssean_fc_legs,feet=gear.odyssean_fc_feet}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Sapience Orb",
		-- Sakpata's Helm
		neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		-- ring1="Rahab Ring",
		body="Sacro Breastplate", hands="Leyline Gloves", ring2="Prolix Ring",
		back="Moonbeam Cape",waist="Goading Belt",legs=gear.odyssean_fc_legs,feet=gear.odyssean_fc_feet}
	
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
                   
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
		head="Agoge Mask +3",neck="Fotia Gorget",ear1="Lugra Earring +1",ear2="Moonshade Earring",
		-- Nyame Mail Nyame Gauntlets 
		body=gear.valorous_wsd_body,hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Niqmaddu Ring",
		-- Nyame Flanchard Nyame Sollerets 
		back=gear.strws_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	-- Club
	sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- War. Beads +2 Thrud Earring
		head="Agoge Mask +3",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		-- Sakpata's Plate Sakpata's Gauntlets 
		body=gear.valorous_wsd_body,hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Epaminondas's Ring",
		-- Sakpata's Cuisses Path A
		back=gear.strws_jse_back,waist="Sailfi Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"})
	sets.precast.WS['Black Halo'].SomeAcc = set_combine(sets.precast.WS['Black Halo'],{})
    sets.precast.WS['Black Halo'].Acc = set_combine(sets.precast.WS['Black Halo'], {})
    sets.precast.WS['Black Halo'].FullAcc = set_combine(sets.precast.WS['Black Halo'], {})
    sets.precast.WS['Black Halo'].Fodder = set_combine(sets.precast.WS['Black Halo'], {})
	
	sets.precast.WS['Judgement'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- War. Beads +2 Thrud Earring
		head="Agoge Mask +3",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		-- Sakpata's Plate Sakpata's Gauntlets 
		body=gear.valorous_wsd_body,hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Epaminondas's Ring",
		-- Sakpata's Cuisses Path A
		back=gear.strws_jse_back,waist="Sailfi Belt +1",legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"})
	sets.precast.WS['Judgement'].SomeAcc = set_combine(sets.precast.WS['Judgement'], {})
    sets.precast.WS['Judgement'].Acc = set_combine(sets.precast.WS['Judgement'], {})
    sets.precast.WS['Judgement'].FullAcc = set_combine(sets.precast.WS['Judgement'], {})
    sets.precast.WS['Judgement'].Fodder = set_combine(sets.precast.WS['Judgement'], {})
	
	-- Sword
    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- War. Beads +2 ear1="Trud Earring"
		head="Agoge Mask +3",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		--  Nyame Mail Nyame Gauntlets 
		body="Pumm. Lorica +2",hands="Sulev. Gauntlets +2",ring1="Epaminondas's Ring",ring2="Niqmaddu Ring",
		-- Nyame Flanchard Nyame Sollerets 
		back=gear.strws_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Sulev. Leggings +2"})
    sets.precast.WS['Savage Blade'].SomeAcc = set_combine( sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Savage Blade'].Acc = set_combine( sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Savage Blade'].FullAcc = set_combine( sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Savage Blade'].Fodder = set_combine( sets.precast.WS['Savage Blade'], {})
	
	-- Polearm
    sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- War. Beads +2 ear1="Trud Earring"
		head="Agoge Mask +3",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		-- Nyame Mail Nyame Gauntlets 
		body="Pumm. Lorica +2",hands="Sulev. Gauntlets +2",ring1="Epaminondas's Ring",ring2="Niqmaddu Ring",
		-- Nyame Flanchard Nyame Sollerets 
		back=gear.strws_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Sulev. Leggings +2"})
    sets.precast.WS['Impulse Drive'].SomeAcc = set_combine( sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Impulse Drive'].Acc = set_combine( sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Impulse Drive'].FullAcc = set_combine( sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Impulse Drive'].Fodder = set_combine( sets.precast.WS['Savage Blade'], {})
	
	-- Greatsword
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {ammo="Seeth. Bomblet +1",
		-- Sakpata's Helm  
		head="Agoge Mask +3",neck="Fotia Gorget",ear1="Lugra Earring +1",ear2="Moonshade Earring",
		-- Sakpata's Gauntlets
		body="Tatena. Harama. +1",hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Niqmaddu Ring",
		-- Nyame Flanchard Nyame Sollerets 
		back=gear.strws_jse_back,waist="Fotia Belt",legs="Tatena. Haidate +1",feet="Flam. Gambieras +2"})
    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS['Resolution'], {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'], {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS['Resolution'], {})
    sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS['Resolution'], {})
	
	-- Great Axe
    sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- War. Beads +2 ear1="Trud Earring"
		head="Agoge Mask +3",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		-- Sakpata's Gauntlets
		body="Pumm. Lorica +2", hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.vitws_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Sulev. Leggings +2"})
    sets.precast.WS['Upheaval'].SomeAcc = set_combine(sets.precast.WS['Upheaval'], {})
    sets.precast.WS['Upheaval'].Acc = set_combine(sets.precast.WS['Upheaval'], {})
    sets.precast.WS['Upheaval'].FullAcc = set_combine(sets.precast.WS['Upheaval'], {})
    sets.precast.WS['Upheaval'].Fodder = set_combine(sets.precast.WS['Upheaval'], {})
		
	--sets.precast.WS['Upheaval'].MightyCharge = set_combine(sets.precast.WS['Upheaval'], {})

	sets.precast.WS['Steel Cyclone'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- War. Beads +2 ear1="Trud Earring"
		head="Agoge Mask +3",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		-- Nyame Gauntlets
		body="Pumm. Lorica +2", hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Epaminondas's Ring",
		-- Nyame Flachard	Nyame Sollerets
		back=gear.strws_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Sulev. Leggings +2"})
    sets.precast.WS['Steel Cyclone'].SomeAcc = set_combine(sets.precast.WS['Steel Cyclone'], {})
    sets.precast.WS['Steel Cyclone'].Acc = set_combine(sets.precast.WS['Steel Cyclone'], {})
    sets.precast.WS['Steel Cyclone'].FullAcc = set_combine(sets.precast.WS['Steel Cyclone'], {})
    sets.precast.WS['Steel Cyclone'].Fodder = set_combine(sets.precast.WS['Steel Cyclone'], {})
	
    sets.precast.WS["Ukko's Fury"] = set_combine(sets.precast.WS, {ammo="Yetshila +1",
		-- War. Beads +2 ear1="Trud Earring" ear2="Schere Earring"
		head="Agoge Mask +3",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Cessance Earring",
		-- Sakpata's Gauntlets
		body="Pumm. Lorica +2", hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Nyame Sollerets
		back=gear.strws_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Sulev. Leggings +2"})
    sets.precast.WS["Ukko's Fury"].SomeAcc = set_combine(sets.precast.WS["Ukko's Fury"], {})
    sets.precast.WS["Ukko's Fury"].Acc = set_combine(sets.precast.WS["Ukko's Fury"], {})
    sets.precast.WS["Ukko's Fury"].FullAcc = set_combine(sets.precast.WS["Ukko's Fury"], {})
    sets.precast.WS["Ukko's Fury"].Fodder = set_combine(sets.precast.WS["Ukko's Fury"], {})
	
    sets.precast.WS["King's Justice"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["King's Justice"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["King's Justice"].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS["King's Justice"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["King's Justice"].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS["Armor Break"] = set_combine(sets.precast.WS, {ammo="Pemphredo Tathlum",
		-- Sakpata's Helm
		head="Agoge Mask +3", neck="Moonlight Necklace", ear1="Digni. Earring", ear2="Hermetic Earring",
		-- Sakpata's Plate. Agoge Lorica +3 Sakpata's Gauntlets Agoge Mufflers +3
		body="Pumm. Lorica +2", hands="Sulev. Gauntlets +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		-- Sakpata's Cuisses Agoge Cuisses +3
		back=gear.fc_jse_back, waist="Eschan Stone", legs="Pumm. Cuisses +2", feet="Agoge Calligae +3"})
    sets.precast.WS["Armor Break"].SomeAcc = set_combine(sets.precast.WS["Armor Break"], {})
    sets.precast.WS["Armor Break"].Acc = set_combine(sets.precast.WS["Armor Break"],{})
    sets.precast.WS["Armor Break"].FullAcc = set_combine(sets.precast.WS["Armor Break"], {})
    sets.precast.WS["Armor Break"].Fodder = set_combine(sets.precast.WS["Armor Break"], {})
	
	sets.precast.WS["Full Break"] = set_combine(sets.precast.WS, {ammo="Pemphredo Tathlum",
		-- Sakpata's Helm 
		head="Agoge Mask +3", neck="Moonlight Necklace", ear1="Digni. Earring", ear2="Hermetic Earring",
		-- Sakpata's Plate. Agoge Lorica +3 Sakpata's Gauntlets Agoge Mufflers +3
		body="Pumm. Lorica +2", hands="Sulev. Gauntlets +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		-- Sakpata's Cuisses Agoge Cuisses +3
		back=gear.fc_jse_back, waist="Eschan Stone", legs="Pumm. Cuisses +2", feet="Agoge Calligae +3"})
    sets.precast.WS["Full Break"].SomeAcc = set_combine(sets.precast.WS["Full Break"], {})
    sets.precast.WS["Full Break"].Acc = set_combine(sets.precast.WS["Full Break"],{})
    sets.precast.WS["Full Break"].FullAcc = set_combine(sets.precast.WS["Full Break"], {})
    sets.precast.WS["Full Break"].Fodder = set_combine(sets.precast.WS["Full Break"], {})
	
	sets.precast.WS["Fell Cleave"] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- War. Beads +2 ear1="Trud Earring"
		head="Agoge Mask +3",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
		-- Nyame Gauntlets
		body="Pumm. Lorica +2", hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Epaminondas's Ring",
		-- Nyame Flachard	Nyame Sollerets
		back=gear.strws_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Sulev. Leggings +2"})
    sets.precast.WS["Fell Cleave"].SomeAcc = set_combine(sets.precast.WS["Fell Cleave"], {})
    sets.precast.WS["Fell Cleave"].Acc = set_combine(sets.precast.WS["Fell Cleave"], {})
    sets.precast.WS["Fell Cleave"].FullAcc = set_combine(sets.precast.WS["Fell Cleave"], {})
    sets.precast.WS["Fell Cleave"].Fodder = set_combine(sets.precast.WS["Fell Cleave"], {})
	
	-- Axe
    sets.precast.WS['Decimation'] = set_combine(sets.precast.WS, {ammo="Seeth. Bomblet +1",
		-- Sakpata's Helm  ear2="Schere Earring"
		head="Agoge Mask +3",neck="Fotia Gorget",ear1="Lugra Earring +1",ear2="Cessance Earring",
		-- Agoge Lorica +3 Sakpata's Plate Sakpata's Gauntlets
		body="Tatena. Harama. +1",hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings 
		back=gear.strws_jse_back,waist="Fotia Belt", legs="Sulev. Cuisses +2", feet="Flam. Gambieras +2"})
    sets.precast.WS['Decimation'].SomeAcc = set_combine(sets.precast.WS['Decimation'], {})
    sets.precast.WS['Decimation'].Acc = set_combine(sets.precast.WS['Decimation'], {})
    sets.precast.WS['Decimation'].FullAcc = set_combine(sets.precast.WS['Decimation'], {})
    sets.precast.WS['Decimation'].Fodder = set_combine(sets.precast.WS['Decimation'], {})
	
    sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Cloudsplitter'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Cloudsplitter'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Cloudsplitter'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Cloudsplitter'].Fodder = set_combine(sets.precast.WS.Fodder, {})	
   
	-- H2H 
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	-- DusktoDawn
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Lugra Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	-- Not Dusktodawn
	sets.AccDayMaxTPWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2="Moonshade Earring"}

    -- Sets to return to when not performing an action.
           
    -- Resting sets
    sets.resting = {}
           
	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum +1",
		-- Sakpata's Helm  
		head="Volte Cap",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Hearty Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Volte Haubert",hands="Volte Moufles",ring1="Moonlight Ring",ring2="Moonlight Ring",
		-- Sakpata's Cuisses Sakpata's Leggings 
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Volte Brayettes",feet="Volte Sollerets"}
		
	sets.idle.Weak = set_combine(sets.idle, {})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		-- Sakpata's Helm  
		head="Volte Cap",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Hearty Earring",
		body="Volte Haubert",hands="Volte Moufles",ring1="Moonlight Ring",ring2="Moonlight Ring",
		-- Sakpata's Cuisses Sakpata's Leggings 
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Volte Brayettes",feet="Volte Sollerets"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Crepuscular Helm",body="Crepuscular Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
		-- Sakpata's Helm  
		head="Volte Cap",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Hearty Earring",
		body="Volte Haubert",hands="Volte Moufles",ring1="Moonlight Ring",ring2="Moonlight Ring",
		-- Sakpata's Cuisses Sakpata's Leggings 
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Volte Brayettes",feet="Volte Sollerets"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Crepuscular Helm",body="Crepuscular Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		-- Sakpata's Helm  
		head="Volte Cap",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Hearty Earring",
		body="Volte Haubert",hands="Volte Moufles",ring1="Moonlight Ring",ring2="Moonlight Ring",
		-- Sakpata's Cuisses Sakpata's Leggings 
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Volte Brayettes",feet="Volte Sollerets"}

	sets.Kiting = {lring="Shneddick Ring"}
	sets.Reraise = {head="Crepuscular Helm",body="Crepuscular Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {} -- head="Frenzy Sallet"
     
    -- Engaged sets
	sets.engaged = {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Hjarrandi Breast.",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.SomeAcc = sets.engaged
	sets.engaged.Acc = {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Agoge Lorica",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.FullAcc = {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Agoge Lorica",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Fodder = {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Agoge Lorica",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
 	
	-- Bravura
	sets.engaged.Bravura = {}
	sets.engaged.Bravura.SomeAcc = {}
	sets.engaged.Bravura.Acc = {}
	sets.engaged.Bravura.FullAcc = {}
	sets.engaged.Bravura.Fodder = {}
	
    sets.engaged.Bravura.AM = {}
	sets.engaged.Bravura.SomeAcc.AM = {}
	sets.engaged.Bravura.Acc.AM = {}
	sets.engaged.Bravura.FullAcc.AM = {}
	sets.engaged.Bravura.Fodder.AM = {} 
	
	-- Sword	
	sets.engaged.Sword = {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Hjarrandi Breast.",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.Sword.SomeAcc = sets.engaged.Sword
	sets.engaged.Sword.Acc = {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Agoge Lorica",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Sword.FullAcc = {ammo="Ginsen", -- Coiste Bodhar
		-- Hjarrandi Helm neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Hjarrandi Breast.",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Pumm. Calligae +2"}
    sets.engaged.Sword.Fodder = {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Agoge Lorica",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}

	-- GreatSword
	sets.engaged.GreatSword = {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Agoge Lorica",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.GreatSword.SomeAcc = sets.engaged.Greatsword
	sets.engaged.GreatSword.Acc= {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Agoge Lorica",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.GreatSword.FullAcc = {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Agoge Lorica",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.GreatSword.Fodder = {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Agoge Lorica",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
		
	-- Polearm
	sets.engaged.Polearm = {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Agoge Lorica",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Polearm.SomeAcc = sets.engaged.Polearm
	sets.engaged.Polearm.Acc = {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Agoge Lorica",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.Polearm.FullAcc = {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Agoge Lorica",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Polearm.Fodder = {ammo="Ginsen", -- Coiste Bodhar
		-- Sakpata's Helm  neck="War. Beads +2", ear1="Schere Earring",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		-- Sakpata's Plate. Sakpata's Gauntlets
		body="Agoge Lorica",hands="Sulve. Gauntlets +2",ring1="Flamma Ring",ring2="Niqmaddu Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Pumm. Cuisses +2",feet="Flam. Gambieras +2"}
	
--[[  
	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
-- Bravura melee sets
  
	sets.engaged.Bravura.PDT = {}
	sets.engaged.Bravura.SomeAcc.PDT = {}
	sets.engaged.Bravura.Acc.PDT = {}
	sets.engaged.Bravura.FullAcc.PDT = {}
	sets.engaged.Bravura.Fodder.PDT = {}
	
	sets.engaged.Bravura.PDT.Adoulin = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Bravura.PDT.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.AM = {}
	sets.engaged.Bravura.Acc.PDT.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.AM = {}
	sets.engaged.Bravura.Fodder.PDT.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Bravura.PDT.Charge = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge = {}
	sets.engaged.Bravura.Acc.PDT.Charge = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge = {}
	sets.engaged.Bravura.Fodder.PDT.Charge = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Bravura.PDT.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Bravura.Acc.PDT.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Bravura.MDT = {}
	sets.engaged.Bravura.SomeAcc.MDT = {}
	sets.engaged.Bravura.Acc.MDT = {}
	sets.engaged.Bravura.FullAcc.MDT = {}
	sets.engaged.Bravura.Fodder.MDT = {}
	
	sets.engaged.Bravura.MDT.Adoulin = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Bravura.MDT.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.AM = {}
	sets.engaged.Bravura.Acc.MDT.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.AM = {}
	sets.engaged.Bravura.Fodder.MDT.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.AM = {}
	
	sets.engaged.Bravura.MDT.Charge = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge = {}
	sets.engaged.Bravura.Acc.MDT.Charge = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge = {}
	sets.engaged.Bravura.Fodder.MDT.Charge = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge = {}
	
	sets.engaged.Bravura.MDT.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge.AM = {}
	sets.engaged.Bravura.Acc.MDT.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Charge.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge.AM = {}
	
    
	
    sets.engaged.Bravura.Adoulin.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Bravura.Acc.Adoulin.Mighty = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Bravura.Fodder.Adoulin.Mighty = {}
	
    sets.engaged.Bravura.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Mighty.AM = {}
	
    sets.engaged.Bravura.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Adoulin.Mighty.AM = {}

    sets.engaged.Bravura.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.Charge.Mighty = {}
	
    sets.engaged.Bravura.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.Adoulin.Charge.Mighty = {}
	
    sets.engaged.Bravura.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Charge.Mighty.AM = {}
	
    sets.engaged.Bravura.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Bravura.PDT.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Mighty = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Mighty = {}
	
	sets.engaged.Bravura.PDT.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Mighty.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Bravura.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Charge.Mighty = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Bravura.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Charge.Mighty.AM = {}
	
	sets.engaged.Bravura.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.PDT.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Bravura.MDT.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Mighty = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Mighty = {}
	
	sets.engaged.Bravura.MDT.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Mighty.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Bravura.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Charge.Mighty = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Bravura.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Charge.Mighty.AM = {}
	
	sets.engaged.Bravura.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.SomeAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Acc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.FullAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Bravura.Fodder.MDT.Adoulin.Charge.Mighty.AM = {}
	
-- Ragnarok melee sets
    sets.engaged.Ragnarok = {}
	sets.engaged.Ragnarok.SomeAcc = {}
	sets.engaged.Ragnarok.Acc = {}
	sets.engaged.Ragnarok.FullAcc = {}
	sets.engaged.Ragnarok.Fodder = {}
	
    sets.engaged.Ragnarok.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin = {}
	sets.engaged.Ragnarok.Acc.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.Adoulin = {}
	
    sets.engaged.Ragnarok.AM = {}
	sets.engaged.Ragnarok.SomeAcc.AM = {}
	sets.engaged.Ragnarok.Acc.AM = {}
	sets.engaged.Ragnarok.FullAcc.AM = {}
	sets.engaged.Ragnarok.Fodder.AM = {}
	
    sets.engaged.Ragnarok.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.AM = {}

    sets.engaged.Ragnarok.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.Charge = {}
	sets.engaged.Ragnarok.Acc.Charge = {}
	sets.engaged.Ragnarok.FullAcc.Charge = {}
	sets.engaged.Ragnarok.Fodder.Charge = {}
	
    sets.engaged.Ragnarok.Adoulin.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge = {}
	
    sets.engaged.Ragnarok.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.Charge.AM = {}
	
    sets.engaged.Ragnarok.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge.AM = {}

	sets.engaged.Ragnarok.PDT = {}
	sets.engaged.Ragnarok.SomeAcc.PDT = {}
	sets.engaged.Ragnarok.Acc.PDT = {}
	sets.engaged.Ragnarok.FullAcc.PDT = {}
	sets.engaged.Ragnarok.Fodder.PDT = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Ragnarok.PDT.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Ragnarok.PDT.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge = {}
	
	sets.engaged.Ragnarok.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge.AM = {}

	sets.engaged.Ragnarok.MDT = {}
	sets.engaged.Ragnarok.SomeAcc.MDT = {}
	sets.engaged.Ragnarok.Acc.MDT = {}
	sets.engaged.Ragnarok.FullAcc.MDT = {}
	sets.engaged.Ragnarok.Fodder.MDT = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Ragnarok.MDT.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.AM = {}
	
	sets.engaged.Ragnarok.MDT.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge = {}
	
	sets.engaged.Ragnarok.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge.AM = {}
	
    sets.engaged.Ragnarok.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Mighty = {}
	sets.engaged.Ragnarok.Acc.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Mighty = {}
	
    sets.engaged.Ragnarok.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Mighty = {}
	
    sets.engaged.Ragnarok.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Mighty.AM = {}
	
    sets.engaged.Ragnarok.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Mighty.AM = {}

    sets.engaged.Ragnarok.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Charge.Mighty = {}
	
    sets.engaged.Ragnarok.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge.Mighty = {}
	
    sets.engaged.Ragnarok.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Charge.Mighty.AM = {}
	
    sets.engaged.Ragnarok.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Ragnarok.PDT.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Mighty.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Ragnarok.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Charge.Mighty.AM = {}
	
	sets.engaged.Ragnarok.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.PDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.PDT.Adoulin.Charge.Mighty.AM = {}

	sets.engaged.Ragnarok.MDT.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Mighty.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Mighty.AM = {}
	
	sets.engaged.Ragnarok.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge.Mighty = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge.Mighty = {}
	
	sets.engaged.Ragnarok.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Charge.Mighty.AM = {}
	
	sets.engaged.Ragnarok.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.SomeAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Acc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.FullAcc.MDT.Adoulin.Charge.Mighty.AM = {}
	sets.engaged.Ragnarok.Fodder.MDT.Adoulin.Charge.Mighty.AM = {}
	
]]--
	
	--Extra Special Sets	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Retaliation = {}
	sets.buff.Restraint = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Sword = {main="Naegling", sub="Blurred Shield +1"} -- 
	sets.weapons.Axe = {main="Dolichenus", sub="Blurred Shield +1"} -- Blurred Shield +1
	sets.weapons.Farsha = {main="Farsha", sub="Blurred Shield +1"} -- Blurred Shield +1
	sets.weapons.Club = {main="Loxotic Mace", sub="Blurred Shield +1"} -- Blurred Shield +1
	sets.weapons.Polearm = {main="Shining One", sub="Utu Grip"}
	sets.weapons.Chango = {main="Bravura",sub="Utu Grip"}
	sets.weapons.Bravura = {main="Bravura",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Ternion Dagger +1"}
	sets.weapons.DualAxe = {main="Dolichenus",sub="Ternion Dagger +1"}
	sets.weapons.DualClub = {main="Loxotic Mace", sub="Ternion Dagger +1"}
	sets.weapons.Ragnarok = {main="Ragnarok",sub="Utu Grip"}
	sets.weapons.Greatsword = {main="Montante +1",sub="Utu Grip"}
	-- Proc Weapons
	sets.weapons.ProcDagger = {main="Aern Dagger",sub=empty}
	sets.weapons.ProcSword = {main="Aern Sword",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub="Utu Grip"}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub="Utu Grip"}
	sets.weapons.ProcPolearm = {main="Aern Spear",sub="Utu Grip"}
	sets.weapons.ProcGreatKatana = {main="Zanmato",sub="Utu Grip"}
	sets.weapons.ProcKatana = {main="Debahocho +1",sub=empty}
	sets.weapons.ProcClub = {main="Rounsey Wand",sub=empty}
	sets.weapons.ProcStaff = {main="Aern Staff",sub=empty}
	sets.weapons.ProcAxe = {main="Aern Axe",sub=empty}

end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(1, 11)
    elseif player.sub_job == 'DNC' then
        set_macro_page(2, 11)
    elseif player.sub_job == 'DRG' then
        set_macro_page(3, 11)
	elseif player.sub_job == 'THF' then
        set_macro_page(4, 11)
	elseif player.sub_job == 'NIN' then
        set_macro_page(5, 11)
    else
        set_macro_page(1, 11)
    end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 011')
end

    -- Setup vars that are user-independent.
function job_setup()

	state.Buff['Brazen Rush'] = buffactive['Brazen Rush'] or false
	state.Buff["Warrior's Charge"] = buffactive["Warrior's Charge"] or false
	state.Buff['Mighty Strikes'] = buffactive['Mighty Strikes']  or false
	state.Buff.Retaliation = buffactive['Retaliation'] or false
	state.Buff.Restraint = buffactive['Restraint'] or false
    state.Buff['Aftermath'] = buffactive['Aftermath'] or false
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
	state.Stance = M{['description']='Stance','Hasso','Seigan','None'}

	autows = "Savage Blade"
	autofood = 'Soy Ramen'
	
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","Stance","IdleMode","Passive","RuneElement","TreasureMode",})
end

autows_list = {	
	['None']='Savage Blade',}