-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc','Low','Mid','Max')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT','Refresh')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('None','Sword', 'Dagger', 'RangedWeapons','DualRangedWeapons', 'DualLeaden', 'DualWildfire', 'DualHotShot', 'DualWeapons', 'DualDaggers', 'AeolianEdge','RollMeleeWeapons', 'RollRangedWeapons')
	
	-- Ammo 
    gear.RAbullet = "Chrono Bullet" 
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Chrono Bullet" -- For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Hauksbok Bullet"
    options.ammo_warning_limit = 15

	-- Snapshot
	gear.snapshot_jse_back = 	{name="Camulus's Mantle", augments={'"Snapshot"+10',}}	
	-- Ranged TP - need dyes
	gear.tp_ranger_jse_back =	{name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10','Damage taken-5%',}}
	-- Crit RA TP - augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}}
	gear.crit_ranger_jse_back= 	{name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10','Damage taken-5%',}}
	-- Last Stand augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	gear.ranger_wsd_jse_back = 	{name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
	-- Leaden/Wildfire
	gear.magic_wsd_jse_back = 	{name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}	
	-- Melee TP
	gear.tp_jse_back = 			{name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}}
	-- DW
	gear.DW_jse_back = 			{name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}}
	-- Savage Blade
	gear.str_wsd_jse_back = 	{name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
	-- Quick Draw
	gear.magic_QD_jse_back = 	{name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}}
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

	send_command('bind !r gs c weapons SingleWeapoterB1n;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons DualRangedWeapons;gs c update')
	send_command('bind !q gs c weapons Sword;gs c update')
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
	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1", hands="Lanun Gants +3"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +3"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +3"}
    
    sets.precast.CorsairRoll = {main=Rostam_PathC, range="Compensator",
		head="Lanun Tricorne +3", neck="Regal Necklace", lear="Etiolation Earring", rear="Odnowa Earring +1",
		body="Malignance Tabard", hands="Chasseur's Gants +1", ring1="Luzaf Ring", ring2="Defending Ring",
		--  Plat. Mog. Belt legs="Desultor Tassets"
		back=gear.tp_jse_back, waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}

    sets.precast.LuzafRing = {ring1="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chass. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
    
	-- Quick Draw
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
		--head="Nyame Helm", Baetyl Necklace rear="Crematio Earring"
		head="Laksa. Tricorne +3", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Hecate's Earring",
		-- ring1="Dingir Ring", ring2="Fenrir Ring +1"
		body="Lanun Frac +3",  hands="Carmine Fin. Ga. +1", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- Skymir Cord +1 Nyame Flanchard 
		back=gear.magic_QD_jse_back, waist="Aquiline Belt", legs="Laksa. Trews +3", feet="Lanun Bottes +3"}
	
	-- STP 
    sets.precast.CorsairShot.STP = {ammo=gear.QDbullet,
		-- neck="Iskur Gorget" lear="Dedition Earring", 
		head="Malignance Chapeau", neck="Combatant's Torque", lear="Volley Earring", rear="Telos Earring",
		-- hands="Malignance Gloves",
		body="Malignance Tabard", hands="Pursuer's Cuffs", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Sweordfaetels +1", 
		back=gear.magic_QD_jse_back, waist="Aquiline Belt", legs="Malignance Tights", feet="Malignance Boots"}
	
	-- Acc 
    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
		--  lear="Digni. Earring", 
		head="Laksa. Tricorne +3", neck="Comm. Charm +2", lear="Telos Earring", rear="Gwati Earring",
		-- rring="Regal Ring",
		body="Malignance Tabard", hands="Laksa. Gants +3", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.magic_QD_jse_back, waist="K. Kachina Belt +1",  legs="Malignance Tights", feet="Laksa. Bottes +3"}

	-- for ws bonus
    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {})
	
	sets.precast.CorsairShot['Fire Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {})
			
	-- to Prevent Damage overkill
	sets.precast.CorsairShot.Proc = {ammo=gear.RAbullet,
		head="Laksa. Tricorne +3", neck="Sanctity Necklace", lear="Telos Earring", rear="Gwati Earring",
		body="Lanun Frac +3",  hands="Laksa. Gants +3", lring="Stikini Ring", rring="Stikini Ring",
		back=gear.magic_QD_jse_back, waist="Aquiline Belt", legs="Malignance Tights", feet="Malignance Boots"}

	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2"} -- ,ring1="Asklepian Ring"
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells    
    sets.precast.FC = {
		-- neck="Voltsurge Torque", 
		head="Carmine Mask +1", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		-- hands="Leyline Gloves", lring="Kishar Ring", 
		body=gear.taeon_body_Fastcast, hands=gear.herculean_fc_hands, rring="Prolix Ring",
		-- 
		back=gear.FC_jse_back, legs=gear.herculean_fc_legs, feet="Carmine Greaves +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Snapshot Sets
    sets.precast.RA = {ammo=gear.RAbullet,
		head="Chass. Tricorne +1", neck="Comm. Charm +2",
		body="Oshosi Vest +1", hands="Lanun Gants +3",
		-- waist="Yemaya Belt",
		back=gear.snapshot_jse_back, legs="Adhemar Kecks +1", feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
		head="Chass. Tricorne +1", neck="Comm. Charm +2",
		body="Laksa. Frac +3", hands="Lanun Gants +3",
		-- waist="Yemaya Belt", 
		back=gear.snapshot_jse_back, legs="Adhemar Kecks +1", feet="Meg. Jam. +2"})
	
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {
		head="Chass. Tricorne +1", neck="Comm. Charm +2",
		body="Laksa. Frac +3", hands="Carmine Fin. Ga. +1",
		back=gear.snapshot_jse_back, waist="Impulse Belt", legs="Laksa. Trews +3", feet="Pursuer's Gaiters"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head="Meghanada Visor +2", neck="Rep. Plat. Medal", lear="Moonshade Earring", rear="Telos Earring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Epaminondas's Ring", rring="Chirich Ring +1", 
		back=gear.magic_wsd_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Lanun Bottes +3"}
	
    sets.precast.WS.Acc = {
		head="Meghanada Visor +2", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Telos Earring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Chirich Ring +1", rring="Epaminondas's Ring", 
		back=gear.magic_wsd_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Lanun Bottes +3"}

    sets.precast.WS.Proc = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    -- Melee
	-- Sword
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
		-- head="Nyame Helm", 
		head="Meghanada Visor +2", neck="Comm. Charm +2",  lear="Moonshade Earring", rear="Telos Earring",
		-- hands="Nyame Gauntlets", Path B lring="Regal Ring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epaminondas's Ring", 
		--  legs="Nyame Flanchard" 
		back=gear.str_wsd_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights",feet="Lanun Bottes +3"})

	-- Savage Blade
	sets.precast.WS['Savage Blade'] = {--range="Ataktos",
		-- head="Nyame Helm",
		head="Meghanada Visor +2", neck="Rep. Plat. Medal", lear="Moonshade Earring", rear="Telos Earring",
		-- hands="Nyame Gauntlets", Path B lring="Regal Ring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epaminondas's Ring", 
		--  legs="Nyame Flanchard" 
		back=gear.str_wsd_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Lanun Bottes +3"}

    sets.precast.WS['Savage Blade'].Acc = {--range="Ataktos",
		-- head="Nyame Helm",
		head="Meghanada Visor +2", neck="Rep. Plat. Medal", lear="Moonshade Earring", rear="Telos Earring",
		-- hands="Nyame Gauntlets", Path B lring="Regal Ring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Chirich Ring +1", rring="Epaminondas's Ring", 
		--  legs="Nyame Flanchard" 
		back=gear.str_wsd_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Lanun Bottes +3"}

	sets.precast.WS['Evisceration'] = {--range="Ataktos",
		-- head="Nyame Helm",
		head="Meghanada Visor +2", neck="Comm. Charm +2",  lear="Moonshade Earring", rear="Odr Earring",
		-- hands="Nyame Gauntlets", Path B lring="Regal Ring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Epaminondas's Ring", rring="Mummu Ring", 
		--  waist="Fotia Belt", legs="Nyame Flanchard" 
		back=gear.str_wsd_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Lanun Bottes +3"}
	
	sets.precast.WS['Aeolian Edge'] = {--range="Ataktos",
		-- head="Nyame Helm",
		head="Lanun Tricorne +3", neck="Comm. Charm +2", lear="Moonshade Earring", rear="Telos Earring",
		-- hands="Nyame Gauntlets", Path B hands="Carmine Fin. Ga. +1", lring="Dingir Ring",
		body="Lanun Frac +3", hands="Meg. Gloves +2", lring="Rajas Ring", rring="Epaminondas's Ring", 
		-- legs="Nyame Flanchard" 
		back=gear.str_wsd_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Lanun Bottes +3"}
	
	--Ranged Weaponskill
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
		--  rear="Enervating Earring",
		head="Lanun Tricorne +3", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- rring="Regal Ring", 
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Epaminondas's Ring", rring="Chirich Ring +1",
		--waist="Fotia Belt",
		back=gear.tp_ranger_jse_back, waist="Aquiline Belt", legs="Malignance Tights", feet="Lanun Bottes +3"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
		-- Rostam A 
		-- rear="Enervating Earring",
		head="Lanun Tricorne +3", neck="Fotia Gorget", lear="Moonshade Earring", rear="Ishvara Earring",
		-- rring="Regal Ring", 
		body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Epaminondas's Ring", rring="Chirich Ring +1",
		-- waist="Fotia Belt",
		back=gear.tp_ranger_jse_back, waist="Aquiline Belt", legs="Malignance Tights", feet="Lanun Bottes +3"}
		
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
		head="Pixie Hairpin +1", neck="Comm. Charm +2", lear="Friomisi Earring", rear="Moonshade Earring",
		--   Nyame Gauntlets Path B lring="Dingir Ring", rring="Archon Ring",
		body="Lanun Frac +3", hands="Carmine Fin. Ga. +1", lring="Epaminondas's Ring", rring="Chirich Ring +1",
		--  Nyame Flanchard Path B 
		back=gear.magic_wsd_jse_back, waist="Svelt. Gouriz +1", legs="Laksa. Trews +3", feet="Lanun Bottes +3"}

    sets.precast.WS['Leaden Salute'].Acc = {ammo=gear.MAbullet,
		head="Pixie Hairpin +1",  neck="Comm. Charm +2", lear="Friomisi Earring", rear="Moonshade Earring",
		--   Nyame Gauntlets Path B lring="Dingir Ring", rring="Archon Ring",
		body="Lanun Frac +3", hands="Carmine Fin. Ga. +1", lring="Epaminondas's Ring", rring="Chirich Ring +1",
		-- Nyame Flanchard Path B
		back=gear.magic_wsd_jse_back, waist="Svelt. Gouriz +1", legs="Laksa. Trews +3", feet="Lanun Bottes +3"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,		
		head="Pixie Hairpin +1",  neck="Comm. Charm +2", lear="Friomisi Earring", rear="Moonshade Earring",
		--  hands="Carmine Fin. Ga. +1", Nyame Gauntlets Path B lring="Dingir Ring", 
		body="Lanun Frac +3",hands="Carmine Fin. Ga. +1", lring="Epaminondas's Ring", rring="Chirich Ring +1",
		-- Nyame Flanchard Path B 
		back=gear.magic_wsd_jse_back, waist="Svelt. Gouriz +1", legs="Laksa. Trews +3", feet="Lanun Bottes +3"}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
		--		
		head="Lanun Tricorne +3",  neck="Comm. Charm +2", lear="Friomisi Earring", rear="Moonshade Earring",
		-- Nyame Gauntlets Path B lring="Dingir Ring", 
		body="Lanun Frac +3", hands="Carmine Fin. Ga. +1", lring="Epaminondas's Ring", rring="Chirich Ring +1",
		-- back=gear.magic_wsd_jse_back, Nyame Flanchard Path B
		back=gear.magic_wsd_jse_back, waist="Svelt. Gouriz +1", legs="Laksa. Trews +3", feet="Lanun Bottes +3"}

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
	
	sets.Self_Healing = {waist="Gishdubar Sash"}--neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring"
	sets.Cure_Received = {waist="Gishdubar Sash"}--neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
		-- Rostam A 
		--  Ikenga's Hat neck="Iskur Gorget", rear="Enervating Earring",
		head="Malignance Chapeau", neck="Combatant's Torque", lear="Telos Earring", rear="Volley Earring",
		-- Malignance Gloves  rring="Dingir Ring", 
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Ilabrat Ring", rring="Chirich Ring +1",
		--waist="Yemaya Belt", Ikenga Trousers
		back=gear.tp_ranger_jse_back, waist="Aquiline Belt", legs="Malignance Tights", feet="Malignance Boots"}
	
    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
		-- Rostam A 
		-- Ikenga's Hat neck="Iskur Gorget", rear="Enervating Earring",
		head="Malignance Chapeau", neck="Combatant's Torque", lear="Telos Earring", rear="Volley Earring",
		-- Malignance Tabard Malignance Gloves  rring="Dingir Ring", 
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Ilabrat Ring", rring="Chirich Ring +1",
		--waist="Yemaya Belt", Malignance Tights Ikenga Trousers
		back=gear.tp_ranger_jse_back, waist="Aquiline Belt", legs="Malignance Tights", feet="Malignance Boots"}
		
	sets.midcast.RA.Crit = {ammo=gear.RAbullet,
		-- Rostam A 
		-- neck="Iskur Gorget",
		head="Malignance Chapeau", neck="Combatant's Torque", lear="Telos Earring", rear="Odr Earring",
		-- Meghanada Cuirie +2  rring="Begrudging Ring", 
		body="Malignance Tabard", hands="Mummu Wrists +2", lring="Mummu Ring", rring="Chirich Ring +1",
		--waist="Gerdr Belt +1", Darraigner's Brais Oshosi Lieggings +1
		back=gear.tp_ranger_jse_back, waist="Aquiline Belt", legs="Malignance Tights", feet="Oshosi Lieggings"}
	
	sets.buff['Triple Shot'] = {
		-- head="Oshosi Mask +1", 
		-- Oshosi Gloves
		body="Chasseur's Frac +1", hands="Lanun Gants +3", 
		-- legs="Osh. Trousers +1", Feet="Osh. Leggings +1",
		back=gear.tp_ranger_jse_back, feet="Oshosi Leggings"}
    
    -- Sets to return to when not performing an action.	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
		head="Malignance Chapeau", neck="Loricate Torque +1",  lear="Odnowa Earring", rear="Odnowa Earring +1",
		-- Malignance Gloves
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Gelatinous Ring +1",  rring="Defending Ring",
		-- waist="Plat. Mog. Belt", 
		back=gear.tp_ranger_jse_back, waist="Carrier's Sash",  legs="Malignance Tights", feet="Malignance Boots"}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
        head="Rawhide Mask", neck="Loricate Torque +1", lear="Etiolation Earring",  rear="Odnowa Earring +1",
		-- Malignance Gloves
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- waist="Plat. Mog. Belt",
		back=gear.tp_ranger_jse_back, waist="Carrier's Sash",  legs="Malignance Tights", feet="Malignance Boots"}
	
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
		head="Malignance Chapeau", neck="Loricate Torque +1", lear="Odnowa Earring", rear="Odnowa Earring +1",
		--  Malignance Gloves
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- waist="Plat. Mog. Belt",  
		back=gear.tp_ranger_jse_back, waist="Carrier's Sash",  legs="Malignance Tights", feet="Malignance Boots"}

    sets.defense.MDT = {ammo=gear.RAbullet,
		head="Malignance Chapeau", neck="Warder's Charm +1", lear="Odnowa Earring", rear="Odnowa Earring +1",
		-- Malignance Gloves
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Gelatinous Ring +1", rring="Defending Ring",
		back=gear.tp_ranger_jse_back, waist="Carrier's Sash",  legs="Malignance Tights", feet="Malignance Boots"}
	
    sets.defense.MEVA = {ammo=gear.RAbullet,
		head="Malignance Chapeau", neck="Warder's Charm +1", lear="Odnowa Earring", rear="Odnowa Earring +1",
		--  Malignance Gloves
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Gelatinous Ring +1", rring="Defending Ring",
		back=gear.tp_ranger_jse_back, waist="Carrier's Sash",  legs="Malignance Tights", feet="Malignance Boots"}
			
    sets.Kiting = {lring="Shneddick Ring"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapon Sets
	-- Single Weapon
	-- Ranged 
	-- Rostam Path A
	sets.weapons.None = {main="Kustawi +1", sub="Nusku Shield", range="Fomalhaut"}

	-- Melee 
	-- Savage 
	sets.weapons.Sword = {main="Naegling", sub="Nusku Shield", range="Anarchy"}--range="Ataktos"	
	sets.weapons.Dagger = 	{main="Tauret", sub="Nusku Shield", range="Anarchy"}--range="Ataktos"
	
	-- Dual Weapons
	-- Ranged
	sets.weapons.RangedWeapons = {main="Kustawi +1",sub="Kustawi", range="Fomalhaut"}
	-- Last Stand Dual Ranged   Rostam A Fomalhaut
	sets.weapons.DualRangedWeapons = {main="Kustawi +1",sub="Kustawi", range="Fomalhaut"}
	-- Leaden/Wildfire  Rostam Path A
	sets.weapons.DualLeaden = {main="Kustawi +1",sub="Tauret", range="Fomalhaut"}-- Death Penalty
	sets.weapons.DualWildfire = {main="Naegling",sub="Tauret", range="Fomalhaut"}--range="Armageddon"
	sets.weapons.DualHotShot = sets.weapons.DualWildfire
	
	-- Melee 
	-- DW Savage Naegling Gleti's Knife
	sets.weapons.DualWeapons = {main="Naegling",sub="Blurred Knife +1",range="Anarchy"}--range="Ataktos"	
	-- Tauret Gleti's Knife
	sets.weapons.DualDaggers = 	{main="Tauret",sub="Ternion Dagger", range="Anarchy"}--range="Ataktos"
	-- Rostam B Tauret 
	sets.weapons.AeolianEdge = 	{main="Tauret", sub="Naegling", range="Anarchy"}--range="Ataktos"
	
	-- Rolling
	sets.weapons.RollMeleeWeapons = {main=gear.Rostam_PathC, sub="Blurred Knife +1", range="Compensator"}
	sets.weapons.RollRangedWeapons = {main=gear.Rostam_PathC, sub="Nusku Shield", range="Compensator"}
	
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
		head="Malignance Chapeau", neck="Combatant's Torque", lear="Brutal Earring", rear="Mache Earring +1",
		-- body="Ashera Harness", hands="Adhemar Wrist. +1" lring="Petrov Ring", rring="Epona's Ring",
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Chirich Ring +1", rring="Chirich Ring +1",
		--  legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Malignance Boots"}

    sets.engaged.Acc = {
		-- head="Adhemar Bonnet +1"  rear="Cessance Earring"
		head="Malignance Chapeau", neck="Combatant's Torque", lear="Brutal Earring", rear="Mache Earring +1",
		-- body="Ashera Harness", hands="Adhemar Wrist. +1" lring="Petrov Ring", rring="Epona's Ring",
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Chirich Ring +1", rring="Chirich Ring +1",
		--  legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Malignance Boots"}
	
	 sets.engaged.Low = {
		-- head="Adhemar Bonnet +1"  rear="Cessance Earring"
		head="Malignance Chapeau", neck="Combatant's Torque", lear="Brutal Earring", rear="Mache Earring +1",
		-- body="Ashera Harness", hands="Adhemar Wrist. +1" lring="Petrov Ring", rring="Epona's Ring",
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Chirich Ring +1", rring="Chirich Ring +1",
		--  legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Malignance Boots"}

	sets.engaged.Mid = {
		-- head="Adhemar Bonnet +1"  rear="Cessance Earring"
		head="Malignance Chapeau", neck="Combatant's Torque", lear="Brutal Earring", rear="Mache Earring +1",
		-- body="Ashera Harness", hands="Adhemar Wrist. +1" lring="Petrov Ring", rring="Epona's Ring",
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Chirich Ring +1", rring="Chirich Ring +1",
		--  legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Malignance Boots"}

	sets.engaged.Max = {
		-- head="Adhemar Bonnet +1"  rear="Cessance Earring"
		head="Malignance Chapeau", neck="Combatant's Torque", lear="Brutal Earring", rear="Mache Earring +1",
		-- body="Ashera Harness", hands="Adhemar Wrist. +1" lring="Petrov Ring", rring="Epona's Ring",
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Chirich Ring +1", rring="Chirich Ring +1",
		--  legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Malignance Boots"}

    sets.engaged.DW = {
		-- head="Adhemar Bonnet +1"  Path B neck="Iskur Gorget", rear="Dedition Earring"
		head="Malignance Chapeau", neck="Combatant's Torque", lear="Eabani Earring", rear="Mache Earring +1",
		-- body="Adhemar Jacket +1", Path A hands=gear.herculean_dt_qat, lring="Petrov Ring", rring="Epona's Ring",
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Windbuffet Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Malignance Boots"}

    sets.engaged.DW.Acc = {
		-- head="Adhemar Bonnet +1"  Path B neck="Iskur Gorget", rear="Dedition Earring"
		head="Malignance Chapeau", neck="Combatant's Torque", lear="Eabani Earring", rear="Mache Earring +1",
		-- body="Adhemar Jacket +1", Path A hands=gear.herculean_dt_qat, lring="Petrov Ring", rring="Epona's Ring",
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Windbuffet Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Malignance Boots"}
	
	sets.engaged.DW.Low = {
		-- head="Adhemar Bonnet +1"  Path B neck="Iskur Gorget", rear="Dedition Earring"
		head="Malignance Chapeau", neck="Combatant's Torque", lear="Eabani Earring", rear="Mache Earring +1",
		-- body="Adhemar Jacket +1", Path A hands=gear.herculean_dt_qat, lring="Petrov Ring", rring="Epona's Ring",
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Windbuffet Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Malignance Boots"}

	sets.engaged.DW.Mid = {
		-- head="Adhemar Bonnet +1"  Path B neck="Iskur Gorget", rear="Dedition Earring"
		head="Malignance Chapeau", neck="Combatant's Torque", lear="Eabani Earring", rear="Mache Earring +1",
		-- body="Adhemar Jacket +1", Path A hands=gear.herculean_dt_qat, lring="Petrov Ring", rring="Epona's Ring",
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Windbuffet Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Malignance Boots"}

	sets.engaged.DW.Max = {
		-- head="Adhemar Bonnet +1"  Path B neck="Iskur Gorget", rear="Dedition Earring"
		head="Malignance Chapeau", neck="Combatant's Torque", lear="Eabani Earring", rear="Mache Earring +1",
		-- body="Adhemar Jacket +1", Path A hands=gear.herculean_dt_qat, lring="Petrov Ring", rring="Epona's Ring",
		body="Malignance Tabard", hands="Meg. Gloves +2", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Windbuffet Belt +1", legs="Samnuha Tights",
		back=gear.tp_jse_back, waist="Sailfi Belt +1", legs="Malignance Tights", feet="Malignance Boots"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Ranged sets
	if player.sub_job == 'NIN' then
		if player.equipment.range == 'Akatos' then
			set_macro_page(4, 10)
		else
			set_macro_page(4, 10)
		end
	elseif player.sub_job == 'DNC' then
		if player.equipment.range == 'Akatos' then
			set_macro_page(6, 10)
		else
			set_macro_page(6, 10)
		end
	elseif player.sub_job == 'WAR' then
			if player.equipment.range == 'Akatos' then
			set_macro_page(5, 10)
		else
			set_macro_page(5, 10)
		end
	elseif player.sub_job == 'DRG' then
		if player.equipment.range == 'Akatos' then
			set_macro_page(7, 10)
		else
			set_macro_page(7, 10)
		end
	else
		if player.equipment.range == 'Akatos' then
			set_macro_page(1, 10)
		else
			set_macro_page(1, 10)
		end		
	end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 010')
end

function job_setup()
	-- Whether to use Compensator under a certain threshhold even when weapons are locked.
	state.CompensatorMode = M{['description'] = 'CompensatorMode','Never','300','1000','Always'}
	state.RollMode = M{['description'] = 'RollMode','None','Recast','Weak','RecastLock','WeakLock'}
	-- Whether to automatically generate bullets.
	state.AutoAmmoMode = M(true,'Auto Ammo Mode')
	state.UseDefaultAmmo = M(true,'Use Default Ammo')
	state.TrueShotMode = M(true,'True Shot Mode')
	state.Buff['Triple Shot'] = buffactive['Triple Shot'] or false

	-- Whether to use Luzaf's Ring
	state.LuzafRing = M(true, "Luzaf's Ring")
	-- Whether a warning has been given for low ammo
	
	autows = 'Savage Blade'
	rangedautows = 'Last Stand'
	autofood = 'Sublime Sushi'
	ammostock = 98

	define_roll_values()
	init_job_states({"Capacity","AutoFoodMode","AutoTrustMode","LuzafRing","AutoWSMode","RngHelper","AutoShadowMode","AutoStunMode","AutoDefenseMode"},{"AutoBuffMode","AutoSambaMode","AutoRuneMode","Weapons","OffenseMode","RangedMode","WeaponskillMode","ElementalMode","IdleMode","Passive","RuneElement","CompensatorMode","RollMode","TreasureMode",})
end


autows_list = {
		['Default']='Last Stand',
		['Sword']='Savage Blade',
		['Dagger']='Evisceration',	
		['RangedWeapons']='Last Stand',
		['DualRangedWeapons']='Last Stand',
		['DualLeaden']='Leaden Salute',		
		['DualWildfire']='Wildfire',		
		['DualHotShot']='Hot Shot',		
		['DualWeapons']='Savage Blade',
		['DualDaggers']='Aeolian Edge',
		['AeolianEdge']='Aeolian Edge',
		['RollMeleeWeapons']='Savage Blade',	
		['RollRangedWeapons']='Last Stand'
}
		