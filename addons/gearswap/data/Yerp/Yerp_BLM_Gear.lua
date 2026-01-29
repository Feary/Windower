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
	gear.nuke_jse_back	= {name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	gear.FC_jse_back 	= {name="Taranus's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}}
	
	gear.Cure_jse_back  = {name="Taranus's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}}
	gear.STP_jse_back 	= {name="Taranus's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}}
	-- INT WSD
	gear.WS_jse_back 	= {name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}

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

    sets.precast.JA.Manafont = {body="Arch. Coat"}
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1", -- ammo="Impatiens",
		-- neck="Voltsurge Torque", ear2="Malignance Earring",
		head="Amalric Coif +1",  ear1="Enchntr. Earring +1", ear2="Loquac. Earring",
		-- ring1="Kishar Ring", ring2="Lebeche Ring",
		body="Zendik Robe", hands="Helios Gloves", lring="Prolix Ring",
		-- legs="Psycloth Lappas",
		back=gear.FC_jse_back,waist="Witful Belt",  feet="Amalric Nails +1"}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {ammo="Staunch Tathlum",ring2="Prolix Ring",waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ammo="Staunch Tathlum",hands="Mallquis Cuffs +2", rring1="Mallquis Ring", ring2="Prolix Ring"}) --ear1="Barkaro. Earring"

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})

	sets.precast.FC.Death = {}
		
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
     sets.precast.WS = {ammo="Pemphredo Tathlum",
		-- Nyame Helm
		head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
		-- Nyame Mail Nyame Gauntlets 
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Epaminondas's Ring",ring2="Shiva Ring +1",
		-- Nyame Flanchard Nyame Sollerets
		back=gear.nuke_jse_back,waist="Fotia Belt",legs="Amalric Slops +1",feet="Jhakri Pigaches +2"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {ammo="Pemphredo Tathlum",
		head="Amalric Coif +1",neck="Saevus Pendant +1",ear1="Regal Earring",ear2="Malignance Earring",
		body="Zendik Robe", hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Fotia Belt",legs="Amalric Slops +1",feet="Amalric Nails +1"}

    sets.precast.WS['Myrkr'] = {ammo="Staunch Tathlum +1",
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Evans Earring",ear2="Etiolation Earring",
		body="Amalric Doublet +1", hands="Regal Cuffs", ring1="Mephitas's Ring +1", ring2="Mephitas's Ring",
		back="Aurist's Cape +1",waist="Eschan Stone",legs="Psycloth Lappas",feet="Skaoi Boots"}
		
	sets.precast.WS['Cataclysm'] = {ammo="Pemphredo Tathlum",
		-- Baetyl Pendant
		head="Pixie Hairpin +1", neck="Saevus Pendant +1",ear1="Moonshade Earring",ear2="Regal Earring",
		-- Nyame Mail Nyame Gauntlets R15 
		body="Amalric Doublet +1", hands="Jhakri Cuffs +2", ring1="Metamor. Ring +1", ring2="Archon Ring",
		-- Nyame Flanchard Nyame Sollerets 
		back=gear.nuke_jse_back,waist="Orpheus's Sash",legs="Amalric Slops +1", feet="Amalric Nails +1"}
    
    ---- Midcast Sets ----
    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1", neck="Voltsurge Torque", ear1="Enchntr. Earring +1", eear2="Loquacious Earring",
		body="Zendik Robe", hands="Helios Gloves", ring1="Kishar Ring",ring2="Lebeche Ring",
		-- legs="Psycloth Lappas",
		back=gear.FC_jse_back,waist="Witful Belt", legs="Lengo Pants", feet="Amalric Nails +1"}

    sets.midcast.Cure = {main="Daybreak", sub="Sors Shield",ammo="Pemphredo Tathlum",
		--main=gear.gada_healing_club,
        head="Vanya Hood", neck="Incanter's Torque", ear1="Mendi. Earring",ear2="Roundel Earring",
        --body="Vanya Robe",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure,ring1="Sirona's Ring",ring2="Mephitas's Ring +1",
        back=gear.FC_jse_back,waist="Shinjutsu-no-obi +1",legs="Vanya Slops",feet="Vanya Clogs"}
		
    sets.midcast.LightWeatherCure = {main="Daybreak", sub="Sors Shield",ammo="Pemphredo Tathlum",
		--main=gear.gada_healing_club,
        head="Vanya Hood", neck="Incanter's Torque", ear1="Mendi. Earring",ear2="Roundel Earring",
        --body="Vanya Robe",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure,ring1="Sirona's Ring",ring2="Mephitas's Ring +1",
        back=gear.FC_jse_back,waist="Shinjutsu-no-Obi +1",legs="Vanya Slops",feet="Vanya Clogs"}
		
	--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Daybreak", sub="Sors Shield",ammo="Sapience Orb",
		--main=gear.gada_healing_club,
        head="Vanya Hood", neck="Incanter's Torque", ear1="Mendi. Earring",ear2="Roundel Earring",
        --body="Vanya Robe",
		body="Annoint. Kalasiris", hands=gear.telchine_hands_Cure,ring1="Sirona's Ring",ring2="Lebeche Ring",
        back=gear.FC_jse_back,waist="Hachirin-no-Obi",legs="Vanya Slops",feet="Vanya Clogs"}

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
		head="Amalric Coif +1", hands="Regal Cuffs",	
		--waist="Emphatikos Rope",
		legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
    
	sets.midcast['Enfeebling Magic'] = {main="Maxentius",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Befouled Crown",neck="Erra Pendant",ear2="Regal Earring",
        body="Vanya Robe",hands="Mallquis Cuffs +2",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=gear.cure_jse_back,legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
		
    sets.midcast['Enfeebling Magic'].Resistant = {main="Maxentius",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Befouled Crown",neck="Erra Pendant",ear2="Regal Earring",
        body="Vanya Robe",hands="Mallquis Cuffs +2",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=gear.cure_jse_back,legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back=gear.Nuke_jse_back})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {main="Maxentius",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Mallquis Chapeau +2",neck="Erra Pendant", ear1="Gwati Earring", ear2="Regal Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Mallquis Chapeau +2",neck="Erra Pendant",ear1="Gwati Earring", ear2="Regal Earring", 
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
    
    sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Aspir.Death = {main="Maxentius",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Mallquis Chapeau +2",neck="Erra Pendant", ear1="Gwati Earring", ear2="Regal Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
	
	sets.midcast.Death = {main="Maxentius",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head="Mallquis Chapeau +2",neck="Erra Pendant", ear1="Gwati Earring", ear2="Regal Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    sets.midcast.Stun = {main="Maxentius",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
        --ear1="Barkaro. Earring",
		head="Spae. Petasos +3",neck="Erra Pendant", ear2="Regal Earring",
		body="Spaekona's Coat +3",hands="Spae. Gloves +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.Nuke_jse_back,waist="Witful Belt",legs="Spae. Tonban +3",feet="Spae. Sabots +3"}
		
    sets.midcast.Stun.Resistant = {main="Maxentius",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        --ear1="Barkaro. Earring",
		head="Spae. Petasos +3",neck="Erra Pendant", ear1="Gwati Earring", ear2="Regal Earring",
		body="Spaekona's Coat +3",hands="Spae. Gloves +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.Nuke_jse_back,waist="Witful Belt",legs="Spae. Tonban +3",feet="Spae. Sabots +3"}

    sets.midcast.BardSong = {main="Maxentius",sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
		head="Spae. Petasos +3",neck="Erra Pendant", ear1="Gwati Earring", ear2="Regal Earring",
		body="Spaekona's Coat +3",hands="Spae. Gloves +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.Nuke_jse_back,waist="Acuity Belt +1",legs="Spae. Tonban +3",feet="Spae. Sabots +3"}
		
	sets.midcast.Impact = {main="Maxentius",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		-- ear1="Digni. Earring",
        head=empty,neck="Erra Pendant",ear1="Gwati Earring", ear2="Regal Earring",
        body="Twilight Cloak",hands="Mallquis Cuffs +2",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back=gear.Nuke_jse_back,waist="Luminary Sash", legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    -- Elemental Magic sets    
    sets.midcast['Elemental Magic'] = {main="Lathi",sub="Khonsu",ammo="Ghastly Tathlum +1",
        head="Jhakri Coronal +2",neck="Saevus Pendant +1",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Shamash Robe",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
        back=gear.Nuke_jse_back,waist="Acuity Belt +1",legs="Amalric Slops +1",feet="Amalric Nails +1"}

    sets.midcast['Elemental Magic'].Resistant = {main="Lathi",sub="Khonsu",ammo="Ghastly Tathlum +1",
        head="Jhakri Coronal +2",neck="Saevus Pendant +1",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Shamash Robe", hands="Arch. Gloves +3",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
        back=gear.Nuke_jse_back,waist="Acuity Belt +1",legs="Arch. Tonban +3",feet="Arch. Sabots +3"}

		
    sets.midcast['Elemental Magic'].Fodder = {main="Lathi",sub="Khonsu",ammo="Ghastly Tathlum +1",
        head="Jhakri Coronal +2",neck="Saevus Pendant +1",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Shamash Robe",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
        back=gear.Nuke_jse_back,waist="Acuity Belt +1",legs="Amalric Slops +1",feet="Amalric Nails +1"}


	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		main="Lathi",sub="Khonsu",ammo="Ghastly Tathlum +1",
        head="Jhakri Coronal +2",neck="Saevus Pendant +1",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Shamash Robe",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
        back=gear.Nuke_jse_back,waist="Acuity Belt +1",legs="Amalric Slops +1",feet="Amalric Nails +1"})


	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
		main="Lathi", sub="Khonsu", ammo="Ghastly Tathlum +1",
        head="Jhakri Coronal +2",neck="Saevus Pendant +1",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Shamash Robe",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
        back=gear.Nuke_jse_back,waist="Acuity Belt +1",legs="Amalric Slops +1",feet="Amalric Nails +1"})

	sets.midcast['Elemental Magic'].Fodder.HighTierNuke = set_combine(sets.midcast['Elemental Magic'].Fodder, {
		main="Lathi",sub="Khonsu",ammo="Ghastly Tathlum +1",
        head="Jhakri Coronal +2",neck="Saevus Pendant +1",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Shamash Robe",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
        back=gear.Nuke_jse_back,waist="Acuity Belt +1",legs="Amalric Slops +1",feet="Amalric Nails +1"})

	
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant
		
		-- Minimal damage gear, maximum recast gear for procs.
    sets.midcast['Elemental Magic'].Proc = {main=empty,sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Mallquis Chapeau +2",neck="Saevus Pendant +1",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
        back=gear.Nuke_jse_back,waist="Acuity Belt +1",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
	
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Boonwell Staff",sub="Khonsu", ammo="Staunch Tathlum",
		head="Befouled Crown",neck="Sibyl Scarf",ear1="Ethereal Earring",ear2="Sanare Earring",
		-- hands=gear.merlinic_refresh_hands,
		body="Jhakri Robe +2",  ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		-- feet=gear.merlinic_refresh_feet
		back=gear.FC_jse_back,waist="Shinjutsu-no-Obi +1",legs="Assid. Pants +1",}
    

    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {main=gear.grioavolr_refresh_staff, sub="Khonsu", ammo="Staunch Tathlum",
		head="Befouled Crown", neck="Sibyl Scarf", ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
		body="Shamash Robe", hands="Amalric Gages +1", ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		--  feet="Wicce Sabots +1"}
		back=gear.FC_jse_back, waist="Shinjutsu-no-Obi +1",legs="Assid. Pants +1", feet="Amalric Nails +1"}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {main=gear.grioavolr_refresh_staff, sub="Khonsu", ammo="Staunch Tathlum",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		-- hands=gear.merlinic_refresh_hands,
		body="Jhakri Robe +2", hands="Amalric Gages +1", ring1="Gelatinous Ring +1", ring2="Defending Ring",
		-- feet="Wicce Sabots +1"}
		back=gear.FC_jse_back, waist="Shinjutsu-no-Obi +1",legs="Assid. Pants +1", feet="Amalric Nails +1"}
		
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

	sets.idle.Death = {main=gear.grioavolr_nuke_staff,sub="Khonsu",ammo="Staunch Tathlum",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Gifted Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Wicce Sabots +1"}

    sets.idle.Weak = {main="Bolelabunga",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Befouled Crown",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Gelatinous Ring +1" ,ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Wicce Sabots +1"}

    -- Defense sets
    sets.defense.PDT = {main="Mafic Cudgel",sub="Genmei Shield",ammo="Staunch Tathlum",
        head="Mallquis Chapeau +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2", ring1="Gelatinous Ring +1", ring2="Defending Ring",
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

    sets.defense.MDT = {main="Mafic Cudgel",sub="Genmei Shield",ammo="Staunch Tathlum",
        head="Mallquis Chapeau +2",neck="Loricate Torque +1",ear1="Merman's Earring",ear2="Etiolation Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2", ring1="Gelatinous Ring +1", ring2="Defending Ring",
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}
    sets.defense.MEVA = {main="Mafic Cudgel",sub="Genmei Shield",ammo="Staunch Tathlum",
        head="Mallquis Chapeau +2",neck="Warder's Charm +1",ear1="Lugalbanda Earring",ear2="Etiolation Earring",
        body="Mallquis Saio +2",hands="Mallquis Cuffs +2", ring1="Gelatinous Ring +1", ring2="Defending Ring",
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Mallquis Trews +2",feet="Mallquis Clogs +2"}

	sets.Kiting = {lring="Shneddick Ring"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {ammo="Per. Lucky Egg",})
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
    sets.buff['Mana Wall'] = {back="Taranus's Cape",feet="Wicce Sabots +1"}
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Spaekona's Coat +2"}
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",hands="Amalric Gages +1",ring1="Mujin Band",feet="Jhakri Pigaches +2"} -- head="Ea Hat",body="Ea Houppelande", legs="Ea Slops"
	sets.RecoverBurst = {neck="Mizu. Kubikazari",body="Spaekona's Coat +2",hands="Amalric Gages +1",ring1="Mujin Band",feet="Jhakri Pigaches +2"} -- head="Ea Hat", 
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1"}--,ring2="Archon Ring"

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Staunch Tathlum",
        head="Jhakri Coronal +2",neck="Sanctity Necklace",ear1="Zennaroi Earring", -- ear2="Telos Earring",	
		body="Jhakri Robe +2",hands="Gazu Bracelets +1",ring1="Petrov Ring",ring2="Ramuh Ring",
		back=gear.TP_jse_back,waist="Olseni Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring2="Asklepian Ring"}
	sets.Cure_Received = {neck="Phalaina Locket",ring2="Asklepian Ring"}
	sets.Self_Refresh = {waist="Gishdubar Sash",}-- back="Grapevine Cape",feet="Inspirited Boots"
		
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