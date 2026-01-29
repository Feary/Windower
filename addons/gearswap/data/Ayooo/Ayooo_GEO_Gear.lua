function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','DualWield')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Maxentius','Tishtrya','DualTishtrya','DualMaxentius')

	gear.idle_jse_back = 	{name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.nuke_jse_back = 	{name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
	gear.ws_jse_back =		{name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
	gear.mnd_ws_jse_back = "Aurist's Cape +1"
	gear.Cure_jse_back = 	{name="Nantosuelta's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Cure" potency +10%',}}
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^backspace input /ja "Entrust" <me>')
	send_command('bind !backspace input /ja "Life Cycle" <me>')
	send_command('bind @backspace input /ma "Sleep II" <t>')
	send_command('bind ^delete input /ma "Aspir III" <t>')
	send_command('bind @delete input /ma "Sleepga" <tid>')
	
	-- Alias
	send_command('alias ageohaste gs c autogeo frailty;gs c autoindi haste;gs c autoentrust fury')
	send_command('alias ageoatk gs c autogeo frailty;gs c autoindi fury;gs c autoentrust haste')	
	send_command('alias ageoacc gs c autogeo frailty;gs c autoindi torpor;gs c autoentrust haste')
	send_command('alias ageomacc gs c autogeo malaise;gs c autoindi acumen;gs c autoentrust refresh')	
	
	indi_duration = 275
	
	select_default_macro_book()
	user_job_lockstyle()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +3"}
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +2", back=gear.idle_jse_back}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +3"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +3"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1", hands="Bagua Mitaines +3"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {legs="Bagua Pants +3", feet="Azimuth Gaiters +1"}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells
	-- Current 76%
	sets.precast.FC = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap", ranged="Dunna",
		head="Agwu's Cap", neck="Voltsurge Torque", ear1="Enchntr. Earring +1", ear2="Malignance Earring",
		body="Agwu's Robe", hands="Agwu's Gages", ring1="Kishar Ring", ring2="Prolix Ring", 
		back="Fi Follet Cape +1", waist="Embla Sash", legs="Agwu's Slops", feet="Agwu's Pigaches"}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {main="Idris", sub="Genmei Shield", range="Dunna", ammo=empty,})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +3"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1"})--main="Serenity",
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {--ammo="Impatiens",
		head=empty,
		body="Twilight Cloak"})
	
	sets.Self_Healing = {neck="Phalaina Locket", ring2="Asklepian Ring",waist="Gishdubar Sash"} --ring1="Kunaji Ring"
	sets.Cure_Received = {neck="Phalaina Locket", ring2="Asklepian Ring",waist="Gishdubar Sash"} --ring1="Kunaji Ring",
	sets.Self_Refresh = {back="Grapevine Cape", waist="Gishdubar Sash", feet="Inspirited Boots",} --
	
	
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = set_combine(sets.precast.FC,{ammo="Dunna",
		main=gear.grioavolr_fc_staff, sub="Clerisy Strap", 
		head="Agwu's Cap", neck="Voltsurge Torque", ear1="Enchntr. Earring +1", ear2="Malignance Earring",
		body="Agwu's Robe", hands="Agwu's Gages", ring1="Kishar Ring", ring2="Prolix Ring", 
		back="Fi Follet Cape +1", waist="Shinjutsu-no-Obi +1", legs="Agwu's Slops", feet="Agwu's Pigaches"})

	sets.midcast.Geomancy = {main="Solstice", sub="Genmei Shield", range="Dunna",
		-- main="
		head="Vanya Hood", neck="Bagua Charm +2", lear="Odnowa Earring +1", rear="Azimuth Earring +1", 
		-- Vanya Cuffs Path C
		body="Zendik Robe", hands="Geo. Mitaines +3", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- Azimuth Gaiters +3
		back="Lifestream Cape", waist="Shinjutsu-no-Obi +1", legs="Bagua Pants +3", feet="Azimuth Gaiters +1"}

	-- Extra Indi duration on any slot you can't get skill on here.
	-- MasterLevel 10+
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {range="Dunna",
		main="Solstice", sub="Genmei Shield", 
		-- neck="Incantor's Torque",
		head="Vanya Hood", neck="Bagua Charm +2", lear="Ran ", rear="Azimuth Earring +1", 
		-- Vanya Cuffs Path C 
		body="Zendik Robe", hands="Geo. Mitaines +3", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- Azimuth Gaiters +3
		back="Lifestream Cape", waist="Shinjutsu-no-Obi +1", legs="Bagua Pants +3", feet="Azimuth Gaiters +1"})
		
	-- HealingMagic
    sets.midcast.Cure = {main="Daybreak", sub="Sors Shield", range="Dunna",
		-- Mendi. Earring 
		head="Vanya Hood", neck="Incanter's Torque", lear="Meilli Earring", rear="Novia Earring",
		-- Vanya Robe Path B Vanya Cuffs Path B
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Mephitas's Ring +1", rring="Stikini Ring +1",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Vanya Slops", feet="Vanya Clogs"}

    sets.midcast.LightWeatherCure = {main="Chatoyant Staff", sub="Khonsu", range="Dunna",
		head="Vanya Hood", neck="Incanter's Torque", lear="Meilli Earring", rear="Novia Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Vanya Slops", feet="Skaoi Boots"}

    sets.midcast.LightDayCure = {main="Chatoyant Staff", sub="Khonsu", range="Dunna",
		head="Vanya Hood", neck="Incanter's Torque", lear="Meilli Earring", rear="Novia Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Vanya Slops", feet="Skaoi Boots"}
    
	sets.midcast.Curaga = {main="Daybreak", sub="Sors Shield", range="Dunna",
		head="Vanya Hood", neck="Incanter's Torque", lear="Meilli Earring", rear="Novia Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Metamor. Ring +1", rring="Stikini Ring +1",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Vanya Slops", feet="Skaoi Boots"}

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})--neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring"
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    sets.midcast['Elemental Magic'] = {main="Daybreak", sub="Ammurapi Shield", range="Dunna",
		-- rear="Azimuth Earring +2"
		head="Bagua Galero +3", neck="Sanctity Necklace", lear="Regal Earring", rear="Malignance Earring",
		-- Azimuth Coat +3 Azimuth Gloves +3
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Freke Ring",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Orpheus's Sash", legs="Bagua Pants +3", feet="Bagua Sandals +3"}		

    sets.midcast['Elemental Magic'].Resistant = {main="Daybreak", sub="Ammurapi Shield", range="Dunna",
		-- rear="Azimuth Earring +2"
		head="Bagua Galero +3", neck="Sanctity Necklace", lear="Regal Earring", rear="Malignance Earring",
		-- Azimuth Coat +3 Azimuth Gloves +3
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Freke Ring",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Orpheus's Sash", legs="Bagua Pants +3", feet="Bagua Sandals +3"}			

    sets.midcast['Elemental Magic'].Fodder = {main="Daybreak", sub="Ammurapi Shield", range="Dunna",
		-- rear="Azimuth Earring +2"
		head="Bagua Galero +3", neck="Sanctity Necklace", lear="Regal Earring", rear="Malignance Earring",
		-- Azimuth Coat +3 Azimuth Gloves +3
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Freke Ring",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Orpheus's Sash", legs="Bagua Pants +3", feet="Bagua Sandals +3"}			
	
	-- Hight Tier Nuke
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		main="Daybreak", sub="Ammurapi Shield", range="Dunna",
		-- rear="Azimuth Earring +2"
		head="Bagua Galero +3", neck="Sanctity Necklace", lear="Regal Earring", rear="Malignance Earring",
		-- Azimuth Coat +3 Azimuth Gloves +3
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Freke Ring",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Orpheus's Sash", legs="Bagua Pants +3", feet="Bagua Sandals +3"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		main="Daybreak", sub="Ammurapi Shield", range="Dunna",
		-- rear="Azimuth Earring +2"
		head="Bagua Galero +3", neck="Sanctity Necklace", lear="Regal Earring", rear="Malignance Earring",
		-- Azimuth Coat +3 Azimuth Gloves +3 
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Freke Ring",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Orpheus's Sash", legs="Bagua Pants +3", feet="Bagua Sandals +3"})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {
		main="Daybreak", sub="Ammurapi Shield", range="Dunna",
		-- rear="Azimuth Earring +2"
		head="Bagua Galero +3", neck="Sanctity Necklace", lear="Regal Earring", rear="Malignance Earring",
		-- Azimuth Coat +3 Azimuth Gloves +3
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Freke Ring",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Orpheus's Sash", legs="Bagua Pants +3", feet="Bagua Sandals +3"})
	
    sets.midcast['Dark Magic'] = {main="Daybreak", sub="Ammurapi Shield", range="Dunna",
		head="Bagua Galero +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

    sets.midcast.Drain = {main="Daybreak", sub="Ammurapi Shield", range="Dunna",
		head="Bagua Galero +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- C. Palug Hammmer
		head="Geo. Galero +2", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Witful Belt", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}
		
	sets.midcast.Stun.Resistant = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		head="Geo. Galero +2", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

	sets.midcast.Impact = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- C. Palug Hammmer
		head=empty, neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Twilight Cloak", hands="Geo. Mitaines +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Geomancy Pants +2", feet="Geo. Sandals +3"}

	sets.midcast['Enfeebling Magic'] = {main="Daybreak", sub="Ammurapi Shield", range="Dunna",
		head="Geo. Galero +2",  neck="Bagua Charm +2", lear="Regal Earring", rear="Malignance Earring",
		--  hands="Regal Cuffs", ring="Stikini Ring +1",
		body="Geomancy Tunic +2", hands="Geo. Mitaines +3", lring="Kishar Ring", rring="Metamor. Ring +1",
		
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs="Geomancy Pants +2", feet="Geo. Sandals +2"}

	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak", sub="Ammurapi Shield", range="Dunna",
		head="Geo. Galero +2", neck="Bagua Charm +2", lear="Regal Earring", rear="Malignance Earring",
		--  hands="Regal Cuffs",  ring="Stikini Ring +1",
		body="Geomancy Tunic +2",  hands="Geo. Mitaines +3", lring="Stikini Ring +1", rring="Metamor. Ring +1",
		back=gear.Cure_jse_back, waist="Acuity Belt +1", legs="Geomancy Pants +2", feet="Geo. Sandals +2"}

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {waist="Acuity Belt +1",})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Acuity Belt +1",})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Acuity Belt +1",})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Acuity Belt +1",})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Luminary Sash"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Luminary Sash"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club, sub="Ammurapi Shield", range="Dunna",
		head=gear.telchine_head_Duration, neck="Incanter's Torque", ear1="Andoaa Earring", ear2="Mimir Earring",
		--  ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, lring="Mephitas Ring +1", rring="Defending Ring",
		back="Fi Follet Cape +1", waist="Embla Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}
		
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
		head=gear.merlinic_phalanx_head,
		body=gear.merlinic_phalanx_body})
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {feet="Inspirited Boots"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod", head="Amalric Coif +1", hands="Regal Cuffs"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Daybreak", sub="Genmei Shield", range="Dunna",
		--head=gear.merlinic_refresh_head, 
		head="Volte Beret", neck="Sibyl Scarf", lear="Etiolation Earring", rear="Azimuth Earring +1",
		--  ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		body="Shamash Robe", hands="Bagua Mitaines +3", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- legs=gear.merlinic_refresh_legs, feet=gear.merlinic_refresh_feet
		back="Fi Follet Cape +1", waist="Carrier's Sash", legs="Volte Brais", feet="Nyame Sollerets"}

	-- Idle sets
	sets.idle = {main="Daybreak", sub="Genmei Shield", range="Dunna",
		--head=gear.merlinic_refresh_head,   neck="Sibyl Scarf",
		head="Volte Beret", neck="Loricate Torque +1", lear="Flashward Earring", rear="Azimuth Earring +1",
		--  ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		body="Shamash Robe", hands="Bagua Mitaines +3", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- legs=gear.merlinic_refresh_legs, feet=gear.merlinic_refresh_feet
		back="Shadow Mantle", waist="Carrier's Sash", legs="Volte Brais", feet="Nyame Sollerets"}

	sets.idle.PDT = {main="Daybreak", sub="Genmei Shield", range="Dunna",
		-- Genmei Earring 
		head="Nyame Helm", neck="Loricate Torque +1", lear="Static Earring", rear="Azimuth Earring +1",
		body="Shamash Robe", hands="Nyame Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- waist="Shinjutsu-no-Obi +1",
		back="Shadow Mantle", waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	-- Pet sets are for when Luopan is present.
	sets.idle.Pet = set_combine(sets.idle.PDT, {main="Solstice", sub="Genmei Shield", range="Dunna",
		-- Azimuth Hood +2 
		head="Azimuth Hood +1", neck="Bagua Charm +2", lear="Static Earring", rear="Azimuth Earring +1",
		body="Agwu's Robe", hands="Geo. Mitaines +3", lring="Gelatinous Ring +1", rring="Defending Ring",
		back=gear.idle_jse_back, waist="Isa Belt", legs="Agwu's Slops", feet="Bagua Sandals +3"})

	sets.idle.PDT.Pet = set_combine(sets.idle.PDT, {main="Solstice", sub="Genmei Shield", range="Dunna",
		-- Azimuth Hood +2 Ran Earring
		head="Azimuth Hood +1", neck="Bagua Charm +2", lear="Static Earring", rear="Azimuth Earring +1",
		body="Shamash Robe", hands="Geo. Mitaines +3", lring="Gelatinous Ring +1", rring="Defending Ring",
		back=gear.idle_jse_back, waist="Isa Belt", legs="Agwu's Slops", feet="Bagua Sandals +3"})

	-- Indi sets are for when an Indi-spell is active.
	-- Idris
	sets.idle.Indi = set_combine(sets.idle, {main="Idris", sub="Genmei Shield", range="Dunna"})	
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {main="Idris", sub="Genmei Shield", range="Dunna"}) 
	
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {main="Idris", sub="Genmei Shield", range="Dunna"})
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {main="Idris", sub="Genmei Shield", range="Dunna"})

	sets.idle.Weak = {main="Idris",sub="Genmei Shield", range="Dunna",
		-- lear="Odnowa Earring +1",
		head="Nyame Helm", neck="Warder's Charm +1", lear="Heartly Earring", rear="Etiolation Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Shadow Ring", rring="Defending Ring",
		back="Shadow Mantle", waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	sets.idle.Weak.Pet = {main="Idris",sub="Genmei Shield", range="Dunna",
		--  lear="Odnowa Earring +1",
		head="Nyame Helm", neck="Bagua Charm +2",  lear="Heartly Earring", rear="Etiolation Earring",
		body="Nyame Mail", hands="Geo Mitaines +3", lring="Shadow Ring", rring="Defending Ring",
		back="Shadow Mantle", waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	-- Defense sets	
	sets.defense.PDT = {main="Idris", sub="Genmei Shield", range="Dunna",
		-- Genmei Earring 
		head="Nyame Helm", neck="Loricate Torque +1", lear="Static Earring", rear="Azimuth Earring +1",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- waist="Shinjutsu-no-Obi +1",
		back="Fi Follet Cape +1", waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	sets.defense.MDT = {main="Idris", sub="Genmei Shield", range="Dunna",
		-- Genmei Earring 
		head="Nyame Helm", neck="Warder's Charm +1", lear="Static Earring", rear="Azimuth Earring +1",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- waist="Shinjutsu-no-Obi +1",
		back="Fi Follet Cape +1", waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	
    sets.defense.MEVA = {main="Idris", sub="Genmei Shield", range="Dunna",
		-- Genmei Earring 
		head="Nyame Helm", neck="Warder's Charm +1", lear="Static Earring", rear="Azimuth Earring +1",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- waist="Shinjutsu-no-Obi +1",
		back="Fi Follet Cape +1", waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {lring="Shneddick Ring" }
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {ammo="Per. Lucky Egg", head="Volte Cap", hands="Volte Bracers", waist="Chaac Belt"})
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {ammo="Hasty Pinion +1",
		-- rear="Crep. Earring"
		head="Nyame Helm", neck="Lissome Necklace", lear="Telos Earring", rear="Cessance Earring",
		--  lring="Chirich Ring +1", rring="Chirich Ring +1",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Rajas Ring", rring="Apate Ring",
		back=gear.idle_jse_bawck, waist="Cetl Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	sets.engaged.DW = {ammo="Hasty Pinion +1",
		--  rear="Crep. Earring"
		head="Nyame Helm", neck="Lissome Necklace", lear="Telos Earring", rear="Cessance Earring",
		--  lring="Chirich Ring +1", rring="Chirich Ring +1",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Rajas Ring", rring="Apate Ring",
		-- Gerdr Belt +1
		back=gear.idle_jse_bawck, waist="Cetl Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Oshasha's Treatise",
		-- neck="Fotia Gorget",
		head="Nyame Helm", neck="Sanctity Necklace", lear="Ishvara Earring", rear="Regal Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Rajas Ring", rring="Metamor. Ring +1",
		-- WS Cape  waist="Fotia Belt",
		back=gear.ws_jse_back, waist="Light Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	-- Club
	sets.precast.WS['Hexa Strike']= {ammo="Oshasha's Treatise",
		-- neck="Fotia Gorget",
		head="Nyame Helm", neck="Sanctity Necklace", lear="Ishvara Earring", rear="Regal Earring",
		body="Nyame Mail", hands="Nyame Gauntlets",  lring="Rajas Ring", rring="Metamor. Ring +1",
		--waist="Fotia Belt",
		back=gear.mnd_ws_jse_back, waist="Light Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	sets.precast.WS['Black Halo']= {ammo="Oshasha's Treatise",
		-- neck="Fotia Gorget", Moonshade Earring 
		head="Nyame Helm", neck="Caro Necklace", lear="Ishvara Earring", rear="Regal Earring",
		-- Epaminondas's Ring Cacoethic Ring +1
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Rajas Ring", rring="Metamor. Ring +1",
		-- Grunfeld Rope waist="Fotia Belt",
		back=gear.ws_jse_back, waist="Thunder Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	sets.precast.WS['Flash Nova']= {ammo="Oshasha's Treatise",
		head="Nyame Helm", neck="Fotia Gorget", lear="Ishvara Earring", rear="Regal Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Rufescent Ring", rring="Petrov Ring",
		-- WS Cape  
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	sets.precast.WS['Realmrazer']= {ammo="Oshasha's Treatise",
		-- Fortia Gorget
		head="Nyame Helm", neck="Fotia Gorget", lear="Ishvara Earring", rear="Regal Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Rajas Ring", rring="Metamor. Ring +1",
		-- WS Cape  
		back=gear.nuke_jse_back, waist="Light Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	sets.precast.WS['Exudation']= {ammo="Oshasha's Treatise",
		--neck="Fotia Gorget",
		head="Nyame Helm", neck="Sanctity Necklace", lear="Ishvara Earring", rear="Regal Earring",
		body="Nyame Mail", hands="Nyame Gauntlets",  lring="Rajas Ring", rring="Metamor. Ring +1",
		-- WS Cape  Fotia Belt
		back=gear.mnd_ws_jse_back, waist="Light Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	
	-- Staff
	sets.precast.WS['Catacylsm']= {ammo="Oshasha's Treatise",
		-- neck="Fotia Gorget",
		head="Nyame Helm", neck="Sanctity Necklace", lear="Ishvara Earring", rear="Regal Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Metamor. Ring +1", rring="Archon Ring",
		-- WS Cape   waist="Fotia Belt",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	sets.precast.WS['Shattersoul']= {
		ammo="Oshasha's Treatise",
		--  neck="Fotia Gorget", 
		head="Nyame Helm", neck="Sanctity Necklace", lear="Ishvara Earring", rear="Regal Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Rajas Ring", rring="Metamor. Ring +1",
		-- WS Cape waist="Fotia Belt", 
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari", hands="Bagua Mitaines +3", ring1="Mujin Band", }--body="Ea Houppelande", legs="Ea Slops",
	sets.RecoverBurst = set_combine(sets.MagicBurst,{body="Seidr Cotehardie"})
	
	-- Weapons sets
	sets.weapons.None = {main="Daybreak", sub="Genmei Shield", ranged="Dunna"}
	sets.weapons.Maxentius = {main="Maxentius", sub="Genmei Shield", ranged="Dunna"}
	sets.weapons.Tishtrya = {main="Tishtrya", sub="Genmei Shield", ranged="Dunna"}
	sets.weapons.DualTishtrya = {main="Tishtrya", sub="Maxentius", ranged="Dunna"}	
	sets.weapons.DualMaxentius = {main="Maxentius", sub="Maxentius", ranged="Dunna"}	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 22)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 024')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

	state.Buff.Entrust = buffactive.Entrust or false
	state.Buff['Blaze of Glory'] = buffactive['Blaze of Glory'] or false

    LowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga'}

	state.RecoverMode = M('35%', '60%', 'Always', 'Never')

	autows = 'Realmrazer'
	autofood = 'Miso Ramen'
	autoindi = 'Frailty'
	autoentrust = 'Torpor'
	autoentrustee = '<p1>'
	autogeo = 'Fury'
	last_indi = nil
	last_geo = nil
	blazelocked = false
	used_ecliptic = false

	state.ShowDistance = M(true, 'Show Geomancy Buff/Debuff distance')
	state.AutoEntrust = M(false, 'AutoEntrust Mode')
	state.CombatEntrustOnly = M(true, 'Combat Entrust Only Mode')
	state.AutoGeoAbilities = M(true, 'Use Geo Abilities Automatically')

    indi_timer = ''
    indi_duration = 180

	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoNukeMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode"},{"AutoBuffMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","RecoverMode","ElementalMode","CastingMode","TreasureMode",})
end

autows_list = {
		['None']='Hexa Strike',
		['Maxentius']='Black Halo',	
		['Tishtrya']='Realmrazer',
		['DualMaxentius']='Black Halo',
		['DualTishtrya']='Realmrazer',
		}