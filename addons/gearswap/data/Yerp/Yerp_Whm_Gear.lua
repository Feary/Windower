-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('None','Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal', 'DT', 'Refresh')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','MeleeWeapons','DualWeapons','Staff')

	-- Augmented Capes
	gear.cure_jse_back 		= {name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Damage taken-5%',}}
	gear.idle_jse_back 		= {name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Phys. dmg. taken-10%',}}
	gear.DA_jse_back 		= {name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken-5%',}}
	
	gear.DW_jse_back 		= gear.DA_jse_back
	-- Str crit acc 
	gear.WSD_jse_back 		= gear.DA_jse_back
	-- MND WSD acc
	gear.MNDWSD_jse_back 		= gear.DA_jse_back
	-- INT WSD acc 
	gear.INTWSD_jse_back 		= gear.DA_jse_back
	
	--[[Global binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key
	]]

	-- Additional local binds
	send_command('bind ^` input /ma "Arise" <t>')
	send_command('bind !` input /ja "Penury" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind @backspace input /ma "Aurora Storm" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind !backspace input /ja "Accession" <me>')
	send_command('bind != input /ja "Sublimation" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')

    select_default_macro_book()
	user_job_lockstyle()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	-- Nehetsan Clubs?
	sets.weapons.None = {}
	sets.weapons.MeleeWeapons = {main="Maxentius", sub="Genbu's Shield"}
	sets.weapons.DualWeapons = {main="Maxentius", sub="Kaja Rod"}
	sets.weapons.Staff = {main="Malignance Pole", sub="Irenic Strap"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {main="C. Palug Hammer", sub="Genbu's Shield", ammo="Incantor Stone",
		-- sub="Chanter's Shield", ammo="Impatiens",
		-- neck=""Clr. Torque +2", rear="Malignance Earring", 
		head="Vanya Hood", neck="Voltsurge Torque", lear="Enchntr. Earring +1", rear="Loquac. Earring",
		-- hands="Fanatic's Gloves", rring="Kishar Ring",
		body="Inyanga Jubbah +2", hands=gear.helios_hands_FC, lring="Prolix Ring", rring="Defending Ring",
		-- back="Perimede Cape", legs="Volte Brais", feet="Regal Pumps +1" 
		back="Fi Follet Cape +1", waist="Witful Belt", legs=gear.chironic_fastcast_legs, feet="Kaykaus Boots +1"}

    sets.precast.FC.DT = {main="C. Palug Hammer", sub="Genbu's Shield", ammo="Incantor Stone",
		--  rear="Malignance Earring", 
		head="Vanya Hood", neck="Loricate Torque +1", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		-- hands="Gende. Gages +1", lring="Kishar Ring",
		body="Inyanga Jubbah +2", hands=gear.helios_hands_FC, lring="Prolix Ring", rring="Defending Ring",
		--  feet="Regal Pumps +1" 
		back="Fi Follet Cape +1", waist="Witful Belt", legs="Aya. Cosciales +2", feet="Kaykaus Boots +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})-- waist="Siegel Sash"
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +1"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {sub="Sors Shield",
		-- lear="Nourish. Earring", rear="Nourish. Earring +1",
		-- feet="Cure Clogs"
		head="Piety Cap +3", neck="Aceso's Choker",
		legs="Ebers Pant. +1"})
	
	sets.precast.FC.Cure.DT = set_combine(sets.precast.FC.Cure, {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +3"}
	sets.precast.JA.Devotion = {head="Piety Cap +3"}
	sets.precast.JA.Martyr = {hands="Piety Mitts +3"}


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Midcast Sets

    sets.Kiting = {lring="Shneddick Ring"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {ammo="Per. Lucky Egg", head="Wh. Rarab Cap +1", waist="Chaac Belt"})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {waist="Gishdubar Sash"}--ring1="Vocane Ring",ring2="Asklepian Ring"
	sets.Cure_Received = {waist="Gishdubar Sash"}--ring1="Vocane Ring",ring2="Asklepian Ring",
	sets.Self_Refresh = {waist="Gishdubar Sash"}-- back="Grapevine Cape" feet="Inspirited Boots"

	-- Conserve Mp set for spells that don't need anything else, for set_combine.	
	sets.ConserveMP = {main=gear.grioavolr_fc_staff, sub="Achaq Grip", ammo="Clarus Stone",
		--sub="Clerisy Strap +1", ammo="Pemphredo Tathlum",
		-- lear="Magnetic Earring",
		head="Vanya Hood", neck="Clr. Torque +1", lear="Gwati Earring",rear="Mendi. Earring",
		-- hands="Fanatic Gloves",
		body="Zendik Robe", hands=helios_hands_FC, lring="Mephitas's Ring +1", rring="Kishar Ring",
		--legs="Volte Brais",
		back="Fi Follet Cape +1", waist="Shinjutsu-no-Obi +1", legs="Aya. Cosciales +2", feet="Kaykaus Boots +1"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",ring1="Mujin Band", ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff, sub="Achaq Grip", ammo="Clarus Stone",
		--sub="Clerisy Strap +1", ammo="Pemphredo Tathlum",
		-- lear="Magnetic Earring",
		head="Vanya Hood", neck="Clr. Torque +1", lear="Gwati Earring",rear="Mendi. Earring",
		-- hands="Fanatic Gloves",
		body="Zendik Robe", hands=helios_hands_FC, lring="Mephitas's Ring +1", rring="Kishar Ring",
		--legs="Volte Brais",
		back="Fi Follet Cape +1", waist="Shinjutsu-no-Obi +1", legs="Aya. Cosciales +2", feet="Kaykaus Boots +1"}
		
    -- Cure sets
	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {main="Queller Rod", sub="Thuellaic Ecu +1", ammo="Psilomene", -- Pemphredo Tathlum
		--  lear="Regal Earring", rear="Glorius Earring",	
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Beatific Earring", rear="Orison Earring",
		body="Theo. Bliaut +3", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +1", feet="Kaykaus Boots +1"}
	
	sets.midcast.CureSolace =  {main="Queller Rod", sub="Thuellaic Ecu +1", ammo="Psilomene", -- Pemphredo Tathlum
		--  lear="Regal Earring", rear="Glorius Earring",	
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Beatific Earring", rear="Orison Earring",
		body="Ebers Bliaut +1", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +1", feet="Kaykaus Boots +1"}
		
	sets.midcast.LightWeatherCure = {main="Queller Rod", sub="Thuellaic Ecu +1", ammo="Psilomene", -- Pemphredo Tathlum
		-- lear="Regal Earring", rear="Glorius Earring",	
		head="Kaykaus Mitra +1",  neck="Clr. Torque +1", lear="Beatific Earring", rear="Orison Earring",
		body="Theo. Bliaut +3", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +1", feet="Kaykaus Boots +1"}
		
	sets.midcast.LightWeatherCureSolace = {main="Queller Rod", sub="Thuellaic Ecu +1", ammo="Psilomene", -- Pemphredo Tathlum
		--  lear="Regal Earring", rear="Glorius Earring",	
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Beatific Earring", rear="Orison Earring",
		body="Ebers Bliaut +1", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +1", feet="Kaykaus Boots +1"}
	
	sets.midcast.LightDayCure =  {main="Queller Rod", sub="Thuellaic Ecu +1", ammo="Psilomene", -- Pemphredo Tathlum
		--  lear="Regal Earring", rear="Glorius Earring",	
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Beatific Earring", rear="Orison Earring",
		body="Theo. Bliaut +3", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +1", feet="Kaykaus Boots +1"}
	
	sets.midcast.LightDayCureSolace = {main="Queller Rod", sub="Thuellaic Ecu +1", ammo="Psilomene", -- Pemphredo Tathlum
		--  lear="Regal Earring", rear="Glorius Earring",	
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Beatific Earring", rear="Orison Earring",
		body="Ebers Bliaut +1", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +1", feet="Kaykaus Boots +1"}
		
	sets.midcast.Curaga =  {main="Queller Rod", sub="Thuellaic Ecu +1", ammo="Psilomene", -- Pemphredo Tathlum
		-- lear="Regal Earring",
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Beatific Earring", rear="Orison Earring",
		body="Theo. Bliaut +3", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +1", feet="Kaykaus Boots +1"}

	sets.midcast.LightWeatherCuraga = {main="Iridal Staff", sub="Achaq Grip", ammo="Psilomene",
		-- lear="Regal Earring",
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Beatific Earring", rear="Orison Earring",
		body="Theo. Bliaut +3", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Stikini Ring +1",
		-- Twilight Cape
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +1", feet="Kaykaus Boots +1"}

	sets.midcast.LightDayCuraga = {main="Queller Rod", sub="Sors Shield", ammo="Psilomene",
		-- lear="Regal Earring", 
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Beatific Earring", rear="Orison Earring",
		body="Kaykaus Bliaut +1", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		--back="Twilight Cape", 
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +1", feet="Kaykaus Boots +1"}

	sets.midcast.Cure.DT = {main="Iridal Staff", sub="Kh", ammo="Psilomene", -- Pemphredo Tathlum
		--  lear="Regal Earring", rear="Glorius Earring",	
		head="Kaykaus Mitra +1", neck="Loricate Torque +1", lear="Beatific Earring", rear="Orison Earring",
		body="Kaykaus Bliaut +1", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Defending Ring",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +1", feet="Kaykaus Boots +1"}
		
	--Melee Curesets are used whenever your OffenseMode is set to anything but None.
	sets.midcast.MeleeCure = set_combine(sets.midcast.Cure,{})
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.CureSolace, {})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {})

	sets.midcast.Cursna = {main=gada_enhancing_club, sub="Sors Shield", -- ammo="Pemphredo Tathlum",
		-- main="Gambanteinn", sub="Thuellaic Ecu +1",
		-- neck="Debilis Medallion", lear="Ebers Earring +2",
		head="Kaykaus Mitra +1", lear="Beatific Earring",  rear="Meili Earring",
		-- hands="Fanatic Gloves", rring="Haoma's Ring",
		body="Ebers Bliaut +1", hands="Inyan. Dastanas +2", lring="Menelaus Ring", rring="Stikini Ring +1",
		back="Fi Follet Cape +1", waist="Bishop's Sash", legs="Th. Pant. +3", feet="Vanya Clogs"}

	-- -Na
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast,{
		-- main="Yagrush" sub="Thuellaic Ecu +1",
		head="Ebers Cap +1",
		hands="Ebers Mitts +1",
		back="Mending Cape", legs="Ebers Pantaloons +1", feet="Vanya Clogs"})
	
	-- Erase
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval,{
		-- main="Yagrush" sub="Thuellaic Ecu +1",
		neck="Clr. Torque +1", legs="Ebers Pant. +1"})
	
    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	-- Duration
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club, sub="Ammurapi Shield", ammo="Clarus Stone",
		-- neck="Incanter's Torque",   
		head=gear.telchine_head_Duration, lear="Andoaa Earring", rear="Mimir Earring",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Fi Follet Cape +1", waist="Embla Sash", legs=gear.telchine_legs_Duration, feet="Theo. Duckbills +3"}

	sets.midcast.BarElement = {main=gear.gada_enhancing_club, sub="Ammurapi Shield", ammo="Clarus Stone",
		-- neck="Incanter's Torque",
		head="Ebers Cap +1", lear="Andoaa Earring", rear="Mimir Earring",
		body="Ebers Bliaut +1", hands="Ebers Mitts +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- Ebers Duckbills +3
		back="Fi Follet Cape +1", waist="Embla Sash", legs="Piety Pantaln. +3", feet="Theo. Duckbills +3"}
	
	sets.midcast.BarElement['Light Arts'] = {main=gear.gada_enhancing_club, sub="Ammurapi Shield", ammo="Clarus Stone",
		-- neck="Incanter's Torque",  
		head=gear.telchine_head_Duration,
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Mending Cape", waist="Embla Sash", legs=gear.telchine_legs_Duration, feet="Theo. Duckbills +3"}
		
	sets.midcast.BarStatus = {main=gear.gada_enhancing_club, sub="Ammurapi Shield", ammo="Clarus Stone",		
		head=gear.telchine_head_Duration, neck="Sroda Necklace",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Fi Follet Cape +1", waist="Embla Sash", legs=gear.telchine_legs_Duration, feet="Theo. Duckbills +3"}

	-- 500 Skill
	sets.midcast.BoostStat = {main=gear.gada_enhancing_club, sub="Ammurapi Shield", ammo="Clarus Stone",
		-- ammo="Pemphredo Tathlum",
		-- neck="Incanter's Torque",
		head=gear.telchine_head_Duration, lear="Andoaa Earring", rear="Mimir Earring",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Fi Follet Cape +1", waist="Embla Sash", legs="Piety Pantaln. +3", feet="Theo. Duckbills +3"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {
		main=gear.gada_enhancing_club, sub="Ammurapi Shield", ammo="Clarus Stone",
		head=gear.telchine_head_Duration,
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration,
		back="Fi Follet Cape +1", waist="Embla Sash", legs=gear.telchine_legs_Duration, feet="Theo. Duckbills +3"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		main="Vadose Rod", sub="Ammurapi Shield",
		head=gear.chironic_refresh_head,
		body=gear.telchine_body_Duration,
		--hands="Regal Cuffs",
		--waist="Emphatikos Rope",legs="Shedir Seraweels",
		feet="Theo. Duckbills +3"})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
		main="Daybreak", sub="Ammurapi Shield",
		head="Inyanga Tiara +2",
		body="Piety Bliaut +3", hands="Ebers Mitts +1",
		waist="Embla Sash", legs="Th. Pant. +3", feet="Theo. Duckbills +3"})
		
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {feet="Piety Duckbills +3"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {feet="Piety Duckbills +3"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {legs="Piety Pantaln. +3"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {legs="Piety Pantaln. +3"})

	sets.midcast.Impact = {-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat, neck="Voltsurge Torque", lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +2", neck="Sanctity Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Theo. Bliaut +3",  hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}
		
	sets.midcast['Elemental Magic'] = {--- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat, neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	sets.midcast['Elemental Magic'].Resistant = {-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat, neck="Voltsurge Torque", lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	sets.midcast['Divine Magic'] = {ammo="Clarus Stone",-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- 
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

    sets.midcast.Flash = {ammo="Clarus Stone", --Hydrocera
		--  main"Yagrush" Rank 15
		main="Maxentius", sub="Ammurapi Shield",
		-- neck="Jokushu Chain",lear="Regal Earring", rear="Malignance Earring", rear="Ebers Earring +2",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Theo. Bliaut +3",  hands="Piety Mitts +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- Obstin. Sash Rank 30
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs="Th. Pant. +3", feet="Theo. Duckbills +3"}
    
	sets.midcast.Repose = sets.midcast.Flash
	
	sets.midcast.Banish = {ammo="Clarus Stone",-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Theophany Cap +3", neck="Saevus Pendant +1", lear="Beatific Earring", rear="Enchntr. Earring +1",
		-- Cohort Cloak Rank 15 Bunzi's Gloves Freke Ring 
		body="Theo. Bliaut +3",  hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Metamor. ring +1",
		-- Eschan Stone Bunzi's Pants Bunzi Sabots
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}
    
	sets.midcast.Holy = sets.midcast.Banish
	
	sets.midcast['Dark Magic'] = {ammo="Clarus Stone",-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

    sets.midcast.Drain = {ammo="Clarus Stone", -- Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- lear="Regal Earring", rear="Malignance Earring",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

    sets.midcast.Drain.Resistant = {-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {ammo="Incantor Stone",-- Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	sets.midcast.Stun.Resistant = {ammo="Incantor Stone",-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	sets.midcast['Enfeebling Magic'] = {ammo="Clarus Stone", -- Pemphredo Tathlum
		--  main="Bunzi's Rod" Rank 30
		main="Daybreak", sub="Ammurapi Shield",
		-- lear="Regal Earring", rear="Ebers Earring +2" rear="Malignance Earring",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Vor Earring", rear="Enchntr. Earring +1",
		-- Regal Cuffs
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Metamor. ring +1",
		-- Obsin. Sash Rank 30
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	sets.midcast['Enfeebling Magic'].Resistant = {ammo="Clarus Stone",-- Grioavolr Pemphredo Tathlum
		main="Maxentius", sub="Ammurapi Shield",
		-- Chironic Hat, neck="Voltsurge Torque", lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Vor Earring", rear="Enchntr. Earring +1",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {main="Boonwell Staff",
		head="Inyanga Tiara +2", neck="Eidolon Pendant", lear="Ethereal Earring", rear="Odnowa Earring +1",
		body="Shamash Robe", hands=gear.chironic_refresh_hands, lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Fi Follet Cape +1", waist="Shinjutsu-no-Obi +1",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Daybreak", sub="Genbu's Shield", ammo="Staunch Tahlum",
		-- sub="Genmei Shield", ammo="Homiliary",
		-- head="Bunzi's Hat", rear="Ebers Eaerring +2",
		head=gear.chironic_refresh_head, neck="Warder's Charm +1", lear="Eabani Earring", rear="Etiolation Earring",
		-- Ebers Bliaut +3 Bunzi's Gloves
		body="Shamash Robe", hands=gear.chironic_refresh_hands, lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Plat. Mog. Belt", Ebers Pant. +3 Ebers Duckbills +3
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1", legs="Assid. Pants +1", feet="Inyan. Crackows +2"}

	sets.idle.DT = {main="Daybreak", sub="Genbu's Shield", ammo="Staunch Tahlum",
		-- main="Daybreak", sub="Genmei Shield", ammo="Staunch Tahlum +1",
		-- head="Bunzi's Hat", neck="Warder's Charm +1", rear="Ebers Eaerring +2",
		head="Inyanga Tiara +2", neck="Warder's Charm +1", lear="Eabani Earring", rear="Etiolation Earring",
		-- Ebers Bliaut +3 Bunzi's Gloves
		body="Shamash Robe", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Plat. Mog. Belt", Ebers Pant. +3 Ebers Duckbills +3
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1",legs="Assid. Pants +1", feet="Inyan. Crackows +2"}
		
	sets.idle.Refresh = {main="Daybreak", sub="Genbu's Shield", ammo="Staunch Tahlum",
		-- main="Daybreak", sub="Genmei Shield", ammo="Homiliary",
		-- head="Bunzi's Hat",   rear="Ebers Eaerring +2",
		head=gear.chironic_refresh_head, neck="Sibyl Scarf", lear="Eabani Earring", rear="Etiolation Earring",
		-- Ebers Bliaut +3 Bunzi's Gloves
		body="Shamash Robe", hands=gear.chironic_refresh_hands, lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Plat. Mog. Belt", Ebers Pant. +3 Ebers Duckbills +3
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1",legs="Assid. Pants +1", feet="Inyan. Crackows +2"}

    --sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	sets.idle.Weak = {main="Daybreak", sub="Genbu's Shield", ammo="Staunch Tahlum",
		-- sub="Genmei Shield", ammo="Staunch Tahlum +1",
		-- head="Bunzi's Hat",  rear="Ebers Eaerring +2",
		head="Inyanga Tiara +2", neck="Warder's Charm +1", lear="Eabani Earring", rear="Etiolation Earring",
		-- Ebers Bliaut +3 Bunzi's Gloves
		body="Shamash Robe", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Plat. Mog. Belt", Ebers Pant. +3 Ebers Duckbills +3
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1",legs="Assid. Pants +1", feet="Inyan. Crackows +2"}

    -- Defense sets
	sets.defense.PDT = {main="Mafic Cudgel", sub="Genbu's Shield", ammo="Staunch Tahlum",
		-- sub="Genmei Shield", ammo="Homiliary",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Shamash Robe", hands="Aya. Manopolas +2", lring="Gelatinous Ring +1", rring="Defending Ring",
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.defense.MDT ={main="Mafic Cudgel", sub="Genbu's Shield", ammo="Staunch Tahlum",
		-- main=gear.grioavolr_fc_staff, sub="Irenic Strap +1",
		head="Inyanga Tiara +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Inyanga Ring", rring="Defending Ring",
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}

    sets.defense.MEVA = {main="Mafic Cudgel", sub="Genbu's Shield", ammo="Staunch Tahlum",
		-- main=gear.grioavolr_fc_staff, sub="Irenic Strap +1",
		head="Inyanga Tiara +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", lring="Inyanga Ring", rring="Defending Ring",
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1", legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
		
	-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
		head="Aya. Zucchetto +2", lear="Mache Earring +1", rear="Mache Earring +1",
		body="Ayanmo Corazza +2", hands="Gazu Bracelets +1", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Windbuffet Belt +1", 
		back=gear.DA_jse_back, legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
    sets.engaged.Acc = {
		head="Aya. Zucchetto +2", lear="Mache Earring +1", rear="Mache Earring +1",
		body="Ayanmo Corazza +2", hands="Gazu Bracelets +1", lring="Chirich Ring +1", rring="Chirich Ring +1",
		back=gear.DA_jse_back, legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
    sets.engaged.DW = {
		head="Aya. Zucchetto +2", lear="Mache Earring +1", rear="Mache Earring +1",
		body="Ayanmo Corazza +2", hands="Gazu Bracelets +1", lring="Chirich Ring +1", rring="Chirich Ring +1",
		back=gear.DW_jse_back, legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
    sets.engaged.DW.Acc = {
		head="Aya. Zucchetto +2", lear="Mache Earring +1", rear="Mache Earring +1",
		body="Ayanmo Corazza +2", hands="Gazu Bracelets +1", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Windbuffet Belt +1", 
		back=gear.DW_jse_back, legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	-- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Oshasha's Treatise",
		-- rear="Telos Earring",
		head="Piety Cap +3", neck="Fotia Gorget", lear="Moonshade Earring", rear="Brutal Earring",
		body="Piety Bliaut +3", hands="Piety Mitts +3", lring="Stikini Ring +1", rring="Metamor. Ring +1", 
		-- waist="Fotia Belt"
		back=gear.WSD_jse_back, legs="Piety Pantaln. +3", feet="Piety Duckbills +3"}

	-- Club 
	sets.precast.WS['Hexa Strike'] = {ammo="Oshasha's Treatise", -- Ammo="Floestone",
		-- rear="Telos Earring",
		head="Piety Cap +3", neck="Fotia Gorget", lear="Moonshade Earring", rear="Brutal Earring",
		-- lring="Begrudging Ring" rring="Ilabrat Ring",
		body="Piety Bliaut +3", hands="Piety Mitts +3", lring="Stikini Ring +1", rring="Metamor. Ring +1", 
		-- waist="Fotia Belt"
		back=gear.WSD_jse_back, legs="Piety Pantaln. +3", feet="Piety Duckbills +3"}
	
	sets.precast.WS['Realmrazer'] = {ammo="Oshasha's Treatise", -- Ammo="Amar Cluster",
		-- lear="Regal Earring", rear="Telos Earring",
		head="Piety Cap +3", neck="Fotia Gorget",
		-- lring="Rufescent Ring"
		body="Piety Bliaut +3", hands="Piety Mitts +3", lring="", rring="Metamor. Ring +1", 
		-- waist="Fotia Belt"
		back=gear.WSD_jse_back, legs="Piety Pantaln. +3", feet="Piety Duckbills +3"} 
	
    sets.precast.WS['Flash Nova'] = {ammo="Oshasha's Treatise",
		-- main="Daybreak", sub="Genmei Shield",
		-- Nyame Helm 
		head="Piety Cap +3", neck="Cleric's Torque +1", lear="Moonshade Earring", rear="Brutal Earring",
		-- body="Nyame Mail" hands="Nyame Gauntlets" lring="Epaminandas's Ring"
		body="Piety Bliaut +3", hands="Piety Mitts +3", lring="Stikini Ring +1", rring="Metamor. Ring +1", 
		-- waist="Orpheus's Sash" legs="Nyame Flanchard", feet="Nyame Sollerets"
		back=gear.MNDWSD_jse_back, legs="Piety Pantaln. +3", feet="Piety Duckbills +3"} 

    sets.precast.WS['Mystic Boon'] = {ammo="Oshasha's Treatise", -- Ammo="Floestone",
		-- Nyame Helm rear="Regal Earring",
		head="Aya. Zucchetto +2", neck="Cleric's Torque +1", lear="Moonshade Earring",
		-- body="Nyame Mail", hands="Nyame Gauntlets", lring="Epaminandas's Ring", 
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", rring="Metamor. Ring +1",
		-- Waist="Grunfeld Rope",
		back=gear.MNDWSD_jse_back, legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.precast.WS['Black Halo'] = {ammo="Oshasha's Treatise", -- Ammo="Floestone",
		-- main="Maxentius", sub="Genmei Shield",
		-- Nyame Helm 
		head="Piety Cap +3", neck="Cleric's Torque +1", lear="Moonshade Earring", rear="Brutal Earring",
		-- body="Nyame Mail" hands="Nyame Gauntlets" lring="Epaminandas's Ring"
		body="Piety Bliaut +3", hands="Piety Mitts +3", lring="Stikini Ring +1", rring="Metamor. Ring +1", 
		-- waist="Grunfeld Rope" legs="Nyame Flanchard", feet="Nyame Sollerets"
		back=gear.MNDWSD_jse_back, legs="Piety Pantaln. +3", feet="Piety Duckbills +3"} 
	
	sets.precast.WS['Judgment'] = sets.precast.WS['Black Halo']
	sets.precast.WS['Randgirth'] = sets.precast.WS['Black Halo']
	
	-- Staff 
	sets.precast.WS['Shell Crusher'] = {ammo="Oshasha's Treatise",
		-- rear="Telos Earring",
		head="Piety Cap +3", neck="Fotia Gorget", lear="Moonshade Earring", rear="Brutal Earring",
		body="Piety Bliaut +3", hands="Piety Mitts +3", lring="Stikini Ring +1", rring="Metamor. Ring +1", 
		-- waist="Fotia Belt"
		back=gear.WSD_jse_back, legs="Piety Pantaln. +3", feet="Piety Duckbills +3"}
	
	sets.precast.WS['Cataclysm'] = {ammo="Oshasha's Treatise", -- Ammo="Floestone",
		-- head="Pixie Hairpin +1", rear="Malignance Earring",
		head="Piety Cap +3", neck="Sibyl Scarf", lear="Friomisi Earring",
		-- body="Nyame Mail", hands="Nyame Gauntlets", lring="Archon Ring" 
		body="Piety Bliaut +3", hands="Piety Mitts +3", rring="Metamor. Ring +1", 
		-- waist="Orpheus's Sash" Nyame Flachard Nyame Sollerets
		back=gear.INTWSD_jse_back, waist="Acuity Belt +1", legs="Piety Pantaln. +3", feet="Piety Duckbills +3"} 
	
	
	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1", back="Mending Cape"}
	
	-- used for omen objectives
	-- //curecheat
	sets.HPDown = {
		head="Pixie Hairpin +1",neck="Loricate Torque +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body=empty,hands=empty,ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back=empty,waist="Flume Belt",legs=empty,feet=empty}
		
	sets.HPCure = {}


	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	if player.sub_job == 'SCH' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'RDM' then
		set_macro_page(2, 1)
	elseif player.sub_job == 'BLM' then
		set_macro_page(3, 1)
	else
		set_macro_page(1, 1)
	end	
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 001')
end

function user_job_self_command(commandArgs, eventArgs)
	
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
	state.Buff['Divine Caress'] = buffactive['Divine Carness'] or false
	
	state.AutoCaress = M(false, 'Auto Caress Mode')
	state.Gambanteinn = M(false, 'Gambanteinn Cursna Mode')
	state.BlockLowDevotion = M(true, 'Block Low Devotion')
	
	autows = 'Black Halo'
	autofood = 'Miso Ramen'
	
	state.ElementalMode = M{['description'] = 'Elemental Mode','Light','Dark','Fire','Ice','Wind','Earth','Lightning','Water',}

	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoNukeMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode"},{"AutoBuffMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","ElementalMode","CastingMode","TreasureMode",})
	
	function handle_smartcure(cmdParams)
		if cmdParams[2] then
			if tonumber(cmdParams[2]) then
				cureTarget = windower.ffxi.get_mob_by_id(tonumber(cmdParams[2]))
			else
				cureTarget = table.concat(cmdParams, ' ', 2)
				cureTarget = get_closest_mob_by_name(cureTarget) 
				if not cureTarget.name then cureTarget = player.target end
				if not cureTarget.name then cureTarget = player end
			end
		elseif player.target.type == "SELF" or player.target.type == 'MONSTER' or player.target.type == 'NONE' then
			cureTarget = player
		else
			cureTarget = player.target
		end

		if cureTarget.status == 2 or cureTarget.status == 3 then
			windower.chat.input('/ma "Arise" '..cureTarget..'')
			return
		end
		
		local missingHP
		local spell_recasts = windower.ffxi.get_spell_recasts()

		if cureTarget.type == 'MONSTER' then
			if silent_can_use(4) and spell_recasts[4] < spell_latency then
				windower.chat.input('/ma "Cure IV" '..cureTarget.id..'')
			elseif spell_recasts[3] < spell_latency then
				windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
			elseif spell_recasts[2] < spell_latency then
				windower.chat.input('/ma "Cure II" '..cureTarget.id..'')
			else
				add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
			end
		elseif cureTarget.in_alliance then
			cureTarget.hp = find_player_in_alliance(cureTarget.name).hp
			local est_max_hp = cureTarget.hp / (cureTarget.hpp/100)
			missingHP = math.floor(est_max_hp - cureTarget.hp)
		else
			local est_current_hp = 1800 * (cureTarget.hpp/100)
			missingHP = math.floor(1800 - est_current_hp)
		end

		if missingHP < 250 then
			if spell_recasts[1] < spell_latency then
				windower.chat.input('/ma "Cure" '..cureTarget.id..'')
			elseif spell_recasts[2] < spell_latency then
				windower.chat.input('/ma "Cure II" '..cureTarget.id..'')
			else
				add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
			end
		elseif missingHP < 400 then
			if spell_recasts[2] < spell_latency then
				windower.chat.input('/ma "Cure II" '..cureTarget.id..'')
			elseif spell_recasts[3] < spell_latency then
				windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
			elseif spell_recasts[1] < spell_latency then
				windower.chat.input('/ma "Cure" '..cureTarget.id..'')
			else
				add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
			end
		elseif missingHP < 900 then
			if spell_recasts[3] < spell_latency then
				windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
			elseif spell_recasts[4] < spell_latency then
				windower.chat.input('/ma "Cure IV" '..cureTarget.id..'')
			elseif spell_recasts[5] < spell_latency then
				windower.chat.input('/ma "Cure V" '..cureTarget.id..'')
			else
				add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
			end
		elseif missingHP < 1400 then
			if spell_recasts[5] < spell_latency then
				windower.chat.input('/ma "Cure V" '..cureTarget.id..'')
			elseif spell_recasts[4] < spell_latency then
				windower.chat.input('/ma "Cure IV" '..cureTarget.id..'')
			elseif spell_recasts[6] < spell_latency then
				windower.chat.input('/ma "Cure VI" '..cureTarget.id..'')
			elseif spell_recasts[3] < spell_latency then
				windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
			else
				add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
			end
		else
			if spell_recasts[6] < spell_latency then
				windower.chat.input('/ma "Cure VI" '..cureTarget.id..'')
			elseif spell_recasts[5] < spell_latency then
				windower.chat.input('/ma "Cure V" '..cureTarget.id..'')
			elseif spell_recasts[4] < spell_latency then
				windower.chat.input('/ma "Cure IV" '..cureTarget.id..'')
			elseif spell_recasts[3] < spell_latency then
				windower.chat.input('/ma "Cure III" '..cureTarget.id..'')
			else
				add_to_chat(123,'Abort: Appropriate cures are on cooldown.')
			end
		end
	end
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	When='Always'},
		{Name='Haste',			Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Always'},
		{Name='Refresh',		Buff='Refresh',		SpellID=109,	When='Always'},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		When='Always'},
	},
	
	default = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen IV',		Buff='Regen',		SpellID=477,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',		SpellID=106,	Reapply=false},
		{Name='Boost-MND',		Buff='MND Boost',	SpellID=484,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	Reapply=false},
		--{Name='Barthundra',	Buff='Barthunder',	SpellID=70,		Reapply=false},
		--{Name='Barparalyzra',	Buff='Barparalyze',	SpellID=88,		Reapply=false},
	},
	melee = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Boost-STR',		Buff='STR Boost',	SpellID=479,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Auspice',		Buff='Auspice',		SpellID=96,		Reapply=false},
	},
	ramuh = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen IV',		Buff='Regen',		SpellID=477,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',		SpellID=106,	Reapply=false},
		{Name='Boost-MND',		Buff='MND Boost',	SpellID=484,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	Reapply=false},
		{Name='Barthundra',		Buff='Barthunder',	SpellID=70,		Reapply=false},
		{Name='Barparalyzra',	Buff='Barparalyze',	SpellID=88,		Reapply=false},
	},
	shiva = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen IV',		Buff='Regen',		SpellID=477,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',		SpellID=106,	Reapply=false},
		{Name='Boost-MND',		Buff='MND Boost',	SpellID=484,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	Reapply=false},
		{Name='Barblizzara',	Buff='Barblizzard',	SpellID=67,		Reapply=false},
		{Name='Barparalyzra',	Buff='Barparalyze',	SpellID=88,		Reapply=false},
	},
}

autows_list = {
		['None']='Hexa Strike',
		['MeleeWeapons']='Black Halo',		
		['DualWeapons']='Hexa Strike',
		['Staff']='Cataclysm'}