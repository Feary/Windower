function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','DualWield')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','SingleWeapon','DualWeapons')

	gear.idle_jse_back = 	{name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.nuke_jse_back = 	{name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-2%',}}
	--{name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back = 	{name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	
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
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +3", back=gear.idle_jse_back}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +3"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +3"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1", hands="Bagua Mitaines +3"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {legs="Bagua Pants +3", feet="Azimuth Gaiters +1"}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells
	-- Current 76%
	sets.precast.FC = {main="C. Palug Hammer", sub="Chanter's Shield", ranged="Dunna", ammo=empty,
		--  ear2="Malignance Earring",
		head="Amalric Coif +1", neck="Voltsurge Torque", ear1="Enchntr. Earring +1", rear="Loquac. Earring",
		-- ring1="Kishar Ring", 
		body="Zendik Robe", hands=gear.helios_hands_FC, lring="Naji's Loop", ring2="Prolix Ring", 
		back="Fi Follet Cape +1", waist="Shinjutsu-no-Obi +1", legs="Geomancy Pants +3", feet="Amalric Nails +1"}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {main="C. Palug Hammer", sub="Chanter's Shield", range="Dunna", ammo=empty,})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +3"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})--main="Serenity",
		
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

    sets.midcast.FastRecast = set_combine(sets.precast.FC,{
		main="C. Palug Hammer", sub="Chanter's Shield", ranged="Dunna", ammo=empty,
		--  ear2="Malignance Earring",
		head="Amalric Coif +1", neck="Voltsurge Torque", ear1="Enchntr. Earring +1", rear="Loquac. Earring",
		-- ring1="Kishar Ring", 
		body="Zendik Robe", hands=gear.helios_hands_FC, lring="Naji's Loop", ring2="Prolix Ring", 
		back="Fi Follet Cape +1", waist="Shinjutsu-no-Obi +1", legs="Geomancy Pants +3", feet="Amalric Nails +1"})

	sets.midcast.Geomancy = {main="Solstice", sub="Genbu's Shield", range="Dunna",
		-- head="Vanya Hood",  neck="Incantor's Torque",
		head="Azimuth Hood +1", neck="Bagua Charm +2", lear="Gna Earring", rear="Fulla Earring", 
		-- Vanya Cuffs Path C
		body="Bagua Tunic +3", hands="Geo. Mitaines +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- Azimuth Gaiters +3
		back="Lifestream Cape", waist="Shinjutsu-no-Obi +1", legs="Bagua Pants +3", feet="Azimuth Gaiters +1"}

	-- Extra Indi duration on any slot you can't get skill on here.
	-- MasterLevel 10+
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {main="Solstice", sub="Genbu's Shield", range="Dunna",
		--head="Vanya Hood", 
		head="Azimuth Hood +1", neck="Bagua Charm +2", lear="Gna Earring", rear="Fulla Earring", 
		-- Vanya Cuffs Path C
		body="Bagua Tunic +3", hands="Geo. Mitaines +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- Azimuth Gaiters +3
		back="Lifestream Cape", waist="Shinjutsu-no-Obi +1", legs="Bagua Pants +3", feet="Azimuth Gaiters +1"})
		
	-- HealingMagic
    sets.midcast.Cure = {main="Daybreak", sub="Sors Shield", range="Dunna",
		-- Path Incanter's Torque  Mendi. Earring 
		head="Vanya Hood", neck="Colossus's Torque", lear="Meili Earring", rear="Novia Earring",
		-- Vanya Robe Path B Vanya Cuffs Path B
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- Vanya Clogs
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Vanya Slops", feet="Skaoi Boots"}

    sets.midcast.LightWeatherCure = {main="Chatoyant Staff", sub="Khonsu", range="Dunna",
		head="Vanya Hood", neck="Colossus's Torque", lear="Meili Earring", rear="Novia Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Vanya Slops", feet="Skaoi Boots"}

    sets.midcast.LightDayCure = {main="Chatoyant Staff", sub="Khonsu", range="Dunna",
		head="Vanya Hood", neck="Colossus's Torque", lear="Meili Earring", rear="Novia Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Vanya Slops", feet="Skaoi Boots"}
    
	sets.midcast.Curaga = {main="Daybreak", sub="Sors Shield", range="Dunna",
		head="Vanya Hood", neck="Colossus's Torque", lear="Meili Earring", rear="Novia Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, lring="Metamor. Ring +1", rring="Stikini Ring +1",
		back=gear.Cure_jse_back, waist="Shinjutsu-no-Obi +1", legs="Vanya Slops", feet="Skaoi Boots"}

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})--neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring"
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    sets.midcast['Elemental Magic'] = {main="Daybreak", sub="Ammurapi Shield", ammo="Ghastly Tathlum +1",
		-- Idris Rank 15 
		-- lear="Regal Earring", rear="Malignance Earring",  rear="Azimuth Earring +2" 
		head="Bagua Galero +3", neck="Sibyl Scarf", lear="Novio Earring", rear="Friomisi Earring",
		-- Azimuth Coat +3 Azimuth Gloves +3 Freke Ring 
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Shiva Ring +1",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Bagua Pants +3", feet="Bagua Sandals +3"}		

    sets.midcast['Elemental Magic'].Resistant = {main="Daybreak", sub="Ammurapi Shield", ammo="Ghastly Tathlum +1",
		-- rear="Azimuth Earring +2" lear="Regal Earring", rear="Malignance Earring",
		head="Bagua Galero +3", neck="Sibyl Scarf", 
		-- Azimuth Coat +3 Azimuth Gloves +3
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Shiva Ring +1",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Bagua Pants +3", feet="Bagua Sandals +3"}			

    sets.midcast['Elemental Magic'].Fodder = {main="Daybreak", sub="Ammurapi Shield", ammo="Ghastly Tathlum +1",
		-- rear="Azimuth Earring +2" lear="Regal Earring", rear="Malignance Earring",
		head="Bagua Galero +3", neck="Sibyl Scarf", 
		-- Azimuth Coat +3 Azimuth Gloves +3
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Shiva Ring +1",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Bagua Pants +3", feet="Bagua Sandals +3"}			
	
	-- Hight Tier Nuke
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		main="Daybreak", sub="Ammurapi Shield", ammo="Ghastly Tathlum +1",
		-- rear="Azimuth Earring +2"  lear="Regal Earring", rear="Malignance Earring",
		head="Bagua Galero +3", neck="Sibyl Scarf", lear="Novio Earring", rear="Friomisi Earring",
		-- Azimuth Coat +3 Azimuth Gloves +3
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Shiva Ring +1",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Bagua Pants +3", feet="Bagua Sandals +3"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		main="Daybreak", sub="Ammurapi Shield", ammo="Ghastly Tathlum +1",
		-- rear="Azimuth Earring +2"  lear="Regal Earring", rear="Malignance Earring",
		head="Bagua Galero +3", neck="Sibyl Scarf", lear="Novio Earring", rear="Friomisi Earring",
		-- Azimuth Coat +3 Azimuth Gloves +3
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Shiva Ring +1",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Bagua Pants +3", feet="Bagua Sandals +3"})
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {
		main="Daybreak", sub="Ammurapi Shield", ammo="Ghastly Tathlum +1",
		-- rear="Azimuth Earring +2"  lear="Regal Earring", rear="Malignance Earring",
		head="Bagua Galero +3", neck="Sibyl Scarf", lear="Novio Earring", rear="Friomisi Earring",
		-- Azimuth Coat +3 Azimuth Gloves +3
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Shiva Ring +1",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Bagua Pants +3", feet="Bagua Sandals +3"})
	
    sets.midcast['Dark Magic'] = {main="Daybreak", sub="Ammurapi Shield", range="Ghastly Tathlum +1",
		head="Bagua Galero +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		body="Geomancy Tunic +3", hands="Geo. Mitaines +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Geomancy Pants +3", feet="Geo. Sandals +3"}

    sets.midcast.Drain = {range="Ghastly Tathlum +1",
		main="Daybreak", sub="Ammurapi Shield", 
		-- lear="Regal Earring", rear="Malignance Earring",
		head="Bagua Galero +3", neck="Erra Pendant", lear="Enchntr. Earring +1", rear="Gwati Earring",
		-- lring="Stikini Ring +1", rring="Stikini Ring +1",
		body="Geomancy Tunic +3", hands="Geo. Mitaines +3", lring="Metamor. Ring +1", rring="Stikini ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Geomancy Pants +3", feet="Geo. Sandals +3"}

    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {range="Ghastly Tathlum +1", -- Sapience Orb 
		main="Daybreak", sub="Ammurapi Shield", 
		head="Geo. Galero +3", neck="Bagua Charm +2", lear="Regal Earring", rear="Malignance Earring",
		body="Geomancy Tunic +3", hands="Geo. Mitaines +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Witful Belt", legs="Geomancy Pants +3", feet="Geo. Sandals +3"}

	sets.midcast.Impact = {range="Dunna",
		main="Daybreak", sub="Ammurapi Shield",
		head=empty, neck="Bagua Charm +2", lear="Regal Earring", rear="Malignance Earring",
		body="Twilight Cloak", hands="Geo. Mitaines +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Geomancy Pants +3", feet="Geo. Sandals +3"}
		
	sets.midcast.Stun.Resistant = {range="Dunna",
		main="Daybreak", sub="Ammurapi Shield",
		head="Geo. Galero +3", neck="Bagua Charm +2", lear="Regal Earring", rear="Malignance Earring",
		body="Geomancy Tunic +3", hands="Geo. Mitaines +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Geomancy Pants +3", feet="Geo. Sandals +3"}

	sets.midcast.Impact = {main="Daybreak", sub="Ammurapi Shield", range="Dunna",
		head=empty, neck="Bagua Charm +2", lear="Regal Earring", rear="Malignance Earring",
		body="Twilight Cloak", hands="Geo. Mitaines +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Geomancy Pants +3", feet="Geo. Sandals +3"}

	sets.midcast['Enfeebling Magic'] = {main="Daybreak", sub="Ammurapi Shield", range="Dunna",
		-- Pempheredo Tathlum
		--  lear="Regal Earring", rear="Malignance Earring",
		head="Geo. Galero +3", neck="Bagua Charm +2", lear="Enchntr. Earring +1", rear="Gwati Earring",
		-- hands="Regal Cuffs", lring="Kishar Ring",
		body="Geomancy Tunic +3", hands="Geo. Mitaines +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Luminary Sash", legs="Geomancy Pants +3", feet="Geo. Sandals +3"}

	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak", sub="Ammurapi Shield", range="Dunna",
		-- Pempheredo Tathlum
		--  lear="Regal Earring", rear="Malignance Earring",
		head="Geo. Galero +3", neck="Bagua Charm +2", lear="Enchntr. Earring +1", rear="Gwati Earring",
		-- hands="Regal Cuffs",  lring="Stikini Ring +1",
		body="Geomancy Tunic +3", hands="Geo. Mitaines +3", lring="Kishar Ring", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Luminary Sash", legs="Geomancy Pants +3", feet="Geo. Sandals +3"}

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Luminary Sash"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Luminary Sash"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club, sub="Ammurapi Shield", range="Dunna",
		-- neck="Incantor's Torque", neck="Colossus's Torque",
		head=gear.telchine_head_Duration,  ear1="Andoaa Earring", ear2="Mimir Earring",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Fi Follet Cape +1", waist="Embla Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}
		
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
		head=gear.merlinic_phalanx_head,
		--body=gear.merlinic_phalanx_body
		})
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})--feet="Inspirited Boots"
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod", head="Amalric Coif +1",})--  hands="Regal Cuffs"
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Daybreak", sub="Genbu's Shield", range="Dunna",
		head="Befouled Crown",neck="Sibyl Scarf", ear1="Ethereal Earring", rear="Etiolation Earring",
		body="Shamash Robe", hands="Bagua Mitaines +3", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		back="Fi Follet Cape +1",waist="Shinjutsu-no-Obi +1",legs=gear.merlinic_refresh_legs,feet="Mallquis Clogs +2"}

	-- Idle sets
	sets.idle = {main="Daybreak", sub="Genbu's Shield", range="Dunna",
		--head=gear.merlinic_refresh_head,
		head="Befouled Crown", neck="Sibyl Scarf", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Shamash Robe", hands="Bagua Mitaines +3", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		-- gear.merlinic_refresh_legs gear.merlinic_refresh_feet
		back="Fi Follet Cape +1", waist="Shinjutsu-no-Obi +1", legs="Assiduity Pants +1", feet="merlinic Crackows"}

	sets.idle.PDT = {main="Daybreak", sub="Genbu's Shield", range="Dunna",
		-- Genmei Earring 
		head="Mall. Chapeau +2", neck="Loricate Torque +1", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Shamash Robe", hands="Bagua Mitaines +3", lring="Gelatinous Ring +1", rring="Defending Ring",
		back="Fi Follet Cape +1", waist="Shinjutsu-no-Obi +1", legs=gear.merlinic_refresh_legs, feet="Mallquis Clogs +2"}

	-- Pet sets are for when Luopan is present.
	sets.idle.Pet = set_combine(sets.idle.PDT, {main="Solstice", sub="Genbu's Shield", range="Dunna",
		-- Azimuth Hood +2 
		head="Azimuth Hood +1", neck="Bagua Charm +2", lear="Ethereal Earring", rear="Etiolation Earring",
		body="Shamash Robe", hands="Geo. Mitaines +3", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- Agqwu's Slops
		back=gear.idle_jse_back, waist="Isa Belt", legs=gear.telchine_legs_Pet, feet="Bagua Sandals +3"})

	sets.idle.PDT.Pet = set_combine(sets.idle.PDT, {main="Solstice", sub="Genbu's Shield", range="Dunna",
		-- Azimuth Hood +2 
		head="Azimuth Hood +1", neck="Bagua Charm +2", lear="Odnowa Earring +1", rear="Ran Earring",
		body="Shamash Robe", hands="Geo. Mitaines +3", lring="Gelatinous Ring +1", rring="Defending Ring",
		back=gear.idle_jse_back, waist="Isa Belt", legs=gear.telchine_legs_Pet, feet="Bagua Sandals +3"})

	-- Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {main="Daybreak", sub="Genbu's Shield", range="Dunna"})	
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {main="Daybreak", sub="Genbu's Shield", range="Dunna"}) 
	
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {main="Solstice", sub="Genbu's Shield", range="Dunna"})
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {main="Solstice", sub="Genbu's Shield", range="Dunna"})

	sets.idle.Weak = {main="Daybreak",sub="Genbu's Shield", range="Dunna",
		head="Mall. Chapeau +2", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Shamash Robe", hands="Mallquis Cuffs +2", lring="Gelatinous Ring +1", rring="Defending Ring",
		back="Fi Follet Cape +1", waist="Shinjutsu-no-Obi +1", legs="Mallquis Trews +2", feet="Mallquis Clogs +2"}

	-- Defense sets	
	sets.midcast.PDT = {main="Daybreak",sub="Genbu's Shield", range="Dunna",
		-- Genmei Earring
		head="Bagua Galero +3", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Shamash Robe", hands="Bagua Mitaines +3", lring="Gelatinous Ring +1", rring="Defending Ring",
		back="Shadow Mantle", waist="Carrier's Sash", legs="Bagua Pants +3", feet="Bagua Sandals +3"}	

	sets.defense.MDT = {main="Daybreak",sub="Genbu's Shield", range="Dunna",
		-- Nyame Helm
		head="Bagua Galero +3", neck="Warder's Charm +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		-- Nyame Mail Nyame Gauntlets
		body="Shamash Robe", hands="Bagua Mitaines +3", lring="Gelatinous Ring +1", rring="Defending Ring",
		--  Nyame Flanchard Nyame Sollerets
		back="Shadow Mantle", waist="Carrier's Sash", legs="Bagua Pants +3", feet="Bagua Sandals +3"}
	
    sets.defense.MEVA = {main="Daybreak",sub="Genbu's Shield", range="Dunna",
		-- Nyame Helm
		head="Bagua Galero +3", neck="Warder's Charm +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		-- Nyame Mail Nyame Gauntlets
		body="Shamash Robe", hands="Bagua Mitaines +3", lring="Gelatinous Ring +1", rring="Defending Ring",
		--  Nyame Flanchard Nyame Sollerets
		back="Shadow Mantle", waist="Carrier's Sash", legs="Bagua Pants +3", feet="Bagua Sandals +3"}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {lring="Shneddick Ring"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
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
	sets.engaged = {
		-- Nyame Helm
		head="Blistering Sallet +1", neck="Sanctity Necklace", lear="Mache Earring +1", rear="Mache Earring +1",
		-- Nyame Mail Nyame Gauntlets 
		body="Shamash Robe", hands="Gazu Bracelets +1", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- Nyame Flanchard Nyame Sollerets
		back=gear.idle_jse_back, waist="Witful Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	sets.engaged.DW = {
		-- Nyame Helm
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Dudgeon Earring", rear="Heartseeker Earring",
		-- Nyame Mail Nyame Gauntlets 
		body="Shamash Robe", hands="Jhakri Cuffs +2", lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- Nyame Flanchard Nyame Sollerets
		back=gear.idle_jse_back, waist="Witful Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Bagua Galero +3", neck="Fotia Gorget", lear="Zennaroi Earring", rear="Regal Earring",
		body="Bagua Tunic +3", hands="Jhakri Cuffs +2", lring="Rufescent Ring", rring="Petrov Ring",
		-- WS Cape  
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Bagua Pants +3", feet="Bagua Sandals +3"}

	-- Club
	sets.precast.WS['Hexa Strike']= {  
		-- neck="Caro Necklace", lear="Telos Earring",
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Zennaroi Earring", rear="Regal Earring",
		-- lring="Begrudging Ring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring",  rring="Petrov Ring",
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	sets.precast.WS['Flash Nova']= {  
		head="Bagua Galero +3", neck="Fotia Gorget", lear="Zennaroi Earring", rear="Regal Earring",
		body="Bagua Tunic +3", hands="Bagua Mitaines +3", lring="Rufescent Ring",  rring="Petrov Ring",
		-- WS Cape
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Bagua Pants +3", feet="Bagua Sandals +3"}
	sets.precast.WS['Realmrazer']= {
		-- lear="Telos Earring", rear="Cessance Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget",  lear="Zennaroi Earring", rear="Regal Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring",  rring="Petrov Ring",
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	sets.precast.WS['Exudation']= {	
		-- lear="Telos Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Zennaroi Earring", rear="Regal Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Rufescent Ring", rring="Archon Ring",
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	
	-- Staff
	sets.precast.WS['Catacylsm']= {
		--  lear="Telos Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Zennaroi Earring", rear="Regal Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Metamor. Ring +1", rring="Archon Ring",
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	sets.precast.WS['Shattersoul']= {
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Zennaroi Earring", rear="Regal Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Epaminondas's Ring", rring="Shiva Ring +1",
		back=gear.nuke_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari", hands="Bagua Mitaines +3", ring1="Mujin Band", }--body="Ea Houppelande", legs="Ea Slops",
	sets.RecoverBurst = {neck="Mizu. Kubikazari", body="Seidr Cotehardie", ring1="Mujin Band", }--head="Ea Hat", legs="Ea Slops",
	
	-- Weapons sets
	sets.weapons.None = {main="Daybreak", sub="Genbu's Shield",ranged="Dunna"}
	sets.weapons.SingleWeapon = {main="Maxentius", sub="Genbu's Shield", ranged="Dunna"}
	sets.weapons.DualWeapons = {main="Daybreak", sub="Maxentius", ranged="Dunna"}	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 22)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 022')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

	state.Buff.Entrust = buffactive.Entrust or false
	state.Buff['Blaze of Glory'] = buffactive['Blaze of Glory'] or false

	LowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
		'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
		'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga'}

	autows = 'Realmrazer'
	autofood = 'Miso Ramen'
	autoindi = 'Frailty'
	autoentrust = 'Haste'
	autoentrustee = '<p1>'
	autogeo = 'Fury'
	last_indi = nil
	last_geo = nil
	blazelocked = false
	used_ecliptic = false

	state.ShowDistance = M(true, 'Show Geomancy Buff/Debuff distance')
	state.AutoEntrust = M(false, 'AutoEntrust Mode')
	state.UnlockGeomancy = M{'Always','500','1000','Never'}
	state.CombatEntrustOnly = M(true, 'Combat Entrust Only Mode')
	state.AutoGeoAbilities = M(true, 'Use Geo Abilities Automatically')

	indi_timer = ''
	indi_duration = 180
	init_job_states({"Capacity","AutoFoodMode","AutoTrustMode","AutoWSMode","AutoNukeMode","AutoShadowMode","AutoStunMode","AutoDefenseMode"},{"AutoBuffMode","AutoRuneMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","RecoverMode","ElementalMode","CastingMode","TreasureMode",})
end

autows_list = {
		['None']='Hexa Strike',
		['Maxentius']='Black Halo',	
		['Tishtrya']='Realmrazer',
		['DualMaxentius']='Black Halo',
		['DualTishtrya']='Realmrazer',
		}