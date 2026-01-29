-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('None','Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal', 'DT', 'Refresh')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','MeleeWeapons','DualWeapons','Staff','Gambanteinn')

	-- Augmented Capes
	gear.cure_jse_back 		= {name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Spell interruption rate down-10%',}}
	gear.idle_jse_back 		= {name="Alaunus's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Mag. Evasion+15',}}
	gear.enmity_jse_back	= {name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Mag. Evasion+15',}}
	
	gear.DA_jse_back 		= {name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	
	gear.DW_jse_back 		= gear.DA_jse_back
	-- Str crit acc 
	gear.WSD_jse_back 		= gear.DA_jse_back
	-- MND WSD acc
	gear.MNDWSD_jse_back 	= gear.DA_jse_back
	-- INT WSD acc 
	gear.INTWSD_jse_back 	= gear.DA_jse_back
	
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
	sets.weapons.None = {main="Yagrush", sub="Genmei Shield"}
	sets.weapons.Yagrush = {main="Yagrush", sub="Genmei Shield"}
	sets.weapons.MeleeWeapons = {main="Tishtrya", sub="Genmei Shield"}
	sets.weapons.DualWeapons = {main="Tishtrya", sub="Kaja Rod"}
	sets.weapons.Staff = {main="Malignance Pole", sub="Bloodrain Strap"}
	sets.weapons.Gambanteinn = {main="Stenz", sub="Genmei Shield"}
	sets.weapons.Maxentius = {main="Maxentius", sub="Genmei Shield"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {main="Pandit's Staff", sub="Clerisy Strap", ammo="Sapience Orb",
		-- Ebers Cap +3 Impatiens
		head="Ebers Cap +2", neck="Clr. Torque +2", lear="Malignance Earring", rear="Loquac. Earring",
		body="Inyanga Jubbah +2", hands="Fanatic Gloves", lring="Kishar Ring", rring="Lebeche Ring",
		back="Fi Follet Cape +1", waist="Witful Belt", legs="Volte Brais", feet="Regal Pumps +1"}

    sets.precast.FC.DT = {main="Pandit's Staff", sub="Clerisy Strap",  ammo="Sapience Orb",		
		head="Ebers Cap +2", neck="Loricate Torque +1", lear="Malignance Earring", rear="Loquac. Earring",
		body="Inyanga Jubbah +2", hands="Fanatic Gloves", lring="Kishar Ring", rring="Defending Ring",
		back="Fi Follet Cape +1", waist="Witful Belt", legs="Volte Brais", feet="Regal Pumps +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})-- waist="Siegel Sash"
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {ammo="Impatiens", 
		-- sub="Chanter's Shield"	
		back="Perimede Cape", legs="Ebers Pant. +3"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		-- Impatiens
		main="Pandit's Staff",
		head="Piety Cap +3", rear="Nourish. Earring +1",
		lring="Defending Ring", 
		legs="Ebers Pant. +3", feet="Hygieia Clogs +1"})
	
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
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {ammo="Per. Lucky Egg", head="Volte Cap", hands="Volte Bracers", waist="Chaac Belt"})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {waist="Gishdubar Sash",ring2="Asklepian Ring"}
	sets.Cure_Received = {waist="Gishdubar Sash",ring2="Asklepian Ring"}
	sets.Self_Refresh = {waist="Gishdubar Sash",feet="Inspirited Boots"}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.	
	sets.ConserveMP = {main="Septoptic", sub="Thuellaic Ecu +1", ammo="Pemphredo Tathlum",
		-- lear="Magnetic Earring",
		head="Vanya Hood", neck="Clr. Torque +2", lear="Gwati Earring", rear="Calamitous Earring",
		body="Zendik Robe", hands="Fanatic Gloves", lring="Mephitas's Ring +1", rring="Kishar Ring",
		back="Fi Follet Cape +1", waist="Shinjutsu-no-Obi +1", legs="Volte Brais", feet="Kaykaus Boots +1"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari", lear="Static Earring", ring1="Mujin Band", ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {}
		
    -- Cure sets
	sets.midcast['Full Cure'] = set_combine(sets.midcast.FastRecast,{main="Asclepius"})
	
	sets.midcast.Cure = {main="Queller Rod", sub="Thuellaic Ecu +1", ammo="Pemphredo Tathlum",
		head="Kaykaus Mitra +1", neck="Clr. Torque +2", lear="Regal Earring", rear="Glorius Earring",
		body="Theo. Bliaut +3", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +3", feet="Kaykaus Boots +1"}
	
	sets.midcast.CureSolace =  {main="Queller Rod", sub="Thuellaic Ecu +1", ammo="Pemphredo Tathlum", 
		head="Kaykaus Mitra +1", neck="Clr. Torque +2", lear="Regal Earring", rear="Glorius Earring",
		body="Ebers Bliaut +2", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +3", feet="Kaykaus Boots +1"}
		
	sets.midcast.LightWeatherCure = {main="Queller Rod", sub="Thuellaic Ecu +1", ammo="Pemphredo Tathlum",
		head="Kaykaus Mitra +1", neck="Clr. Torque +2", lear="Regal Earring", rear="Glorius Earring",
		body="Theo. Bliaut +3", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +3", feet="Kaykaus Boots +1"}
	
		
	sets.midcast.LightWeatherCureSolace = {main="Queller Rod", sub="Thuellaic Ecu +1", ammo="Pemphredo Tathlum", 
		head="Kaykaus Mitra +1", neck="Clr. Torque +2", lear="Regal Earring", rear="Glorius Earring",
		body="Ebers Bliaut +2", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +3", feet="Kaykaus Boots +1"}
	
	sets.midcast.LightDayCure =  {main="Queller Rod", sub="Thuellaic Ecu +1", ammo="Pemphredo Tathlum",
		head="Kaykaus Mitra +1", neck="Clr. Torque +2", lear="Regal Earring", rear="Glorius Earring",
		body="Theo. Bliaut +3", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +3", feet="Kaykaus Boots +1"}
	
	
	sets.midcast.LightDayCureSolace = {main="Queller Rod", sub="Thuellaic Ecu +1", ammo="Pemphredo Tathlum", 
		head="Kaykaus Mitra +1", neck="Clr. Torque +2", lear="Regal Earring", rear="Glorius Earring",
		body="Ebers Bliaut +2", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +3", feet="Kaykaus Boots +1"}
		
	sets.midcast.Curaga =  {main="Queller Rod", sub="Thuellaic Ecu +1", ammo="Pemphredo Tathlum",
		head="Kaykaus Mitra +1", neck="Clr. Torque +2", lear="Regal Earring", rear="Glorius Earring",
		body="Theo. Bliaut +3", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +3", feet="Kaykaus Boots +1"}
	

	sets.midcast.LightWeatherCuraga = {main="Iridal Staff", sub="Achaq Grip", ammo="Psilomene",
		head="Kaykaus Mitra +1", neck="Clr. Torque +2", lear="Regal Earring", rear="Glorius Earring",
		body="Ebers Bliaut +2", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		-- back="Twilight Cape", 
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +3", feet="Kaykaus Boots +1"}

	sets.midcast.LightDayCuraga = {main="Queller Rod", sub="Sors Shield", ammo="Psilomene",
		head="Kaykaus Mitra +1", neck="Clr. Torque +2", lear="Regal Earring", rear="Glorius Earring",
		body="Ebers Bliaut +2", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		--back="Twilight Cape", 
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +3", feet="Kaykaus Boots +1"}

	sets.midcast.Cure.DT = {main="Malignance Pole", sub="Enki Strap", ammo="Staunch Tathlum", 
		head="Kaykaus Mitra +1", neck="Clr. Torque +2", lear="Regal Earring", rear="Glorius Earring",
		body="Ebers Bliaut +2", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Defending Ring",
		back=gear.cure_jse_back, waist="Shinjutsu-no-obi +1", legs="Ebers Pant. +3", feet="Kaykaus Boots +1"}
		
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

	sets.midcast.Cursna = {main=gada_enhancing_club, sub="Thuellaic Ecu +1", ammo="Pemphredo Tathlum",
		-- main="Gambanteinn", 
		head=gear.vanya_hood_pathb, neck="Debilis Medallion", lear="Meili Earring", rear="Ebers Earring +1",
		body="Ebers Bliaut +2", hands="Fanatic Gloves", lring="Menelaus Ring", rring="Haoma's Ring",
		back="Fi Follet Cape +1", waist="Bishop's Sash", legs="Th. Pant. +3", feet="Vanya Clogs"}

	-- -Na
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast,{
		main="Yagrush", sub="Thuellaic Ecu +1",
		head="Ebers Cap +2",
		hands="Ebers Mitts +2",
		back="Mending Cape", legs="Ebers Pant. +3", feet="Vanya Clogs"})
	
	-- Erase
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval,{
		main="Yagrush", sub="Thuellaic Ecu +1",
		neck="Clr. Torque +2", legs="Ebers Pant. +3"})
	
	sets.midcast.Esuna = set_combine(sets.midcast.StatusRemoval,{
		main="Asclepius", sub="Thuellaic Ecu +1",
		neck="Clr. Torque +2", legs="Ebers Pant. +3"})
	
    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	-- Duration
	sets.midcast['Enhancing Magic'] = {ammo="Pemphredo Tathlum",
		main=gear.gada_enhancing_club, sub="Ammurapi Shield",
		head=gear.telchine_head_Duration, neck="Incanter's Torque", lear="Andoaa Earring",  rear="Mimir Earring",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Fi Follet Cape +1", waist="Embla Sash", legs=gear.telchine_legs_Duration, feet="Theo. Duckbills +3"}

	sets.midcast.BarElement = {ammo="Pemphredo Tathlum",
		main="Beneficus", sub="Ammurapi Shield",
		head="Ebers Cap +2", neck="Incanter's Torque", lear="Andoaa Earring",  rear="Mimir Earring",
		body="Ebers Bliaut +2", hands="Ebers Mitts +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Fi Follet Cape +1", waist="Embla Sash", legs="Piety Pantaln. +3", feet="Ebers Duckbills +2"}
	
	sets.midcast.BarElement['Light Arts'] = {main="Boonwell Staff", sub="Fulcio Grip", ammo="Clarus Stone",
		main="Beneficus", sub="Ammurapi Shield",
		head=gear.telchine_head_Duration, neck="Incanter's Torque",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Mending Cape", waist="Embla Sash", legs=gear.telchine_legs_Duration, feet="Theophany Duckbills +3" }
		
	sets.midcast.BarStatus = {main=gear.gada_enhancing_club, sub="Thuellaic Ecu +1", ammo="Pemphredo Tathlum",
		main=gear.gada_enhancing_club, sub="Ammurapi Shield",
		head=gear.telchine_head_Duration, neck="Sroda Necklace",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Fi Follet Cape +1", waist="Embla Sash", legs=gear.telchine_legs_Duration, feet="Theo. Duckbills +3"}

	-- 500 Skill
	sets.midcast.BoostStat = {main=gear.gada_enhancing_club, sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head=gear.telchine_head_Duration, neck="Incanter's Torque", lear="Andoaa Earring", rear="Mimir Earring",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Fi Follet Cape +1", waist="Embla Sash", legs="Piety Pantaln. +3", feet="Theo. Duckbills +3"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",lear="Earthcry Earring",waist="Siegel Sash"})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {ammo="Pemphredo Tahlum",
		main=gear.gada_enhancing_club, sub="Ammurapi Shield", 
		head=gear.telchine_head_Duration,
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration,
		back="Fi Follet Cape +1", waist="Embla Sash", legs=gear.telchine_legs_Duration, feet="Theo. Duckbills +3"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {ammo="Pemphredo Tahlum",
		main="Vadose Rod", sub="Ammurapi Shield",
		head=gear.chironic_aspir_head,
		body=gear.telchine_body_Duration,
		--hands="Regal Cuffs",
		back="Fi Follet Cape +1", waist="Emphatikos Rope", legs="Shedir Seraweels", feet="Theo. Duckbills +3"})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {ammo="Pemphredo Tahlum",
		main="Bolelabunga", sub="Ammurapi Shield",
		-- lear="Magnetic Earring", rear="Gifted Earring",
		head="Inyanga Tiara +2", lear="Gwati Earring", rear="Calamitous Earring",
		body="Piety Bliaut +3", hands="Ebers Mitts +2", lring="Mephitas's Earring +1",
		-- Bunzi's Sabots
		back="Fi Follet Cape +1", dwaist="Embla Sash", legs="Th. Pant. +3", feet="Theo. Duckbills +3"})
		
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {feet="Piety Duckbills +3"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {feet="Piety Duckbills +3"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {legs="Piety Pantaln. +3"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {legs="Piety Pantaln. +3"})

	sets.midcast.Impact = {-- Grioavolr ammo="Pemphredo Tathlum"
		main="Daybreak", sub="Ammurapi Shield",
		-- Chironic Hat, 
		head="Inyanga Tiara +2", neck="Voltsurge Torque", lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3",  hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}
		
	sets.midcast['Elemental Magic'] = {--- Grioavolr ammo="Pemphredo Tathlum",
		main="Daybreak", sub="Ammurapi Shield",
		-- Chironic Hat, 
		head="Inyanga Tiara +2", neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	sets.midcast['Elemental Magic'].Resistant = {ammo="Pemphredo Tathlum",
		main="Daybreak", sub="Ammurapi Shield",
		-- Chironic Hat, neck="Voltsurge Torque", lear="Regal Earring", rear="Malignance Earring",
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	sets.midcast['Divine Magic'] = {ammo="Pemphredo Tathlum",
		main="Daybreak", sub="Ammurapi Shield",
		-- neck="Voltsurge Torque",lear="Regal Earring", rear="Malignance Earring",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Gwati Earring", rear="Enchntr. Earring +1",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- 
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

    sets.midcast.Flash = {ammo="Hydrocera",
		--  main"Yagrush" Rank 15 
		main="Yagrush", sub="Ammurapi Shield",
		-- neck="Jokushu Chain", rear="Ebers Earring +2",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3",  hands="Piety Mitts +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- Obstin. Sash Rank 30
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs="Th. Pant. +3", feet="Theo. Duckbills +3"}
    
	sets.midcast.Repose = sets.midcast.Flash
	
	sets.midcast.Banish = {ammo="Pemphredo Tathlum",
		-- Grioavolr 
		main="Daybreak", sub="Ammurapi Shield",
		head="Theophany Cap +3", neck="Voltsurge Torque", lear="Regal Earring", rear="Malignance Earring",
		-- Cohort Cloak Rank 15 Bunzi's Gloves Freke Ring 
		body="Theo. Bliaut +3",  hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Metamor. ring +1",
		--  Bunzi's Pants Bunzi Sabots
		back="Aurist's Cape +1", waist="Eschan Stone", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}
    
	sets.midcast.Holy = sets.midcast.Banish
	
	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
		-- Grioavolr 
		main="Daybreak", sub="Ammurapi Shield",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

    sets.midcast.Drain = {ammo="Pemphredo Tathlum",
		main="Daybreak", sub="Ammurapi Shield",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

    sets.midcast.Drain.Resistant = {ammo="Pemphredo Tathlum",
		-- Grioavolr 
		main="Daybreak", sub="Ammurapi Shield",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {ammo="Pemphredo Tathlum",
		main="Daybreak", sub="Ammurapi Shield",
		head="Theophany Cap +3", neck="Clr. Torque +2", lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	sets.midcast.Stun.Resistant = {ammo="Pemphredo Tathlum",
		-- Grioavolr
		main="Daybreak", sub="Ammurapi Shield",
		head="Theophany Cap +3", neck="Clr.Torque +2", lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	-- Skill
	sets.midcast['Enfeebling Magic'] = {ammo="Hydrocera",
		main="Bunzi's Rod", sub="Ammurapi Shield",
		-- rear="Ebers Earring +2"
		head="Theophany Cap +3", neck="Erra Pendant", lear="Regal Earring",  rear="Malignance Earring",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Metamor. ring +1",
		-- Obsin. Sash Rank 30
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	-- Pure Macc
	sets.midcast['Enfeebling Magic'].Resistant = {ammo="Pemphredo Tahlum",
		main="Bunzi's Rod", sub="Ammurapi Shield",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3", hands="Kaykaus Cuffs +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
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
	sets.resting = {main="Malignance Pole", sub="Achaq Grip", ammo="Homiliary",
		-- sub="Mensch Strap +1",
		head="Nyame Helm", neck="Warder's Charm +1", lear="Etiolation Earring", rear="Ebers Eaerring +1",
		body="Ebers Bliaut +2", hands="Bunzi's Gloves", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Plat. Mog. Belt",
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1",legs="Ebers Pant. +3", feet="Ebers Duckbills +2"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Daybreak", sub="Genmei Shield", ammo="Homiliary",
		-- head=gear.chironic_refresh_head, 
		head="Nyame Helm", neck="Loricate Torque +1", lear="Etiolation Earring", rear="Ebers Earring +1",
		-- hands=gear.chironic_refresh_hands,
		body="Ebers Bliaut +2", hands="Bunzi's Gloves", lring="Stikini Ring +1", rring="Defending Ring",
		-- legs=gear.chironic_refresh_legs, feet=gear.chironic_refresh_feet,
		back=gear.idle_jse_back, waist="Carrier's Sash", legs="Ebers Pant. +3", feet="Ebers Duckbills +2"}

	sets.idle.DT = {main="Malignance Pole", sub="Achaq Grip", ammo="Homiliary",
		-- sub="Mensch Strap +1",
		head="Nyame Helm", neck="Warder's Charm +1", lear="Etiolation Earring", rear="Ebers Eaerring +1",
		body="Ebers Bliaut +2", hands="Bunzi's Gloves", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Plat. Mog. Belt",
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1",legs="Ebers Pant. +3", feet="Ebers Duckbills +2"}
		
	sets.idle.Refresh = {main="Daybreak", sub="Genmei Shield", ammo="Homiliary",
		-- head=gear.chironic_refresh_head, 
		head="Nyame Helm", neck="Sybil Scarf", lear="Etiolation Earring", rear="Ebers Earring +1",
		-- hands=gear.chironic_refresh_hands,
		body="Ebers Bliaut +2", hands="Bunzi's Gloves", lring="Stikini Ring +1", rring="Defending Ring",
		-- legs=gear.chironic_refresh_legs, feet=gear.chironic_refresh_feet,
		back=gear.idle_jse_back, waist="Carrier's Sash", legs="Ebers Pant. +3", feet="Ebers Duckbills +2"}

    --sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	sets.idle.Weak = sets.idle.DT

    -- Defense sets
	sets.defense.PDT = sets.idle.DT

	sets.defense.MDT = sets.idle.DT

    sets.defense.MEVA = sets.idle.DT
		
	-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {main="Tishtrya", sub="Genmei Shield", -- ammo="Amar Cluster",
		-- lear="Dedition Earring",
		head="Bunzi's Hat", neck="Combatant's Torque", lear="Brutal Earring", rear="Telos Earring",
		-- lring="Chirich Ring +1",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Ilabrat Ring", rring="Petrov Ring",
		-- waist="Olseni Belt", 
		back=gear.DA_jse_back, waist="Cetl Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}
		
    sets.engaged.Acc = {main="Tishtrya", sub="Genmei Shield", -- ammo="Amar Cluster",
		-- lear="Dedition Earring",
		head="Bunzi's Hat", neck="Combatant's Torque", lear="Brutal Earring", rear="Telos Earring",
		-- lring="Chirich Ring +1",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Ilabrat Ring", rring="Petrov Ring",
		-- waist="Olseni Belt", 
		back=gear.DA_jse_back, waist="Cetl Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}
		
    sets.engaged.DW = {main="Tishtrya", sub="Genmei Shield", -- ammo="Amar Cluster",
		-- lear="Dedition Earring",
		head="Bunzi's Hat", neck="Combatant's Torque", lear="Brutal Earring", rear="Telos Earring",
		-- lring="Chirich Ring +1",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Ilabrat Ring", rring="Petrov Ring",
		-- waist="Olseni Belt", 
		back=gear.DA_jse_back, waist="Cetl Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}
		
    sets.engaged.DW.Acc = {main="Tishtrya", sub="Genmei Shield", -- ammo="Amar Cluster",
		-- lear="Dedition Earring",
		head="Bunzi's Hat", neck="Combatant's Torque", lear="Brutal Earring", rear="Telos Earring",
		-- lring="Chirich Ring +1",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Ilabrat Ring", rring="Petrov Ring",
		-- waist="Olseni Belt", 
		back=gear.DA_jse_back, waist="Cetl Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	-- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Oshasha's Treatise",
		-- neck="Fotia Gorget", 
		head="Nyame Helm", neck="Sanctity Necklace", lear="Regal Earring", rear="Telos Earring",
		--  lring="Epaminandas's Ring", 
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Stikini Ring +1", rring="Metamor. Ring +1", 
		-- waist="Fotia Belt"
		back=gear.WSD_jse_back, waist="Orpheus's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	-- Club 
	sets.precast.WS['Hexa Strike'] = {ammo="Oshasha's Treatise", -- Ammo="Floestone",
		-- Blistering Sallet +1 fotia Gorget Mache Earring +1 Machine Earring +1
		head="Nyame Helm", neck="Fotia Gorget", lear="Moonshade Earring", rear="Telos Earring",
		-- lring="Begrudging Ring" rring="Shukuyu Ring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Stikini Ring +1", rring="Metamor. Ring +1", 
		-- waist="Fotia Belt"
		back=gear.WSD_jse_back, waist="Light Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	
	sets.precast.WS['Realmrazer'] = {ammo="Hasty Pinion +1", -- Ammo="Amar Cluster",
		-- neck="Fotia Gorget",  lear="Domin. Earring +1"
		head="Nyame Helm", neck="Sanctity Necklace", lear="Regal Earring", rear="Telos Earring",
		-- lring="Rufescent Ring"
		body="Nyame Mail", hands="Bunzi's Gloves", lring="Stikini Ring +1", rring="Metamor. Ring +1", 
		-- waist="Fotia Belt"
		back=gear.WSD_jse_back, waist="Light Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"} 
	
    sets.precast.WS['Flash Nova'] = {ammo="Oshasha's Treatise",
		head="Nyame Helm", neck="Clr. Torque +2", lear="Moonshade Earring", rear="Brutal Earring",
		--  lring="Epaminandas's Ring"
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Stikini Ring +1", rring="Metamor. Ring +1", 
		back=gear.MNDWSD_jse_back, waist="Orpheus's Sash", legs="Nyame Flanchard",  feet="Nyame Sollerets"} 

	sets.precast.WS['Seraph Strike'] = {ammo="Oshasha's Treatise",
		head="Nyame Helm", neck="Saevus Pendant +1", lear="Regal Earring", rear="Friomisi Earring",
		--  lring="Epaminandas's Ring"
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Stikini Ring +1", rring="Metamor. Ring +1", 
		back=gear.MNDWSD_jse_back, waist="Orpheus's Sash", legs="Nyame Flanchard",  feet="Nyame Sollerets"}
	
    sets.precast.WS['Mystic Boon'] = {ammo="Oshasha's Treatise",
		--  neck="Rep. Plat. Medal",
		head="Nyame Helm", neck="Caro Necklace", lear="Regal Earring", rear="Telos Earring",
		--lring="Epaminandas's Ring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Stikini Ring +1",  rring="Metamor. Ring +1",
		-- Waist="Grunfeld Rope",
		back=gear.MNDWSD_jse_back, waist="Eschan Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	sets.precast.WS['Black Halo'] = {ammo="Oshasha's Treatise",
		-- Rep. Plat. Medal
		head="Nyame Helm ", neck="Clr. Torque +2", lear="Regal Earring", rear="Telos Earring",
		--  lring="Epaminandas's Ring"
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Stikini Ring +1", rring="Metamor. Ring +1", 
		-- waist="Grunfeld 
		back=gear.MNDWSD_jse_back, waist="Breeze Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"} 
	
	sets.precast.WS['Judgment'] = sets.precast.WS['Black Halo']
	sets.precast.WS['Randgirth'] = sets.precast.WS['Black Halo']
	
	-- Staff 
	sets.precast.WS['Shell Crusher'] = {ammo="Oshasha's Treatise",
		--  neck="Fotia Gorget", 
		head="Nyame Helm", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Telos Earring",
		-- Lring="Epaminandas's ring", 
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Stikini Ring +1", rring="Metamor. Ring +1", 
		-- waist="Fotia Belt"
		back=gear.WSD_jse_back, waist="Breeze Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	
	sets.precast.WS['Cataclysm'] = {ammo="Oshasha's Treatise", -- Ammo="Floestone",
		-- head="Pixie Hairpin +1", 
		head="Nyame Helm", neck="Sibyl Scarf", lear="Friomisi Earring", rear="Malignance Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Archon Ring", rring="Metamor. Ring +1", 
		back=gear.INTWSD_jse_back, waist="Orpheus's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"} 
	
	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +2", back="Mending Cape"}
	
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
	state.Buff['Divine Caress'] = buffactive['Divine Caress'] or false
	state.Buff['Celerity'] = buffactive['Celerity'] or false

	state.AutoCaress = M(true, 'Auto Caress Mode')
	state.AutoCelerity = M(true, 'Auto Celerity Mode')
	state.Gambanteinn = M(false, 'Gambanteinn Cursna Mode')
	state.BlockLowDevotion = M(true, 'Block Low Devotion')

	autows = 'Mystic Boon'
	autofood = 'Miso Ramen'

	state.ElementalMode = M{['description'] = 'Elemental Mode','Light','Dark','Fire','Ice','Wind','Earth','Lightning','Water',}
	init_job_states({"Capacity","AutoFoodMode","AutoTrustMode","AutoWSMode","AutoNukeMode","AutoShadowMode","AutoStunMode","AutoDefenseMode"},{"AutoBuffMode","AutoRuneMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","ElementalMode","CastingMode","TreasureMode",})

	function handle_smartcure(cmdParams)
		if cmdParams[1] then
			if cmdParams[1] == '<me>' or cmdParams[1] == 'me' then
				cureTarget = player
			elseif cmdParams[1] == '<bt>' or cmdParams[1] == 'bt' then
				local bt = windower.ffxi.get_mob_by_target('bt') or false
				target = bt and bt.id or false
			elseif cmdParams[1] == '<t>' or cmdParams[1] == 't' then
				cureTarget = player.target
			elseif tonumber(cmdParams[1]) then
				cureTarget = windower.ffxi.get_mob_by_id(tonumber(cmdParams[1]))
			else
				cureTarget = table.concat(cmdParams, ' ')
				cureTarget = get_closest_mob_by_name(cureTarget)
				if not (cureTarget and cureTarget.is_valid) then
					if player.target.is_valid then
						cureTarget = player.target
					else
						cureTarget = player
					end
				end
			end
		elseif player.target.type == "SELF" or player.target.type == 'NONE' then
			cureTarget = player
		elseif player.target.type == 'MONSTER' then
			windower.send_command('gs c smartcure <stal>')
			return
		else
			cureTarget = player.target
		end
		if cureTarget.status == 'Dead' or cureTarget.status == 'Engaged dead' then
			windower.chat.input('/ma "Arise" '..cureTarget.id..'')
			return
		end

		local missingHP
		local spell_recasts = windower.ffxi.get_spell_recasts()

		if cureTarget.in_alliance then
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
		['MeleeWeapons']='Realmrazer',		
		['DualWeapons']='Realmrazer',
		['Staff']='Rock Crusher',
		['Gambanteinn']='Black Halo',
		['Maxentius']='Black Halo',
		['Yagrush']='Mystic Boon'}