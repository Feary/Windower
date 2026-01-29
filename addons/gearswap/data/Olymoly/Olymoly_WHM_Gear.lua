-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','SIRD','DT')
    state.IdleMode:options('Normal','PDT','Refresh')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons')
	state.WeaponskillMode:options('Normal','Fodder')
	
	-- Augmented Capes
	gear.FC_jse_back =	 	{name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}}
	gear.Cure_jse_back = 	{name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	gear.macc_jse_back = 	{name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	
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
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')
	
    select_default_macro_book()
	user_job_lockstyle()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Maxentius",sub="Sors Shield"}
	sets.weapons.DualWeapons = {main="Maxentius",sub="Kaja Rod"}

    -- Precast Sets

    -- FC Currently 83 in gear
    sets.precast.FC = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Incantor Stone",
		-- Bunzi's Hat  Clr. Torque +2
		head="Vanya Hood", neck="Orunmila's Torque", lear="Enchntr. Earring +1", rear="Malignance Earring",
		body="Inyanga Jubbah +2", hands="Volte Gloves", lring="Lebeche Ring", rring="Kishar Ring",
		back="Fi Follet Cape +1", waist="Witful Belt", legs="Volte Brais", feet="Regal Pumps +1"}

    sets.precast.FC.DT = set_combine(sets.precast.FC, {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Incantor Stone",
		-- ammo="Impatiens",
		head="Vanya Hood", neck="Orunmila's Torque",  lear="Enchntr. Earring +1", rear="Malignance Earring",
		body="Inyanga Jubbah +2", hands="Fanatic Gloves", lring="Prolix Ring", rring="Kishar Ring",
		-- Volte Gaiters
		back=gear.FC_jse_back, waist="Witful Belt", legs="Volte Brais", feet="Regal Pumps +1"})
 
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat", waist="Siegel Sash"})

	-- Healing
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pantaloons +1"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {-- main="Queller Rod", sub="Sors Shield",
		lear="Mendi. Earring",
		back="Perimede Cape", legs="Ebers Pant. +1", feet="Vanya Clogs"})

	sets.precast.FC.Cure.DT =  set_combine(sets.precast.FC.Cure, {
		-- main="Queller Rod", sub="Sors Shield",
		lear="Mendi. Earring",
		back="Perimede Cape", legs="Ebers Pant. +1", feet="Vanya Clogs"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +3"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {--ammo="Floestone",
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Cessance Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
    sets.precast.WS.Dagan = {--ammo="Floestone",
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Cessance Earring",
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	
	sets.MaxTP.Dagan = {ear1="Etiolation Earring",ear2="Evans Earring"}
	
    sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS,{})

    sets.precast.WS['Mystic Boon'] = set_combine(sets.precast.WS,{--ammo="Floestone",
		-- Nyame Helm
		head="Piety Cap +3", neck="Clr. Torque +1", lear="Regal Earring", rear="Moonshade Earring",
		-- Nyame Mail Nyame Gauntlets
		body="Piety Bliaut +3", hands="Piety Mitts +3", lring="Epaminondas's Ring", rring="Metamor. Ring +1",
		-- Grunfeld Rope  Nyame Flanchard Nyame Gaiters
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Piety Pantaln. +3", feet="Piety Duckbills +3"})
	
	sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS,{--ammo="Floestone",
		head="Piety Cap +3", neck="Fotia Gorget", lear="Moonshade Earring", rear="Telos Earring",
		body="Piety Bliaut +3", hands="Piety Mitts +3", lring="Begrudging Ring", rring="Ilabrat Ring",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Piety Pantaln. +3", feet="Piety Duckbills +3"})
	
	sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS,{--ammo="Floestone",
		-- Nyame Helm
		head="Piety Cap +3", neck="Clr. Torque +1", lear="Regal Earring", rear="Moonshade Earring",
		-- Nyame Mail Nyame Gauntlets
		body="Piety Bliaut +3", hands="Piety Mitts +3", lring="Epaminondas's Ring", rring="Metamor. Ring +1",
		-- Grunfeld Rope Nyame Flanchard Nyame Gaiters
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Piety Pantaln. +3", feet="Piety Duckbills +3"})
	
	sets.precast.WS['Randgirth'] = set_combine(sets.precast.WS,{--ammo="Floestone",
		-- Nyame Helm
		head="Piety Cap +3", neck="Clr. Torque +1", lear="Brutal Earring", rear="Regal Earring",
		-- Nyame Mail Nyame Gauntlets
		body="Piety Bliaut +3", hands="Piety Mitts +3", lring="Epaminondas's Ring", rring="Metamor. Ring +1",
		-- Luminary Sash  Nyame Flanchard Nyame Gaiters
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Piety Pantaln. +3", feet="Piety Duckbills +3"})
	
	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS,{--ammo="Amar Cluster",
		head="Piety Cap +3", neck="Fotia Gorget", lear="Regal Earring", rear="Telos Earring",
		body="Piety Bliaut +3", hands="Piety Mitts +3", lring="Rufescent Ring", rring="Metamor. Ring +1",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Piety Pantaln. +3", feet="Piety Duckbills +3"})
		
    -- Midcast Sets
	sets.Kiting = {lring="Shneddick Ring"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {ring2="Asklepian Ring"}-- neck="Phalaina Locket", ring1="Kunaji Ring",
	sets.Cure_Received = {ring2="Asklepian Ring"} -- neck="Phalaina Locket", ring1="Kunaji Ring",
	sets.Self_Refresh = {}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.	
	sets.ConserveMP = {ammo="Homiliary",
		main="Rubicundity", sub="Thuellaic Ecu +1",
		head="Vanya Hood", neck="Reti Pendant", neck="Incanter's Torque", ear1="Gifted Earring", ear2="Mendi. Earring",
		body="Vedic Coat", hands="Fanatic Gloves", lring="Prolix Ring", rring="Mephitas's Ring +1",
		back="Fi Follet Cape +1", waist="Shinjutsu-no-Obi +1",legs="Vanya Slops",feet="Kaykaus Boots +1"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
		--head="Bunzi's Hat",neck="Mizu. Kubikazari", 
		--body="Bunzi's Robe", hands="Bunzi's Gloves", ring2="Locus Ring",
		ring1="Mujin Band", 
		--legs="Bunzi's Pants", feet="Bunzi's Sabots"
		}
	
    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Sapience Orb",
		head="Vanya Hood", neck="Orunmila's Torque",  lear="Enchntr. Earring +1", rear="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Gende. Gages +1", lring="Prolix Ring", rring="Kishar Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Kaykaus Tights +1",feet="Regal Pumps +1"}
		
	sets.midcast['Esuna'] =  sets.precast.FC['Healing Magic']
	
    -- Cure sets
	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {main="Daybreak", sub="Sors Shield", ammo="Pemphredo Tathlum",
		-- Raetic Rod +1 
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Glorious Earring", rear="Mendi. Earring",
		body="Kaykaus Bliaut +1", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Ebers Pantaloons +1", feet="Kaykaus Boots +1"}

	sets.midcast.LightWeatherCure = {main="Chatoyant Staff", sub="Vox Grip", ammo="Pemphredo Tathlum",
		-- Raetic Rod +1 
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Glorious Earring", rear="Mendi. Earring",
		body="Kaykaus Bliaut +1", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Ebers Pantaloons +1", feet="Kaykaus Boots +1"}

	sets.midcast.LightDayCure = {main="Chatoyant Staff", sub="Vox Grip", ammo="Pemphredo Tathlum",
		-- Raetic Rod +1 
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Glorious Earring", rear="Mendi. Earring",
		body="Ebers Bliaut +1", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Ebers Pantaloons +1", feet="Kaykaus Boots +1"}
	
	sets.midcast.CureSolace = {main="Daybreak", sub="Sors Shield", ammo="Pemphredo Tathlum",
		-- Raetic Rod +1 
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Glorious Earring", rear="Mendi. Earring",
		body="Ebers Bliaut +1", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Ebers Pantaloons +1", feet="Kaykaus Boots +1"}

	sets.midcast.LightWeatherCureSolace = {main="Chatoyant Staff", sub="Vox Grip", ammo="Pemphredo Tathlum",
		-- Raetic Rod +1 
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Glorious Earring", rear="Mendi. Earring",
		body="Ebers Bliaut +1", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Ebers Pantaloons +1", feet="Kaykaus Boots +1"}

	sets.midcast.LightDayCureSolace = {main="Chatoyant Staff", sub="Elder's Grip +1", ammo="Pemphredo Tathlum",
		-- Raetic Rod +1 
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Glorious Earring", rear="Mendi. Earring",
		body="Ebers Bliaut +1", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Ebers Pantaloons +1", feet="Kaykaus Boots +1"}
	
	sets.midcast.Curaga = {main="Daybreak", sub="Sors Shield", ammo="Pemphredo Tathlum",
		-- Raetic Rod +1 
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Glorious Earring", rear="Mendi. Earring",
		body="Theo. Bliaut +3", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Ebers Pantaloons +1", feet="Kaykaus Boots +1"}

	sets.midcast.LightWeatherCuraga = {main="Chatoyant Staff", sub="Vox Grip", ammo="Pemphredo Tathlum",
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Glorious Earring", rear="Novia Earring",
		body="Theo. Bliaut +3", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Ebers Pantaloons +1", feet="Kaykaus Boots +1"}
		
	sets.midcast.LightDayCuraga = {main="Chatoyant Staff", sub="Vox Grip", ammo="Pemphredo Tathlum",
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Glorious Earring", rear="Novia Earring",
		body="Theo. Bliaut +3", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Ebers Pantaloons +1", feet="Kaykaus Boots +1"}
		
	sets.midcast.Cure.DT = {main="Chatoyant Staff", sub="Vox Grip", ammo="Pemphredo Tathlum",
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Glorious Earring", rear="Novia Earring",
		body="Theo. Bliaut +3", hands="Theophany Mitts +3", lring="Mephitas's Ring +1", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Ebers Pantaloons +1", feet="Kaykaus Boots +1"}

	--Melee Curesets are used whenever your OffenseMode is set to anything but None.
	sets.midcast.MeleeCure = {
		-- Queller Rod D
		main="Daybreak", sub="Sors Shield", ammo="Esper Stone +1", 
		head="Kaykaus Mitra +1", neck="Clr. Torque +1", lear="Glorious Earring", rear="Mendi. Earring",
		body="Ebers Bliaut +1", hands="Theophany Mitts +3", lring="Sirona's Ring", rring="Lebeche Ring",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Ebers Pantaloons +1", feet="Kaykaus Boots +1"}

	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1",})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +1",})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +1",})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {})

	sets.midcast.Cursna = {
		-- main={name="Gada", priority=2}, sub={name="Sors Shield", priority=1},
		--  neck="Debilis Medallion", lear="Mimir Earring", rear="Ebers Earring +1",
		head="Vanya Hood", neck="Incanter's Torque", lear="Beatific Earring", rear="Enchntr. Earring +1",
		-- lring="Haoma's Ring", 
		body="Ebers Bliaut +1", hands="Fanatic Gloves", lring="Sirona's Ring", rring="Menelaus's Ring",
		back=gear.FC_jse_back, waist="Bishop's Sash", legs="Th. Pant. +3", feet="Vanya Clogs"}

	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast,{main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", 
		--main={name="Grioavolr", priority=2}, sub={name="Clemency Grip", priority=1}, 
		ammo="Sapience Orb",
		head="Ebers Cap +1",
		hands="Ebers Mitts +1",
		waist="Witful Belt", legs="Ebers Pantaloons +1", feet="Vanya Clogs"})

	-- Erase
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Clr. Torque +1"})
    
	-- 110 total Enhancing Magic Skill; caps even without Light Arts
	-- Duration
	sets.midcast['Enhancing Magic'] = {main="Daybreak", sub="Ammurapi Shield",		
		-- -main={name="Gada", priority=2},
		head=gear.telchine_head_Duration,
		body=the, hands=gear.telchine_hands_Duration,
		-- waist="Embla Sash",
		legs=gear.telchine_legs_Duration, feet="Theo. Duckbills +3"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget", ear2="Earthcry Earring", waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		main="Vadose Rod", sub="Ammurapi Shield",
		head="Chironic Hat", neck="Incanter's Torque",
		body=gear.telchine_body_Duration, hands="Regal Cuffs", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- waist="Emphatikos Rope"
		back="Mending Cape", legs="Shedir Seraweels", feet="Theo. Duckbills +3"})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga", sub="Genmei Shield",
		head="Inyanga Tiara +2", 
		body="Piety Bliaut +3", hands="Ebers Mitts +1", 
		waist="Embla Sash", legs="Th. Pant. +3", feet="Theo. Duckbills +3"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +3"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +3"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +3"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +3"})
	
	-- 438 Cap
	sets.midcast.BarElement = {main="Beneficus", sub="Ammurapi Shield",
		-- 	neck="Sroda Necklace", Mimir Earring
		head="Ebers Cap +1", neck="Incanter's Torque", lear="Andoaa Earring", rear="Augment. Earring",
		body="Ebers Bliaut +1", hands="Ebers Mitts +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Mending Cape", waist="Olympus Sash", legs="Ebers Pantaloons +1", feet="Ebers Duckbills +1"}

	-- Caps 500 /sch  need 106 blm/rdm
	sets.midcast.BarStatus = {main="Daybreak", sub="Ammurapi Shield",
		--main=gear.gada_enhancing_club,
		head=gear.telchine_head_Duration, neck="Sroda Necklace", lear="Andoaa Earring", rear="Augment. Earring",
		body=gear.telchine_body_Duration, hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Mending Cape", waist="Olympus Sash", legs="Piety Pantaln. +3", feet="Theo. Duckbills +3"}
	
	--sets.midcast.BarStatus['Light Arts'] = {main={name="Beneficus", priority=2}, sub={name="Genmei Shield", priority=1},
		--main=gear.gada_enhancing_club,sub="Ammurapi Shield",
		--head=gear.telchine_head_Duration, neck="Incanter's Torque",  lear="Andoaa Earring", 
		--body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- feet="Theophany Duckbills +3"
		--back="Mending Cape", waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	-- Caps 500 to Cap - need 106 blm/rdm
	-- Duration
	sets.midcast.BoostStat = {
		-- main={name="Gada", priority=2},
		head="Befouled Crown", neck="Incanter's Torque", lear="Andoaa Earring", rear="Augment. Earring",
		body=gear.telchine_body_Duration, hands="Inyanga Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Mending Cape", waist="Olympus Sash", legs="Piety Pantaln. +3", feet="Theo. Duckbills +3"}
			
	sets.midcast.Impact = {main="Oranyan",sub="Clerisy Strap +1",ammo="Pemphredo Tathlum",
		head=empty, neck="Erra Pendant", ear1="Regal Earring", rear="Malignance Earring",
		body="Crepuscular Cloak",hands="Inyan. Dastanas +2", ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}
		
	sets.midcast['Elemental Magic'] = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Bunzi's Hat
		head=empty, neck="Sanctity Necklace",lear="Regal Earring", rear="Malignance Earring",
		-- Bunzi's Robe Bunzi's Gloves lring="Freke Ring"
		body="Cohort Cloak +1", hands="Inyan. Dastanas +2", lring="Mephitas's Ring +1", rring="Metamor. Ring +1",
		-- Bunzi's Pants Bunzi's Sabots
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs="Kaykaus Tights +1", feet="Theo. Duckbills +3"}

	sets.midcast['Elemental Magic'].Resistant = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Bunzi's Hat
		head="Theophany Cap +3", neck="Sanctity Necklace",lear="Regal Earring", rear="Malignance Earring",
		-- Bunzi's Robe Bunzi's Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Shiva Ring +1", rring="Shiva Ring +1",
		-- Bunzi's Pants Bunzi's Sabots
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	sets.midcast['Divine Magic'] = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Bunzi's Hat
		head="Theophany Cap +3", neck="Sanctity Necklace",lear="Regal Earring", rear="Malignance Earring",
		-- Bunzi's Robe Bunzi's Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- Bunzi's Pants Bunzi's Sabots
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	sets.midcast['Dark Magic'] = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Bunzi's Hat
		head="Theophany Cap +3", neck="Sanctity Necklace",lear="Regal Earring", rear="Malignance Earring",
		-- Bunzi's Robe Bunzi's Gloves Fenrir Ring +1 Fenrir Ring +1 
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- Bunzi's Pants Bunzi's Sabots
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

    sets.midcast.Drain = {main="Rubicundity", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Chironic Hat 
		head="Theophany Cap +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Fucho-no-Obi", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

    sets.midcast.Drain.Resistant = {main="Rubicundity", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1", 
		back="Aurist's Cape +1", waist="Fucho-no-Obi", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head="Inyanga Tiara +2", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	sets.midcast.Stun.Resistant = {main="Daybreak", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",	
		head="Theophany Cap +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3", hands="Inyan. Dastanas +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	sets.midcast['Enfeebling Magic'] = {main="Contemplator +1", sub="Clerisy Strap +1", ammo="Pemphredo Tathlum",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3", hands="Kaykaus Cuffs +1", lring="Kishar Ring", rring="Stikini Ring +1",
		-- waist="Obstinate sash". Rank 15+ 
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Theo. Duckbills +3"}

	sets.midcast['Enfeebling Magic'].Resistant = {main="Contemplator +1", sub="Clerisy Strap +1", ammo="Pemphredo Tathlum",
		head="Theophany Cap +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Theo. Bliaut +3", hands="Kaykaus Cuffs +1", lring="Stikini Ring +1", rring="Metamor. Ring +1",
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

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back="Aurist's Cape +1"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back="Aurist's Cape +1"})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {main="Contemplator +1", sub="Clerisy Strap +1", ammo="Homiliary",
		head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Inyan. Dastanas +2",ring1="Inyanga Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Shinjutsu-no-Obi +1",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Daybreak", sub="Genmei Shield", ammo="Homiliary",
		head="Inyanga Tiara +2", neck="Loricate Torque +1", ear1="Ethereal Earring",ear2="Sanare Earring",
		body="Shamash Robe", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Carrier's Sash",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}

	sets.idle.Refresh = {main="Daybreak", sub="Genmei Shield", ammo="Homiliary",
		head="Inyanga Tiara +2", neck="Loricate Torque +1", ear1="Ethereal Earring",ear2="Sanare Earring",
		body="Shamash Robe", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Stikini Ring +1",
		back=gear.FC_jse_back,waist="Carrier's Sash", legs="Assid. Pants +1", feet="Inyan. Crackows +2"}
		
	sets.idle.PDT = {main="Malignance Pole", sub="Irenic Strap +1", ammo="Staunch Tathlum +1",
		-- Nyame Helm
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Genmei Earring",
		-- Nyame Mial Nyame Gauntlets
		body="Shamash Robe", hands="Aya. Manopolas +2", lring="Ayanmo Ring", rring="Defending Ring",
		-- Nyame Flanchard Nyame Sollerets
		back=gear.FC_jse_back, waist="Carrier's Sash", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

   	sets.idle.Weak = {main="Malignance Pole",sub="Irenic Strap +1", ammo="Staunch Tathlum +1",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		-- Chironic Gloves DT
		body="Shamash Robe", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		-- Chironic Slippers DT
		back=gear.FC_jse_back, waist="Carrier's Sash", legs="Assid. Pants +1", feet="Aya. Gambieras +2"}

    -- Defense sets
	sets.defense.PDT = {main="Malignance Pole", sub="Irenic Strap +1", ammo="Staunch Tathlum +1",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Genmei Earring",
		-- Chironic Gloves DT
		body="Shamash Robe", hands="Aya. Manopolas +2", lring="Dark Ring", rring="Defending Ring",
		-- Chironic Slippers DT
		back=gear.FC_jse_back, waist="Fucho-no-Obi", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	sets.defense.MDT = {main="Malignance Pole",sub="Irenic Strap +1", ammo="Staunch Tathlum +1",
		head="Aya. Zucchetto +2", neck="Loricate Torque +1", ear1="Ethereal Earring",ear2="Sanare Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}

    sets.defense.MEVA = {main="Malignance Pole",sub="Irenic Strap +1", ammo="Staunch Tathlum +1",
		head="Inyanga Tiara +2", neck="Loricate Torque +1", ear1="Ethereal Earring",ear2="Sanare Earring",
		body="Inyanga Jubbah +2", hands="Inyan. Dastanas +2", ring1="Inyanga Ring", ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Inyanga Shalwar +2", feet="Inyan. Crackows +2"}
	
	-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
	sets.engaged = {ammo="Staunch Tathlum +1", -- Amar Cluster
		-- Lissome Necklace
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Brutal Earring", rear="Telos Earring",
		-- hands="Bunzi's Gloves"
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Petrov Ring", rring="Hetairoi Ring",
		back=gear.FC_jse_back, waist="Windbuffet Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.engaged.Acc = {ammo="Staunch Tathlum +1", -- Amar Cluster
		-- Lissome Necklace
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Ebani Earring", rear="Suppanomimi",
		-- hands="Gazu Bracelet +1"
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- Grunfeld Rope
		back=gear.FC_jse_back, waist="Windbuffet Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}
		
    sets.engaged.DW = {ammo="Staunch Tathlum +1", -- Amar Cluster
		-- Lissome Necklace
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Ebani Earring", rear="Suppanomimi",
		-- hands="Bunzi's Gloves"
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Petrov Ring", rring="Hetairoi Ring",
		back=gear.FC_jse_back, waist="Windbuffet Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

    sets.engaged.DW.Acc = {ammo="Staunch Tathlum +1", -- Amar Cluster
		-- Combantant's Torque
		head="Aya. Zucchetto +2", neck="Sanctity Necklace", lear="Ebani Earring", rear="Suppanomimi",
		-- hands="Gazu Bracelet +1"
		body="Ayanmo Corazza +2", hands="Aya. Manopolas +2", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- Grunfeld Rope
		back=gear.FC_jse_back, waist="Windbuffet Belt +1", legs="Aya. Cosciales +2", feet="Aya. Gambieras +2"}

	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1", back="Mending Cape"}
	
	--sets.buff['Light Arts'] = {} 
	
	sets.HPDown = {}
		
	sets.HPCure = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(2, 1)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 001')
end


buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	When='Always'},
		{Name='Haste',			Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Always'},
		{Name='Refresh',		Buff='Refresh',		SpellID=109,	When='Always'},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		When='Always'},
	},
	
	Default = {
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
	Melee = {
		{Name='Reraise IV',		Buff='Reraise',		SpellID=848,	Reapply=false},
		{Name='Haste',			Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Boost-STR',		Buff='STR Boost',	SpellID=479,	Reapply=false},
		{Name='Shellra V',		Buff='Shell',		SpellID=134,	Reapply=false},
		{Name='Protectra V',	Buff='Protect',		SpellID=129,	Reapply=false},
		{Name='Auspice',		Buff='Auspice',		SpellID=96,		Reapply=false},
	},
	Ramuh = {
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
		--{Name='Barthundra',		Buff='Barthunder',	SpellID=70,		Reapply=false},
		--{Name='Barparalyzra',	Buff='Barparalyze',	SpellID=88,		Reapply=false},
	},
	Shiva = {
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
		--{Name='Barthundra',		Buff='Barthunder',	SpellID=70,		Reapply=false},
		{Name='Barparalyzra',	Buff='Barparalyze',	SpellID=88,		Reapply=false},
	},
}