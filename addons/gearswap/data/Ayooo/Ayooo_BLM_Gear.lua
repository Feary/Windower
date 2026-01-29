function user_job_setup()
	-- Options: Override default values
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc', 'OccultAcumen')
	state.OffenseMode:options('None', 'Normal')
	state.IdleMode:options('Normal', 'PDT', 'DTHippo')
	state.Weapons:options('None','NukeWeapons','MeleeStaff','MeleeClubs','Death')
	
	-- Staves 
	gear.grioavolr_refresh_staff =  "Lathi"
	gear.grioavolr_nuke_staff =  "Lathi"
	gear.nuke_staff = "Lathi"
	gear.grioavolr_Death_staff =  "Lathi"

	-- Capes 
	gear.nuke_jse_back	= {name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
	gear.idle_jse_back 	= {name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
	
	-- MP FC
	gear.FC_jse_back = 	  {name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
	gear.Cure_jse_back  = "Aurist's Cape +1"
	
	gear.TP_jse_back	 = gear.STP_jse_back
	gear.STP_jse_back 	= {name="Taranus's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}}
	
	-- INT WSD
	gear.WS_jse_back 	= {name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}

	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !\\\\ input /ja "Manawell" <me>')
	send_command('bind !` input /ma "Aspir II" <t>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f9 gs c cycle DeathMode')
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace input /ja "Enmity Douse" <t>')
	send_command('bind @backspace input /ja "Alacrity" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind @= input /ja "Addendum: White" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
    
	select_default_macro_book()
	user_job_lockstyle()
end

function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	-- Weapons sets
	sets.weapons.None = {main="Contemplator +1", sub="Khonsu"}
	sets.weapons.NukeWeapons = {main="Lathi", sub="Khonsu"}
	sets.weapons.MeleeStaff = {main="Maxentius",sub="Ammurapi Shield"}
	sets.weapons.MeleeClubs =  {main="Maxentius",sub="Ammurapi Shield"}
	sets.weapons.Death = {main="Lathi",sub="Khonsu"}
	
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {}-- back="Taranus's Cape",feet="Wicce Sabots +1"

    sets.precast.JA.Manafont = {body="Arch. Coat +3"}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap", ammo="Impatiens",
		--ear1="Enchntr. Earring +1",
		head="Agwu's Cap", neck="Voltsurge Torque", lear="Loquac. Earring", ear2="Malignance Earring",
		body="Agwu's Robe", hands="Agwu's Gages", ring1="Kishar Ring", ring2="Lebeche Ring",
		back="Fi Follet Cape +1",waist="Embla Sash", legs="Agwu's Slops", feet="Agwu's Pigaches"}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {ammo="Sapience Orb",ring2="Prolix Ring",waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ammo="Sapience Orb",ring2="Prolix ring",}) --ear1="Barkaro. Earring"

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

	sets.precast.FC.Death = {}
		
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
     sets.precast.WS = {ammo="Oshasha's Treatise",
		head="Nyame Helm",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
		-- ring1="Epaminondas's Ring", ring2="Shiva Ring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Metamor. Ring +1",ring2="Shiva Ring",
		--  waist="Fotia Belt"
		back=gear.nuke_jse_back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {ammo="Ghastly Tathlum +1",
		-- Pixie Hairpin +1 Src. Stole +2
		head="Nyame Helm",neck="Saevus Pendant +1",ear1="Regal Earring",ear2="Malignance Earring",
		-- Freke Ring Epaminondas's Ring
		body="Nyame Mail", hands="Nyame Gauntlets",ring1="Metamor. Ring +1",ring2="Shiva Ring",
		back=gear.WS_jse_back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Myrkr'] = {--ammo="Strobilus",
		-- neck="Dualism Collar +1" lear="Nehalennia Earring", rear="Moo
		head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Etiolation Earring",
		body="Amalric Doublet +1", hands="Spae. Gloves +2", ring1="Mephitas's Ring +1", ring2="Mephitas's Ring",
		-- Psycloth Boots Path A
		back="Aurist's Cape +1",waist="Shinjutsu-no-Obi +1",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
	sets.precast.WS['Cataclysm'] = {ammo="Pemphredo Tathlum",
		-- Pixie Hairpin +1
		head="Nyame Helm", neck="Baetyl Pendant",ear1="Moonshade Earring",ear2="Regal Earring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Metamor. Ring +1", ring2="Archon Ring",
		back=gear.WS_jse_back,waist="Orpheus's Sash",legs="Nyame Flanchard", feet="Nyame Sollerets"}
    
	sets.precast.WS['Earth Crusher'] = {ammo="Oshasha's Treatise",
		head="Nyame Helm",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
		-- ring1="Epaminondas's Ring", ring2="Shiva Ring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Metamor. Ring +1",ring2="Shiva Ring",
		--  waist="Fotia Belt"
		back=gear.WS_jse_back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	-- Scythe
	sets.precast.WS['Spiral Hell'] = {ammo="Oshasha's Treatise",
		-- Fotia Gorget
		head="Nyame Helm",neck="Sanctity Necklace",ear1="Ishvara Earring",ear2="Moonshade Earring",
		-- ring1="Epaminondas's Ring", ring2="Ifrit's ring +1",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Rajas Ring",ring2="Petrov Ring",
		--  waist="Fotia Belt"
		back=gear.WS_jse_back,waist="Snow Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.precast.WS['Shadow Of Death'] = {ammo="Oshasha's Treatise",
		-- Pixie Hairpin +1 
		head="Nyame Helm",neck="Saevus Pendant +1",ear1="Moonshade Earring",ear2="Malignance Earring",
		-- ring1="Epaminondas's Ring",
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Metamor. Ring +1",ring2="Archon Ring",
		--  waist="Fotia Belt"
		back=gear.WS_jse_back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Agwu's Pigaches"}
	
    ---- Midcast Sets ----
    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.Cure = {main="Daybreak", sub="Sors Shield",ammo="Pemphredo Tathlum",
		--main=gear.gada_healing_club,
		-- Vanya path B
        head="Vanya Hood", neck="Incanter's Torque", ear1="Mendi. Earring",ear2="Meili Earring",
        --hands="Vanya Cuffs", Path B Stikini Ring +1 Stikini Ring +1
		body="Vrikodara Jupon", hands="Telchine Gloves",ring1="Sirona's Ring",ring2="Mephitas's Ring +1",
		--
        back=gear.Cure_jse_back,waist="Shinjutsu-no-obi +1",legs="Vanya Slops",feet="Vanya Clogs"}
		
    sets.midcast.LightWeatherCure = {main="Daybreak", sub="Sors Shield",ammo="Pemphredo Tathlum",
		--main=gear.gada_healing_club,
		-- Vanya path B
        head="Vanya Hood", neck="Incanter's Torque", ear1="Mendi. Earring",ear2="Meili Earring",
        --hands="Vanya Cuffs", Path B Stikini Ring +1 Stikini Ring +1
		body="Vrikodara Jupon", hands="Telchine Gloves",ring1="Sirona's Ring",ring2="Mephitas's Ring +1",
		--
        back=gear.Cure_jse_back,waist="Shinjutsu-no-obi +1",legs="Vanya Slops",feet="Vanya Clogs"}
		
	--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Daybreak", sub="Sors Shield",ammo="Pemphredo Tathlum",
		--main=gear.gada_healing_club,
		-- Vanya path B
        head="Vanya Hood", neck="Incanter's Torque", ear1="Mendi. Earring",ear2="Meili Earring",
        --hands="Vanya Cuffs", Path B Stikini Ring +1 Stikini Ring +1
		body="Vrikodara Jupon", hands="Telchine Gloves",ring1="Sirona's Ring",ring2="Mephitas's Ring +1",
		--
        back=gear.Cure_jse_back,waist="Shinjutsu-no-obi +1",legs="Vanya Slops",feet="Vanya Clogs"}

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	sets.midcast['Enhancing Magic'] = {main="Mafic Cudgel", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- main=gear.gada_enhancing_club,		
		head=gear.telchine_head_Duration, neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
		body=gear.telchine_body_Duration,hands=gear.telchine_hands_Duration,ring1="Stikini Ring +1","Stikini Ring +1",
		back="Perimede Cape",waist="Embla Sash",legs=gear.telchine_legs_Duration,feet=gear.telchine_feet_Duration}
    
     sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		--ear2="Earthcry Earring", 
		neck="Nodens Gorget", waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		main="Vadose Rod", sub="Genmei Shield",
		head="Amalric Coif +1", 	
		-- hands="Regal Cuffs",
		waist="Emphatikos Rope", legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
    
	sets.midcast['Enfeebling Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- Src. Stole +2
        head="Spae. Petasos +3",neck="Sanctity Necklace",ear1="Regal Earring", ear2="Malignance Earring",
		-- Cohort Cloak +1 Regal Cuffs
		body="Spaekona's Coat +3",hands="Spae. Gloves +2",ring1="Kishar Ring", ring2="Stikini Ring +1",
		-- Wicce Chausses +3  Wicce Sabots +3
        back="Aurist's Cape +1", waist="Acuity Belt +1", legs="Spae. Tonban +2", feet="Spae. Sabots +2"}
		
    sets.midcast['Enfeebling Magic'].Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		--  Src. Stole +2
        head="Spae. Petasos +3",neck="Sanctity Necklace",ear1="Regal Earring", ear2="Malignance Earring",
		-- Cohort Cloak +1 Regal Cuffs
		body="Spaekona's Coat +3",hands="Spae. Gloves +2",ring1="Kishar Ring", ring2="Stikini Ring +1",
		-- Wicce Chausses +3  Wicce Sabots +3
        back="Aurist's Cape +1", waist="Acuity Belt +1", legs="Spae. Tonban +2", feet="Spae. Sabots +2"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {
		main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- Wicce Petasos +3 Src. Stole +2
        head="Spae. Petasos +2",neck="Erra Pendant",ear1="Regal Earring", ear2="Malignance Earring",
        body="Spaekona's Coat +3",hands="Spae. Gloves +2", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back="Aurist's Cape +1", waist="Acuity Belt +1", legs="Arch. Tonban +3",feet="Arch. Sabots +3"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine( sets.midcast.ElementalEnfeeble, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.Nuke_jse_back})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {
		main="Daybreak", sub="Ammurapi Shield", ammo="Hydrocera",
		-- Ipoca Beret Jokushi Chain Saxnot Earring 
		head="Agwu's Cap", neck="", lear="Regal Earring", rear="Malignance Earring",
		-- Vanya Robe Path C Fenian Ring  lring="Stikini Ring +1", rring="Stikini Ring +1",
		body="Agwu's Robe", hands="Agwu's Gages", lring="Metamor. Ring +1", rring="Mephitas's Ring +1",
		-- Sacro Cord
		back="Aurist's Cape +1", waist="Luminary Sash", legs="Agwu's Slops", feet="Agwu's Pigaches"})

    sets.midcast['Dark Magic'] = {main="Daybreak",sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- Rubi
		-- ear1="Digni. Earring",
        head="Mallquis Chapeau +2",neck="Erra Pendant", ear1="Gwati Earring", ear2="Regal Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    sets.midcast.Drain = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- Rubicundity
		-- Pixie Hairpin +1 Hirudinea Earring Wicce Earring +1
        head="Mallquis Chapeau +2",neck="Erra Pendant",ear1="Gwati Earring", ear2="Regal Earring", 
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
    
    sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Aspir.Death = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Mallquis Chapeau +2",neck="Erra Pendant", ear1="Gwati Earring", ear2="Regal Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
	
	sets.midcast.Death = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Mallquis Chapeau +2",neck="Erra Pendant", ear1="Gwati Earring", ear2="Regal Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    sets.midcast.Stun = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Spae. Petasos +2", neck="Erra Pendant", ear1="Barkaro. Earring", ear2="Regal Earring",
		body="Spaekona's Coat +3", hands="Spae. Gloves +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.Nuke_jse_back,waist="Witful Belt",legs="Spae. Tonban +2", feet="Spae. Sabots +2"}
		
    sets.midcast.Stun.Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Spae. Petasos +2", neck="Erra Pendant", ear1="Barkaro. Earring", ear2="Regal Earring",
		body="Spaekona's Coat +3", hands="Spae. Gloves +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.Nuke_jse_back,waist="Witful Belt",legs="Spae. Tonban +2", feet="Spae. Sabots +2"}

    sets.midcast.BardSong = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Spae. Petasos +2", neck="Erra Pendant", ear1="Barkaro. Earring", ear2="Regal Earring",
		body="Spaekona's Coat +3", hands="Spae. Gloves +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.Nuke_jse_back,waist="Luminary Sash",legs="Spae. Tonban +2", feet="Spae. Sabots +2"}
		
	sets.midcast.Impact = {main="Maxentius",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head=empty,neck="Erra Pendant",ear1="Gwati Earring", ear2="Regal Earring",
        body="Twilight Cloak",hands="Mallquis Cuffs +2",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    -- Elemental Magic sets    
    sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		-- Src. Stole +2
        head="Agwu's Cap",neck="Saevus Pendant +1",ear1="Regal Earring",ear2="Malignance Earring",
		-- rring="Freke Ring"
        body="Agwu's Robe",hands="Agwu's Gages",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		-- Wicce Chausses +3 Wicce Pigaches +3
        back=gear.Nuke_jse_back,waist="Acuity Belt +1",legs="Agwu's Slops",feet="Agwu's Pigaches"}

    sets.midcast['Elemental Magic'].Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		-- Src. Stole +2
        head="Agwu's Cap",neck="Saevus Pendant +1",ear1="Regal Earring",ear2="Malignance Earring",
		-- rring="Freke Ring"
        body="Agwu's Robe",hands="Agwu's Gages",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		-- Wicce Chausses +3 Wicce Pigaches +3
        back=gear.Nuke_jse_back,waist="Acuity Belt +1",legs="Agwu's Slops",feet="Agwu's Pigaches"}

    sets.midcast['Elemental Magic'].Fodder = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		-- Src. Stole +2
        head="Agwu's Cap",neck="Saevus Pendant +1",ear1="Regal Earring",ear2="Malignance Earring",
		-- rring="Freke Ring"
        body="Agwu's Robe",hands="Agwu's Gages",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		-- Wicce Chausses +3 Wicce Pigaches +3
        back=gear.Nuke_jse_back,waist="Acuity Belt +1",legs="Agwu's Slops",feet="Agwu's Pigaches"}

	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		-- Src. Stole +2
        head="Agwu's Cap",neck="Saevus Pendant +1",ear1="Regal Earring",ear2="Malignance Earring",
		-- rring="Freke Ring"
        body="Agwu's Robe",hands="Agwu's Gages",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		-- Wicce Chausses +3 Wicce Pigaches +3
        back=gear.Nuke_jse_back,waist="Acuity Belt +1",legs="Agwu's Slops",feet="Agwu's Pigaches"})


	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		-- Src. Stole +2
        head="Agwu's Cap",neck="Saevus Pendant +1",ear1="Regal Earring",ear2="Malignance Earring",
		-- rring="Freke Ring"
        body="Agwu's Robe",hands="Agwu's Gages",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		-- Wicce Chausses +3 Wicce Pigaches +3
        back=gear.Nuke_jse_back,waist="Acuity Belt +1",legs="Agwu's Slops",feet="Agwu's Pigaches"})

	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {
		main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		-- Src. Stole +2
        head="Agwu's Cap",neck="Saevus Pendant +1",ear1="Regal Earring",ear2="Malignance Earring",
		-- rring="Freke Ring"
        body="Agwu's Robe",hands="Agwu's Gages",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
		-- Wicce Chausses +3 Wicce Pigaches +3
        back=gear.Nuke_jse_back,waist="Acuity Belt +1",legs="Agwu's Slops",feet="Agwu's Pigaches"})

	
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant
		
		-- Minimal damage gear, maximum recast gear for procs.
    sets.midcast['Elemental Magic'].Proc = sets.precast.FC
	
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main=gear.grioavolr_refresh_staff ,sub="Khonsu", ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Gelatinous Ring +1", ring2="Defending Ring",
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1", legs="Nyame Flanchard", feet="Nyame Sollerets"}
    

    -- Idle sets
    -- Normal refresh idle set
    sets.idle = {main=gear.grioavolr_refresh_staff, sub="Khonsu", ammo="Staunch Tathlum",
		-- head=gear.merlinic_refresh_head, Sibyl Scarf Halasz Earring Nehalennia Earring
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,  ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		body="Shamash Robe", hands="Nyame Gauntlets", ring1="Gelatinous Ring +1", ring2="Defending Ring",
		-- waist="Shinjutsu-no-Obi +1", feet=gear.merlinic_refresh_feet
		back=gear.idle_jse_back, waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {main="Daybreak" ,sub="Genmei Shield", ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Gelatinous Ring +1", ring2="Defending Ring",
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1", legs="Nyame Flanchard", feet="Nyame Sollerets"}
		
    sets.idle.TPEat = set_combine(sets.idle, {})--neck="Chrys. Torque"
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

	sets.idle.Death = {main="Bunzi's Rod", sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		-- Wicce Petasos +3 Halasz Earring Nehalennia Earring
		head="Befouled Crown",neck="Sanctity Necklace",ear1="Gifted Earring",ear2="Etiolation Earring",
		-- Ros. Jaseran +1
		body="Jhakri Robe +2",hands="Spae. Gloves +2", ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		-- Psycloth Boots Path A
		back=gear.FC_jse_back,waist="Shinjutsu-no-Obi +1",legs="Amalric Slops +1",feet="Agwu's Pigaches"}

    sets.idle.Weak = {main="Daybreak" ,sub="Ammurapi Shield", ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Gelatinous Ring +1", ring2="Defending Ring",
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    -- Defense sets
    sets.defense.PDT = {main="Daybreak" ,sub="Genmei Shield", ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Gelatinous Ring +1", ring2="Defending Ring",
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1", legs="Nyame Flanchard", feet="Nyame Sollerets"}

    sets.defense.MDT = {main="Daybreak",sub="Genmei Shield", ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Gelatinous Ring +1", ring2="Defending Ring",
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1", legs="Nyame Flanchard", feet="Nyame Sollerets"}
    sets.defense.MEVA = {main="Daybreak" ,sub="Genmei Shield", ammo="Staunch Tathlum",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
		body="Nyame Mail", hands="Nyame Gauntlets", ring1="Gelatinous Ring +1", ring2="Defending Ring",
		back=gear.idle_jse_back, waist="Shinjutsu-no-Obi +1", legs="Nyame Flanchard", feet="Nyame Sollerets"}

	sets.Kiting = {lring="Shneddick Ring"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {} -- feet=gear.merlinic_refresh_feet
	sets.NightIdle = {}
	
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
	-- HP- Gear
	sets.HPDown = {head="Pixie Hairpin +1", ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		feet="Jhakri Pigaches +2"}
		
	-- HP+ Gear
	sets.HPCure = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	
    sets.buff['Mana Wall'] = {main="Daybreak", sub="Genmei Shield", ammo="Staunch Tathlum",
		-- main="Archmage Staff +1",
		--head="Wicce Petasos +3", neck="Unmoving Collar +1",  rear="Heartly Earring",
		head="Nyame Helm", neck="Unmoving Collar", lear="Ethereal Earring", rear="Sanare Earring",
		--body="Wicce Coat +3", hands="Wicce Gloves +3", lring="Supershear Ring",
		 body="Nyame Mail", hands="Nyame Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring", 
		--back=gear.idle_jse_back, waist="Plat. Mog. Belt", legs="Wicce Chausses +3", feet="Wicce Sabots +3"
		back=gear.idle_jse_back, waist="Carrier's Sash", legs="Nyame Flanchard", feet="Nyame Sollerets"}
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Spaekona's Coat +3"}
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",hands="Amalric Gages",ring1="Mujin Band",feet="Jhakri Pigaches +2"} -- head="Ea Hat",body="Ea Houppelande", legs="Ea Slops"
	sets.RecoverBurst = {neck="Mizu. Kubikazari",body="Spaekona's Coat +3",hands="Amalric Gages",ring1="Mujin Band",feet="Jhakri Pigaches +2"} -- head="Ea Hat", 
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {ring2="Archon Ring"}--head="Pixie Hairpin +1"

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Staunch Tathlum", -- ammo="Amar Cluster",
		-- lear="Crep. Earring",
        head="Nyame Helm",neck="Combatant's Torque", ear1="Telos Earring", ear2="Digni. Earring",	
		-- Chirich Ring +1
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Rajas Ring",ring2="Petrov Ring",
		-- waist="Olseni Belt",
		back=gear.TP_jse_back, waist="Cetl Belt", legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	-- Mythic Max STP
	sets.engaged.Laevateinn = {ammo="Staunch Tathlum", -- ammo="Amar Cluster",
		-- lear="Crep. Earring",
        head="Nyame Helm",neck="Combatant's Torque", ear1="Telos Earring", ear2="Digni. Earring",	
		-- Wicce Coat +3 Gazu Braclets +1
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Rajas Ring",ring2="Petrov Ring",
		-- Wicce Chausses Wicce Sabots +3
		back=gear.TP_jse_back,waist="Olseni Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring2="Asklepian Ring"}
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Asklepian Ring"}
	sets.Self_Refresh = {feet="Inspirited Boots"}-- back="Grapevine Cape",waist="Gishdubar Sash",
		
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 2)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 002')
end

function job_setup()

	state.Buff['Mana Wall'] = buffactive['Mana Wall'] or false
	state.Buff['Manafont'] = buffactive['Manafont'] or false
	state.Buff['Manawell'] = buffactive['Manawell'] or false

    LowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga'}
		
    AutoManawellSpells = S{'Impact'}
	AutoManawellOccultSpells = S{'Impact','Meteor','Thundaja','Blizzaja','Firaja','Thunder VI','Blizzard VI',}

	state.DeathMode = M{['description'] = 'Death Mode', 'Off', 'Single', 'Lock'}
	state.AutoManawell = M(false, 'Auto Manawell Mode')
	state.RecoverMode = M('35%', '60%', 'Always', 'Never')

	autows = 'Heavy Swing'
	autofood = 'Pear Crepe'
	
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoNukeMode","AutoManawell","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode"},{"AutoBuffMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","RecoverMode","ElementalMode","CastingMode","TreasureMode",})
end