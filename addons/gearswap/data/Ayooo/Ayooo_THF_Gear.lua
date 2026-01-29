-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','PDT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Sword','MagicWeapons','Throwing')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}
	state.AmbushMode = M(false, 'Ambush Mode')

	gear.stp_jse_back = 	{name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.da_jse_back = 		{name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.dw_jse_back = 		{name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	gear.crit_jse_back = 	{name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}
	gear.wsd_jse_back = 	{name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	-- Fast Cast
	gear.FC_jse_back = 		{name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	
    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind !` input /ra <t>')
    send_command('bind !- gs c cycle targetmode')
	send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f10 gs c toggle AmbushMode')
	send_command('bind ^backspace gs c weapons Throwing;gs c update')
	send_command('bind !backspace input /ja "Hide" <me>')
	send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind ^\\\\ input /ja "Despoil" <t>')
	send_command('bind !\\\\ input /ja "Mug" <t>')

    select_default_macro_book()
	user_job_lockstyle()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------
	
	-- Weapon Sets
	sets.weapons.None = {main="Aeneas",sub="Taming Sari"}
	sets.weapons.Sword = {main="Naegling",sub="Blurred Knife +1"}
	sets.weapons.MagicWeapons = {main="Aeneas",sub="Malevolence"}
	sets.weapons.Throwing = {main="Tauret",sub="Blurred Knife +1", range="Raider's Bmrng."}

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {hands="Plun. Armlets", waist="Chaac Belt",feet="Skulk. Poulaines +1"})
    sets.ExtraRegen = {}
    sets.Kiting = {lring="Shneddick Ring"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}-- head="Frenzy Sallet"
	
    sets.buff['Sneak Attack'] = {}
    sets.buff['Trick Attack'] = {}
		
    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {back="Repulse Mantle"}
	sets.Suppa = {ear1="Brutal Earring", ear2="Suppanomimi"}	
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {hands="Floral Gauntlets", ear1="Dudgeon Earring",ear2="Heartseeker Earring",}--body="Adhemar Jacket +1",waist="Reiki Yotai"
	sets.Ambush = {body="Plunderer's Vest +1"}
	
	-- Actions we want to use to tag TH.
    sets.precast.Step = {ammo="Hasty Pinion +1",
		-- Malignance Chapeau rear="Telos Earring",
		head="Mummu Bonnet +2", neck="Sanctity Necklace", lear="Sherida Earring", rear="Suppanomimi",
		-- Malignance Tabard Malignance Gloves
		body="Mummu Jacket +2", hands="Mummu Wrists +2", lring="Regal Ring", rring="Ilabrat Ring",
		-- Malignance Tights Malignance Boots
		back=gear.stp_jse_back, waist="Kentarch Belt +1", legs="Malignance Tights", feet="Mummu Gamash. +2"}

    sets.precast.JA['Violent Flourish'] = {ammo="Hasty Pinion +1",
		-- Malignance Chapeau rear="Telos Earring",
		head="Mummu Bonnet +2", neck="Sanctity Necklace", lear="Sherida Earring", rear="Suppanomimi",
		-- Malignance Tabard Malignance Gloves
		body="Mummu Jacket +2", hands="Mummu Wrists +2", lring="Regal Ring", rring="Ilabrat Ring",
		--  Malignance Boots
		back=gear.stp_jse_back, waist="Kentarch Belt +1", legs="Malignance Tights", feet="Mummu Gamash. +2"}

	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] 	=	{head="Skulker's Bonnet +1"}
    sets.precast.JA['Accomplice'] 		= 	{head="Skulker's Bonnet +1"}
    sets.precast.JA['Flee'] 			=	{feet="Pill. Poulaines +2"}
    sets.precast.JA['Hide'] 			= 	{body="Pillager's Vest +2"}
    sets.precast.JA['Conspirator'] 		= 	{body="Skulker's Vest"}
    sets.precast.JA['Steal'] 			= 	{hands="Pill. Armlets +1"}
	sets.precast.JA['Mug'] 				= 	{}
    sets.precast.JA['Despoil'] 			= 	{legs="Skulk. Culottes +1", feet="Skulk. Poulaines +1"}
    sets.precast.JA['Perfect Dodge'] 	=	{hands="Plun. Armlets"}
    sets.precast.JA['Feint']		 	= 	{legs="Plun. Culottes +1"} 

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",}-- body="Passion Jacket", ring1="Asklepian Ring"
		
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {
		head="Haruspex Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body=gear.taeon_body_Fastcast, hands="Leyline Gloves", lring="Prolix Ring", rring="Kishar Ring",
		back=gear.FC_jse_back, waist="Sarissapho. Belt", legs="Malignance Tights",}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",})--body="Passion Jacket"

    -- Ranged snapshot gear
    sets.precast.RA = {feet="Meg. Jam. +2"}
			
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Seething Bomblet",
		-- Rep. Plat. Medal
		head="Nyame Helm", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {aammo="Seething Bomblet",
		-- Rep. Plat. Medal
		head="Nyame Helm", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
	
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS.Acc, {ammo="Seething Bomblet",
		-- Rep. Plat. Medal
		head="Nyame Helm", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})

    
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
		
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})

	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
	
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
		
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
	
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
		
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
	
    sets.precast.WS["Mandalic Stab"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Mandalic Stab"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Mandalic Stab"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Mandalic Stab"].Fodder = set_combine(sets.precast.WS["Mandalic Stab"], {})
    sets.precast.WS["Mandalic Stab"].SA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {})
    sets.precast.WS["Mandalic Stab"].TA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {})
    sets.precast.WS["Mandalic Stab"].SATA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {})
    sets.precast.WS["Shark Bite"].SA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {})
    sets.precast.WS["Shark Bite"].TA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {})
    sets.precast.WS["Shark Bite"].SATA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
		
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
    sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Fodder, {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Ilabrat Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
	
	-- Sword 
	sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {ammo="Seething Bomblet",
        -- Pill. Bonnet +4 Rep. Plat. Medal Moonshade Earring Sherida Earring
		head="Nyame Helm",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
        -- Skulker's Vest +4 Beithir Ring
		body="Nyame Mail",hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Rufescent Ring",
        back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"})
    sets.precast.WS["Savage Blade"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Seething Bomblet",
		 -- Pill. Bonnet +4 Rep. Plat. Medal Moonshade Earring Sherida Earring
		head="Nyame Helm",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
        -- Skulker's Vest +4 Beithir Ring
		body="Nyame Mail",hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Rufescent Ring",
        back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"})
    sets.precast.WS["Savage Blade"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Seething Bomblet",
		 -- Pill. Bonnet +4 Rep. Plat. Medal Moonshade Earring Sherida Earring
		head="Nyame Helm",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
        -- Skulker's Vest +4 Beithir Ring
		body="Nyame Mail",hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Rufescent Ring",
        back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"})
	sets.precast.WS["Savage Blade"].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Seething Bomblet",
		 -- Pill. Bonnet +4 Rep. Plat. Medal Moonshade Earring Sherida Earring
		head="Nyame Helm",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
        -- Skulker's Vest +4 Beithir Ring
		body="Nyame Mail",hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Rufescent Ring",
        back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"})
    sets.precast.WS["Savage Blade"].Fodder = set_combine(sets.precast.WS["Savage Blade"], {ammo="Seething Bomblet",
		-- Pill. Bonnet +4 Rep. Plat. Medal Moonshade Earring Sherida Earring
		head="Nyame Helm",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
        -- Skulker's Vest +4 Beithir Ring
		body="Nyame Mail",hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Rufescent Ring",
        back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"})
    
	sets.precast.WS["Savage Blade"].SA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Seething Bomblet",
		 -- Pill. Bonnet +4 Rep. Plat. Medal Moonshade Earring Sherida Earring
		head="Nyame Helm",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
        -- Skulker's Vest +4 Beithir Ring
		body="Nyame Mail",hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Rufescent Ring",
        back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"})
    sets.precast.WS["Savage Blade"].TA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Seething Bomblet",
		 -- Pill. Bonnet +4 Rep. Plat. Medal Moonshade Earring Sherida Earring
		head="Nyame Helm",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
        -- Skulker's Vest +4 Beithir Ring
		body="Nyame Mail",hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Rufescent Ring",
        back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"})
    sets.precast.WS["Savage Blade"].SATA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Seething Bomblet",
		 -- Pill. Bonnet +4 Rep. Plat. Medal Moonshade Earring Sherida Earring
		head="Nyame Helm",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
        -- Skulker's Vest +4 Beithir Ring
		body="Nyame Mail",hands="Nyame Gauntlets", ring1="Regal Ring", ring2="Rufescent Ring",
        back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"})
    
	sets.precast.WS['Last Stand'] = {}

    sets.precast.WS['Aeolian Edge'] = {ammo="Seething Bomblet",
		head="Nyame Helm", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Friomisi Earring",
		-- Epaminodas's Ring 
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Dingir Ring", rring="Shiva Ring",
		back=gear.wsd_jse_back, waist="Orpheus's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}
		
    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {}

    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {neck="Magoraga Beads"})--back="Mujin Mantle"

	sets.midcast['Absorb-TP'] = sets.precast.JA['Violent Flourish']

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	


    -- Ranged gear
    sets.midcast.RA = {
		-- Malignance Chapeau
        head="Nyame Helm", neck="Sanctity Necklace", lear="Enervating Earring", rear="Neritic Earring",
		-- Malignance Tabard Malignance Gloves
        body="Nyame Mail",hands="Nyame Gauntlets", lring="Regal Ring", rring="Dingir Ring",
		-- Malignance Boots
		back=gear.stp_jse_back, waist="Yemaya Belt",legs="Malignance Tights",feet="Nyame Sollerets"}

    sets.midcast.RA.Acc = {
		-- Malignance Chapeau
        head="Nyame Helm", neck="Sanctity Necklace", lear="Enervating Earring", rear="Neritic Earring",
		-- Malignance Tabard Malignance Gloves
        body="Nyame Mail",hands="Nyame Gauntlets", lring="Regal Ring", rring="Dingir Ring",
		-- Malignance Boots
		back=gear.stp_jse_back, waist="Yemaya Belt",legs="Malignance Tights",feet="Nyame Sollerets"}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {ammo="Staunch Tahtlum",
		-- Malignance Chapeau
		head="Nyame Helm", neck="Loricate Torque +1", lear="Genmei Earring", rear="Etiolation Earring",
		-- Malignance Tabard Malignance Gloves
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		--  Malignance Boots
		back=gear.stp_jse_back, waist="Carrier's Sash", legs="Malignance Tights", feet="Nyame Sollerets"}

    sets.idle.Sphere = set_combine(sets.idle, {})--body="Mekosu. Harness"

    sets.idle.Weak = set_combine(sets.idle, {})

	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Defense sets
    sets.defense.PDT = {--ammo="Staunch Tahtlum",
		-- head="Malignance Chapeua", lear="Odnowa Earring +1",
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		-- Malignance Tabard Malignance Gloves 
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Moonbeam Ring", rring="Defending Ring",
		-- Malignance Tights Malignance Boots
		back=gear.stp_jse_back, waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}

    sets.defense.MDT = {--ammo="Staunch Tahtlum",
		-- head="Malignance Chapeua", lear="Odnowa Earring +1",
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Merman's Earring", rear="Etiolation Earring",
		-- Malignance Tabard Malignance Gloves 
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Moonbeam Ring", rring="Defending Ring",
		-- Malignance Tights Malignance Boots
		back=gear.stp_jse_back, waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}

	sets.defense.MEVA = {--ammo="Staunch Tahtlum",
		-- head="Malignance Chapeua", lear="Odnowa Earring +1",
		head="Meghanada Visor +2", neck="Warder's Charm +1", lear="Merman's Earring", rear="Etiolation Earring",
		-- Malignance Tabard Malignance Gloves 
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Moonbeam Ring", rring="Defending Ring",
		-- Malignance Tights Malignance Boots
		back=gear.stp_jse_back, waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
    sets.engaged = {
		--  rear="Dedition Earring",
		head="Mummu Bonnet +2", neck="Anu Torque", lear="Sherida Earring", rear="Suppanomimi",
		-- body="Pillager's Vest +3", hands="Adhemar Wrist. +1", lring="Epona's Ring", rring="Hetairoi Ring",
		body="Pillager's Vest +2", hands="Mummu Wrists +2", lring="Regal Ring", rring="Epona's Ring",
		-- waist="Reiki Yotai", feet="Plun. Poulaines +3"
		back=gear.stp_jse_back, waist="Patentia Sash", legs="Samnuha Tights", feet="Mummu Gamash. +2"}

 	sets.engaged.Acc = {
		head="Mummu Bonnet +2", neck="Sanctity Necklace", lear="Sherida Earring", rear="Suppanomimi",
		body="Mummu Jacket +2", hands="Mummu Wrists +2", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.stp_jse_back, waist="Patentia Sash", legs="Pill. Culottes +3", feet="Meg. Jam. +2"}

    sets.engaged.FullAcc = {
		head="Mummu Bonnet +2", neck="Sanctity Necklace", lear="Sherida Earring", rear="Suppanomimi",
		body="Mummu Jacket +2", hands="Mummu Wrists +2", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.stp_jse_back, waist="Patentia Sash", legs="Pill. Culottes +3", feet="Meg. Jam. +2"}

    sets.engaged.Fodder = {
		head="Mummu Bonnet +2", neck="Anu Torque", lear="Sherida Earring", rear="Suppanomimi",
		body="Mummu Jacket +2", hands="Mummu Wrists +2", lring="Rajas Ring", rring="Epona's Ring",
		back=gear.stp_jse_back, waist="Patentia Sash", legs="Pill. Culottes +3", feet="Mummu Gamash. +2"}

    sets.engaged.PDT = {
		-- Malignance Chapeau
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Sherida Earring", rear="Suppanomimi",
		-- Malignance Tabard Malignance Gloves
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Moonbeam Ring", rring="Defending Ring",
		-- Malignance Tights Malignance Boots
		back=gear.dw_jse_back, waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}

    sets.engaged.Acc.PDT = {
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Sherida Earring", rear="Suppanomimi",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.dw_jse_back, waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}

    sets.engaged.FullAcc.PDT = {
        head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Sherida Earring", rear="Suppanomimi",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.dw_jse_back, waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}

    sets.engaged.Fodder.PDT = {
		head="Meghanada Visor +2", neck="Loricate Torque +1", lear="Sherida Earring", rear="Suppanomimi",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Moonbeam Ring", rring="Defending Ring",
		back=gear.dw_jse_back, waist="Flume Belt", legs="Mummu Kecks +2", feet="Meg. Jam. +2"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(3, 5)
    elseif player.sub_job == 'WAR' then
        set_macro_page(2, 5)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 5)
    else
        set_macro_page(3, 5)
    end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 005')
end

function job_setup()

	state.Buff['Sneak Attack'] = buffactive['Sneak Attack'] or false
	state.Buff['Trick Attack'] = buffactive['Trick Attack'] or false
	state.Buff['Feint'] = buffactive['Feint'] or false

	autows = "Rudra's Storm"
	rangedautows = "Last Stand"
	autofood = 'Soy Ramen'

	init_job_states({"Capacity","AutoFoodMode","AutoTrustMode","AutoWSMode","AutoJumpMode","AutoShadowMode","AutoStunMode","AutoDefenseMode"},{"AutoBuffMode","AutoSambaMode","AutoRuneMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","TreasureMode",})
end


--Dynamis Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[936] == 0 and not have_trust("Karaha-Baruha") then
					windower.send_command('input /ma "Karaha-Baruha" <me>')
					return true
				elseif spell_recasts[952] == 0 and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					return true
				elseif spell_recasts[914] == 0 and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					return true
				elseif spell_recasts[989] == 0 and not have_trust("KingofHearts") then
					windower.send_command('input /ma "King of Hearts" <me>')
					return true
				elseif spell_recasts[968] == 0 and not have_trust("Adelheid") then
					windower.send_command('input /ma "Adelheid" <me>')
					return true
				else
					return false
				end
			end
		end
	end
	return false
end