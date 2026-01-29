-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
    state.RangedMode:options('Normal', 'Acc', 'Crit', 'STP')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','DualRangedWeapons', 'SavageWeapons', 'DualWeapons', 'LeadenWeapons', 'RollMeleeWeapons', 'RollRangedWeapons', 'None')
	state.CompensatorMode:options('300','1000','Never','Always')
	
    gear.RAbullet = "Eminent Bullet"
    gear.WSbullet = "Eminent Bullet" -- Chrono Bullet  Divine Bullet
    gear.MAbullet = "Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Animikii Bullet" -- Living Bullet  Omphalous Bullet 
    options.ammo_warning_limit = 15


	gear.snapshot_jse_back = {		name="Camulus's Mantle", augments={'"Snapshot"+10',}}	
	gear.ranger_wsd_jse_back = {	name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {		name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.DW_jse_back = {			name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Damage taken-5%',}}
	gear.tp_ranger_jse_back = {		name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Damage taken-5%',}}
	gear.magic_wsd_jse_back = {		name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	gear.tp_jse_back = {			name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken-5%',}}
	gear.crit_ranger_jse_back = {	name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10','Damage taken-5%',}}
	gear.magic_QD_jse_back = {		name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','"Store TP"+10',}}
	gear.FC_jse_back = {			name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','"Store TP"+10',}}
	
	-- Additional local alias
	--send_command('alias das send Dasmir /targetnpc;wait 1;send Dasmir Horde Lullaby;wait 1;send dasmir /follow olymoly')

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
	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +3"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +3"}
    
    sets.precast.CorsairRoll = {main=gear.Rostam_PathC, Ranged="Compensator",
        head="Lanun Tricorne +3", neck="Regal Necklace", ear1="Odnowa Earring +1", ear2="Odnowa Earring",
		body="Malignance Tabard",hands="Chasseur's Gants +1",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.tp_jse_back, waist="Flume Belt", legs="Desultor Tassets", feet="Malignance Boots"}
		
    sets.precast.LuzafRing = {ring1="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
    
	-- Quick Draw
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
		-- Nyame Helm Path B Baetyl Pendant
		head=gear.herculean_nuke_head, neck="Sanctity Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Nyame Gauntlets Path B Fenrir Ring +1
		body="Lanun Frac +3", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Shiva Ring +1",
		-- Skrymir Cord +1 Nyame Flanchard Path B
		back=gear.magic_QD_jse_back, waist="Eschan Stone", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +3"}
	
	sets.precast.CorsairShot.STP = {ammo=gear.QDbullet,
		head="Malignance Chapeau", neck="Iskur Gorget", lear="Dedition Earring", rear="Telos Earring",
		body="Malignance Tabard", hands="Malignance Gloves", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- Sweordfaetels +1
		back=gear.magic_QD_jse_back, waist="Goading Belt", legs="Chas. Culottes +1", feet="Malignance Boots"}

    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
		-- Comm. Charm +2  
		head="Laksa. Tricorne +3", neck="Sanctity Necklace", lear="Digni. Earring", rear="Gwati Earring",
		body="Malignance Tabard", hands="Laksa. Gants +3", lring="Regal Ring", rring="Stikini Ring +1",
		back=gear.magic_QD_jse_back, waist="Kwahu Kachina Belt", legs="Malignance Tights", feet="Laksa. Bottes +3"}
	
	-- Proc AF3 Feet for Damage Bonus
    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chass. Bottes +1"})
	sets.precast.CorsairShot['Fire Shot'] = set_combine(sets.precast.CorsairShot['Fire Shot'], {feet="Chass. Bottes +1"})
	
	-- Less damage
    sets.precast.CorsairShot.Proc = {ammo=gear.QDbullet,
        -- Baetyl Pendant
		head="Blood Mask", neck="Sanctity Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- Fenrir Ring +1 Fenrir Ring +1
		body="Carm. Sc. Mail +1", hands="Leyline Gloves", lring="Shiva Ring +1", rring="Shiva Ring +1",
		back=gear.magic_QD_jse_back, waist="Eschan Stone", legs="Mummu Kecks +2", feet="Adhe. Gamashes +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Dashing Subligar",feet="Malignance Boots"}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",ring1="Asklepian Ring"} --body="Passion Jacket",
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		-- neck="Baetyl Pendant"
        head="Carmine Mask +1",neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Enchntr. Earring +1",
        body=gear.taeon_body_Fastcast,hands="Leyline Gloves",ring1="Prolix Ring",ring2="Kishar Ring",
		-- Herc FC
        back="Moonbeam Cape",waist="Flume Belt",legs="Mummu Kecks +2",feet="Carmine Greaves +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})--body="Passion Jacket"
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

	-- Snapshot
    sets.precast.RA = {ammo=gear.RAbullet,
		-- neck="Comm. Charm +2"
        head=gear.taeon_head_Snapshot,
		body="Laksa. Frac +3", hands="Carmine Fin. Ga. +1",
        back=gear.snapshot_jse_back,waist="Impulse Belt",legs="Laksa. Trews +3",feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {
		-- neck="Comm. Charm +2"
        head=gear.taeon_head_Snapshot,
		body="Laksa. Frac +3", hands="Carmine Fin. Ga. +1",
        back=gear.snapshot_jse_back,waist="Yemaya Belt",legs="Adhemar Kecks +1",feet="Meg. Jam. +2"})
	
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {
		-- neck="Comm. Charm +2"
        head="Chass. Tricorne +1",
		body="Laksa. Frac +3", hands="Carmine Fin. Ga. +1",
        back=gear.snapshot_jse_back,waist="Impulse Belt",legs="Adhemar Kecks +1",feet="Pursuer's Gaiters"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
	-- Melee
    sets.precast.WS = {
		-- Nyame Helm 
        head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Telos Earring",
        -- Nyame Mail Nyame Gauntlets 
		body="Nisroch Jerkin",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Ilabrat Ring",
        -- Nyame Flanchard Nyame Sollerets
		back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +3"}
		
    sets.precast.WS.Acc = {
		-- Nyame Helm 
        head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Telos Earring",
        -- Nyame Mail Nyame Gauntlets 
		body="Nisroch Jerkin",hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Ilabrat Ring",
        -- Nyame Flanchard Nyame Sollerets
		back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +3"}
		
    sets.precast.WS.Proc = {}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	-- Melee
	-- Sword
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
		head="Adhemar Bonnet +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Telos Earring",
		body="Adhemar Jacket +1", hands="Meg. Gloves +2", lring="Regal Ring", rring="Rufescent Ring",
		back=gear.str_wsd_jse_back, waist="Fotia Belt", legs="Meg. Chausses +2", feet=gear.herculean_ta_feet})
				
	sets.precast.WS['Savage Blade'] = {
		-- Nyame Helm Path B Rep. Plat. Medal ear2="Chas. Earring +2",
        head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		--  Nyame Mail Nyame Gauntlets Path B Chasseur's Gants +3
        body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Regal Ring", rring="Epaminondas's Ring",
		-- Nyame Flanchard Path B
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Meg. Chausses +2",feet="Lanun Bottes +3"}

    sets.precast.WS['Savage Blade'].Acc = {
		-- Nyame Helm Path B Rep. Plat. Medal ear2="Chas. Earring +2",
        head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		-- Nyame Mail Nyame Gauntlets Path B Chasseur's Gants +3
        body="Laksa. Frac +3", hands="Meg. Gloves +2", lring="Regal Ring", rring="Epaminondas's Ring",
		-- Nyame Flanchard Path B
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Meg. Chausses +2",feet="Lanun Bottes +3"}
	
	sets.precast.WS['Swift Blade'] = {ammo=gear.WSbullet,
		-- Nyame Helm Path B
        head="Adhemar Bonnet", neck="Fotia Gorget",ear1="Brutal Earring",ear2="Telos Earring",
        -- Nyame Mail Path B Nyame Gauntlets Path B
		body="Adhemar Jacket +1", hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epona's Ring",
		-- Nyame Flanchard Nyame Sollerets
        back=gear.tp_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +3"}

    sets.precast.WS['Swift Blade'].Acc = {ammo=gear.WSbullet,
		-- Nyame Helm Path B
        head="Adhemar Bonnet", neck="Fotia Gorget",ear1="Brutal Earring",ear2="Telos Earring",
        -- Nyame Mail Path B Nyame Gauntlets Path B
		body="Adhemar Jacket +1", hands="Meg. Gloves +2", ring1="Regal Ring", ring2="Epona's Ring",
		-- Nyame Flanchard Nyame Sollerets
        back=gear.tp_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +3"}
		
	--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {}
	
	-- Dagger
	sets.precast.WS['Evisceration'] = {
        head="Blistering Sallet +1",neck="Fotia Belt",ear1="Moonshade Earring",ear2="Odr Earring",  
		-- Nyame Mail Nyame Gauntlets 
		body="Abnoba Kaftan",hands="Mummu Wrists +2", ring1="Epaminondas's Ring", ring2="Regal Ring",
		-- Nyame Flanchard Nyame Sollerets
        back=gear.tp_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet="Mummu Gamash. +2"}		
		
    sets.precast.WS['Evisceration'].Acc = {
        head="Blistering Sallet +1",neck="Fotia Belt",ear1="Moonshade Earring", ear2="Odr Earring",  
		-- Nyame Mail Nyame Gauntlets 
		body="Abnoba Kaftan",hands="Mummu Wrists +2", ring1="Epaminondas's Ring", ring2="Regal Ring",
		-- Nyame Flanchard Nyame Sollerets
        back=gear.tp_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet="Mummu Gamash. +2"}		
	
	sets.precast.WS['Aeolian Edge'] = {ammo=gear.MAbullet,
		-- Nyame Helm Path B Comm. Charm +2
		head=gear.herculean_nuke_head, neck="Sanctity Necklace", lear="Moonshade Earring", rear="Friomisi Earring",
		--  Nyame Gauntlets Path B
		body="Lanun Frac +3", hands="Carmine Fin. Ga. +1", lring="Regal Ring", rring="Epaminondas's Ring",
		-- Nyame Flanchard
		back=gear.magic_wsd_jse_back, waist="Orpheus's Sash", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +3"}

	sets.precast.WS['Aeolian Edge'] = {ammo=gear.MAbullet,
		-- Nyame Helm Path B Comm. Charm +2
		head=gear.herculean_nuke_head, neck="Sanctity Necklace", lear="Moonshade Earring", rear="Friomisi Earring",
		-- Nyame Gauntlets Path B
		body="Lanun Frac +3", hands="Carmine Fin. Ga. +1", lring="Regal Ring", rring="Epaminondas's Ring",
		-- Nyame Flanchard
		back=gear.magic_wsd_jse_back, waist="Orpheus's Sash", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +3"}

	-- Ranged WS
	-- Last Stand
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
		-- Nyame Helm 
        head="Lanun Tricorne +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        -- Nyame Mail Chasseur's Gants +3 
		body="Laksa. Frac +3",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Epaminondas's Ring",
        -- Nyame Flanchard  Nyame Sollerets
		back=gear.ranger_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +3"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
		-- Nyame Helm 
        head="Lanun Tricorne +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        --Nyame Mail Chasseur's Gants +3 
		body="Laksa. Frac +3",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Epaminondas's Ring",
        -- Nyame Flanchard  Nyame Sollerets
		back=gear.ranger_wsd_jse_back,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Lanun Bottes +3"}

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
		-- Comm. Charm +2
		head="Pixie Hairpin +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Friomisi Earring",
		-- Nyame Gauntlets 
		body="Lanun Frac +3", hands="Carmine Fin. Ga. +1", lring="Dingir Ring",  rring="Archon Ring",
		-- Nyame Flanchard 
		back=gear.magic_wsd_jse_back, waist="Orpheus's Sash", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +3"}

    sets.precast.WS['Leaden Salute'].Acc = {ammo=gear.MAbullet,
		-- Comm. Charm +2
		head="Pixie Hairpin +1", neck="Fotia Gorget", lear="Moonshade Earring", rear="Friomisi Earring",
		-- Nyame Gauntlets 
		body="Lanun Frac +3", hands="Carmine Fin. Ga. +1", lring="Dingir Ring",  rring="Archon Ring",
		-- Nyame Flanchard 
		back=gear.magic_wsd_jse_back, waist="Orpheus's Sash", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +3"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
		-- Nyame Helm Comm. Charm +2
		head=gear.herculean_nuke_head, neck="Fotia Gorget", lear="Moonshade Earring", rear="Friomisi Earring",
		-- Nyame Gauntlets 
		body="Lanun Frac +3", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Epaminondas's Ring",
		-- Nyame Flanchard 
		back=gear.magic_wsd_jse_back, waist="Orpheus's Sash", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +3"}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
		-- Nyame Helm Comm. Charm +2
		head=gear.herculean_nuke_head, neck="Fotia Gorget", lear="Moonshade Earring", rear="Friomisi Earring",
		-- Nyame Gauntlets 
		body="Lanun Frac +3", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Epaminondas's Ring",
		-- Nyame Flanchard 
		back=gear.magic_wsd_jse_back, waist="Orpheus's Sash", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +3"}

    sets.precast.WS['Hot Shot'] = {ammo=gear.MAbullet,
		-- Nyame Helm Comm. Charm +2
		head=gear.herculean_nuke_head, neck="Fotia Gorget", lear="Moonshade Earring", rear="Friomisi Earring",
		-- Nyame Mail Path B Nyame Gauntlets Path B 
		body="Lanun Frac +3", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Epaminondas's Ring",
		-- Nyame Flanchard 
		back=gear.magic_wsd_jse_back, waist="Orpheus's Sash", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +3"}
    
	sets.precast.WS['Hot Shot'].Acc = {ammo=gear.MAbullet,
		-- Nyame Helm Comm. Charm +2
		head=gear.herculean_nuke_head, neck="Fotia Gorget", lear="Moonshade Earring", rear="Friomisi Earring",
		-- Nyame Mail Path B Nyame Gauntlets Path B 
		body="Lanun Frac +3", hands="Carmine Fin. Ga. +1", lring="Dingir Ring", rring="Epaminondas's Ring",
		-- Nyame Flanchard 
		back=gear.magic_wsd_jse_back, waist="Orpheus's Sash", legs=gear.herculean_nuke_legs, feet="Lanun Bottes +3"}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Enervating Earring",ear2="Telos Earring"}
	sets.AccMaxTP = {ear1="Enervating Earring",ear2="Telos Earring"}
        
    -- Midcast Sets
    sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
    
	-- Specific spells
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",ring2="Kunaji Ring",waist="Gishdubar Sash"}--hands="Buremte Gloves",
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Kunaji Ring",waist="Gishdubar Sash"}--hands="Buremte Gloves"
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		body="Malignance Tabard", hands="Malignance Gloves",ring1="Dingir Ring",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
	
    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard", hands="Malignance Gloves",ring1="Regal Ring",ring2="Ilabrat Ring",
		-- waist="K. Kachina Belt +1"
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Malignance Tights",feet="Malignance Boots"}
	
    sets.midcast.RA.Crit = {ammo=gear.RAbullet, 
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- hands="Adhemar Wrist. +1" Path C 
		body="Nisroch Jerkin", hands="Mummu Wrists +2",ring1="Mummu Ring", rring="Begrudging Ring", 
		-- waist="K. Kachina Belt +1" Gerdr Belt feet="Osh. Leggings +1"
        back=gear.crit_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Darraigner's Brais",feet="Malignance Boots"}
	
	sets.midcast.RA.STP = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",rear="Dedition Earring",
		--  hands="Adhemar Wrist. +1 Path C 
		body="Nisroch Jerkin", hands="Adhemar Wristbands",ring1="Chirich Ring +1",ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt", legs="Adhemar Kecks +1", feet="Malignance Boots"}
	
	-- Armageddon
	sets.midcast.RA.Armageddon = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		--  hands="Adhemar Wrist. +1 Path C 
		body="Nisroch Jerkin", hands="Adhemar Wristbands",lring="Dingir Ring", ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt", legs="Adhemar Kecks +1", feet="Malignance Boots"}
	
    sets.midcast.RA.Armageddon.Acc = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		body="Laksa. Frac +3",hands="Meg. Gloves +2",ring1="Dingir Ring",ring2="Ilabrat Ring",
		-- waist="K. Kachina Belt +1" 
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Malignance Tights",feet="Malignance Boots"}
	
	sets.midcast.RA.Armageddon.Crit = {ammo=gear.RAbullet,
        head="Mummu Bonnet +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		body="Nisroch Jerkin", hands="Mummu Wrists +2",ring1="Mummu Ring",rring="Begrudging Ring", 
		-- waist="K. Kachina Belt +1" feet="Osh. Leggings +1"
        back=gear.crit_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Darraigner's Brais",feet="Mummu Gamash. +2"}
	
	sets.midcast.RA.Armageddon.STP = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring", ear2="Dedition Earring",
        body="Malignance Tabard", hands="Malignance Gloves" , lring="Chirich Ring +1", ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Adhemar Kecks +1", feet="Malignance Boots"}
		
	-- Fomalhaut
	sets.midcast.RA.Fomalhaut = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		-- hands="Adhemar Wrist. +1" Path C 
        body="Nisroch Jerkin", hands="Adhemar Wristbands",ring1="Dingir Ring", ring2="Ilabrat Ring", 
        back=gear.tp_ranger_jse_back, waist="Yemaya Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
	
    sets.midcast.RA.Fomalhaut.Acc = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
		body="Laksa. Frac +3", hands="Meg. Gloves +2",lring="Regal Ring",ring2="Ilabrat Ring",
		-- waist="K. Kachina Belt +1" 
        back=gear.tp_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Laksa. Trews +3",feet="Meg. Jam. +2"}
	
	sets.midcast.RA.Fomalhaut.Crit = {ammo=gear.RAbullet, 
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Nisroch Jerkin", hands="Mummu Wrists +2",ring1="Mummu Ring", rring="Begrudging Ring", 
		-- waist="K. Kachina Belt +1" feet="Osh. Leggings +1"
        back=gear.crit_ranger_jse_back,waist="Kwahu Kachina Belt",legs="Darraigner's Brais",feet="Meg. Jam. +2"}
		
	sets.midcast.RA.Fomalhaut.STP = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Telos Earring",rear="Dedition Earring",
		--  hands="Adhemar Wrist. +1 Path C 
        body="Nisroch Jerkin", hands="Adhemar Wristbands", lring="Chirich Ring +1", ring2="Ilabrat Ring",
        back=gear.tp_ranger_jse_back, waist="Yemaya Belt", legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}

	sets.buff['Triple Shot'] = {
		--head="Oshosi Mask +1",
		body="Chasseur's Frac +1", hands="Lanun Gants +3",
		--legs="Osh. Trousers +1", feet="Osh. Leggings +1"
		}
    
    -- Sets to return to when not performing an action.
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Eabani Earring", rear="Etiolation Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Vengeful Ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
		head="Rawhide Mask", neck="Loricate Torque +1", ear1="Eabani Earring", rear="Etiolation Earring",
		body="Mekosu. Harness",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="Moonbeam Cape",waist="Flume Belt",legs="Rawhide Trousers", feet="Malignance Boots"}
    
	sets.idle.Regen = {ammo=gear.RAbullet,
		head="Rawhide Mask", neck="Loricate Torque +1", ear1="Eabani Earring", rear="Etiolation Earring",
		body="Mekosu. Harness",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back="Moonbeam Cape",waist="Flume Belt",legs="Meg. Chausses +2", feet="Malignance Boots"}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
		head="Malignance Chapeau", neck="Loricate Torque +1", lear="Eabani Earring", rear="Etiolation Earring",
		body="Malignance Tabard", hands="Malignance Gloves", lring="Vengeful Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}

    sets.defense.MDT = {ammo=gear.RAbullet,
		head="Malignance Chapeau", neck="Loricate Torque +1", lear="Etiolation Earring", rear="Sanare Earring",
		body="Malignance Tabard", hands="Malignance Gloves", lring="Vengeful Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}

    sets.defense.MEVA = {ammo=gear.RAbullet,
		head="Malignance Chapeau", neck="Warder's Charm +1", lear="Eabani Earring", rear="Sanare Earring",
		body="Malignance Tabard", hands="Malignance Gloves", lring="Gelatinous Ring +1", rring="Defending Ring",
		back="Moonbeam Cape", waist="Carrier's Sash", legs="Malignance Tights", feet="Malignance Boots"}

	sets.Kiting = {lring="Shneddick Ring"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	-- hands="Floral Gauntlets",
	sets.DWMax = {body="Adhemar Jacket +1", waist="Reiki Yotai", ear1="Eabani Earring", ear2="Suppanomimi"}
	
	--Weapon Sets
	--'Default','DualRangedWeapons', 'SavageWeapons', 'DualWeapons', 'LeadenWeapons', 'RollMeleeWeapons', 'RollRangedWeapons', 'None')
	-- Fencer Last Stand gear.Rostam_PathC
	sets.weapons.Default = {main="Kustawi +1", sub="Nusku Shield", range="Molybdosis"}--range="Fomalhaut"	
	-- Fencer Savage 
	sets.weapons.SavageWeapons = {main="Naegling", sub="Nusku Shield", range="Molybdosis"}--range="Ataktos"	
	-- Leaden/Wildfire  gear.Rostam_PathC Path A
	sets.weapons.LeadenWeapons = {main="Naegling", sub="Kaja Knife", range="Molybdosis"}--range="Fomalhaut"
	
	-- DW 
	sets.weapons.DualRangedWeapons = {main="Kustawi +1", sub="Kaja Knife", range="Molybdosis"}
	sets.weapons.DualWeapons = {main="Naegling", sub="Blurred Knife +1",range="Molybdosis"}--range="Ataktos"
	
	-- Rolling
	sets.weapons.RollMeleeWeapons = {main=gear.Rostam_PathC, sub="Blurred Knife +1",range="Compensator"}
	sets.weapons.RollRangedWeapons = {main=gear.Rostam_PathC, sub="Nusku Shield", range="Compensator"}

    -- Engaged sets
	
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Adhemar Bonnet +1", neck="Iskur Gorget", lear="Brutal Earring", rear="Cessance Earring",
		-- Herculean Vest TA
		body="Mummu Jacket +2", hands="Adhemar Wrist. +1", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.tp_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights", feet=gear.herculean_ta_feet}

    sets.engaged.Acc = {
		-- neck="Combatant's Torque", 
		head="Adhemar Bonnet +1", neck="Iskur Gorget", lear="Mache Earring +1",rear="Telos Earring",
		-- Herculean Vest TA
		body="Mummu Jacket +2", hands="Adhemar Wrist. +1", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Samnuha Tights", feet=gear.herculean_ta_feet}
	
	sets.engaged.DT = { 
		head="Malignance Chapeau", neck="Iskur Gorget", lear="Mache Earring +1",rear="Telos Earring",
		body="Mummu Jacket +2", hands="Adhemar Wrist. +1", lring="Chirich Ring +1", rring="Chirich Ring +1",
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Malignance Tights", feet="Malignance Boots"}
    
	sets.engaged.DW = {
		head="Adhemar Bonnet +1", neck="Iskur Gorget", lear="Suppanomimi", rear="Telos Earring",
		body="Adhemar Jacket +1", hands="Adhemar Wrist. +1", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.DW_jse_back, waist="Windbuffet Belt +1", legs="Samnuha Tights", feet=gear.herculean_ta_feet}

    sets.engaged.DW.Acc = {
		head="Adhemar Bonnet +1", neck="Iskur Gorget", lear="Suppanomimi", rear="Telos Earring",
		body="Adhemar Jacket +1", hands="Adhemar Wrist. +1",lring="Chirich Ring +1", rring="Chirich Ring +1",
		back=gear.DW_jse_back, waist="Windbuffet Belt +1", legs="Malignance Tights", feet="Malignance Boots"}

	sets.engaged.DW.DT = {
		head="Malignance Chapeau", neck="Iskur Gorget", lear="Mache Earring +1",rear="Telos Earring",
		body="Mummu Jacket +2", hands="Adhemar Wrist. +1", lring="Chirich Ring +1", rring="Chirich Ring +1",
		back=gear.tp_jse_back, waist="Kentarch Belt +1", legs="Malignance Tights", feet="Malignance Boots"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 10)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 10)
    elseif player.sub_job == 'RNG' then
        set_macro_page(3, 10)
	elseif player.sub_job == 'WAR' then
        set_macro_page(5, 10)
	elseif player.sub_job == 'WHM' then
		set_macro_page(4, 10)
	elseif player.sub_job == 'RDM' then
        set_macro_page(4, 10)
	elseif player.sub_job == 'BRD' then
        set_macro_page(4, 10)
    else
        set_macro_page(1, 10)
    end  
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 010')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
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
	
	autows = 'Leaden Salute'
	rangedautows = 'Last Stand'
	autofood = 'Sublime Sushi'
	ammostock = 198

    define_roll_values()
	
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","RngHelper","AutoStunMode","AutoDefenseMode","LuzafRing",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","RangedMode","WeaponskillMode","ElementalMode","IdleMode","Passive","RuneElement","CompensatorMode","TreasureMode",})
end

autows_list = {
		['Default']='Last Stand',
		['SavageWeapons']='Savage Blade',
		['LeadenWeapons']='Leaden Salute',
		['DualRangedWeapons']='Last Stand',
		['DualWeapons']='Savage Blade',
		['RollMeleeWeapons']='Savage Blade',
		['RollRangedWeapons']='Last Stand',}