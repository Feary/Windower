-- Setup vars that are user-dependent.
function user_job_setup()
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DTLite','PDT','Reraise')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc','Omen')
    state.RangedMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT','PDTReraise')
	state.MagicalDefenseMode:options('MDT','MDTReraise')
	state.ResistDefenseMode:options('MEVA')
    state.IdleMode:options('Normal', 'Reraise')
	state.Weapons:options('GreatKatana','Polearm','Omen','Quint','ProcWeapon','Bow') --'Dojikiri',

	gear.ws_jse_back = 	{name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	gear.stp_jse_back = {name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.dbl_jse_back = {name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.FC_jse_back = 	{name="Smertrios's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10',}}
    
	-- Additional local binds
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind !backspace input /ja "Third Eye" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !@^` gs c cycle Stance')
	--send_command('bind !r gs c set skipprocweapons false;gs c weapons ProcWeapon;gs c set WeaponskillMode Proc;gs c update')
	--send_command('bind ^r gs c set skipprocweapons true;gs c weapons Default;gs c set WeaponskillMode Normal;gs c update')
	--send_command('bind ^q gs c weapons Bow;gs c update')

    select_default_macro_book()
	user_job_lockstyle()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Wakido Kabuto +3",hands="Sakonji Kote +3", back=gear.ws_jse_back}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +3"}
    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +3"}
	sets.precast.JA['Sekkanoki'] = {hands="Kasuga Kote +1"}
	sets.precast.JA['Sengikori'] = {feet="Kas. Sune-Ate +1"}--
	sets.precast.JA['Shikikoyo'] = {legs="Sakonji Haidate +3"}
	
	-- Acc
    sets.precast.Step = {ammo="Hasty Pinion +1",
		-- ear1="Digni. Earring", Telos Earring
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear2="Moonshade Earring",
		body="Flamma Korazin +2",hands="Wakido Kote +3", lring="Chirich Ring +1", rring="Chirich Ring +1",
		back=gear.ws_jse_back,waist="Kentarch Belt +1",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    -- Macc
	sets.precast.JA['Violent Flourish'] = {ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear2="Moonshade Earring",
        -- ring2="Metamor. Ring +1",
		body="Flamma Korazin +2",hands="Flam. Manopolas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Eschan Stone",
        back=gear.ws_jse_back, legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		head="Flam. Zucchetto +2", neck="Sanctity Necklace",
        body="Flamma Korazin +2", hands="Flam. Manopolas +2",
        waist="Chaac Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {
		neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring"}
	   
    -- Ranged snapshot gear
    sets.precast.RA = {}
	   
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
		-- head="Mpaca's Cap", neck="Sam. Nodowa +2", 
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thud Earring",
        -- Nyame Gauntlets
		body="Sakonji Domaru +3", hands="Wakido Kote +3", ring1="Niqmaddu Ring", ring2="Regal Ring",
		-- Nyame Sollerets
        back=gear.ws_jse_back, waist="Sailfi Belt +1", legs="Wakido Haidate +3", feet="Flam. Gambieras +2"}
   
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- head="Mpaca's Cap", neck="Sam. Nodowa +2", 
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thud Earring",
        -- Nyame Gauntlets
		body="Sakonji Domaru +3", hands="Wakido Kote +3", ring1="Niqmaddu Ring", ring2="Regal Ring",
		-- Nyame Sollerets
        back=gear.ws_jse_back, waist="Sailfi Belt +1", legs="Wakido Haidate +3", feet="Flam. Gambieras +2"})
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS,  {ammo="Knobkierrie",
		-- head="Mpaca's Cap", neck="Sam. Nodowa +2", 
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thud Earring",
        -- Nyame Gauntlets
		body="Sakonji Domaru +3", hands="Wakido Kote +3", ring1="Niqmaddu Ring", ring2="Regal Ring",
		-- Nyame Sollerets
        back=gear.ws_jse_back, waist="Sailfi Belt +1", legs="Wakido Haidate +3", feet="Flam. Gambieras +2"})
		
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS,  {ammo="Knobkierrie",
		-- head="Mpaca's Cap", neck="Sam. Nodowa +2", 
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thud Earring",
        -- Nyame Gauntlets
		body="Sakonji Domaru +3", hands="Wakido Kote +3", ring1="Niqmaddu Ring", ring2="Regal Ring",
		-- Nyame Sollerets
        back=gear.ws_jse_back, waist="Sailfi Belt +1", legs="Wakido Haidate +3", feet="Flam. Gambieras +2"})
    
	sets.precast.WS.Fodder = set_combine(sets.precast.WS,  {ammo="Knobkierrie",
		-- head="Mpaca's Cap", neck="Sam. Nodowa +2", 
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thud Earring",
        -- Nyame Gauntlets
		body="Sakonji Domaru +3", hands="Wakido Kote +3", ring1="Niqmaddu Ring", ring2="Regal Ring",
		-- Nyame Sollerets
        back=gear.ws_jse_back, waist="Sailfi Belt +1", legs="Wakido Haidate +3", feet="Flam. Gambieras +2"})
	
	sets.precast.WS.Proc = {}
	
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Fudo'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Fudo'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Fudo'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
   
    sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Rana'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Rana'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Rana'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Kasha'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Kasha'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Kasha'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Kasha'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Gekko'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Gekko'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Gekko'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Gekko'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Yukikaze'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Yukikaze'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Yukikaze'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Yukikaze'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Shoha'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Shoha'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Shoha'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Ageha'] =  {ammo="Pemphredo Tathlum",
		--  ear2="Digni. Earring", 
		head="Flam. Zucchetto +2", neck="Sanctity Necklace", ear1="Gwati Earring", ear2="Moonshade Earring",
        -- ring2="Metamor. Ring +1",
		body="Flamma Korazin +2",hands="Wakido Kote +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
        back=gear.ws_jse_back, waist="Eschan Stone", legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
		
    sets.precast.WS['Tachi: Hobaku'] = {}
		
    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- head="Nyame Helm", neck="Sam. Nodowa +2", 
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thud Earring",
        --  Nyame Gauntlets 
		body="Sakonji Domaru +3",hands="Wakido Kote +3", lring="Rajas Ring", rring="Epaminondas's Ring",
		-- Nyame Flanchard Nyame Sollerets
        back=gear.ws_jse_back, waist="Orpheus's Sash", legs="Wakido Haidate +3", feet="Flam. Gambieras +2"})
	sets.precast.WS['Tachi: Jinpu'].Omen = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring",ear2="Friomisi Earring",
		body="Wakido Domaru +3",hands="Wakido Kote +3", lring="Stikini Ring +1", rring="Epaminondas's Ring",
        back=gear.ws_jse_back, waist="Orpheus's Sash", legs="Wakido Haidate +3", feet="Flam. Gambieras +2"})
    
	-- Ranged	
	sets.precast.WS['Apex Arrow'] = {}
    sets.precast.WS['Apex Arrow'].SomeAcc = set_combine(sets.precast.WS['Apex Arrow'], {})
    sets.precast.WS['Apex Arrow'].Acc = set_combine(sets.precast.WS['Apex Arrow'], {})
    sets.precast.WS['Apex Arrow'].FullAcc = set_combine(sets.precast.WS['Apex Arrow'], {})
    sets.precast.WS['Apex Arrow'].Fodder = set_combine(sets.precast.WS['Apex Arrow'], {})

	-- Polearm 
	sets.precast.WS['Impluse Drive'] = {ammo="Knobkierrie",
		-- head="Mpaca's Cap", neck="Sam. Nodowa +2", 
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thud Earring",
        -- body="Nyame Mail" hands="Nyame Gauntlets", 
		body="Sakonji Domaru +3",hands="Wakido Kote +3", ring1="Niqmaddu Ring", rring="Epaminondas's Ring",
		-- legs="Nyame Flanchard", feet="Nyame Sollerets"
        back=gear.ws_jse_back, waist="Sailfi Belt +1", legs="Wakido Haidate +3",feet="Flam. Gambieras +2"}
   
	sets.precast.WS['Impluse Drive'].SomeAcc = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- head="Mpaca's Cap", neck="Sam. Nodowa +2", 
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thud Earring",
        -- body="Nyame Mail" hands="Nyame Gauntlets", 
		body="Sakonji Domaru +3",hands="Wakido Kote +3", ring1="Niqmaddu Ring", rring="Epaminondas's Ring",
		-- legs="Nyame Flanchard", feet="Nyame Sollerets"
        back=gear.ws_jse_back, waist="Sailfi Belt +1", legs="Wakido Haidate +3",feet="Flam. Gambieras +2"})
	
	sets.precast.WS['Impluse Drive'].Acc = set_combine(sets.precast.WS,  {ammo="Knobkierrie",
		-- head="Mpaca's Cap", neck="Sam. Nodowa +2", 
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thud Earring",
        -- body="Nyame Mail" hands="Nyame Gauntlets", 
		body="Sakonji Domaru +3",hands="Wakido Kote +3", ring1="Niqmaddu Ring", rring="Epaminondas's Ring",
		-- legs="Nyame Flanchard", feet="Nyame Sollerets"
        back=gear.ws_jse_back, waist="Sailfi Belt +1", legs="Wakido Haidate +3",feet="Flam. Gambieras +2"})
		
	sets.precast.WS['Impluse Drive'].FullAcc = set_combine(sets.precast.WS,  {ammo="Knobkierrie",
		-- head="Mpaca's Cap", neck="Sam. Nodowa +2", 
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thud Earring",
        -- body="Nyame Mail" hands="Nyame Gauntlets", 
		body="Sakonji Domaru +3",hands="Wakido Kote +3", ring1="Niqmaddu Ring", rring="Epaminondas's Ring",
		-- legs="Nyame Flanchard", feet="Nyame Sollerets"
        back=gear.ws_jse_back, waist="Sailfi Belt +1", legs="Wakido Haidate +3",feet="Flam. Gambieras +2"})
    
	sets.precast.WS['Impluse Drive'].Fodder = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- head="Mpaca's Cap", neck="Sam. Nodowa +2", 
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring", ear2="Thud Earring",
        -- body="Nyame Mail" hands="Nyame Gauntlets", 
		body="Sakonji Domaru +3",hands="Wakido Kote +3", ring1="Niqmaddu Ring", rring="Epaminondas's Ring",
		-- legs="Nyame Flanchard", feet="Nyame Sollerets"
        back=gear.ws_jse_back, waist="Sailfi Belt +1", legs="Wakido Haidate +3",feet="Flam. Gambieras +2"})
	
	sets.precast.WS['Sonic Thrust'] = sets.precast.WS['Impluse Drive']
	sets.precast.WS['Sonic Thrust'].SomeAcc = set_combine(sets.precast.WS['Impluse Drive'], {})
    sets.precast.WS['Sonic Thrust'].Acc = set_combine(sets.precast.WS['Impluse Drive'], {})
    sets.precast.WS['Sonic Thrust'].FullAcc = set_combine(sets.precast.WS['Impluse Drive'], {})
    sets.precast.WS['Sonic Thrust'].Fodder = set_combine(sets.precast.WS['Impluse Drive'], {})

	sets.precast.WS['Stardiver'] = {--ammo="Coiste Bodhar",
		-- head="Mpaca's Cap", ear2="Schere Earring",
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring",ear2="Brutal Earring",
        -- body="Tatena. Harama. +1" hands="Ryou Tekko +1", 
		body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Niqmaddu Ring",ring2="Regal Ring",
		-- legs="Mpaca's Hose", feet="Valorous Greaves" Crit +4
        back=gear.ws_jse_back, waist="Fotia Belt", legs="Wakido Haidate +3",feet="Flam. Gambieras +2"}
   
	sets.precast.WS['Stardiver'].SomeAcc = set_combine(sets.precast.WS, {--ammo="Coiste Bodhar",
		-- head="Mpaca's Cap", ear2="Schere Earring",
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring",ear2="Brutal Earring",
        -- body="Tatena. Harama. +1" hands="Ryou Tekko +1", 
		body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Niqmaddu Ring",ring2="Regal Ring",
		-- legs="Mpaca's Hose", feet="Valorous Greaves" Crit +4
        back=gear.ws_jse_back, waist="Fotia Belt", legs="Wakido Haidate +3",feet="Flam. Gambieras +2"})
	
	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS,   {--ammo="Coiste Bodhar",
		-- head="Mpaca's Cap", ear2="Schere Earring",
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring",ear2="Brutal Earring",
        -- body="Tatena. Harama. +1" hands="Ryou Tekko +1", 
		body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Niqmaddu Ring",ring2="Regal Ring",
		-- legs="Mpaca's Hose", feet="Valorous Greaves" Crit +4
        back=gear.ws_jse_back, waist="Fotia Belt", legs="Wakido Haidate +3",feet="Flam. Gambieras +2"})
		
	sets.precast.WS['Stardiver'].FullAcc = set_combine(sets.precast.WS,   {--ammo="Coiste Bodhar",
		-- head="Mpaca's Cap", ear2="Schere Earring",
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring",ear2="Brutal Earring",
        -- body="Tatena. Harama. +1" hands="Ryou Tekko +1", 
		body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Niqmaddu Ring",ring2="Regal Ring",
		-- legs="Mpaca's Hose", feet="Valorous Greaves" Crit +4
        back=gear.ws_jse_back, waist="Fotia Belt", legs="Wakido Haidate +3",feet="Flam. Gambieras +2"})
    
	sets.precast.WS['Stardiver'].Fodder = set_combine(sets.precast.WS,   {--ammo="Coiste Bodhar",
		-- head="Mpaca's Cap", ear2="Schere Earring",
		head="Flam. Zucchetto +2", neck="Fotia Gorget", ear1="Moonshade Earring",ear2="Brutal Earring",
        -- body="Tatena. Harama. +1" hands="Ryou Tekko +1", 
		body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Niqmaddu Ring",ring2="Regal Ring",
		-- legs="Mpaca's Hose", feet="Valorous Greaves" Crit +4
        back=gear.ws_jse_back, waist="Fotia Belt", legs="Wakido Haidate +3",feet="Flam. Gambieras +2"})
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Mache Earring +1"}
	sets.DayMaxTPWSEars = {ear1="Brutal Earring",ear2="Thrud Earring"}--
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}--ear2="Telos Earring"
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Thrud Earring"}
	
    -- Midcast Sets
    sets.midcast.FastRecast = {}
		
    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})--back="Mujin Mantle"

    -- Ranged gear
    sets.midcast.RA = {-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Wakido Kabuto +3",neck="Sanctity Necklace",
		--  hands="Volte Mittens", rring="Crepuscular Ring", 
        body="Wakido Domaru +3",hands="Wakido Kote +3", lring="Regal Ring",
        legs="Wakido Haidate +3",feet="Wakido Sune. +3"}

    sets.midcast.RA.Acc = {-- ear1="Cessance Earring",ear2="Telos Earring",
		head="Wakido Kabuto +3",neck="Sanctity Necklace",
        body="Wakido Domaru +3",hands="Wakido Kote +3", ring2="Regal Ring",
        legs="Wakido Haidate +3",feet="Wakido Sune. +3"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
	
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	
	sets.Kiting = {feet="Danzo Sune-ate"}

    sets.Reraise = {}-- head="Twilight Helm",body="Twilight Mail"
	
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
	
    -- Resting sets
    sets.resting = {}    
	 
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)		
    sets.idle = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1",  lear="Genmei Earring", 
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", lear="Odnowa Earring", rear="Odnowa Earring +1",
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring",
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
		
    sets.idle.Reraise = set_combine(sets.idle, sets.Reraise)

    sets.idle.Weak = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1",  lear="Genmei Earring", 
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", lear="Odnowa Earring", rear="Odnowa Earring +1",
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring",  ring2="Gelatinous Ring +1",
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
		
    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
	
	sets.DayIdle = {}
	sets.NightIdle = {}
    
    -- Defense sets
    sets.defense.PDT = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1",  lear="Genmei Earring", 
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", lear="Odnowa Earring", rear="Odnowa Earring +1",
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring", ring2="Gelatinous Ring +1",
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}

    sets.defense.PDTReraise = set_combine(sets.defense.PDT, sets.Reraise)
		
    sets.defense.MDT = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1",  lear="Genmei Earring", 
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", lear="Odnowa Earring", rear="Odnowa Earring +1",
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring",  ring2="Gelatinous Ring +1",
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, sets.Reraise)
	
    sets.defense.MEVA = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1",  lear="Genmei Earring", 
		head="Wakido Kabuto +3", neck="Loricate Torque +1", lear="Odnowa Earring", rear="Odnowa Earring +1"
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring", ring2="Gelatinous Ring +1",
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Wakido Haidate +3", feet="Wakido Sune. +3"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    -- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
    sets.engaged = {ammo="Ginsen",  ammo="Aurgelmir Orb +1",
		-- neck="Sam. Nodowa +2", ear1="Cessance Earring",  ear2="Telos Earring",
		head="Flam. Zucchetto +2", neck="Combatant's Torque", lear="Mache Earring +1", ear2="Brutal Earring", 
		-- body="Ken. Samue +1", 
		body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Flamma Ring", ring2="Niqmaddu Ring", 
		--  legs="Ken. Hakama +1", feet="Ryuo Sune-ate +1"
        back=gear.dbl_jse_back,waist="Sailfi Belt +1",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
    sets.engaged.SomeAcc = {ammo="Ginsen",  ammo="Aurgelmir Orb +1",
		-- neck="Sam. Nodowa +2", ear2="Dedition Earring", 
		head="Flam. Zucchetto +2", neck="Combatant's Torque", lear="Mache Earring +1", ear2="Brutal Earring", 
		-- body="Ken. Samue +1", 
		body= "Wakido Domaru +3", hands="Wakido Kote +3", ring1="Flamma Ring", ring2="Niqmaddu Ring",
		--  legs="Ken. Hakama +1", 
        back=gear.dbl_jse_back, waist="Windbuffet Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
    sets.engaged.Acc = {ammo="Ginsen",  ammo="Aurgelmir Orb +1",
		-- neck="Sam. Nodowa +2", ear2="Dedition Earring", 
		head="Flam. Zucchetto +2", neck="Combatant's Torque", lear="Mache Earring +1", ear2="Brutal Earring", 
		-- body="Ken. Samue +1", 
		body= "Wakido Domaru +3", hands="Wakido Kote +3", ring1="Flamma Ring", ring2="Niqmaddu Ring",
		--  legs="Ken. Hakama +1", 
        back=gear.dbl_jse_back, waist="Windbuffet Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc = {ammo="Ginsen",  ammo="Aurgelmir Orb +1",
		-- neck="Sam. Nodowa +2", ear2="Dedition Earring", 
		head="Flam. Zucchetto +2", neck="Combatant's Torque", lear="Mache Earring +1", ear2="Brutal Earring", 
		-- body="Ken. Samue +1", 
		body= "Wakido Domaru +3", hands="Wakido Kote +3", ring1="Flamma Ring", ring2="Regal Ring",
		--  legs="Ken. Hakama +1", 
        back=gear.dbl_jse_back, waist="Windbuffet Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
    sets.engaged.Fodder = {ammo="Ginsen", -- ammo="Coiste Bodhar",
		-- neck="Sam. Nodowa +2", ear1="Telos Earring",ear2="Cessance Earring", ear1="Schere Earring", ear2="Dedition Earring", 
		head="Flam. Zucchetto +2", neck="Combatant's Torque", lear="Mache Earring +1", ear2="Brutal Earring", 
		-- body="Ken. Samue +1",  
		body= "Wakido Domaru +3", hands="Wakido Kote +3", ring1="Flamma Ring", ring2="Niqmaddu Ring",
		-- waist="Windbuffet Belt +1", legs="Ken. Hakama +1", feet="Ryuo Sune-ate +1"
        back=gear.dbl_jse_back, waist="Windbuffet Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
    
	sets.engaged.PDT = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1", lear="Genmei Earring", rear="Odnowa Earring +1"
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", lear="Mache Earring +1", ear2="Telos Earring", 
		--  ring2="Gelatinous Ring",
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring", ring2="Chirich Ring +1", 
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
    sets.engaged.SomeAcc.PDT = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1", lear="Genmei Earring", rear="Odnowa Earring +1"
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", lear="Mache Earring +1", ear2="Telos Earring", 
		--  ring2="Gelatinous Ring",
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring", ring2="Chirich Ring +1", 
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
    sets.engaged.Acc.PDT = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1", lear="Genmei Earring", rear="Odnowa Earring +1"
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", lear="Mache Earring +1", ear2="Telos Earring", 
		--  ring2="Gelatinous Ring",
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring", ring2="Chirich Ring +1", 
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc.PDT = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1", lear="Genmei Earring", rear="Odnowa Earring +1"
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", lear="Mache Earring +1", ear2="Telos Earring", 
		--  ring2="Gelatinous Ring",
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring", ring2="Chirich Ring +1", 
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
    sets.engaged.Fodder.PDT = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1", lear="Genmei Earring", rear="Odnowa Earring +1"
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", lear="Mache Earring +1", ear2="Telos Earring", 
		--  ring2="Gelatinous Ring",
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring", ring2="Chirich Ring +1", 
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
	
	sets.engaged.DTLite = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1", lear="Genmei Earring", rear="Odnowa Earring +1"
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", lear="Mache Earring +1", ear2="Telos Earring", 
		--  ring2="Gelatinous Ring",
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring", ring2="Chirich Ring +1", 
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
	sets.engaged.SomeAcc.DTLite = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1", lear="Genmei Earring", rear="Odnowa Earring +1"
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", lear="Mache Earring +1", ear2="Telos Earring", 
		--  ring2="Gelatinous Ring",
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring", ring2="Chirich Ring +1", 
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
    sets.engaged.Acc.DTLite = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1", lear="Genmei Earring", rear="Odnowa Earring +1"
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", lear="Mache Earring +1", ear2="Telos Earring", 
		--  ring2="Gelatinous Ring",
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring", ring2="Chirich Ring +1", 
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"} 
    sets.engaged.FullAcc.DTLite = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1", lear="Genmei Earring", rear="Odnowa Earring +1"
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", lear="Mache Earring +1", ear2="Telos Earring", 
		--  ring2="Gelatinous Ring",
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring", ring2="Chirich Ring +1", 
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}
    sets.engaged.Fodder.DTLite = {--ammo="Staunch Tathlum +1",
		-- head="Ken. Jinpachi +1", lear="Genmei Earring", rear="Odnowa Earring +1"
		head="Flam. Zucchetto +2", neck="Loricate Torque +1", lear="Mache Earring +1", ear2="Telos Earring", 
		--  ring2="Gelatinous Ring",
        body="Wakido Domaru +3", hands="Wakido Kote +3", ring1="Defending Ring", ring2="Chirich Ring +1", 
		-- legs="Ken. Hakama +1", feet="Ken. Sune-ate +1"
        back=gear.dbl_jse_back, waist="Flume Belt", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"}

    sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)		
    sets.engaged.SomeAcc.Reraise = set_combine(sets.engaged.SomeAcc, sets.Reraise)		
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)		
    sets.engaged.FullAcc.Reraise = set_combine(sets.engaged.FullAcc, sets.Reraise)		
    sets.engaged.Fodder.Reraise = set_combine(sets.engaged.Fodder, sets.Reraise)		
        
	-- Weapons sets
	sets.weapons.Omen = {main="Soboro Sukehiro",sub="Khonsu"}
	sets.weapons.GreatKatana = {main="Norifusa",sub="Utu Grip"}
	sets.weapons.Quint = {main="Quint Spear",sub="Utu Grip"}
	sets.weapons.Polearm = {main="Shining One",sub="Utu Grip"}
	sets.weapons.ProcWeapon = {main="Norifusa",sub="Utu Grip"}
	sets.weapons.Bow = {main="Norifusa",sub="Utu Grip",range="Cibitshavore",ammo="Eminent Arrow"}
	
	-- Buff sets
	sets.Cure_Received = {waist="Gishdubar Sash"} --hands="Buremte Gloves",
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}--neck="Vim Torque +1"
	sets.buff.Hasso = {hands="Wakido Kote +3", } --legs="Kasuga Haidate"
	sets.buff['Third Eye'] = {legs="Sakonji Haidate +3"}
    sets.buff.Sekkanoki = {hands="Kasuga Kote +1"}
    sets.buff.Sengikori = {feet="Kas. Sune-Ate +1"}
    sets.buff['Meikyo Shisui'] = {feet="Sak. Sune-ate +3"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(3, 17)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 17)
    elseif player.sub_job == 'NIN' then
        set_macro_page(4, 17)
    elseif player.sub_job == 'THF' then
        set_macro_page(2, 17)
    else
        set_macro_page(1,17)
    end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 017')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

    state.Buff.Sekkanoki = buffactive.Sekkanoki or false
    state.Buff.Sengikori = buffactive.Sengikori or false
    state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	state.Buff['Third Eye'] = buffactive['Third Eye'] or false
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
	state.Stance = M{['description']='Stance','Hasso','Seigan','None'}

	autows = 'Tachi: Fudo'
	rangedautows = "Apex Arrow"
	autofood = 'Soy Ramen'

	update_melee_groups()
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","Stance","IdleMode","Passive","RuneElement","TreasureMode",})
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end