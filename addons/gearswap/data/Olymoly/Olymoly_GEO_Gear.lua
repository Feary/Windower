function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','SingleWeapon','DualWeapons')

	gear.nuke_jse_back = 	{name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}}
	gear.FC_jse_back = 		{name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}
	gear.idle_jse_back = 	{name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	-- Dex, Acc/R.Acc, DA
	gear.tp_jse_back = 		{}
	gear.ws_jse_back = 		{name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}}
	
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
	send_command('bind @delete input /ma "Sleep" <t>')
	
	-- Base duration is 180 seconds.
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
	sets.buff.Entrust = {}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells
	sets.precast.FC = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", range="Dunna",
		head="Amalric Coif +1", neck="Orunmila's Torque", lear="Enchntr. Earring +1", rear="Malignance Earring",
		body="Zendik Robe", hands=gear.helios_hands_FC, ring1="Kishar Ring", ring2="Prolix Ring",
		back=gear.FC_jse_back, waist="Shinjutsu-no-Obi +1", legs="Geomancy Pants +3", feet=gear.merlinic_fc_feet}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {main="Idris", sub="Genmei Shield", range="Dunna",ammo=empty,
		rring=empty,
		waist="Shinjutsu-no-Obi +1"})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +3", ear2="Barkaro. Earring"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		 rear="Mendi. Earring",
		 body="Annoint. Kalasiris",
		 feet="Vanya Clogs"})

	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {ring1="Kunaji Ring",ring2="Asklepian Ring"}-- waist="Gishdubar Sash" neck="Phalaina Locket",
	sets.Cure_Received = {ring1="Kunaji Ring",ring2="Asklepian Ring"}--waist="Gishdubar Sash" neck="Phalaina Locket",
	sets.Self_Refresh = {back="Grapevine Cape"}--waist="Gishdubar Sash",feet="Inspirited Boots"
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

	sets.precast.FC.Impact = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Impatiens",
		head=empty,neck="Orunmila's Torque",lear="Enchntr. Earring +1", rear="Malignance Earring",
		body="Crepuscular Cloak",hands=gear.helios_hands_FC, ring1="Kishar Ring", ring2="Prolix Ring",
		back="Lifestream Cape",waist="Shinjutsu-no-Obi +1",legs="Geomancy Pants +3",feet="Amalric Nails +1"}
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +3"})
	
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {}
		
	-- Geomancy
	-- Master level 10 - 
	sets.midcast.Geomancy = {main="Idris", sub="Genmei Shield", range="Dunna",
		--  Bagua Charm +2
		head="Vanya Hood", neck="Incanter's Torque", lear="Gifted Earring", rear="Calamitous Earring",
		-- Vanya Cuffs Path C
		body="Amalric Doublet +1", hands="Geo. Mitaines +3", ring1="Gelatinous Ring +1", ring2="Defending Ring",
		-- Vanya Slops Vanya Clogs Path C
		back="Lifestream Cape", waist="Shinjutsu-no-Obi +1", legs="Vanya Slops", feet="Vanya Clogs"}

	--Extra Indi duration. As long as you can keep your 900 skill cap
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {main="Idris", sub="Genmei Shield", range="Dunna",
		-- Azimuth Hoods +3  Bagua Charm +2
		head="Vanya Hood", neck="Incanter's Torque", lear="Odnowa Earring +1", rear="Malignance Earring",
		body="Amalric Doublet +1", hands="Geo. Mitaines +3", ring1="Gelatinous Ring +1", ring2="Defending Ring",
		-- Azimuth Gaiters +3
		back="Lifestream Cape", waist="Shinjutsu-no-Obi +1", legs="Bagua Pants +3", feet="Azimuth Gaiters +1"})
	
	-- Healing Magic
    sets.midcast.Cure = {main=gear.gada_healing_club,sub="Sors Shield", range="Dunna",
        head="Vanya Hood", neck="Incanter's Torque",ear1="Novia Earring", rear="Mendi. Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, ring1="Stikini Ring +1",ring2="Sirona's Ring",
		back="Tempered Cape +1", waist="Shinjutsu-no-Obi +1", legs="Vanya Slops", feet="Vanya Clogs"}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff", sub="Enki Strap", 
        head="Vanya Hood", neck="Incanter's Torque",ear1="Novia Earring", rear="Mendi. Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, ring1="Stikini Ring +1",ring2="Sirona's Ring",
		back="Tempered Cape +1", waist="Shinjutsu-no-Obi +1", legs="Vanya Slops", feet="Vanya Clogs"}
		
	-- Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Daybreak",sub="Sors Shield",ammo="Hasty Pinion +1",
         head="Vanya Hood", neck="Incanter's Torque",ear1="Novia Earring", rear="Mendi. Earring",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure, ring1="Stikini Ring +1",ring2="Sirona's Ring",
		back="Tempered Cape +1", waist="Shinjutsu-no-Obi +1", legs="Vanya Slops", feet="Vanya Clogs"}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})--neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring"
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",})--sub="Clemency Grip"
	
	-- Elemental Magic
    sets.midcast['Elemental Magic'] = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- Bunzi's Rod 
		-- Azimuth Hood +3 Baetyl Pendant
		head="Bagua Galero +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		-- Azimuth Coat +3 Azimuth Gloves +3 ring1="Freke Ring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Shiva Ring +1", rring="Metamor. Ring +1",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Orpheus's Sash", legs="Bagua Pants +3", feet="Bagua Sandals +3"}		

    sets.midcast['Elemental Magic'].Resistant = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- Bunzi's Rod 
		-- Azimuth Hood +3 Baetyl Pendant
		head="Bagua Galero +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		-- Azimuth Coat +3 Azimuth Gloves +3 ring1="Freke Ring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Shiva Ring +1", rring="Metamor. Ring +1",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Orpheus's Sash", legs="Bagua Pants +3", feet="Bagua Sandals +3"}			

    sets.midcast['Elemental Magic'].Fodder = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- Bunzi's Rod 
		-- Azimuth Hood +3 Baetyl Pendant
		head="Bagua Galero +3", neck="Erra Pendant", lear="Regal Earring", rear="Malignance Earring",
		-- Azimuth Coat +3 Azimuth Gloves +3 ring2="Freke Ring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", lring="Shiva Ring +1", rring="Metamor. Ring +1",
		-- Sacro Cord Azimuth Tights +3 Azimuth Gaiters +3
		back=gear.nuke_jse_back, waist="Orpheus's Sash", legs="Bagua Pants +3", feet="Bagua Sandals +3"}			

	-- High Tier Nuke
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})	
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})	
	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder,  {})	
	
	sets.midcast.Impact = {main="Idris",sub="Ammurapi Shield", range="Dunna",
		head=empty, neck="Erra Pendant", ear1="Regal Earring", ear2="Malignance Earring",
		body="Crepuscular Cloak", hands="Geo. Mitaines +3", ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Geomancy Pants +3", feet="Geo. Sandals +3"}		

	-- Dark Magic
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield", range="Dunna",
        head="Bagua Galero +3",neck="Erra Pendant", ear1="Regal Earring",ear2="Malignance Earring",
        body="Geomancy Tunic +3",hands="Geo. Mitaines +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Geomancy Pants +3",feet="Geo. Sandals +3"}
		
    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield", range="Dunna",
        head="Bagua Galero +3",neck="Erra Pendant", ear1="Regal Earring", ear2="Malignance Earring",
        body="Geomancy Tunic +3",hands="Geo. Mitaines +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="Perimede Cape",waist="Fucho-no-obi",legs="Geomancy Pants +3",feet="Geo. Sandals +3"}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Idris",sub="Ammurapi Shield", range="Dunna",
		head="Geo. Galero +3",neck="Orunmila's Torque", ear1="Enchntr. Earring +1", ear2="Malignance Earring",
		body="Zendik Robe",hands="Geo. Mitaines +3",ring1="Stikini Ring +1",ring2="Kishar Ring",
        back=gear.FC_jse_back,waist="Ninurta's Sash",legs="Geomancy Pants +3",feet="Geo. Sandals +3"}
    
	sets.midcast.Stun.Resistant = {main="Idris",sub="Ammurapi Shield", range="Dunna",
		head="Geo. Galero +3",neck="Erra Pendant", ear1="Enchntr. Earring +1", ear2="Malignance Earring",
		body="Zendik Robe",hands="Geo. Mitaines +3",ring1="Stikini Ring +1",ring2="Kishar Ring",
		back=gear.FC_jse_back,waist="Ninurta's Sash",legs="Geomancy Pants +3",feet="Geo. Sandals +3"}
	
	-- Enfeebling Magic
	sets.midcast['Enfeebling Magic'] = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- Geo. Galero +3 Bagua Charm +2
		head="Geo. Galero +3", neck="Erra Pendant", ear1="Regal Earring", ear2="Malignance Earring",
		-- Geomancy Tunic +3
		body="Geomancy Tunic +3", hands="Regal Cuffs", ring1="Stikini Ring +1", ring2="Kishar Ring",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs="Geomancy Pants +3", feet="Geo. Sandals +3"}		
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		-- Geo. Galero +3 Bagua Charm +2
		head="Geo. Galero +3", neck="Erra Pendant", ear1="Regal Earring", ear2="Malignance Earring",
		-- Geomancy Tunic +3
		body="Geomancy Tunic +3", hands="Geo. Mitaines +3", ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs="Geomancy Pants +3", feet="Geo. Sandals +3"}		
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
		 
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	-- Duration
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club, sub="Ammurapi Shield", 
		head=gear.telchine_head_Duration, neck="Incanter's Torque", lear="Andoaa Earring", rear="Augment. Earring",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		back="Fi Follet Cape +1", waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Nodens Gorget", ear2="Earthcry Earring",
		body=gear.merlinic_phalanx_body,
		waist="Siegel Sash", legs="Shedir Seraweels"})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Nodens Gorget",ear2="Earthcry Earring",
		waist="Siegel Sash", legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		main="Vadose Rod", sub="Genmei Shield",
		head="Amalric Coif +1", hands="Regal Cuffs", 
		waist="Emphatikos Rope", legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Idris", sub="Ammurapi Shield", range="Dunna",
		head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Bagua Mitaines +3", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		back="Moonbeam Cape",waist="Shinjutsu-no-Obi +1", legs="Assid. Pants +1", feet="Mallquis Clogs +2"}

	-- Idle sets
	sets.idle = {main="Idris",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Befouled Crown", neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe", hands="Bagua Mitaines +3", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		back="Moonbeam Cape",waist="Shinjutsu-no-Obi +1",legs="Assid. Pants +1", feet="Mallquis Clogs +2"}
		
	sets.idle.PDT = {main="Idris",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Bagua Mitaines +3",ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Shinjutsu-no-Obi +1", legs="Assid. Pants +1",feet="Mallquis Clogs +2"}
		
	sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"

	--Pet sets are for when Luopan is present.
	sets.idle.Pet = {main="Idris",sub="Genmei Shield",range="Dunna",
		-- Bagua Charm +2
		head=gear.telchine_head_Pet, neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",		
		body="Shamash Robe",hands="Geo. Mitaines +3", ring1="Stikini Ring +1",ring2="Defending Ring",
		back=gear.idle_jse_back, waist="Isa Belt", legs=gear.telchine_legs_Pet, feet="Bagua Sandals +3"}

	sets.idle.PDT.Pet = {main="Idris",sub="Genmei Shield",range="Dunna",
		head=gear.telchine_head_Pet, neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- ring1="Fortified Ring",
		body="Shamash Robe", hands="Geo. Mitaines +3", ring1="Gelatinous Ring +1", ring2="Defending Ring",
		back=gear.idle_jse_back, waist="Isa Belt", legs=gear.telchine_legs_Pet, feet="Bagua Sandals +3"}

	--Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {main="Idris",sub="Genmei Shield",range="Dunna"})	
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {main="Idris",sub="Genmei Shield",range="Dunna"}) 
	
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {main="Idris",sub="Genmei Shield",range="Dunna"})
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {main="Idris",sub="Genmei Shield",range="Dunna"})

	sets.idle.Weak = {main="Idris",sub="Genmei Shield", range="Dunna",
		head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Bagua Mitaines +3",ring1=gear.DarkRing,ring2="Defending Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Assid. Pants +1",feet="Mallquis Clogs +2"}
		
	-- Defense sets	
	sets.defense.PDT = {main="Malignance Pole",sub="Khonsu",range="Dunna",
		head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Geo. Mitaines +3",ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Assid. Pants +1",feet="Azimuth Gaiters +1"}

	sets.defense.MDT = {main="Malignance Pole",sub="Khonsu",range="Dunna",
		head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Geo. Mitaines +3",ring1=gear.DarkRing,ring2="Defending Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Assid. Pants +1",feet="Mallquis Clogs +2"}
		
    sets.defense.MEVA = {main="Mafic Cudgel",sub="Genmei Shield",ammo="Staunch Tathlum +1",
        head=gear.telchine_head_Pet,neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands=gear.telchine_hands_Pet,ring1=gear.DarkRing,ring2="Defending Ring",
        back=gear.idle_jse_back, waist="Carrier's Sash",legs=gear.telchine_legs_Pet,feet="Mallquis Clogs +2"}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {lring="Shneddick Ring"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.SingleWeapon = {main="Idris", sub="Genmei Shield", ranged="Dunna"}
	sets.weapons.DualWeapons = {main="Idris", sub="Maxentius", ranged="Dunna"}	
	
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
		-- Nyame Helm Lissome Necklace Crep. Earring
		head="Bagua Galero +3",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Telos Earring",
		-- Nyame Mail Nyame Gauntlets 
		body="Bagua Tunic +3",hands="Bagua Mitaines +3",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		-- Cetl Belt Nyame Flanchard Nyame Sollerets 
		back="Moonbeam Cape",waist="Witful Belt",legs="Bagua Pants +3",feet="Bagua Sandals +3"}
		
	sets.engaged.DW = {
		-- Nyame Helm Lissome Necklace Crep. Earring
		head="Bagua Galero +3",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Telos Earring",
		-- Nyame Mail Nyame Gauntlets 
		body="Bagua Tunic +3",hands="Bagua Mitaines +3",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		-- Gerdr Belt +1 Nyame Flanchard Nyame Sollerets 
		back="Moonbeam Cape",waist="Witful Belt",legs="Bagua Pants +3",feet="Bagua Sandals +3"}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		-- Nyame Helm Lissome Necklace Crep. Earring
		head="Bagua Galero +3", neck="Fotia Gorget", lear="Regal Earring", rear="Ishvara Earring",
		-- Nyame Mail Nyame Gauntlets 
		body="Bagua Tunic +3", hands="Bagua Mitaines +3", lring="Rufescent Ring", rring="Epaminondas's Ring",
		-- Nyame Mail Nyame Gauntlets 
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Bagua Pants +3", feet="Bagua Sandals +3"}

	-- Club
	-- STR/MND
	sets.precast.WS['Hexa Strike']= {
		head="Bagua Galero +3", neck="Fotia Gorget", lear="Regal Earring", rear="Ishvara Earring",
		body="Bagua Tunic +3", hands="Bagua Mitaines +3", lring="Rufescent Ring", rring="Epaminondas's Ring",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Bagua Pants +3", feet="Bagua Sandals +3"}
	sets.precast.WS['Flash Nova']= {
		head="Bagua Galero +3", neck="Fotia Gorget", lear="Regal Earring", rear="Ishvara Earring",
		body="Bagua Tunic +3", hands="Bagua Mitaines +3", lring="Rufescent Ring", rring="Epaminondas's Ring",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Bagua Pants +3", feet="Bagua Sandals +3"}
	-- Changes Based on TP Range
	sets.precast.WS['Realmrazer']= {
		head="Bagua Galero +3", neck="Fotia Gorget", lear="Regal Earring", rear="Ishvara Earring",
		body="Bagua Tunic +3", hands="Bagua Mitaines +3", lring="Rufescent Ring", rring="Epaminondas's Ring",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Bagua Pants +3", feet="Bagua Sandals +3"}
	-- MND
	sets.precast.WS['Exudation']= {
		head="Bagua Galero +3", neck="Fotia Gorget", lear="Regal Earring", rear="Ishvara Earring",
		body="Bagua Tunic +3", hands="Bagua Mitaines +3", lring="Archon Ring", rring="Epaminondas's Ring",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Bagua Pants +3", feet="Bagua Sandals +3"}
	-- Staff
	sets.precast.WS['Catacylsm']= {
		head="Bagua Galero +3", neck="Fotia Gorget", lear="Regal Earring", rear="Ishvara Earring",
		body="Bagua Tunic +3", hands="Bagua Mitaines +3", lring="Archon Ring", rring="Epaminondas's Ring",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Bagua Pants +3", feet="Bagua Sandals +3"}
	sets.precast.WS['Shattersoul']= {
		head="Bagua Galero +3", neck="Fotia Gorget", lear="Regal Earring", rear="Ishvara Earring",
		-- Freke Ring
		body="Bagua Tunic +3", hands="Bagua Mitaines +3", lring="Metamor. Ring +1", rring="Epaminondas's Ring",
		back=gear.ws_jse_back, waist="Fotia Belt", legs="Bagua Pants +3", feet="Bagua Sandals +3"}

	-- Custom buff sets
	--------------------------------------
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie", feet="Mallquis Clogs +2"}
	sets.DamageMP = {lear="Ethereal Earring", feet="Mallquis Clogs +2"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",ring1="Mujin Band",feet="Jhakri Pigaches +2"}--head="Ea Hat",body="Ea Houppelande",hands="Ea Cuffs",legs="Ea Slops",
	sets.RecoverBurst = {neck="Mizu. Kubikazari",body="Seidr Cotehardie",ring1="Mujin Band",feet="Jhakri Pigaches +2"}--head="Ea Hat",hands="Ea Cuffs",legs="Ea Slops",

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 22)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 024')
end

function job_setup()

	state.Buff.Entrust = buffactive.Entrust or false
	state.Buff['Blaze of Glory'] = buffactive['Blaze of Glory'] or false

	LowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
		'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
		'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga'}

	autows = 'Realmrazer'
	autofood = 'Miso Ramen'
	autoindi = 'Torpor'
	autoentrust = 'Fury'
	autoentrustee = '<p1>'
	autogeo = 'Frailty'
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
		['None']='Realmrazer',
		['SingleWeapon']='Realmrazer',
		['DualWeapons']='Realmrazer'}