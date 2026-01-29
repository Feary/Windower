-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'MEVA','TPEat')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None', 'Default')

	gear.nuke_jse_back = {	name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
	gear.FC_jse_back = 	{	name="Lugh's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Mag. Evasion+15',}}
	gear.Cure_jse_back = {	name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}}
	gear.Macc_jse_back = {	name="Lugh's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%','Spell interruption rate down-10%',}}
	-- 20 DEX, 30 ACC 20 ATK, 10 STP, 10% PDT
	gear.TP_jse_back = {	name="Lugh's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Mag. Evasion+15',}}
	-- 30 INT, 20 MACC/MDMG, 10% WSD, 10% PDT
	gear.WS_jse_back = {name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
	
	-- Additional local binds 
	-- * = ctrl
	-- @ = windows
	-- ! = alt
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	--send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	--send_command('bind !q gs c weapons default;gs c reset CastingMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	send_command('alias Myrkr input /ws "Myrkr" <me>')
	   	
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
	-- enmity down
	sets.enmity = {main="Malignance Pole", sub="Kaja Grip", ammo="Staunch Tathlum", 
		head="Acad. Mortar. +3", neck="Warder's Charm +1", lear="Etiolation Earring", rear="Odnowa Earring +1",
		body="Shamash Robe", hands="Acad. Bracers +3", lring="Warden's Ring", rring="Defending Ring",
		--waist="Slipor Sash", 
		back="Moonbeam Cape", legs="Acad. Pants +3", feet="Acad. Loafers +3"}

    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +3"}
	sets.precast.JA['Enlightenment'] = {body="Peda. Gown +3"} 

    -- Fast cast sets for spells
    sets.precast.FC = {main=gear.grioavolr_fc_staff, sub="Kaja Grip", ammo="Sapience Orb",
		-- Mpaca's Staff 
		head=gear.merlinic_fc_head, neck="Voltsurge Torque", ear1="Loquac. Earring", ear2="Malignance Earring",
		body="Zendik Robe", hands="Acad. Bracers +3", ring1="Prolix Ring", rring="Kishr Ring",
		back="Fi Follet Cape +1", waist="Embla Sash", legs="Agwu's Slops", feet="Peda. Loafers +3"}
		
	sets.precast.FC.Arts = {feet="Acad. Loafers +3"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {body="Mallquis Saio +2",ear1="Barkaro. Earring" })

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Vadose Rod", sub="Sors Shield",})-- main="Serenity",

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ghastly Tathlum +1",
		-- Pixie Hairpin +1 
		head="Amalric Coif +1", neck="Sybil Scarf", lear="Moonshade Earring", rear="Regal Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Epaminandas's Ring", rring="Archon Ring",
		back=gear.WS_jse_back, waist="Acuity Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	
    sets.precast.WS['Myrkr'] = {ammo="Psilomene",
		-- Dualism Collar +1 rear="Nehalennia Earring"
		head="Amalric Coif +1", neck="Sanctity Necklace", lear="Moonshade Earring", rear="Etiolation Earring",
		--  hands="Otomi Gloves",
		body="Peda. Gown +3", hands="Amalric Gages +1", lring="Mephitas's Ring +1", rring="Mephitas's Ring",
		back=gear.FC_jse_back, waist="Shinjustu-no-Obi +1", legs="Amalric Slops +1", feet=gear.psycloth_boots_MP}

	sets.precast.WS['Cataclysm'] = {ammo="Ghastly Tathlum +1",
		-- Pixie Hairpin +1 
		head="Amalric Coif +1", neck="Sybil Scarf ", lear="Moonshade Earring", rear="Regal Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Epaminandas's Ring", rring="Archon Ring",
		back=gear.WS_jse_back, waist="Acuity Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	sets.precast.WS['Shattersoul'] = {ammo="Ghastly Tathlum +1",
		head="Nyame Helm", neck="Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		--   lring="Freke Ring",
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Epaminandas's Ring", rring="Metamor. Ring +1",
		-- Fotia Belt
		back=gear.WS_jse_back, waist="Acuity Belt +1", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	sets.precast.WS['Shell Crusher'] = {ammo="Ghastly Tathlum +1", -- Amar Cluster
		--  Mache Earring +1 
		head="Nyame Helm", neck="Lissome Necklace", lear="Steelflash Earring", rear="Telos Earring",
		--  lring="Chirich Ring +1", rring="Chirich Ring +1",
		body="Agwu's Robe", hands="Nyame Gauntlets", lring="Jhakri Ring", rring="Rajas Ring",
		-- Fotia Belt 
		back=gear.WS_jse_back, waist="Snow Belt", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	sets.precast.WS['Aeolian Edge'] = {ammo="Ghastly Tathlum +1",
		head="Nyame Helm", neck="Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		-- lring="Freke Ring", 
		body="Nyame Mail", hands="Nyame Gauntlets", lring="Epaminandas's Ring", rring="Metamor. Ring +1",
		-- Fotia Belt
		back=gear.WS_jse_back, waist="Acuity Belt +1", legs="Amalric Slops +1", feet="Amalric Nails +1"}


    -- Midcast Sets
	sets.TreasureHunter = {waist="Chaac Belt", hands="Volte Bracers", head="Volte Cap", ammo="Per. Lucky Egg"}
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {}--body="Seidr Cotehardie"
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Bunzi's Rod", sub="Ammurapi Shield", 
		-- ammo="Ghastly Tahtlum +1",
		head="Agwu's Cap", neck="Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		--  Freke Ring
		body="Arbatel Gown +2", hands="Agwu's Gages", lring="Shiva Ring", rring="Metamor. Ring +1",
		-- Arbatel Pants +3
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Agwu's Slops", feet="Arbatel Loafers +3"}
	
	-- Gear for Ebullience Magic Burst mode.
    sets.MagicBurst.Ebullience = {main="Bunzi's Rod", sub="Ammurapi Shield", ammo="Pemphredo Tahtlum",
		-- ammo="Ghastly Tahtlum +1",
		head="Arbatel Bonnet +3", neck="Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		body="Agwu's Robe", hands="Agwu's Gages", lring="Mujin Band", rring="Metamor. Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Agwu's Slops", feet="Arbatel Loafers +3"}
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {ring2="Archon Ring"} -- head="Pixie Hairpin +1",
	sets.element.Wind = {}
	
	-- Midcast
    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff, sub="Kaja Grip", ammo="Sapience Orb", 
		--main="Mpaca's Staff", 
		head="Amalric Coif +1", neck="Voltsurge Torque", ear1="Loquac. Earring", ear2="Malignance Earring", 
		body="Zendik Robe", hands="Acad. Bracers +3", ring1="Prolix Ring", ring2="Kishar Ring",
		back=gear.FC_jse_back, waist="Shinjustu-no-Obi +1", legs="Agwu's Slops", feet="Peda. Loafers +3"}
		
	-- Healing Magic	
    sets.midcast.Cure = {main="Vadose Rod", sub="Sors Shield", ammo="Sapience Orb",
		-- lear="Mendi. Earring", rear="Magnetic Earring",
		head="Kaykaus Mitra +1", neck="Loricate Torque +1", lear="Novia Earring", rear="Beatific Earring",
		-- Naji's Loop
		body="Kaykaus Bliaut +1", hands="Kaykaus Cuffs +1", lring="Sirona's Ring", ring2="Mephitas's Ring +1",
		back=gear.Cure_jse_back, waist="Shinjustu-no-Obi +1", legs="Kaykaus Tights +1", feet="Kaykaus Boots +1"}

    sets.midcast.LightWeatherCure = {main="Chatoyant Staff", sub="Kaja Grip", ammo="Pemphredo Tathlum",
		-- Mendi. Earring 
		head="Kaykaus Mitra +1", neck="Loricate Torque +1",lear="Novia Earring", rear="Calamitous Earring", 
		-- Naji's Loop
		body="Kaykaus Bliaut +1", hands="Kaykaus Cuffs +1", lring="Sirona's Ring", ring2="Mephitas's Ring +1",
		back=gear.Cure_jse_back, waist="Shinjustu-no-Obi +1", legs="Kaykaus Tights +1", feet="Kaykaus Boots +1"}
		
    sets.midcast.LightDayCure = {main="Chatoyant Staff", sub="Kaja Grip", ammo="Pemphredo Tathlum",
		-- Mendi. Earring 
		head="Kaykaus Mitra +1", neck="Loricate Torque +1",lear="Novia Earring", rear="Calamitous Earring", 
		-- Naji's Loop
		body="Kaykaus Bliaut +1", hands="Kaykaus Cuffs +1", lring="Sirona's Ring", ring2="Mephitas's Ring +1",
		back=gear.Cure_jse_back, waist="Shinjustu-no-Obi +1", legs="Kaykaus Tights +1", feet="Kaykaus Boots +1"}

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Cure.DT = {main="Chatoyant Staff", sub="Kaja Grip", ammo="Staunch Tathlum",
		--lring="Mendi. Earring" rear="Magnetic Earring",	
		head="Kaykaus Mitra +1", neck="Loricate Torque +1", lear="Novia Earring", rear="Beatific Earring",
		body="Arbatel Gown +2", hands="Nyame Gauntlets", lring="Mephitas's Ring +1", ring2="Defending Ring",
		back=gear.Cure_jse_back, waist="Shinjustu-no-Obi +1", legs="Academic Pants +3", feet="Kaykaus Boots +1"}	
	sets.midcast.LightWeatherCure.DT = {main="Chatoyant Staff", sub="Kaja Grip", ammo="Staunch Tathlum", 
		--lring="Mendi. Earring" rear="Magnetic Earring",	
		head="Kaykaus Mitra +1", neck="Loricate Torque +1", lear="Novia Earring", rear="Beatific Earring",
		body="Arbatel Gown +2", hands="Nyame Gauntlets", lring="Mephitas's Ring +1", ring2="Defending Ring",
		back=gear.Cure_jse_back, waist="Shinjustu-no-Obi +1", legs="Academic Pants +3", feet="Kaykaus Boots +1"}
	sets.midcast.LightDayCure.DT = {main="Chatoyant Staff", sub="Kaja Grip", ammo="Staunch Tathlum",
		--lring="Mendi. Earring" rear="Magnetic Earring",	
		head="Kaykaus Mitra +1", neck="Loricate Torque +1", lear="Novia Earring", rear="Beatific Earring",
		body="Arbatel Gown +2", hands="Nyame Gauntlets", lring="Mephitas's Ring +1", ring2="Defending Ring",
		back=gear.Cure_jse_back, waist="Shinjustu-no-Obi +1", legs="Academic Pants +3", feet="Kaykaus Boots +1"}

	sets.Self_Healing = {neck="Phalaina Locket",ring2="Asklepian Ring",waist="Gishdubar Sash"} -- ring1="Kunaji Ring",
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Asklepian Ring",waist="Gishdubar Sash"} -- ring1="Kunaji Ring",
	sets.Self_Refresh = {waist="Gishdubar Sash", feet="Inspirited Boots"} -- back="Grapevine Cape"
	
	sets.midcast.Cursna = {main="Gada", sub="Ammurapi Shield", ammo="Sapience Orb", 
		head=gear.vanya_hood_pathb, neck="Debilis Medallion", ear1="Beatific Earring", ear2="Meili Earring",
		-- hands="Hieros Mittens",
		body="Peda. Gown +3", ring1="Haoma's Ring", ring2="Menelaus's Ring",
		-- Oretan. Cape +1 Bishop's Sash 
		back=gear.FC_jse_back,waist="Witful Belt",legs="Acad. Pants +3", feet=gear.vanya_clog_pathb}
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff, sub="Clemency Grip"})

	-- 500 Skill
	sets.midcast['Enhancing Magic'] = {main="Musa", sub="Fulcio Grip", ammo="Clarus Stone",
		--  ammo="Savant's Treatise",
		head=gear.telchine_head_Duration, neck="Incanter's Torque", lear="Andoaa Earring", rear="Mimir Earring",
		-- lring="Stikini Ring +1", rring="Stikini Ring +1",
		body="Peda. Gown +3", hands="Arbatel Bracers +3", 
		-- 
		back="Fi Follet Cape +1",  waist="Embla Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}

	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {back=gear.FC_jse_back})
	
    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {ammo="Pemphredo Tathlum",
		main="Musa", sub="Kaja Grip",
		head="Arbatel Bonnet +3", 
		body=gear.telchine_body_Duration, hands="Arbatel Bracers +3", lring="Mephitas's Ring +1",
		back=gear.FC_jse_back,waist="Embla Sash",legs=gear.telchine_legs_Duration,feet=gear.telchine_feet_Duration})

	sets.midcast.Regen.Duration = set_combine(sets.midcast['Enhancing Magic'], {ammo="Pemphredo Tathlum",
		main="Musa", sub="Kaja Grip",
		head=gear.telchine_head_Duration, 
		body=gear.telchine_body_Duration, hands="Arbatel Bracers +3", lring="Mephitas's Ring +1",
		back=gear.FC_jse_back, waist="Embla Sash", legs=gear.telchine_legs_Duration,feet=gear.telchine_feet_Duration})
	
	sets.midcast.Regen.Potency = set_combine(sets.midcast['Enhancing Magic'], {ammo="Pemphredo Tathlum",
		main="Musa", sub="Kaja Grip",
		head="Arbatel Bonnet +3", 
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Regen, lring="Mephitas's Ring +1",
		back=gear.FC_jse_back, waist="Embla Sash", legs=gear.telchine_legs_Regen,feet=gear.telchine_feet_Regen})

	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring", waist="Siegel Sash", legs="Shedir Seraweels"})--  
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod", head="Amalric Coif +1", sub="Ammurapi Shield", waist="Emphatikos Rope",legs="Shedir Seraweels"}) -- hands="Regal Cuffs",
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
		main="Musa", sub="Kaja Grip", ammo="Clarus Stone",
		--  ammo="Savant's Treatise",
		-- lear="Mendi. Earring", rear="Magnetic Earring",
		head=gear.telchine_head_Duration, neck="Incantor's Torque", lear="Andoaa Earring", rear="Mimir Earring",
		--  lring="Stikini Ring +1"
		body="Peda. Gown +3", hands=gear.telchine_hands_Duration, rring="Mephitas's Ring +1",
		back="Fi Follet Cape +1", waist="Embla Sash", legs="Shedir Seraweels", feet=gear.telchine_feet_Duration})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers +3"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell

    -- Custom spell classes
	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
		main="Bunzi's Rod", sub="Ammurapi Shield", 
		head="Acad. Mortar. +3", neck="Argute Stole +2",  lear="Regal Earring", rear="Malignance Earring",
		body="Acad. Gown +3", hands="Kaykaus Cuffs +1", lring="Metamor. Ring +1", rring="Stikini Ring +1",
		-- back="Aurist's Cape +1", Obsin. Sash Arbatel Pants +3
		back=gear.Macc_jse_back, waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Acad. Loafers +3"}
	
	sets.midcast['Enfeebling Magic'].Resistant = { ammo="Pemphredo Tathlum",
		main="Bunzi's Rod", sub="Ammurapi Shield",
		head="Acad. Mortar. +3", neck="Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		-- rring="Stikini Ring +1",
		body="Acad. Gown +3", hands="Kaykaus Cuffs +1", lring="Metamor. Ring +1", ring2="Mallquis Ring",
		-- back="Aurist's Cape +1", Obsin. Sash Arbatel Pants +3
		back=gear.Macc_jse_back, waist="Acuity Belt +1", legs="Arbatel Pants +1", feet="Acad. Loafers +3"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {main="Musa", sub="Kaja Grip", ammo="Pemphredo Tathlum",
		head="Acad. Mortar. +3", neck="Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		body="Acad. Gown +3", hands="Amalric Gages +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Witful Belt", legs="Acad. Pants +3", feet="Peda. Loafers +3"}

	-- 300 INT
    sets.midcast.Kaustra = {main="Bunzi's Rod", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Pixie Hairpin +1 
		head="Peda. M.Board +3", neck="Argue Stole +2", lear="Regal Earring", rear="Malignance Earring",
		--   Freke Ring 
		body="Agwu's Robe", hands="Amalric Gages +1", lring="Shiva Ring", rring="Archon Ring",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Amalric Slops +1", feet="Agwu's Pigaches"}
		
    sets.midcast.Kaustra.Resistant = {main="Bunzi's Rod", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Pixie Hairpin +1 
		head="Peda. M.Board +3", neck="Argue Stole +2", lear="Regal Earring", rear="Malignance Earring",
		--   Freke Ring 
		body="Agwu's Robe", hands="Amalric Gages +1", lring="Shiva Ring", rring="Archon Ring",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Amalric Slops +1", feet="Agwu's Pigaches"}

    sets.midcast.Drain = {main="Bunzi's Rod", sub="Ammurapi Shield", ammo="Pemphredo Tahtlum",
		-- main="Rubicundity",
		-- Pixie Hairpin +1 lear="Hirudinea Earring", rear="Mani Earring",
		head="Peda. M.Board +3", neck="Erra Pendant", lear="Enchntr. Earring +1",
		-- gear.merlinic_aspir_body
		body="Acad. Gown +3", hands=gear.merlinic_aspir_hands, lring="Evanescence Ring", rring="Archon Ring",
		back=gear.Macc_jse_back, waist="Fucho-no-Obi", legs="Peda. Pants +3", feet="Agwu's Pigaches"}
		
    sets.midcast.Drain.Resistant = {main="Bunzi's Rod", sub="Ammurapi Shield", ammo="Pemphredo Tahtlum",
		-- main="Rubicundity",
		-- Pixie Hairpin +1 lear="Hirudinea Earring", rear="Mani Earring",
		head=gear.merlinic_fc_head, neck="Erra Pendant", lear="Enchntr. Earring +1",
		-- gear.merlinic_aspir_body 
		body="Acad. Gown +3", hands=gear.merlinic_aspir_hands, lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.Macc_jse_back, waist="Fucho-no-Obi", legs="Peda. Pants +3", feet="Agwu's Pigaches"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {main="Musa", sub="Kaja Grip", ammo="Pemphredo Tathlum",
		head="Acad. Mortar. +3", neck="Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		body="Acad. Gown +3", hands="Acad. Bracers +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.Macc_jse_back, waist="Witful Belt", legs="Acad. Pants +3", feet="Peda. Loafers +3"}

    sets.midcast.Stun.Resistant = {main="Musa", sub="Kaja Grip", ammo="Pemphredo Tathlum", 
		head=merlinic_fc_head, neck="Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		body="Acad. Gown +3", hands="Acad. Bracers +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.Macc_jse_back, waist="Witful Belt", legs="Acad. Pants +3", feet="Peda. Loafers +3"}

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {main="Bunzi's Rod", sub="Ammurapi Shield", ammo="Pemphredo Tahtlum",
		-- ammo="Ghastly Tathlum +1",
		head="Agwu's Cap", neck="Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		--   Freke Ring 
		body="Agwu's Robe", hands="Agwu's Gages", lring="Shiva Ring", rring="Metamor. Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Agwu's Slops", feet="Agwu's Pigaches"}

    sets.midcast['Elemental Magic'].Resistant = {main="Bunzi's Rod", sub="Ammurapi Shield", ammo="Pemphredo Tahtlum",
		-- ammo="Ghastly Tathlum +1",
		head="Agwu's Cap", neck="Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		--   Freke Ring 
		body="Agwu's Robe", hands="Agwu's Gages", lring="Shiva Ring", rring="Metamor. Ring +1",
		-- Arbatel Pants +3
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Agwu's Slops", feet="Arbatel Loafers +3"}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Bunzi's Rod", sub="Ammurapi Shield", ammo="Pemphredo Tahtlum",
		-- ammo="Ghastly Tathlum +1",
		head="Peda. M.Board +3", neck="Saevus Pendant +1", lear="Regal Earring", rear="Malignance Earring",
		-- Freke Ring 
		body="Shamash Robe", hands="Peda. Bracers +3", lring="Shiva Ring", rring="Metamor. Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Amalric Slops +1", feet="Peda. Loafers +3"}
		
    sets.midcast['Elemental Magic'].Proc = {main="Maxentius", sub="Ammurapi Shield", ammo="Pemphredo Tahtlum",
		--  ammo="Ghastly Tathlum +1",
		--
		head="Acad. Mortar +3", neck="Saevus Pendant +1", lear="Regal Earring", rear="Malignance Earring",
		body="Shamash Robe", hands="Acad. Bracers +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Acad. Loafers +3"}
		
    sets.midcast['Elemental Magic'].OccultAcumen = set_combine(sets.midcast['Elemental Magic'],{
		main="Musa", sub="Bloodrain Strap",
		--main="Khatvanga",  ammo="Seraphic Ampulla",
		--  Crep. Earring Dedition Earring
		head="Mall. Chapeau +2", neck="Combatant's Torque", ear1="Dedition Earring", ear2="Telos Earring",
        -- body=gear.merlinic_body_occult,  hands=gear.merlinic_hands_Occult,
		body=gear.helios_body_occult, hands=gear.helios_hands_Occult, ring1="Rajas Ring",ring2="Petrov Ring",
		--waist="Oneiros Rope 
        back=gear.nuke_jse_back, legs="Perdition Slops", feet=gear.helios_feet_occult})
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {ammo="Pemphredo Tahtlum", -- ammo="Ghastly Tathlum +1",
		main="Bunzi's Rod", sub="Ammurapi Shield",   
		head="Agwu's Cap", neck="Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		--   Freke Ring 
		body="Agwu's Doublet", hands="Agwu's Gages", lring="Shiva Ring", rring="Metamor. Ring +1",
		-- 
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Agwu's Slops", feet="Agwu's Nails"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {ammo="Pemphredo Tahtlum", --  ammo="Ghastly Tathlum +1",
		main="Bunzi's Rod", sub="Ammurapi Shield", 
		head="Agwu's Cap", neck=" Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		--   Freke Ring 
		body="Arbatel Gown +2", hands="Arbatel Bracers +3", lring="Shiva Ring", rring="Metamor. Ring +1",
		-- Arbatel Pants +3
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Agwu's Slops", feet=" Arbatel Loafers +3"})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {ammo="Pemphredo Tathlum", --  ammo="Ghastly Tathlum +1",
		 main="Bunzi's Rod", sub="Ammurapi Shield", 
		head="Agwu's Cap", neck="Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		--  Freke Ring 
		body="Arbatel Gown +2", hands="Arbatel Bracers +3", lring="Shiva Ring", rring="Metamor. Ring +1",
		-- Arbatel Pants +3 Arbatel Loafers +3
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Amalric Slops +1", feet="Amalric Nails +1"})

	sets.midcast.Helix = {main="Bunzi's Rod", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		--ammo="Ghastly Tathlum +1",
		head="Agwu's Cap", neck="Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		--  Freke Ring
		body="Agwu's Robe", hands="Amalric Gages +1", lring="Mallquis Ring", rring="Metamor. Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1",  legs="Agwu's Slops", feet="Amalric Nails +1"}
		
	sets.midcast.Helix.Resistant = {main="Bunzi's Rod", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- ammo="Ghastly Tathlum +1",
		head="Agwu's Cap", neck="Argute Stole +2", lear="Regal Earring", rear="Malignance Earring",
		--  lring="Freke Ring"
		body="Agwu's Robe", hands="Amalric Gages +1", lring="Mallquis Ring", rring="Metamor. Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Agwu's Slops", feet="Amalric Nails +1"}
		
	sets.midcast.Helix.Burst = {main="Maxentius", sub="Thuellaic Ecu +1", ammo="Ghastly Tathlum +1",
		-- main="Bunzi's Rod", sub="Ammurapi Shield", 
		-- head="Agwu's Cap", neck="Argute Stole +2", lear="Arbatel Earring +2", rear="Malignance Earring",
		head="Peda. M.Board +3", neck="Saevus Pendant +1", lear="Novio Earring", rear="Friomisi Earring",
		-- body="Agwu's Robe", Agwu's Gages
		body="Shamash Robe", hands="Amalric Gages +1",  lring="Mujin Ring", rring="Mallquis Ring",
		-- legs="Agwu's Slops", feet="Arbatel Loafers +3"
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Amalric Slops +1", feet="Amalric Nails +1"}
		
	sets.midcast.Helix.Proc = {main=empty, sub=empty,
		head="Peda. M.Board +3", neck="Saevus Pendant +1", lear="Regal Earring", rear="Malignance Earring",
		-- Freke Ring 
		body="Shamash Robe", hands="Peda. Bracers +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Amalric Slops +1", feet="Peda. Loafers +3"}

	sets.midcast.Impact = {main="Bunzi's Rod", sub="Ammurapi Shield", ammo="Pemphredo Tathlum", 
		-- main="Contemplator +1", sub="Kaja Grip", ammo="Ghastly Tahtlum +1",
		head=empty, neck="Saevus Pendant +1", lear="Regal Earring", rear="Malignance Earring",
		-- lring="Freke Ring"
		body="Twilight Cloak", hands="Peda. Bracers +3", ring2="Metamor. Ring +1",
		back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Amalric Slops +1", feet="Jhakri Pigaches +2"}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
		
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {main="Boonwell Staff", sub="Kaja Grip", ammo="Homiliary", --sub="Oneiros Grip",
		head="Befouled Crown", neck="Loricate Torque +1",  ear1="Ethereal Earring", ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands, ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		body="Shamash Robe", hands=gear.chironic_refresh_hands, ring1="Gelatinous Ring +1", ring2="Defending Ring",
		-- feet=gear.merlinic_refresh_feet
		back="Felicitas Cape +1", waist="Shinjustu-no-Obi +1",legs="Assid. Pants +1",feet="Peda. Loafers +3"}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {main="Malignance Pole", sub="Kaja Grip", ammo="Staunch Tathlum",
		-- ear1="Savant's Earring", 
        head="Nyame Helm", neck="Warder's Charm +1", ear1="Ethereal Earring", ear2="Etiolation Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Gelatinous Ring +1", ring2="Defending Ring",
        back="Moonbeam Cape", waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}
		
	sets.idle.Refresh = {main="Malignance Pole", sub="Kaja Grip", ammo="Homiliary",
		-- main="Mpaca's Staff",
        head="Nyame Helm", neck="Warden's Charm +1", ear1="Heartly Earring", ear2="Etiolation Earring",
		--   ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        body="Arbatel Gown +2", hands="Nyame Gauntlets", ring1="Gelatinous Ring +1", ring2="Defending Ring",
		-- waist="Flax Sash", 
        back=gear.FC_jse_back, waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}	

    sets.idle.PDT = {main="Malignance Pole", sub="Kaja Grip", ammo="Staunch Tathlum",
        head="Nyame Helm", neck="Warder's Charm +1", ear1="Lugalbanda Earring", ear2="Etiolation Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Gelatinous Ring +1", ring2="Defending Ring",
        back="Moonbeam Cape", waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}
		
	sets.idle.MEVA = {main="Malignance Pole", sub="Kaja Grip", ammo="Staunch Tathlum",
		head="Arbatel Bonnet +3", neck="Warder's Charm +1", ear1="Lugalbanda Earring", ear2="Etiolation Earring",
        body="Arbatel Gown +2",  hands="Arbatel Bracers +3", ring1="Purity Ring", ring2="Shadow Ring",
		-- Arbatel Pants +3 
        back="Moonbeam Cape", waist="Carrier's Sash", legs="Nyame Flanchard", feet="Arbatel Loafers +3"}
			
	sets.idle.Hippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

    sets.idle.Weak = {main="Malignance Pole", sub="Kaja Grip", ammo="Staunch Tathlum",
        head="Nyame Helm", neck="Warder's Charm +1", ear1="Lugalbanda Earring", ear2="Etiolation Earring",
        body="Nyame Mail", hands="Nyame Gauntlets", ring1="Gelatinous Ring +1", ring2="Defending Ring",
        back="Moonbeam Cape", waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    -- Defense sets
    sets.defense.PDT = {main="Malignance Pole", sub="Kaja Grip", ammo="Staunch Tathlum",
        head="Nyame Helm", neck="Warder's Charm +1", ear1="Lugalbanda Earring",  ear2="Etiolation Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Gelatinous Ring +1", ring2="Defending Ring",
        back="Moonbeam Cape", waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    sets.defense.MDT = {main="Malignance Pole", sub="Kaja Grip", ammo="Staunch Tathlum",
        head="Nyame Helm", neck="Warder's Charm +1", ear1="Lugalbanda Earring",  ear2="Etiolation Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Gelatinous Ring +1", ring2="Defending Ring",
        back="Moonbeam Cape", waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}
		
    sets.defense.MEVA = {main="Malignance Pole", sub="Kaja Grip", ammo="Staunch Tathlum",
        head="Nyame Helm", neck="Warder's Charm +1", ear1="Lugalbanda Earring",  ear2="Etiolation Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Gelatinous Ring +1", ring2="Defending Ring",
        back="Moonbeam Cape", waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}
		
    sets.Kiting = {lring="Shneddick Ring"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Gonzuki Mezuki", sub="Kaja Grip", -- ammo="Amar Cluster", Oshasha's Treatise
		--  lear="Crepuscular Earring", 
        head="Nyame Helm", neck="Lissome Necklace", ear1="Brutal Earring", rear="Telos Earring",
        -- Chirich Ring +1 Chirich Ring +1
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Rajas Ring", ring2="Petrov Ring",
		-- waist="Grunfeld Rope",  
        back=gear.TP_jse_back, waist="Cetl Belt", legs="Nyame Flanchard",  feet="Nyame Sollerets"}
	
	sets.engaged.DW = {main="Gonzuki Mezuki", sub="Kaja Grip", -- ammo="Amar Cluster", Oshasha's Treatise
		--  lear="Crepuscular Earring", 
        head="Nyame Helm", neck="Lissome Necklace", ear1="Brutal Earring", rear="Telos Earring",
        -- Chirich Ring +1 Chirich Ring +1
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Rajas Ring", ring2="Petrov Ring",
		-- waist="Grunfeld Rope",  
        back=gear.TP_jse_back, waist="Cetl Belt", legs="Nyame Flanchard",  feet="Nyame Sollerets"}
	
	sets.engaged.PDT = {mmain="Gonzuki Mezuki", sub="Kaja Grip", -- ammo="Amar Cluster", Oshasha's Treatise
		--  lear="Crepuscular Earring", 
        head="Nyame Helm", neck="Lissome Necklace", ear1="Brutal Earring", rear="Telos Earring",
        -- Chirich Ring +1 Chirich Ring +1
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Rajas Ring", ring2="Petrov Ring",
		-- waist="Grunfeld Rope",  
        back=gear.TP_jse_back, waist="Cetl Belt", legs="Nyame Flanchard",  feet="Nyame Sollerets"}

	sets.engaged.PDT.DW = {main="Gonzuki Mezuki", sub="Kaja Grip", -- ammo="Amar Cluster", Oshasha's Treatise
		--  lear="Crepuscular Earring", 
        head="Nyame Helm", neck="Lissome Necklace", ear1="Brutal Earring", rear="Telos Earring",
        -- Chirich Ring +1 Chirich Ring +1
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Rajas Ring", ring2="Petrov Ring",
		-- waist="Grunfeld Rope",  
        back=gear.TP_jse_back, waist="Cetl Belt", legs="Nyame Flanchard",  feet="Nyame Sollerets"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +3"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +3"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +3"}
    sets.buff['Immanence'] = {head="Nyame Helm", neck="Warden's Charm +1",
		body="Nyame Mail", hands="Arbatel Bracers +3"}
	sets.buff['Immanence'].SubtleBlow = {--main="Aern Staff", sub="Furtive Grip", ammo="Tengu-no-Hane",
		-- neck="Bathy Choker +1", lear="Digni. Earring", rear="Evergreen Earring",
		-- lring="Chirich Ring +1", rring="Chirich Ring +1",
		-- waist="Ninurta's Sash"
	}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +3"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +3"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +3"}
	
	sets.HPDown = {
		--head="Pixie Hairpin +1", 
		head=empty, neck="Loricate Torque +1", lear="Odnowa Earring", rear="Odnowa Earring +1",
		--hands="Hieros Mittens", 
		body=empty,	hands=empty, ring1="Mephitas's Ring +1", ring2="Mephitas's Ring",		
		back=gear.FC_jse_back, waist="", legs=empty, feet=empty}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {legs="Acad. Pants +3"}
	sets.buff['Dark Arts'] = {body="Acad. Gown +3"} 

    sets.buff.FullSublimation = {body="Shamash Robe",  waist="Carrier's Sash"}
    sets.buff.PDTSublimation = {body="Shamash Robe", waist="Carrier's Sash"} 
	
	-- Weapons sets
	sets.weapons.Default = {main="Malignance Pole",sub="Niobid Strap"}
	sets.weapons.DualClub = {main="Maxentius", sub="Kaja Rod"}
	sets.weapons.Akademos = {main="Akademos",sub="Niobid Strap"}
	sets.weapons.Staff = {main="Gonzuki Mezuki", sub="Kaja Grip"}
	sets.weapons.AeolianEdge = {main="Malevolence", sub="Ammurapi Shield"}
	sets.weapons.Khatvanga = {}--main="Khatvanga",sub="Bloodrain Strap"
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(5, 9)
	elseif player.sub_job == 'BLM' then
		set_macro_page(3, 9)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 9)
	else
		set_macro_page(1, 9)
	end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 009')
end

function user_job_self_command(commandArgs, eventArgs)
	
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Reraise',	Buff='Reraise',		SpellID=113,	When='Always'},
		{Name='Haste',		Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	When='Always'},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		When='Always'},
		{Name='Klimaform',	Buff='Klimaform',	SpellID=287,	When='Combat'},
	},
	
	Default = {
		{Name='Reraise',	Buff='Reraise',		SpellID=113,	Reapply=false},
		{Name='Haste',		Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Klimaform',	Buff='Klimaform',	SpellID=287,	Reapply=false},
		{Name='Blink',		Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen',		Buff='Regen',		SpellID=108,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',		SpellID=106,	Reapply=false},
	}
}

--[[
        Custom commands:

        Shorthand versions for each stratagem type that uses the version appropriate for
        the current Arts.

                                        Light Arts              Dark Arts

        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar power              Rapture                 Ebullience
        gs c scholar duration           Perpetuance
        gs c scholar accuracy           Altruism                Focalization
        gs c scholar enmity             Tranquility             Equanimity
        gs c scholar skillchain                                 Immanence
        gs c scholar addendum           Addendum: White         Addendum: Black
--]]

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
	
	LowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
		'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
		'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga'}

	info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
		"Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

	state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
	state.Buff['Enlightenment'] = buffactive['Enlightenment'] or false
	state.Buff['Focalization'] = buffactive['Focalization'] or false
	
	update_active_stratagems()
	
	autows = 'Realmrazer'
	autofood = 'Pear Crepe'
	
	data.skillchains.scholar = {}
	data.skillchains.scholar['1'] = {
		['Fire'] = 		{['skillchain'] = 'Liquefaction', 	['first_spell'] = 'Stone',		['second_spell'] = 'Pyrohelix',		['burst_elements'] = '{Fire}'},
		['Wind'] = 		{['skillchain'] = 'Detonation', 	['first_spell'] = 'Stone',		['second_spell'] = 'Anemohelix',	['burst_elements'] = '{Wind}'},
		['Lightning'] = {['skillchain'] = 'Impaction', 		['first_spell'] = 'Water',		['second_spell'] = 'Ionohelix',		['burst_elements'] = '{Lightning}'},
		['Light'] = 	{['skillchain'] = 'Transfixion', 	['first_spell'] = 'Noctohelix',	['second_spell'] = 'Luminohelix',	['burst_elements'] = '{Light}'},
		['Earth'] = 	{['skillchain'] = 'Scission', 		['first_spell'] = 'Fire',		['second_spell'] = 'Geohelix',		['burst_elements'] = '{Earth}'},
		['Ice'] = 		{['skillchain'] = 'Induration', 	['first_spell'] = 'Water',		['second_spell'] = 'Cryohelix',		['burst_elements'] = '{Ice}'},
		['Water'] = 	{['skillchain'] = 'Reverberation', 	['first_spell'] = 'Stone',		['second_spell'] = 'Hydrohelix',	['burst_elements'] = '{Water}'},
		['Dark'] = 		{['skillchain'] = 'Compression', 	['first_spell'] = 'Blizzard',	['second_spell'] = 'Noctohelix',	['burst_elements'] = '{Dark}'},
	}
	data.skillchains.scholar['2'] = {
		['Fire'] = 		{['skillchain'] = 'Fusion', 		['first_spell'] = 'Fire',		['second_spell'] = 'Ionohelix',		['burst_elements'] = '{Fire}, {Light}'},
		['Light'] = 	{['skillchain'] = 'Fusion', 		['first_spell'] = 'Fire',		['second_spell'] = 'Ionohelix',		['burst_elements'] = '{Fire}, {Light}'},
		['Wind'] = 		{['skillchain'] = 'Fragmentation', 	['first_spell'] = 'Blizzard',	['second_spell'] = 'Hydrohelix',	['burst_elements'] = '{Wind}, {Lightning}'},
		['Lightning'] = {['skillchain'] = 'Fragmentation', 	['first_spell'] = 'Blizzard',	['second_spell'] = 'Hydrohelix',	['burst_elements'] = '{Wind}, {Lightning}'},
		['Earth'] = 	{['skillchain'] = 'Gravitation', 	['first_spell'] = 'Aero',		['second_spell'] = 'Noctohelix',	['burst_elements'] = '{Earth}, {Dark}'},
		['Dark'] = 		{['skillchain'] = 'Gravitation', 	['first_spell'] = 'Aero',		['second_spell'] = 'Noctohelix',	['burst_elements'] = '{Earth}, {Dark}'},
		['Ice'] = 		{['skillchain'] = 'Distortion', 	['first_spell'] = 'Luminohelix',['second_spell'] = 'Geohelix',		['burst_elements'] = '{Ice}, {Water}'},
		['Water'] = 	{['skillchain'] = 'Distortion', 	['first_spell'] = 'Luminohelix',['second_spell'] = 'Geohelix',		['burst_elements'] = '{Ice}, {Water}'},
	}
	data.skillchains.scholar['ws'] = {
		['Fire'] = 		{['skillchain'] = 'Liquefaction',	['weaponskill'] = 'Rock Crusher',	['second_spell'] = 'Pyrohelix',		['burst_elements'] = '{Fire}'},
		['Wind'] = 		{['skillchain'] = 'Detonation', 	['weaponskill'] = 'Rock Crusher',	['second_spell'] = 'Anemohelix',	['burst_elements'] = '{Wind}'},
		['Lightning'] = {['skillchain'] = 'Impaction', 		['weaponskill'] = 'Starburst',		['second_spell'] = 'Ionohelix',		['burst_elements'] = '{Lightning}'},
		['Light'] = 	{['skillchain'] = 'Transfixion', 	['weaponskill'] = 'Starburst',		['second_spell'] = 'Luminohelix',	['burst_elements'] = '{Light}'},
		['Earth'] = 	{['skillchain'] = 'Scission', 		['weaponskill'] = 'Shell Crusher',	['second_spell'] = 'Geohelix',		['burst_elements'] = '{Earth}'},
		['Ice'] = 		{['skillchain'] = 'Induration', 	['weaponskill'] = 'Starburst',		['second_spell'] = 'Cryohelix',		['burst_elements'] = '{Ice}'},
		['Water'] = 	{['skillchain'] = 'Reverberation', 	['weaponskill'] = 'Omniscience',	['second_spell'] = 'Hydrohelix',	['burst_elements'] = '{Water}'},
		['Dark'] = 		{['skillchain'] = 'Compression', 	['weaponskill'] = 'Omniscience',	['second_spell'] = 'Noctohelix',	['burst_elements'] = '{Dark}'},
	}
	init_job_states({"Capacity","AutoFoodMode","AutoTrustMode","AutoWSMode","AutoNukeMode","AutoShadowMode","AutoStunMode","AutoDefenseMode"},{"AutoBuffMode","AutoRuneMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","RecoverMode","ElementalMode","CastingMode","TreasureMode",})
end

autows_list = {
		['None']='Myrkr',
		['Default']='Myrkr',
		['DualClub']='Black Halo',		
		['Akademos']='Myrkr',
		['Staff']='Myrkr',
		['AeolianEdge']='Aeolian Edge',		
		['Khatvanga']='Cataclysm',
		}