-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc','Low','Mid','Max')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT','Refresh')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','DualRangedWeapons', 'SavageWeapons', 'DualWeapons', 'LeadenWeapons', 'RollMeleeWeapons', 'RollRangedWeapons', 'None')
	
    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Chrono Bullet" -- For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Animikii Bullet"
    options.ammo_warning_limit = 15

	-- Snapshot int eve mag eva
	gear.snapshot_jse_back = 	{name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Mag. Evasion+15',}}
	-- Ranged TP
	gear.tp_ranger_jse_back =	{name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}}
	-- Crit RA TP
	gear.crit_ranger_jse_back= 	{name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}}
	-- Last Stand/Wildfire
	gear.ranger_wsd_jse_back = 	{name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	-- Leaden
	gear.magic_wsd_jse_back = 	{name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}	
	-- Melee TP/DA/Evis
	gear.tp_jse_back = 			{name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Mag. Evasion+15',}}
	-- DW
	gear.DW_jse_back = 			{name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	-- Savage Blade
	gear.str_wsd_jse_back = 	{name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Mag. Evasion+15',}}
	-- - Quick Draw
	gear.magic_QD_jse_back = 	gear.tp_ranger_jse_back
	-- Fast Cast 
	gear.FC_jse_back = 			{name="Camulus's Mantle", augments={'MP+60','"Fast Cast"+10',}}
	
    -- Additional local binds
	send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	send_command('bind !r gs c weapons SingleWeapon;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons DualRangedWeapons;gs c update')
	send_command('bind !q gs c weapons SavageWeapons;gs c update')
	send_command('bind @pause roller roll')

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
	sets.precast.JA['Triple Shot'] = {body="Navarch's Frac +1", hands="Lanun Gants +1"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +1"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +1"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +1"}
    
    sets.precast.CorsairRoll = {main=gear.Rostam_PathC, ammo="Compensator",
		--  Odnowa Earring +1
		head="Lanun Tricorne +1", neck="Regal Necklace", lear="Etiolation Earring", rear="Genmei Earring",
		body="Nyame Mail", hands="Nvrch. Gants +1", lring="Gelatinous Ring +1", rring="Defending Ring",
		back=gear.snapshot_jse_back, waist="Carrier's Sash", legs="Malignance Tights", feet="Nyame Sollerets"}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Navarch's Bottes"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Navarch's Tricorne"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Navarch's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Nvrch. Gants +1"})
    
	-- Quick Draw
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
		-- Comm. Charm +2 Crematio Earring
		head="Nyame Helm", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Novio Earring",
		-- Lanun Frac +3 Carmine Fin. Ga. +1 Fenrir Ring +1
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Regal Ring", rring="Dingir Ring",
		--  Lanun Boots +3
		back=gear.magic_QD_jse_back, waist="Eschan Stone", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	
	-- STP 
    sets.precast.CorsairShot.STP = {ammo=gear.QDbullet,
		-- head"Ikenga Hat"  lear="Crep. Earring", rear="Dedition Earring"
		head="Nyame Helm", neck="Iskur Gorget", lear="Neritic Earring", rear="Telos Earring",
		-- body="Malignance Tabard", hands="Malignance Gloves", lring="Crep. Ring", rring="Chirich Ring +1",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Ilabrat Ring", rring="Petrov Ring",
		-- waist="Gerdr Belt +1", feet="Malignance Boots"
		back=gear.magic_QD_jse_back, waist="Yemaya Belt", legs="Malignance Tights", feet="Nyame Sollerets"}
	
	-- Acc 
    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
		-- Laksa. Tricorne +3 , neck="Comm. Necklace +2" lear="Crep. Earring", rear="Comm. Earring +2"
		head="Nyame Helm", neck="Combatant's Torque", rear="Gwati Earring",
		-- Ikenga's Vest Laksa. Gants +3
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Regal Ring", rring="Stikini Ring",
		-- waist="Kwahu Kachina Belt", Ikenga's Trousers Laksa. Bottes +3
		back=gear.magic_QD_jse_back, waist="Yemaya Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	-- for ws bonus
    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {})-- feet="Chasseur's Bottes +1"
	
	sets.precast.CorsairShot['Fire Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {}) -- feet="Chasseur's Bottes +1"
			
	-- to Prevent Damage overkill
	sets.precast.CorsairShot.Proc = {ammo=gear.QDbullet,
		-- Comm. Charm +2 Crematio Earring
		head="Nyame Helm", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Novio Earring",
		-- Lanun Frac +3 Carmine Fin. Ga. +1 Fenrir Ring +1
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Regal Ring", rring="Dingir Ring",
		--  Lanun Boots +3
		back=gear.magic_QD_jse_back, waist="Eschan Stone", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	sets.Self_Waltz = {ring1="Asklepian Ring"} -- head="Mummu Bonnet +2",
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells    
    sets.precast.FC = {
		-- head="Carmine Mask +1", neck="Orunmila's Torque", lear="Enchntr Earring +1", rear="Loquac. Earring",
		head="Haruspex Hat", neck="Voltsurge Torque", lear="Loquac. Earring",  rear="Enchntr. Earring +1",
		-- Rahab Ring
		body=gear.taeon_body_Fastcast, hands="Leyline Gloves", lring="Kishar Ring", rring="Prolix Ring",
		-- legs="Taeon Tights", 
		back=gear.FC_jse_back, waist="Sarissapho. Belt", feet="Carmine Greaves +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",}) --  Passion Jacket
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Snapshot Sets
    sets.precast.RA = {ammo=gear.RAbullet,
		-- neck="Comm. Charm +2
		head=gear.taeon_head_Snapshot,
		body="Laksa. Frac", hands="Carmine Fin. Ga. +1",
		back=gear.snapshot_jse_back, waist="Impulse Belt", legs="Laksa. Trews +3", feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
		-- neck="Comm. Charm +2
		head=gear.taeon_head_Snapshot,
		body="Laksa. Frac", hands="Carmine Fin. Ga. +1",
		back=gear.snapshot_jse_back, waist="Impulse Belt", legs="Laksa. Trews +3", feet="Meg. Jam. +2"})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {
		-- neck="Comm. Charm +2
		head=gear.taeon_head_Snapshot,
		body="Laksa. Frac", hands="Carmine Fin. Ga. +1",
		back=gear.snapshot_jse_back, waist="Impulse Belt", legs="Laksa. Trews +3", feet="Meg. Jam. +2"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		-- rear="Ishvara Earring",
		head="Nyame Helm", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		-- lring="Cornelia's Ring", rring="Epaminondas's Ring", 
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Regal Ring", rring="Epona's Ring",
		--  Salifi Belt +1
		back=gear.magic_wsd_jse_back, waist="Wanion Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	
    sets.precast.WS.Acc = {
		-- rear="Ishvara Earring",
		head="Nyame Helm", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		-- lring="Cornelia's Ring", rring="Epaminondas's Ring", 
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Regal Ring", rring="Epona's Ring",
		--  Salifi Belt +1
		back=gear.magic_wsd_jse_back, waist="Wanion Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    sets.precast.WS.Proc = {
		-- rear="Ishvara Earring",
		head="Nyame Helm", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		-- lring="Cornelia's Ring", rring="Epaminondas's Ring", 
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Regal Ring", rring="Epona's Ring",
		--  Salifi Belt +1
		back=gear.magic_wsd_jse_back, waist="Wanion Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    -- Melee
	
	sets.precast.WS['Evisceration'] = {
		--head="Blistering Sallet +1", 
		head="Nyame Helm", neck="Caro Necklace", lear="Odr Earring", rear="Moonshade Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Ilabrat Ring", rring="Regal Ring",
		back=gear.tp_jse_back, waist="Breeze Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
		-- neck="Fotia Belt", neck="Rep. Plat. Medal",
		head="Nyame Helm", neck="Caro Necklace", lear="Moonshade Earring", rear="Telos Earring",
		-- hands="Chasseur's Gants +3", lring="Rufescent ring", rring="Epaminondas's Ring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Regal Ring", rring="Epona's Ring",
		-- Fotia Belt 
		back=gear.tp_jse_back, waist="Soil Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"})

	-- Savage Blade
	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
		-- ammko="Bayeux Bullet"
		-- rear="Ishvara Earring",
		head="Nyame Helm", neck="Rep. Plat. Medal", lear="Moonshade Earring", rear="Steelflash Earring",
		-- hands="Chasseur's Gants +3", rring="Epaminondas's Ring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Regal Ring", rring="Epona's Ring",
		-- Salifi Belt +1
		back=gear.str_wsd_jse_back, waist="Kentarch Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
		-- ammko="Bayeux Bullet"
		-- rear="Ishvara Earring",
		head="Nyame Helm", neck="Rep. Plat. Medal", lear="Moonshade Earring", rear="Steelflash Earring",
		-- hands="Chasseur's Gants +3", rring="Epaminondas's Ring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Regal Ring", rring="Epona's Ring",
		-- Salifi Belt +1
		back=gear.str_wsd_jse_back, waist="Kentarch Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	--Ranged Weaponskill
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
		-- head="Lanun Tricorne +3", rear="Ishvara Earring"
		head="Nyame Helm", neck="Fotia Gorget", lear="Moonshade Earring", rear="Enervating Earring",
		-- body="Ikenga's Vest", hands="Chasseur's Gants +3", lring="Epaminondas's Ring", 
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Regal Ring", rring="Dingir Ring", 
		-- feet="Lanun Boots +3"
		back=gear.ranger_wsd_jse_back, waist="Fotia Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
		-- head="Lanun Tricorne +3", rear="Ishvara Earring"
		head="Nyame Helm", neck="Fotia Gorget", lear="Moonshade Earring", rear="Enervating Earring",
		-- body="Ikenga's Vest", hands="Chasseur's Gants +3", lring="Epaminondas's Ring", 
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Regal Ring", rring="Dingir Ring", 
		-- feet="Lanun Boots +3"
		back=gear.ranger_wsd_jse_back, waist="Fotia Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
		--head="Pixie Hairpin +1", neck="Comm. Neck +2", 
		head="Nyame Helm", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Moonshade Earring",
		-- Lanun Frac +3  rring="Archon Ring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Dingir Ring", rring="Archon Ring",
		-- Svelt. Gouriz +1
		back=gear.magic_wsd_jse_back, waist="Shadow Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    sets.precast.WS['Leaden Salute'].Acc = {ammo=gear.MAbullet,
		--head="Pixie Hairpin +1", neck="Comm. Neck +2", 
		head="Nyame Helm", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Moonshade Earring",
		-- Lanun Frac +3  rring="Archon Ring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Dingir Ring", rring="Archon Ring",
		-- Svelt. Gouriz +1
		back=gear.magic_wsd_jse_back, waist="Shadow Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
		-- neck="Comm. Neck +2", rear="Crematio Earring",
		head="Nyame Helm", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Moonshade Earring",
		-- Lanun Frac +3  rring="Epaminondas's Ring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Dingir Ring", rring="Archon Ring",
		-- Skrymir Cord +1 Lanun Boots +3
		back=gear.magic_wsd_jse_back, waist="Eschan Stone", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
		-- neck="Comm. Neck +2", rear="Crematio Earring",
		head="Nyame Helm", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Moonshade Earring",
		-- Lanun Frac +3  rring="Epaminondas's Ring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Dingir Ring", rring="Archon Ring",
		-- Skrymir Cord +1 Lanun Boots +3
		back=gear.magic_wsd_jse_back, waist="Eschan Stone", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
	
	--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
        
    -- Specific spells

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {}--neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"
	sets.Cure_Received = {}--neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"
	sets.Self_Refresh = {}--waist="Gishdubar Sash"
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
		-- lear="Telos Earring", 
		head="Meghanada Visor +2", neck="Iskur Gorget", lear="Neritic Earring",rear="Enervating Earring",
		-- Nisroch Jerkin  Adhemar Wristbands +1 Path C
		body="Laksa. Frac", hands="Meg. Gloves +2", lring="Ilabrat Ring", rring="Dingir Ring", 
		-- legs="Adhemar Kecks +1", Path C Feet="Adhemar Gamashes +1" Path D
		back=gear.tp_ranger_jse_back, waist="Yemaya Belt", legs="Meg. Chausses +2", feet="Adhemar Gamashes"}
	
    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
		-- lear="Telos Earring", 
		head="Meghanada Visor +2", neck="Iskur Gorget", lear="Neritic Earring",rear="Enervating Earring",
		body="Laksa. Frac", hands="Meg. Gloves +2", lring="Ilabrat Ring", rring="Regal Ring",
		-- legs="Adhemar Kecks +1", 
		back=gear.tp_ranger_jse_back, waist="Yemaya Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
		
	 sets.midcast.RA.Crit = {ammo=gear.RAbullet,
		-- lear="Telos Earring", 
		head="Meghanada Visor +2", neck="Iskur Gorget", lear="Neritic Earring",rear="Enervating Earring",
		-- rring="Hajduk Ring", 
		body="Laksa. Frac", hands="Meg. Gloves +2", lring="Ilabrat Ring", rring="Regal Ring",
		-- legs="Adhemar Kecks +1", 
		back=gear.tp_ranger_jse_back, waist="Yemaya Belt", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
	
	sets.buff['Triple Shot'] = {
		-- head="Oshosi Mask +1", 
		head="Meghanada Visor +2",
		-- Lanun Gants +3 Oshosi Gloves
		body="Navarch's Frac +1", hands="Meg. Gloves +2", 
		-- legs="Oshosi Trousers +1", Feet="Oshosi Leggings +1",
		back=gear.tp_ranger_jse_back, legs="Meg. Chausses +2", feet="Adhemar Gamashes"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Nyame Helm", neck="Loricate Torque +1", lear="Etiolation Earring", rear="Eabani Earring",
		-- Raetic Bangles +1
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- back="Moonbeam Cape", Plat. Mog Belt  Herc feet DT
		back=gear.snapshot_jse_back, waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
        head="Nyame Helm", neck="Loricate Torque +1", lear="Etiolation Earring", rear="Eabani Earring",
		-- Raetic Bangles +1
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- back="Moonbeam Cape", Plat. Mog Belt  Herc feet DT
		back=gear.snapshot_jse_back, waist="Flume Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Nyame Helm", neck="Loricate Torque +1", lear="Etiolation Earring", rear="Eabani Earring",
		-- Raetic Bangles +1
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- back="Moonbeam Cape", Plat. Mog Belt
		back=gear.snapshot_jse_back, waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    sets.defense.MDT = {ammo=gear.RAbullet,
        head="Nyame Helm", neck="Loricate Torque +1", lear="Etiolation Earring", rear="Eabani Earring",
		-- Raetic Bangles +1
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- back="Moonbeam Cape", Plat. Mog Belt  Herc feet DT
		back=gear.snapshot_jse_back, waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	
    sets.defense.MEVA = {ammo=gear.RAbullet,
        head="Nyame Helm", neck="Loricate Torque +1", lear="Etiolation Earring", rear="Eabani Earring",
		-- Raetic Bangles +1
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- back="Moonbeam Cape", Plat. Mog Belt  Herc feet DT
		back=gear.snapshot_jse_back, waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}
			
    sets.Kiting = {lring="Shneddick Ring"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	--Weapon Sets
	-- 'Default','DualRangedWeapons', 'SavageWeapons', 'DualWeapons', 'LeadenWeapons', 'RollMeleeWeapons', 'RollRangedWeapons', 'None')
	-- Fencer Last Stand Rostam
	sets.weapons.Default = {main="Kustawi +1",sub="Nusku Shield",range="Fomalhaut"}--
	-- Last Stand Dual Ranged
	sets.weapons.DualRangedWeapons = {main="Kustawi +1",sub="Kaja Knife",range="Fomalhaut"}
	-- Fencer Savage 
	sets.weapons.SavageWeapons = {main="Naegling",sub="Nusku Shield", range="Fomalhaut"}--range="Ataktos"
	-- DW Savage
	sets.weapons.DualWeapons = {main="Naegling",sub="Blurred Knife +1",range="Fomalhaut"}--range="Ataktos"
	-- Leaden/Wildfire  Rostam Path A
	sets.weapons.LeadenWeapons = {main="Naegling",sub="Kaja Knife",range="Fomalhaut"}--range="Fomalhaut"
	-- Rolling
	sets.weapons.RollMeleeWeapons = {main=gear.Rostam_PathC, sub="Blurred Knife +1",range="Compensator"}
	sets.weapons.RollRangedWeapons = {main=gear.Rostam_PathC,sub="Nusku Shield", range="Compensator"}
	
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",}--body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"

    -- Engaged sets
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
	-- Single Weapon
    sets.engaged = {
		-- head="Adhemar Bonnet +1"  rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Iskur Gorget", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1"
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Petrov Ring", rring="Epona's Ring",
		--  feet="Herculean Boots", TA
		back=gear.tp_jse_back, waist="Windbuffet Belt", legs="Samnuha Tights", feet="Meg. Jam. +2"}

    sets.engaged.Acc = {
		-- head="Dampening Tam" neck="Combatant's Torque", lear="Mache Earring", rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Iskur Gorget", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1" rring="Chirich Ring +1",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Petrov Ring", rring="Epona's Ring",
		-- waist="Olseni Belt",
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}
	
	 sets.engaged.Low = {
		-- head="Dampening Tam" neck="Combatant's Torque", lear="Mache Earring", rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1"  rring="Chirich Ring +1",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2",lring="Petrov Ring", rring="Epona's Ring",
		-- waist="Olseni Belt", 
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

	sets.engaged.Mid = {
		-- head="Dampening Tam" neck="Combatant's Torque", lear="Mache Earring", rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1" rring="Chirich Ring +1",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Petrov Ring", rring="Epona's Ring",
		-- waist="Olseni Belt", 
		back=gear.tp_jse_back, waist="Kentarch Belt +1",legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

	sets.engaged.Max = {
		-- head="Dampening Tam" neck="Combatant's Torque", lear="Mache Earring", rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1" rring="Chirich Ring +1",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Petrov Ring", rring="Epona's Ring",
		-- waist="Olseni Belt", 
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

    sets.engaged.DW = {
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Heartseeker Earring", rear="Dudgeon Earring",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Ramuh Ring",
		back=gear.DW_jse_back, waist="Kentarch Belt +1", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}

    sets.engaged.DW.Acc = {
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Heartseeker Earring", rear="Dudgeon Earring",
		-- Adhemar Jacket +1
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Cacoethic Ring", rring="Ramuh Ring",
		back=gear.DW_jse_back, waist="Kentarch Belt +1", legs="Meg. Chausses +2", feet="Meg. Jam. +2"}
	
	sets.engaged.DW.Low = {
		-- head="Dampening Tam" neck="Combatant's Torque", lear="Mache Earring", rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1"  rring="Chirich Ring +1",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Petrov Ring", rring="Epona's Ring",
		-- waist="Olseni Belt", 
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

	sets.engaged.DW.Mid = {
		-- head="Dampening Tam" neck="Combatant's Torque", lear="Mache Earring", rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1" rring="Chirich Ring +1",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Petrov Ring", rring="Epona's Ring",
		-- waist="Olseni Belt", 
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}

	sets.engaged.DW.Max = {
		-- head="Dampening Tam" neck="Combatant's Torque", lear="Mache Earring", rear="Cessance Earring"
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Suppanomimi",
		-- body="Herculean Vest", hands="Adhemar Wrist. +1" lring="Petrov Ring", rring="Chirich Ring +1",
		body="Meg. Cuirie +2", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epona's Ring",
		-- waist="Olseni Belt", 
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Carmine Cuisses +1", feet="Meg. Jam. +2"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 10)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 10)
    elseif player.sub_job == 'WAR' then
        set_macro_page(3, 10)
	elseif player.sub_job == 'RNG' then
        set_macro_page(4, 10)
    else
        set_macro_page(1, 10)
    end   
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 010')
end

function job_setup()
	-- Whether to use Compensator under a certain threshhold even when weapons are locked.
	state.CompensatorMode = M{'Never','300','1000','Always'}
	-- Whether to automatically generate bullets.
	state.AutoAmmoMode = M(true,'Auto Ammo Mode')
	state.UseDefaultAmmo = M(true,'Use Default Ammo')
	state.Buff['Triple Shot'] = buffactive['Triple Shot'] or false

	-- Whether to use Luzaf's Ring
	state.LuzafRing = M(true, "Luzaf's Ring")
    -- Whether a warning has been given for low ammo
	
	autows = 'Savage Blade'
	rangedautows = 'Last Stand'
	autofood = 'Sublime Sushi'
	ammostock = 198

    define_roll_values()
	
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","RngHelper","AutoStunMode","AutoDefenseMode","LuzafRing",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","RangedMode","WeaponskillMode","ElementalMode","IdleMode","Passive","RuneElement","CompensatorMode","TreasureMode",})
end

