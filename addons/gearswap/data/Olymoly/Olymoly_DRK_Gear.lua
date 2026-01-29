function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal','Refresh','Regen','Reraise')
	state.Weapons:options('None','Naegling','Montante','Apocalypse','CrepuscularScythe','Caladbolg','Ragnarok','Loxotic')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Crepuscular'}
	state.DrainSwapWeaponMode = M{'Always','Never','300','1000'}

	-- Capes
	gear.da_jse_back 	= 	{name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}}
	gear.strws_jse_back = 	{name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
	gear.vitws_jse_back = 	{name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
	gear.fc_jse_back 	= 	"Shadow Mantle"
	gear.meva_jse_back  =	"Shadow Mantle"
	gear.nuke_jse_back  =	"Shadow Mantle"
	
	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Diabolic Eye'] = {hands="Fall. Fin. Gaunt. +3"}
	sets.precast.JA['Arcane Circle'] = {feet="Ig. Sollerets +2"}
	sets.precast.JA['Souleater'] = {head="Ig. Burgeonet +2"}
	sets.precast.JA['Weapon Bash'] = {head="Ig. Gauntlets +2"}
	sets.precast.JA['Nether Void'] = {legs="Heathen's Flanchard +1"}
	sets.precast.JA['Blood Weapon'] = {body="Fall. Cuirass +3"}
	sets.precast.JA['Dark Seal'] = {head="Fall. Burgeonet +3"}
	sets.precast.JA['Last Resort'] = {back="Ankou's Mantle",feet="Fall. Sollerets +3"}
                   
				   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		-- lring="Rahab Ring"
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		-- Gold Mog Belt +1
		back=gear.fc_jse_back, waist="Sailfi Belt +1", legs=gear.odyssean_fc_legs, feet=gear.odyssean_fc_feet}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
		
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		-- lring="Rahab Ring"
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		-- Gold Mog Belt +1
		back=gear.fc_jse_back,waist="Sailfi Belt +1",legs=gear.odyssean_fc_legs,feet=gear.odyssean_fc_feet}
                   
	-- Specific spells 
	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Flamma Korazin +2",hands="Fall. Fin. Gaunt. +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs="Eschite Cuisses",feet="Flam. Gambieras +2"}
           
	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
		-- lear="Heathen Earring +2"
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		-- Heath. Cuirass +3 Heath. Gauntlets +3
		body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Stikini Ring +1",ring2="Metamor. Ring +1",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
		   
	sets.midcast['Dread Spikes'] = set_combine(sets.midcast['Dark Magic'], {})
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {back="Ankou's Mantle"})
           
	sets.midcast.Stun = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Eschan Stone",legs="Eschite Cuisses",feet="Flam. Gambieras +2"}
                   
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ammo="Pemphredo Tathlum",
		head="Fall. Burgeonet +3", neck="Erra Pendant", ear1="Digni. Earring", ear2="Malignance Earring",
		body="Carm. Sc. Mail +1",hands="Fall. Fin. Gaunt. +3", ring1="Evanescence Ring", ring2="Archon Ring",
		-- Heath. Flanchard +3 Heath. Sollerets +3
		back="Niht Mantle", waist="Orpheus's Sash", legs="Eschite Cuisses", feet="Flam. Gambieras +2"})
	
	sets.DrainWeapon = {main="Misanthropy",sub="Alber Strap"}
	
	--sets.AbsorbWeapon = {main="Liberator",sub="Khonsu",range="Ullr",ammo=empty}
	--sets.DreadWeapon = {main="Crepuscular Scythe",sub="Utu Grip",} 	
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {ammo="Pemphredo Tathlum",
		-- ear1="Heath. Earring +2",
		head=empty, neck="Erra Pendant", ear1="Digni. Earring", ear2="Malignance Earring",
		--  hands="Heath. Gauntlets +3",
		body="Crepuscular Cloak", hands="Fall. Fin. Gaunt. +3", lring="Stikini Ring +1", rring="Metamor. Ring +1",
		--legs="Heath. Flanchard +3", feet="Heath. Sollerets +3"
		back=gear.nuke_jse_back, waist="Eschan Stone", legs="Flamma Dirs +2", feet="Flam. Gambieras +2"})
	
	sets.midcast.Cure = {}
	
	-- cap +30
	sets.midcast.Phalanx = {legs=gear.valorous_phalanx_legs}-- Sakapata's Cuirass
	
	sets.Self_Healing = {waist="Gishdubar Sash"}-- neck="Phalaina Locket", body="Sakpata's Plate"
	-- Caps +30
	sets.Cure_Received = {waist="Gishdubar Sash"} -- neck="Phalaina Locket", body="Sakpata's Plate"
	sets.Self_Refresh = {}--waist="Gishdubar Sash"
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
		head="Flam. Zucchetto +2",neck="Fotia Gorget",ear1="Lugra Earring +1",ear2="Moonshade Earring",
		-- body=gear.valorous_wsd_body,
		body="Hjarrandi Breast.", hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.strws_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {}) -- neck="Combatant's Torque"
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		-- Nyame Helm Abyssal Beads +2 Heath. earring +2
		head="Flam. Zucchetto +2",neck="Fotia Gorget",ear1="Lugra Earring +1",ear2="Moonshade Earring",
		-- Igno. Cuirass +3 Nyame Mail Nyame Gauntlets 
		body="Hjarrandi Breast.", hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Niqmaddu Ring",
		-- Nyame Sollerets Heathen Sollerets +3
		back=gear.strws_jse_back,waist="Sailfi Belt +1",legs="Fall. Flanchard +3",feet="Flam. Gambieras +2"})
    sets.precast.WS['Savage Blade'].SomeAcc = set_combine(sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})
	
    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Catastrophe'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Catastrophe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Catastrophe'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Torcleaver'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Torcleaver'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Torcleaver'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Entropy'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Entropy'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Entropy'].Fodder = set_combine(sets.precast.WS.Fodder, {})
     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})     
           
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Lugra Earring"}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring"}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Brutal Earring",ear2="Moonshade Earring"}
     
    -- Idle sets           
    sets.idle = {ammo="Staunch Tathlum +1",
		head="Volte Salade", neck="Loricate Torque +1", ear1="Genmei Earring", ear2="Ethereal Earring",
		-- hands="Nyame Gauntlets", ring1="Gelatinous Ring +1",
		body="Sacro Breastplate", hands="Volte Moufles", ring1="Dark Ring", ring2="Defending Ring",
		back="Shadow Mantle", waist="Carrier's Sash", legs="Volte Brayettes", feet="Volte Sollerets"}
		
    sets.idle.Refresh = set_combine(sets.idle,{neck="Coatl Gorget +1", body="Lugra Cloak", lring="Stikini Ring +1", rring="Stikini Ring +1"})
	
	sets.idle.Regen =  set_combine(sets.idle,{
		-- lear="Infused Earring",
		head="Volte Salade", neck="Bathy Choker", ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Sacro Breastplate", hands="Volte Moufles", lring="Chirich Ring +1", rring="Chirich Ring +1",
		back=gear.fc_jse_back, waist="Flume Belt", legs="Volte Brayettes", feet="Volte Sollerets"})

	sets.idle.Weak = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})
           
    -- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		-- Nyame Helm
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		-- Nyame Gauntlets Gelatinous Ring +1
		body="Hjarrandi Breast.",hands="Volte Moufles",ring1="Moonlight Ring",ring2="Defending Ring",
		-- Nyame Flanchard Nyame Sollerets
		back=gear.da_jse_back,waist="Flume Belt",legs="Sulev. Cuisses +2",feet="Volte Sollerets"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Crepuscular Helm",body="Crepuscular Mail"})

	sets.defense.MDT = {aammo="Staunch Tathlum +1",
		head="Volte Salade", neck="Loricate Torque +1", ear1="Genmei Earring", ear2="Ethereal Earring",
		-- hands="Nyame Gauntlets", ring1="Gelatinous Ring +1",
		body="Hjarrandi Breast.", hands="Volte Moufles", ring1="Moonlight Ring", ring2="Defending Ring",
		back="Shadow Mantle", waist="Carrier's Sash", legs="Volte Brayettes", feet="Volte Sollerets"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Crepuscular Helm",body="Crepuscular Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Volte Salade", neck="Loricate Torque +1", ear1="Genmei Earring", ear2="Ethereal Earring",
		-- hands="Nyame Gauntlets", ring1="Gelatinous Ring +1",
		body="Sacro Breastplate", hands="Volte Moufles", ring1="Moonlight Ring", ring2="Defending Ring",
		back="Shadow Mantle", waist="Carrier's Sash", legs="Volte Brayettes", feet="Volte Sollerets"}
		
     
	sets.Kiting = {lring="Shneddick Ring"}
	sets.passive.Reraise = {head="Crepuscular Helm",body="Crepuscular Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}-- head="Frenzy Sallet"
	sets.buff['Dark Seal'] = {head="Fall. Burgeonet +3"} 
     
	-- Engaged sets
	sets.engaged = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		-- Abyssal Beads +2
		head="Flam. Zucchetto +2", neck="Vim Torque +1", ear1="Dedition Earring",ear2="Cessance Earring",
		--body=gear.valorous_wsd_body, 
		body="Hjarrandi Breast.", hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.SomeAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.Acc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Hjarrandi Breast.", hands=gear.valorous_acc_hands,ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Fodder = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Asperity Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}

	sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
	-- Apocalypse	
	sets.engaged.Apocalypse = {--ammo="Aurgelmir Orb +1",
		-- Abyssal Beads +2
		head="Flam. Zucchetto +2", neck="Vim Torque +1", ear1="Dedition Earring",ear2="Cessance Earring",
		--body=gear.valorous_wsd_body, 
		body="Hjarrandi Breast.", hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.Apocalypse.SomeAcc = {}
	sets.engaged.Apocalypse.Acc = {}
	sets.engaged.Apocalypse.FullAcc = {}
	sets.engaged.Apocalypse.Fodder = {}
	
    sets.engaged.Apocalypse.AM = {--ammo="Aurgelmir Orb +1",
		-- Abyssal Beads +2
		head="Flam. Zucchetto +2", neck="Vim Torque +1", ear1="Dedition Earring",ear2="Cessance Earring",
		--body=gear.valorous_wsd_body, 
		body="Hjarrandi Breast.", hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.Apocalypse.SomeAcc.AM = {}
	sets.engaged.Apocalypse.Acc.AM = {}
	sets.engaged.Apocalypse.FullAcc.AM = {}
	sets.engaged.Apocalypse.Fodder.AM = {}
	
	sets.engaged.Apocalypse.PDT = {}
	sets.engaged.Apocalypse.SomeAcc.PDT = {}
	sets.engaged.Apocalypse.Acc.PDT = {}
	sets.engaged.Apocalypse.FullAcc.PDT = {}
	sets.engaged.Apocalypse.Fodder.PDT = {}
	
	sets.engaged.Apocalypse.PDT.AM = {}
	sets.engaged.Apocalypse.SomeAcc.PDT.AM = {}
	sets.engaged.Apocalypse.Acc.PDT.AM = {}
	sets.engaged.Apocalypse.FullAcc.PDT.AM = {}
	sets.engaged.Apocalypse.Fodder.PDT.AM = {}
	
	sets.engaged.Apocalypse.MDT = {}
	sets.engaged.Apocalypse.SomeAcc.MDT = {}
	sets.engaged.Apocalypse.Acc.MDT = {}
	sets.engaged.Apocalypse.FullAcc.MDT = {}
	sets.engaged.Apocalypse.Fodder.MDT = {}
	
	sets.engaged.Apocalypse.MDT.AM = {}
	sets.engaged.Apocalypse.SomeAcc.MDT.AM = {}
	sets.engaged.Apocalypse.Acc.MDT.AM = {}
	sets.engaged.Apocalypse.FullAcc.MDT.AM = {}
	sets.engaged.Apocalypse.Fodder.MDT.AM = {}
	
	--	Caladbolg
	sets.engaged.Caladbolg = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		-- Abyssal Beads +2
		head="Flam. Zucchetto +2", neck="Vim Torque +1", ear1="Dedition Earring",ear2="Cessance Earring",
		--body=gear.valorous_wsd_body, 
		body="Hjarrandi Breast.", hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Caladbolg.SomeAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.Caladbolg.Acc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Caladbolg.FullAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Hjarrandi Breast.", hands=gear.valorous_acc_hands,ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Caladbolg.Fodder = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Asperity Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.engaged.Caladbolg.PDT = {}
	sets.engaged.Caladbolg.SomeAcc.PDT = {}
	sets.engaged.Caladbolg.Acc.PDT = {}
	sets.engaged.Caladbolg.FullAcc.PDT = {}
	sets.engaged.Caladbolg.Fodder.PDT = {}

	sets.engaged.Caladbolg.MDT = {}
	sets.engaged.Caladbolg.SomeAcc.MDT = {}
	sets.engaged.Caladbolg.Acc.MDT = {}
	sets.engaged.Caladbolg.FullAcc.MDT = {}
	sets.engaged.Caladbolg.Fodder.MDT = {}
	
	-- Montante
	sets.engaged.Montante = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		-- Abyssal Beads +2
		head="Flam. Zucchetto +2", neck="Vim Torque +1", ear1="Dedition Earring",ear2="Cessance Earring",
		--body=gear.valorous_wsd_body, 
		body="Hjarrandi Breast.", hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Montante.SomeAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.Montante.Acc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Montante.FullAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Hjarrandi Breast.", hands=gear.valorous_acc_hands,ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Montante.Fodder = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Asperity Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.engaged.Montante.PDT = {}
	sets.engaged.Montante.SomeAcc.PDT = {}
	sets.engaged.Montante.Acc.PDT = {}
	sets.engaged.Montante.FullAcc.PDT = {}
	sets.engaged.Montante.Fodder.PDT = {}

	sets.engaged.Montante.MDT = {}
	sets.engaged.Montante.SomeAcc.MDT = {}
	sets.engaged.Montante.Acc.MDT = {}
	sets.engaged.Montante.FullAcc.MDT = {}
	sets.engaged.Montante.Fodder.MDT = {}
	
	-- Naegling
	sets.engaged.Naegling = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		-- Abyssal Beads +2
		head="Flam. Zucchetto +2", neck="Vim Torque +1", ear1="Dedition Earring",ear2="Cessance Earring",
		--body=gear.valorous_wsd_body, 
		body="Hjarrandi Breast.", hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Naegling.SomeAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.Naegling.Acc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Naegling.FullAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Hjarrandi Breast.", hands=gear.valorous_acc_hands,ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Naegling.Fodder = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Asperity Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.engaged.Naegling.PDT = {}
	sets.engaged.Naegling.SomeAcc.PDT = {}
	sets.engaged.Naegling.Acc.PDT = {}
	sets.engaged.Naegling.FullAcc.PDT = {}
	sets.engaged.Naegling.Fodder.PDT = {}

	sets.engaged.Naegling.MDT = {}
	sets.engaged.Naegling.SomeAcc.MDT = {}
	sets.engaged.Naegling.Acc.MDT = {}
	sets.engaged.Naegling.FullAcc.MDT = {}
	sets.engaged.Naegling.Fodder.MDT = {}
	
	-- Crepuscular Scythe
	sets.engaged.CrepuscularScythe = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		-- Abyssal Beads +2
		head="Flam. Zucchetto +2", neck="Vim Torque +1", ear1="Dedition Earring",ear2="Cessance Earring",
		--body=gear.valorous_wsd_body, 
		body="Hjarrandi Breast.", hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.CrepuscularScythe.SomeAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.CrepuscularScythe.Acc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.CrepuscularScythe.FullAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Hjarrandi Breast.", hands=gear.valorous_acc_hands,ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.CrepuscularScythe.Fodder = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Asperity Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.engaged.CrepuscularScythe.PDT = {}
	sets.engaged.CrepuscularScythe.SomeAcc.PDT = {}
	sets.engaged.CrepuscularScythe.Acc.PDT = {}
	sets.engaged.CrepuscularScythe.FullAcc.PDT = {}
	sets.engaged.CrepuscularScythe.Fodder.PDT = {}

	sets.engaged.CrepuscularScythe.MDT = {}
	sets.engaged.CrepuscularScythe.SomeAcc.MDT = {}
	sets.engaged.CrepuscularScythe.Acc.MDT = {}
	sets.engaged.CrepuscularScythe.FullAcc.MDT = {}
	sets.engaged.CrepuscularScythe.Fodder.MDT = {}
	
	-- Loxotic
	sets.engaged.Loxotic = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		-- Abyssal Beads +2
		head="Flam. Zucchetto +2", neck="Vim Torque +1", ear1="Dedition Earring",ear2="Cessance Earring",
		--body=gear.valorous_wsd_body, 
		body="Hjarrandi Breast.", hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Loxotic.SomeAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.Loxotic.Acc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Loxotic.FullAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Hjarrandi Breast.", hands=gear.valorous_acc_hands,ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.Loxotic.Fodder = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Asperity Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.engaged.Loxotic.PDT = {}
	sets.engaged.Loxotic.SomeAcc.PDT = {}
	sets.engaged.Loxotic.Acc.PDT = {}
	sets.engaged.Loxotic.FullAcc.PDT = {}
	sets.engaged.Loxotic.Fodder.PDT = {}

	sets.engaged.Loxotic.MDT = {}
	sets.engaged.Loxotic.SomeAcc.MDT = {}
	sets.engaged.Loxotic.Acc.MDT = {}
	sets.engaged.Loxotic.FullAcc.MDT = {}
	sets.engaged.Loxotic.Fodder.MDT = {}
	
	-- Kraken Club
	sets.engaged.KrakenClub = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		-- Abyssal Beads +2
		head="Flam. Zucchetto +2", neck="Vim Torque +1", ear1="Dedition Earring",ear2="Cessance Earring",
		--body=gear.valorous_wsd_body, 
		body="Hjarrandi Breast.", hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.KrakenClub.SomeAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.KrakenClub.Acc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.KrakenClub.FullAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Hjarrandi Breast.", hands=gear.valorous_acc_hands,ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.KrakenClub.Fodder = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Asperity Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.engaged.KrakenClub.PDT = {}
	sets.engaged.KrakenClub.SomeAcc.PDT = {}
	sets.engaged.KrakenClub.Acc.PDT = {}
	sets.engaged.KrakenClub.FullAcc.PDT = {}
	sets.engaged.KrakenClub.Fodder.PDT = {}

	sets.engaged.KrakenClub.MDT = {}
	sets.engaged.KrakenClub.SomeAcc.MDT = {}
	sets.engaged.KrakenClub.Acc.MDT = {}
	sets.engaged.KrakenClub.FullAcc.MDT = {}
	sets.engaged.KrakenClub.Fodder.MDT = {}
	
	-- Lycurgos
	-- Kraken Club
	sets.engaged.KrakenClub = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		-- Abyssal Beads +2
		head="Flam. Zucchetto +2", neck="Vim Torque +1", ear1="Dedition Earring",ear2="Cessance Earring",
		--body=gear.valorous_wsd_body, 
		body="Hjarrandi Breast.", hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.KrakenClub.SomeAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.KrakenClub.Acc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.KrakenClub.FullAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Hjarrandi Breast.", hands=gear.valorous_acc_hands,ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.KrakenClub.Fodder = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Asperity Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.engaged.KrakenClub.PDT = {}
	sets.engaged.KrakenClub.SomeAcc.PDT = {}
	sets.engaged.KrakenClub.Acc.PDT = {}
	sets.engaged.KrakenClub.FullAcc.PDT = {}
	sets.engaged.KrakenClub.Fodder.PDT = {}

	sets.engaged.KrakenClub.MDT = {}
	sets.engaged.KrakenClub.SomeAcc.MDT = {}
	sets.engaged.KrakenClub.Acc.MDT = {}
	sets.engaged.KrakenClub.FullAcc.MDT = {}
	sets.engaged.KrakenClub.Fodder.MDT = {}
	
	-- AeolianEdge
	
	-- Kraken Club
	sets.engaged.AeolianEdge = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		-- Abyssal Beads +2
		head="Flam. Zucchetto +2", neck="Vim Torque +1", ear1="Dedition Earring",ear2="Cessance Earring",
		--body=gear.valorous_wsd_body, 
		body="Hjarrandi Breast.", hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.AeolianEdge.SomeAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.engaged.AeolianEdge.Acc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Flamma Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1", legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.AeolianEdge.FullAcc = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Hjarrandi Breast.", hands=gear.valorous_acc_hands,ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.da_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    sets.engaged.AeolianEdge.Fodder = {ammo="Seeth. Bomblet +1", --ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2", neck="Asperity Necklace",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",  hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.da_jse_back, waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.engaged.AeolianEdge.PDT = {}
	sets.engaged.AeolianEdge.SomeAcc.PDT = {}
	sets.engaged.AeolianEdge.Acc.PDT = {}
	sets.engaged.AeolianEdge.FullAcc.PDT = {}
	sets.engaged.AeolianEdge.Fodder.PDT = {}

	sets.engaged.AeolianEdge.MDT = {}
	sets.engaged.AeolianEdge.SomeAcc.MDT = {}
	sets.engaged.AeolianEdge.Acc.MDT = {}
	sets.engaged.AeolianEdge.FullAcc.MDT = {}
	sets.engaged.AeolianEdge.Fodder.MDT = {}
	
--Example sets:
--[[

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Liberator melee sets
    
	
]]--
	--Extra Special Sets
	
	sets.buff.Souleater = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {} -- head="Frenzy Sallet"
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Naegling = {main="Naegling", sub="Blurred Shield +1"}
	sets.weapons.Montante = {main="Montante +1", sub="Utu Grip"}
	sets.weapons.Apocalypse = {main="Apocalypse",sub="Utu Grip"}
	sets.weapons.Liberator = {main="Liberator", sub="Utu Grip"}
	sets.weapons.Redemption = {main="Redemption", sub="Utu Grip"}
	sets.weapons.Anguta = {main="Anguta", sub="Utu Grip"}
	sets.weapons.FatherTime = {main="Father Time", sub="Utu Grip"}
	sets.weapons.CrepuscularScythe = {main="Crepuscular Scythe",sub="Utu Grip"}
	sets.weapons.Caladbolg = {main="Caladbolg",sub="Utu Grip"}
	sets.weapons.Ragnarok = {main="Ragnarok", sub="Utu Grip"}
	sets.weapons.KrakenClub = {main="Kraken Club",sub="Blurred Shield +1"}
	sets.weapons.Loxotic = {main="Loxotic Mace +1", sub="Blurred Shield +1"}
	sets.weapons.Lycurgos = {main="Lycurgos",sub="Blurred Shield +1"}
	sets.weapons.AeolianEdge = {main="Ternion Dagger +1",sub="Blurred Shield +1"}
	
	-- Proc Weapons
	sets.weapons.ProcStaff = {main="Aern Staff"}
	sets.weapons.ProcClub = {main="Rounsey Wand"} -- Kraken Club
	sets.weapons.ProcDagger = {main="Mercurial Kris"}
	sets.weapons.ProcSword = {main="Ridill",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Bahamut Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Aern Spear",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Zanmato",sub=empty}
	
end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(2, 15)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 15)
	elseif player.sub_job == 'DRG' then
        set_macro_page(3, 15)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 15)
    elseif player.sub_job == 'THF' then
        set_macro_page(5, 15)
    else
        set_macro_page(1, 15)
    end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 015')
end

function job_setup()

    state.Buff.Souleater = buffactive.Souleater or false
    state.Buff['Dark Seal'] = buffactive['Dark Seal'] or false
	state.Buff['Nether Void'] = buffactive['Nether Void'] or false
    state.Buff['Aftermath'] = buffactive['Aftermath'] or false
    state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
	state.Stance = M{['description']='Stance','Hasso','Seigan','None'}
	state.DrainSwapWeaponMode = M{'Never','300','1000','Always'}
	
	autows = 'Resolution'
	autofood = 'Soy Ramen'
	
	update_melee_groups()

	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoNukeMode","AutoStunMode","AutoDefenseMode",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","Stance","IdleMode","Passive","RuneElement","DrainSwapWeaponMode","CastingMode","TreasureMode",})
end
	
	
	autows_list = {		}