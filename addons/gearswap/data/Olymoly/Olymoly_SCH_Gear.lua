-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None','Akademos','Club') -- 'Khatvanga'

	gear.nuke_jse_back = 	{	name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	gear.FC_jse_back = 		{	name="Lugh's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back = 	{	name="Lugh's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}}
	-- 20 DEX, 30 ACC 20 ATK, 10 STP, 10% PDT
	gear.TP_jse_back = 		{	name="Lugh's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}}
	--30 INT, 20 MACC/MDMG, 10% WSD, 10% PDT
	gear.WS_jse_back =		{	name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	
	
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
	
	send_command('alias imp input /ja "Penury" <me>;wait 1;input /ma "Impact" <stnpc>')
	   
	-- Embrava
	send_command('alias emb input /ja "Light Arts" <me>;wait 1.5;input /ja "Tabula Rasa" <me>;wait 2;input /ja "Perpetuance" <me>;wait 2;input /ja "Accession" <me>;wait 3;input /ma "Embrava" <stpc>;wait 4;input /ja "Accession" <me>;wait 3;input /ma "Regen V" <stpc>')
	-- Kaustra
	send_command('alias kau gs c set elementalmode earth;wait 1;input /ja "Tabula Rasa" <me>;wait 1;input /ja "Dark Arts" <me>;wait 1;input /ja "Addendum: Black" <me>;wait 2.5;gs c elemental skillchain2;wait 15;input /ja "Focalization" <me>;wait 1;input /ja "Ebullience" <me>;wait 2.5;input /ma "Kaustra" <t>')
	-- Pro/shell
	send_command('alias pro input /ma "Accession" <me>;wait 1;input /ma "Shell V" <me>;wait 5;input /ma "Accession" <me>;wait 1;input /ma "Protect V" <me>;')
	
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

    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +3"}
	sets.precast.JA['Enlightenment'] = {body="Peda. Gown +3"}

    -- Fast cast sets for spells

    sets.precast.FC = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Incantor Stone",
        head="Amalric Coif +1",neck="Orunmila's Torque", ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Zendik Robe", hands="Acad. Bracers +3",ring1="Kishar Ring",ring2="Lebeche Ring",
		-- Pinga Pants +1
        back="Fi Follet Cape +1",waist="Embla Sash",legs="Volte Brais",feet=gear.merlinic_fc_feet}
	
	-- Grimoire
	sets.precast.FC.Arts = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Incantor Stone",
		-- Musa 
        head="Peda. M.Board +3",neck="Orunmila's Torque", ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		-- Pinga Robe +1 
		body="Zendik Robe", hands="Acad. Bracers +3",ring1="Kishar Ring",ring2="Lebeche Ring",
        -- Pinga Pants +1 
		back="Fi Follet Cape +1",waist="Embla Sash",legs="Volte Brais",feet="Acad. Loafers +2"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear1="Barkaro. Earring"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Annoint. Kalasiris"})-- main="Serenity",sub="Clerisy Strap +1"

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Crepuscular Cloak"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {ammo="Psilomene",
		-- Dualism Collar +1 lear="Nehalennia Earring", rear="
		head="Amalric Coif +1",neck="Sanctity Necklace", ear1="Evans Earring",ear2="Moonshade Earring",
		-- Otomi Gloves
		body="Acad. Gown +2", hands="Regal Cuffs", ring1="Mephitas's Ring +1", ring2="Mephitas's Ring",
		--
		back="Fi Follet Cape +1",waist="Shinjutsu-no-Obi +1",legs="Amalric Slops +1",feet="Psycloth Boots"}

    -- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
		neck="Mizu. Kubikazari",
		hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring",
		feet="Jhakri Pigaches +2"}
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1", ring2="Archon Ring"}

    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Sapience Orb",
		head="Amalric Coif +1",neck="Orunmila's Torque",ear1="Enchntr. Earring +1", ear2="Malignance Earring",
		body="Zendik Robe", hands="Acad. Bracers +3",ring1="Kishar Ring",ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Volte Brais",feet="Amalric Nails +1"}
	
	-- Cure	Sets
    sets.midcast.Cure = {main="Chatoyant Staff", sub="Khonsu", ammo="Pemphredo Tahtlum",
        head="Kaykaus Mitra +1", neck="Orunmila Torque", ear1="Mendi. Earring", ear2="Calamitous Earring",
		body="Kaykaus Bliaut +1",hands="Kaykaus Mitts +1",ring1="Defending Ring",ring2="Mephitas Ring +1",
        back="Fi Follet Cape +1",waist="Shinjutsu-no-Obi +1",legs="Kaykaus Tights +1",feet="Kaykaus Boots +1"}

    sets.midcast.LightWeatherCure = {main="Chatoyant Staff", sub="Khonsu", ammo="Pemphredo Tahtlum",
        head="Kaykaus Mitra +1", neck="Orunmila Torque", ear1="Mendi. Earring", ear2="Calamitous Earring",
		body="Kaykaus Bliaut +1",hands="Kaykaus Mitts +1",ring1="Defending Ring",ring2="Mephitas Ring +1",
        back="Fi Follet Cape +1",waist="Hachirin-no-Obi",legs="Kaykaus Tights +1",feet="Kaykaus Boots +1"}
		
    sets.midcast.LightDayCure = {main="Chatoyant Staff", sub="Khonsu", ammo="Pemphredo Tahtlum",
        head="Kaykaus Mitra +1", neck="Orunmila Torque", ear1="Mendi. Earring", ear2="Calamitous Earring",
		body="Kaykaus Bliaut +1",hands="Kaykaus Mitts +1",ring1="Defending Ring",ring2="Mephitas Ring +1",
        back="Fi Follet Cape +1",waist="Hachirin-no-Obi",legs="Kaykaus Tights +1",feet="Kaykaus Boots +1"}

	 sets.midcast.Cure.DT = {main="Chatoyant Staff", sub="Khonsu", ammo="Staunch Tathlum +1",
        head="Kaykaus Mitra +1",neck="Loricate Torque +1",ear1="Mendi. Earring", ear2="Calamitous Earring",
        -- Arbatel Gown +2 Nyame Gauntlets
		body="Kaykaus Bliaut +1",hands="Kaykaus Mitts +1",ring1="Defending Ring",ring2="Mephitas Ring +1",
        back="Fi Follet Cape +1",waist="Shinjutsu-no-Obi +1",legs="Acad. Pants +3",feet="Kaykaus Boots +1"}

    sets.midcast.LightWeatherCure.DT = {main="Chatoyant Staff", sub="Khonsu", ammo="Staunch Tathlum +1",
        head="Kaykaus Mitra +1",neck="Loricate Torque +1",ear1="Mendi. Earring", ear2="Calamitous Earring",
        -- Arbatel Gown +3 Nyame Gauntlets
		body="",hands="Kaykaus Mitts +1",ring1="Defending Ring",ring2="Mephitas Ring +1",
        back="Fi Follet Cape +1",waist="Hachirin-no-Obi",legs="Acad. Pants +3",feet="Kaykaus Boots +1"}
		
    sets.midcast.LightDayCure.DT = {main="Chatoyant Staff", sub="Khonsu", ammo="Staunch Tathlum +1",
        head="Kaykaus Mitra +1",neck="Loricate Torque +1",ear1="Mendi. Earring", ear2="Calamitous Earring",
        -- Arbatel Gown +3 Nyame Gauntlets
		body="Kaykaus Bliaut +1",hands="Kaykaus Mitts +1",ring1="Defending Ring",ring2="Mephitas Ring +1",
		-- 
        back="Fi Follet Cape +1",waist="Hachirin-no-Obi",legs="Acad. Pants +3",feet="Kaykaus Boots +1"}

    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.Curaga.DT = sets.midcast.Cure.DT

	sets.Self_Healing = {neck="Phalaina Locket", ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}  
	sets.Cure_Received = {neck="Phalaina Locket", ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"} --feet="Inspirited Boots"
	
	sets.midcast.Cursna = {main=gear.grioavolr_fc_staff,ammo="Sapience Orb",
		--main="Gada", sub="Clemency Grip",
		--neck="Debilis Medallion", rring2="Meili Earring"
		head="Kaykaus Mitra +1", ear1="Beatific Earring",ear2="Andoaa Earring",
		-- ring1="Haoma's Ring",
		body="Peda. Gown +3", hands="Hieros Mittens",ring1="Sirona's Ring", ring2="Menelaus's Ring",
		-- Oretan. Cape +1 
		back=gear.FC_jse_back,waist="Bishop's Sash",legs="Acad. Pants +3",feet="Vanya Clogs"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,})--sub="Clemency Grip"

	-- 500 Skill
	-- Current 416  Light Arts 486
	-- Job Gifts 36 skillnn
	sets.midcast['Enhancing Magic'] = {main="Oranyan", sub="Fulcio Grip", ammo="Savant's Treatise",
		--main="Musa", sub="Fulcio Grip",
		--head=gear.telchine_head_Duration, ear2="Mimir Earring"
		head="Arbatel Bonnet +1", neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Augment. Earring",
		-- Arbatel Bracers +3
		body="Peda. Gown +3",hands="Arbatel Bracers +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Fi Follet Cape +1",waist="Embla Sash",legs=gear.telchine_legs_Duration,feet=gear.telchine_feet_Duration}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub="Ammurapi Shield", ammo="Pemphredo Tahtlum",
		--main="Musa",
		head="Arbatel Bonnet +1", neck="Reti Pendant", lear="Gifted Earring",rear="Calamitous Earring",
		body=gear.telchine_body_Duration,hands="Arbatel Bracers +1", rring="Mephitas's Ring +1",
		back="Lugh's Cape",waist="Embla Sash",legs=gear.telchine_legs_Duration,feet=gear.telchine_feet_Duration})
	
	sets.midcast.Regen.Duration = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub="Ammurapi Shield", ammo="Pemphredo Tahtlum",
		--main="Musa",
		head=gear.telchine_head_Duration, neck="Reti Pendant", lear="Gifted Earring",rear="Calamitous Earring",
		body=gear.telchine_body_Duration,hands="Arbatel Bracers +1", rring="Mephitas's Ring +1",
		back="Lugh's Cape",waist="Embla Sash",legs=gear.telchine_legs_Duration,feet=gear.telchine_feet_Duration})

	sets.midcast.Regen.Potency = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub="Ammurapi Shield", ammo="Pemphredo Tahtlum",
		--main="Musa",
		head="Arbatel Bonnet +1", neck="Reti Pendant", lear="Gifted Earring",rear="Calamitous Earring",
		--body=gear.telchine_body_Regen,hands=gear.telchine_hands_Regen
		body=gear.telchine_body_Duration,hands="Arbatel Bracers +1", rring="Mephitas's Ring +1",
		-- gear.telchine_legs_Regen
		back="Bookworm's Cape",waist="Embla Sash",legs=gear.telchine_legs_Duration,feet=gear.telchine_feet_Regen})

	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'],{body=gear.merlinic_phalanx_body})
    
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",waist="Siegel Sash",ear2="Earthcry Earring",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Ammurapi Shield", head="Amalric Coif +1", hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {main="Oranyan", sub="Khonsu",ammo="Savant's Treatise",
		-- Musa
		head=gear.telchine_head_Duration,neck="Incanter's Torque", lear="Andoaa Earring", rear="Calamitous Earring",
		body="Peda. Gown +3", hands="Chironic Gloves", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Fi Follet Cape +1", waist="Embla Sash", legs="Shedir Seraweels",feet=gear.telchine_feet_Duration})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers +3"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell

    -- Custom spell classes
	sets.midcast['Enfeebling Magic'] = {main="Contemplator +1",sub="Khonsu",ammo="Pemphredo Tathlum",
		-- Bunzi's Rod Ammurapi Shield
		--  Argute Stole +2 
        head="Acad. M.Board +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Acad. Gown +2 ",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Stikini Ring +1",
		-- Obstin. Sash Arbatel Pants +3 
        back="Aurist's Cape +1",waist="Acuity Belt +1",legs=gear.chironic_macc_legs,feet="Acad. Loafers +2"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Contemplator +1",sub="Khonsu",ammo="Pemphredo Tathlum",
		-- Bunzi's Rod Ammurapi Shield
		--  Argute Stole +2 
        head="Acad. M.Board +2",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        -- 
		body="Acad. Gown +2 ",hands="Kaykaus Cuffs +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		-- Obstin. Sash Arbatel Pants +3 
        back="Aurist's Cape +1",waist="Acuity Belt +1",legs=gear.chironic_macc_legs,feet="Acad. Loafers +2"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {
		})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
		})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
		body="Cohort Cloak +1",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
		 waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
		body="Cohort Cloak +1", ring1="Stikini Ring +1"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {
		body="Cohort Cloak +1"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring +1"})

    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Malignance Earring",
        body="Amalric Doublet +1",hands="Volte Bracers",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		--
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs=gear.chironic_macc_legs,feet="Amalric Nails +1"}

	-- 300 INT
    sets.midcast.Kaustra = {main="Akademos", sub="Enki Strap", ammo="Pemphredo Tathlum",
		-- Bunzi's Rod Rank 15 Ammurapi Shield
		-- neck="Argute Stole +2",
        head="Pixie Hairpin +1",neck="Saevus Pendant +1", ear1="Regal Earring",ear2="Malignance Earring",
        -- Agwu's Robe Freke Ring 
		body="Volte Doublet",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Archon Ring",
		-- Agwu's Pigaches
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Amalric Slops +1",feet="Mallquis Clogs +2"}
		
    sets.midcast.Kaustra.Resistant = {main="Akademos", sub="Enki Strap", ammo="Pemphredo Tathlum",
		-- Bunzi's Rod Rank 15 Ammurapi Shield
		-- neck="Argute Stole +2",
        head="Pixie Hairpin +1",neck="Saevus Pendant +1", ear1="Regal Earring",ear2="Malignance Earring",
        -- Agwu's Robe Freke Ring 
		body="Volte Doublet",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Archon Ring",
		-- Agwu's Pigaches
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Amalric Slops +1",feet="Mallquis Clogs +2"}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Staunch Tathlum +1",
		-- Mani Earring
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Hirudinea Earring",ear2="Malignance Earring",
        -- gear.merlinic_aspir_body gear.merlinic_aspir_hands ring1="Evanescence Ring"
		--  gear.merlinic_aspir_hands
		body="Acad. Gown +2",hands="Volte Bracers",ring1="Stikini Ring +1",ring2="Archon Ring",
        -- Agwu's Pigaches
		back="Bookworm's Cape",waist="Fucho-no-obi",legs="Peda. Pants +3",feet=gear.merlinic_aspir_feet}
		
    sets.midcast.Drain.Resistant = {main="Rubicundity",sub="Ammurapi Shield",ammo="Staunch Tathlum +1",
		-- Mani Earring
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        -- gear.merlinic_aspir_body gear.merlinic_aspir_hands ring1="Evanescence Ring"
		-- Acad. Gown +3 Acad. Bracers +3 gear.merlinic_aspir_hands
		body="Amalric Doublet +1", hands="Volte Bracers", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        -- Agwu's Pigaches
		-- Acad. Loafers +3
		back="Bookworm's Cape", waist="Fucho-no-obi", legs="Peda. Pants +3", feet=gear.merlinic_aspir_feet}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {main="Oranyan", sub="Clerisy Strap +1", ammo="Sapience Orb",
		-- Musa
		-- gear.merlinic_fc_head
        head="Amalric Coif +1",neck="Orunmila's Torque",ear1="Enchntr. Earring +1", ear2="Malignance Earring",
		body="Acad. Gown +2",hands="Acad. Bracers +3",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		back=gear.nuke_jse_back, waist="Witful Belt", legs="Acad. Pants +3", feet="Acad. Loafers +2"}

    sets.midcast.Stun.Resistant = {main="Oranyan",sub="Khonsu", ammo="Pemphredo Tathlum",
		-- Musa
		-- gear.merlinic_fc_head Argute Stole +2
        head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring", ear2="Malignance Earring",
		body="Acad. Gown +2",hands="Acad. Bracers +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Acad. Pants +3",feet="Acad. Loafers +2"}

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {main="Akademos",sub="Enki Strap", ammo="Ghastly Tathlum +1",		
        -- Argute Stole +2
		head="Peda. M.Board +3",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
		-- Agwu's Robe Arbatel Gown +3 Agwu's Gages Arbatel Bracers +3 Freke Ring
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Metamor. Ring +1",
		-- Agwu's Slops Arbatel Pants +3 Arbatel Loafers +3
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Amalric Slops +1",feet="Amalric Nails +1"}

    sets.midcast['Elemental Magic'].Resistant = {main="Akademos",sub="Enki Strap", ammo="Ghastly Tathlum +1",		
        -- Argute Stole +2
		head="Peda. M.Board +3",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
		-- Agwu's Robe Arbatel Gown +3 Agwu's Gages Arbatel Bracers +3 Freke Ring
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Metamor. Ring +1",
		-- Agwu's Slops Arbatel Pants +3 Arbatel Loafers +3
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].Fodder = {main=gear.grioavolr_nuke_staff,sub="Niobid Strap", ammo="Pemphredo Tathlum",
		--main="Akademos",sub="Zuuxowu Grip", 
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Mephitas's Ring +1",ring2="Metamor. Ring +1",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].Proc = {main=empty, sub=empty,ammo="Impatiens",
        head="Volte Cap",neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
        body="Volte Jupon",hands="Volte Bracers",ring1="Kishar Ring",ring2="Prolix Ring",
        back=gear.FC_jse_back,waist="Witful Belt",legs="Volte Hose",feet="Volte Boots"}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {
		--main="Khatvanga",sub="Bloodrain Strap",ammo="Seraphic Ampulla",
		--neck="Combatant's Torque", rear="Crep. Earring"
		head="Mall. Chapeau +2", neck="Sanctity Necklace", ear1="Dedition Earring", ear2="Telos Earring",
		body="Amalric Doublet +1", hands=gear.merlinic_occult_hands, ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		-- waist="Oneiros Rope"
        back=gear.TP_jse_back, legs="Perdition Slops", feet=gear.merlinic_occult_feet}
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		-- Bunzi's Rod Ammurapi Shield
		main="Akademos",sub="Enki Strap", ammo="Ghastly Tathlum +1",		
        -- Argute Stole +2
		head="Peda. M.Board +3",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
		-- Agwu's Robe Arbatel Gown +3 Agwu's Gages Arbatel Bracers +3 Freke Ring
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Metamor. Ring +1",
		-- Agwu's Slops Arbatel Pants +3 Arbatel Loafers +3
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Amalric Slops +1",feet="Amalric Nails +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		-- Bunzi's Rod Ammurapi Shield
		main="Akademos",sub="Enki Strap", ammo="Ghastly Tathlum +1",		
        -- Argute Stole +2
		head="Peda. M.Board +3",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
		-- Agwu's Robe Arbatel Gown +3 Agwu's Gages Arbatel Bracers +3 Freke Ring
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Metamor. Ring +1",
		-- Agwu's Slops Arbatel Pants +3 Arbatel Loafers +3
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Amalric Slops +1",feet="Amalric Nails +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {
		-- Bunzi's Rod Ammurapi Shield
		main="Akademos",sub="Enki Strap", ammo="Ghastly Tathlum +1",		
        -- Argute Stole +2
		head="Peda. M.Board +3",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
		-- Agwu's Robe Arbatel Gown +3 Agwu's Gages Arbatel Bracers +3 Freke Ring
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Metamor. Ring +1",
		-- Agwu's Slops Arbatel Pants +3 Arbatel Loafers +3
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Amalric Slops +1",feet="Amalric Nails +1"})

	sets.midcast.Helix = {main="Maxentius", sub="Ammurapi Shield", ammo="Ghastly Tathlum +1",
        -- Bunzi's Rod Culminus Shield
		-- Agwu's Cap Argute Stole +2
		head="Peda. M.Board +3",neck="Saevus Pendant +1", ear1="Regal Earring",ear2="Malignance Earring",
		-- Agwu's Robe Freke Ring 
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Mallquis Ring",
		-- Skymir Cord +1 Agwu's Slops
        back="Bookworm's Cape", waist="Acuity Belt +1", legs="Amalric Slops +1",feet="Amalric Nails +1"}
	
	sets.midcast.Helix.Resistant = {main="Maxentius", sub="Ammurapi Shield", ammo="Ghastly Tathlum +1",
        -- Bunzi's Rod Culminus Shield
		-- Agwu's Cap Argute Stole +2
		head="Peda. M.Board +3",neck="Saevus Pendant +1", ear1="Regal Earring",ear2="Malignance Earring",
		-- Agwu's Robe Freke Ring 
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Mallquis Ring",
		-- Skymir Cord +1 Agwu's Slops
        back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Amalric Slops +1",feet="Amalric Nails +1"}
	
	sets.midcast.Helix.Burst = {main="Maxentius", sub="Ammurapi Shield", ammo="Ghastly Tathlum +1",
        -- Bunzi's Rod 
		-- Argute Stole +2
		head="Peda. M.Board +3",neck="Warder's Charm +1", ear1="Regal Earring",ear2="Malignance Earring",
		-- Agwu's Robe Agwu's Gages Freke Ring 
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Mallquis Ring",
		-- Skymir Cord +1 Agwu's Slops Arbatel Loafers +3
        back=gear.nuke_jse_back, waist="Acuity Belt +1", legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
	sets.midcast.Helix.Proc = {main=empty, sub=empty, ammo="Impatiens",
        head="Volte Beret", neck="Orunmila's Torque",ear1="Regal Earring",ear2="Malignance Earring",
        body="Volte Doublet", hands="Volte Gloves", ring1="Kishar Ring", ring2="Prolix Ring",
        back=gear.FC_jse_back, waist="Witful Belt", legs="Volte Brais", feet="Amalric Nails +1"}

	sets.midcast.Impact = {main="Contemplator +1",sub="Khonsu", ammo="Pemphredo Tathlum",
		-- Argute Stole +2
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		-- Acad. Bracers +3
		body="Crepuscular Cloak",hands="Regal Cuffs",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		-- Arbatel Pants +3 Arbatel Loafers +3
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs=gear.chironic_macc_legs, feet="Amalric Nails +1"}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Crepuscular Cloak"})
		
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {main="Contemplator +1", sub="Khonsu", ammo="Homiliary",
        head="Volte Beret", neck="Loricate Torque +1", ear1="Etiolation Earring",ear2="Ethereal Earring",
		-- hands=gear.merlinic_refresh_hands,
        body="Shamash Robe", hands="Volte Gloves", ring1="Defending Ring",ring2="Gelatinous Ring +1",
		-- waist="Flax Sash", feet=gear.chironic_refresh_feet
        back=gear.FC_jse_back, waist="Shinjutsu-no-Obi +1", legs="Volte Brais", feet="Mallquis Clogs +2"}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {main="Contemplator +1", sub="Khonsu", ammo="Homiliary",
        head="Volte Beret", neck="Loricate Torque +1", ear1="Etiolation Earring",ear2="Ethereal Earring",
		-- 
        body="Shamash Robe", hands="Volte Gloves", ring1="Defending Ring",ring2="Gelatinous Ring +1",
		-- waist="Flax Sash", 
        back=gear.FC_jse_back, waist="Carrier's Sash", legs="Volte Brais", feet="Mallquis Clogs +2"}

    sets.idle.PDT = {main="Malignance Pole", sub="Khonsu", ammo="Staunch Tathlum +1",
		-- sub="Oneiros Grip",
        head="Volte Beret",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shamash Robe",hands="Volte Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		--feet=gear.chironic_refresh_feet
        back=gear.FC_jse_back,waist="Carrier's Sash",legs="Volte Brais",feet="Mallquis Clogs +2"}
		
	sets.idle.Hippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

    sets.idle.Weak = {main="Malignance Pole", sub="Khonsu", ammo="Homiliary",
        head="Volte Beret",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		--hands=gear.merlinic_refresh_hands,
        body="Shamash Robe",hands="Volte Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		--feet=gear.chironic_refresh_feet
        back=gear.FC_jse_back,waist="Carrier's Sash",legs="Volte Brais",feet="Mallquis Clogs +2"}
		

    -- Defense sets
    sets.defense.PDT = {main="Malignance Pole", sub="Khonsu", ammo="Staunch Tathlum +1",
		-- Nyame Helm
        head="Volte Beret",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        -- Nyame Mail Nyame Gauntlets rring="Shadow Ring",
		body="Shamash Robe", hands="Volte Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        -- Moonlight Cape Agwu Slops Nyame Sollerets
		back=gear.FC_jse_back, waist="Carrier's Sash",legs="Volte Brais",feet="Peda. Loafers +3"}

    sets.defense.MDT = {main="Malignance Pole", sub="Khonsu", ammo="Staunch Tathlum +1",
		-- Nyame Helm
        head="Volte Beret",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        -- Nyame Mail Nyame Gauntlets rring="Shadow Ring",
		body="Shamash Robe", hands="Volte Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        -- Moonlight Cape Agwu Slops Nyame Sollerets
		back=gear.FC_jse_back, waist="Carrier's Sash",legs="Volte Brais",feet="Peda. Loafers +3"}
		
    sets.defense.MEVA = {main="Malignance Pole", sub="Khonsu", ammo="Staunch Tathlum +1",
		-- Arbatel Bonnet +3
        head="Volte Beret", neck="Warder's Charm +1", ear1="Etiolation Earring",ear2="Lugalbanda Earring",
        -- Arbatel Gown +3 Nyame Gauntlets
		body="Shamash Robe", hands="Volte Gloves",ring1="Purity Ring", ring2="Shadow Ring",
        -- Moonlight Cape Slipor Sash Agwu Slops Nyame Sollerets
		back=gear.FC_jse_back, waist="Carrier's Sash",legs="Volte Brais",feet="Peda. Loafers +3"}
		
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
    sets.engaged = {main="Gozuki Mezuki", sub="Khonsu", ammo="Homiliary", -- Amar Cluster
		-- Crepuscular Earring
        head="Blistering Sallet +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Telos Earring",
		-- Nyame Mail
        body="Shamash Robe",hands="Gazu Bracelets +1", ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		--legs="Nyame Flanchard", feet="Nyame Sollerets"
        back=gear.TP_jse_back, waist="Eschan Stone", legs="Peda. Pants +3", feet="Peda. Loafers +3"}

	sets.engaged.PDT = {main="Gozuki Mezuki", sub="Khonsu", ammo="Homiliary", -- Amar Cluster
		-- Crepuscular Earring
        head="Blistering Sallet +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Telos Earring",
		-- Nyame Mail
        body="Shamash Robe",hands="Gazu Bracelets +1", ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		--legs="Nyame Flanchard", feet="Nyame Sollerets"
        back=gear.TP_jse_back, waist="Eschan Stone", legs="Peda. Pants +3", feet="Peda. Loafers +3"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +3"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +3"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}
	
	sets.HPDown = {
		head=empty,ear1="Odnowa Earring +1",ear2="Odnowa Earring",
		body=empty, hands=empty, ring1="Mephitas's Ring +1", ring2="Mephitas's Ring",
		-- waist="Flax Sash",
		back=gear.FC_jse_back, waist="Platinum Mog Belt", legs=empty, feet=empty}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {legs="Acad. Pants +1"} 
	sets.buff['Dark Arts'] = {body="Acad. Gown +1"} 

    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}
	
	-- Weapons sets
	sets.weapons.None = {main="Malignance Pole", sub="Khonsu"}
	sets.weapons.Club = {main="Maxentius", sub="Genmei Shield"}
	sets.weapons.Akademos = {main="Akademos",sub="Niobid Strap"}
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
		set_macro_page(5, 9)
	end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 009')
end

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
	},
}




