-- Setup vars that are user-dependent.  Can override this function in a sidecar.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('None','Gridarvor','Nirvana','Hvergelmir')
	
	-- Avatar Ammo 
	gear.avatar_ammo = {name="Sancus Sachet +1"}
	-- Staves 
	gear.perp_staff = 		{name="Nirvana"}
	gear.skill_staff = 		{name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}}
	-- Nirvana 
	gear.phys_BP_Staff = 	{name="Nirvana"}
	-- Grioavolr BPD +10  Nirvana
	gear.magic_BP_Staff = 	{name="Nirvana"}
	gear.macc_BP_Staff = 	{name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}}

	-- JSE capes 
	-- Target skil +5  bp dely -3
	gear.jse_back = 		{name="Conveyance Cape", augments={'Summoning magic skill +4','Blood Pact Dmg.+2','Blood Pact ab. del. II -3',}}
	
	-- Ambuscade Cape
	gear.magic_jse_back = 	{name="Campestres's Cape",augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.phys_jse_back = 	{name="Campestres's Cape",augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Haste+10','Pet: Damage taken -5%',}}
	gear.FC_jse_back = 		{name="Campestres's Cape",augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}}
	gear.Cure_jse_back = 	{name="Campestres's Cape", augments={'MND+20','"Cure" potency +10%',}}
	gear.ws_jse_back = 		{name="Campestres's Cape",augments={'MP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}}
	
	gear.phys_BP_feet = 	{name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}}
	gear.magic_BP_feet = 	{name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}
	
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
	
	-- Additional Binds
	send_command('bind !` gs c toggle PactSpamMode')
	send_command('bind @` gs c cycle MagicBurst')
	send_command('bind ^` gs c toggle PactSpamMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	
	--send_command('alias aoe input /targetnpc;send @all /ma "Thunderspark" <t>')
	--send_command('alias stun input /targetnpc;send @all /ma "Thunderspark" <t>')
	select_default_macro_book()
	user_job_lockstyle()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="Glyphic Horn +3"}
    
    sets.precast.JA['Elemental Siphon'] = {main=gear.skill_staff, sub="Vox Grip", ammo="Esper Stone +1",
        head=gear.telchine_head_Siphon, neck="Incanter's Torque", ear1="Andoaa Earring",ear2="Gifted Earring",
		-- hands="Baayami Cuffs"
        body=gear.telchine_body_Siphon, hands="Glyphic Bracers +3", ring1="Evoker's Ring", ring2="Stikini Ring +1",
        back=gear.jse_back,waist="Lucidity Sash", legs=gear.telchine_legs_Siphon,feet="Beck. Pigaches +1"}

    sets.precast.JA['Mana Cede'] = {hands="Beck. Bracers +1"}

    -- Pact delay reduction gear
	-- 
    sets.precast.BloodPactWard = {main="Gridarvor",sub="Vox Grip",ammo=gear.avatar_ammo,
		head="Beckoner's Horn +1", neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Evans Earring",
        -- hands="Baayami Cuffs",
		body="Con. Doublet +3", hands="Glyphic Bracers +3", ring1="Evoker's Ring",ring2="Stikini Ring +1",
        -- legs="Baayami Slops", feet="Baayami Sabots"
		back=gear.jse_back, waist="Lucidity Sash", legs="Glyphic Spats +3", feet="Glyph. Pigaches +3"}

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells    
    sets.precast.FC = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1", ammo="Impatiens",		
		head=gear.merlinic_fc_head,neck="Orunmila's Torque",ear1="Malignance Earring", ear2="Enchntr. Earring +1",
		body="Zendik Robe", hands="Volte Gloves", ring1="Kishar Ring", ring2="Prolix Ring",
		gear.FC_jse_back, waist="Witful Belt", legs="Volte Brais", feet=gear.merlinic_fc_feet}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {sub="Clerisy Strap +1"})--main="Serenity",
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat", waist="Siegel Sash"})

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})


    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		-- Nyame Helm
		head="Merlinic Hood", neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Ishvara Earring",
		-- Nyame Mail Nyame Gauntlets 
		body="Amalric Doublet +1",hands="Amalric Gages +1", ring1="Epaminondas's Ring", ring2="Shiva Ring +1",
		-- Nyame Flanchard  Nyame Sollerets
		back=gear.ws_jse_back, waist="Eschan Stone", legs="Amalric Slops +1", feet="Amalric Nails +1"}

    -- Specific weaponskill sets.  
	sets.precast.WS['Garland of Bliss'] = {ammo=gear.avatar_ammo, 
        head="Merlinic Hood", neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Ishvara Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", ring1="Epaminondas's Ring", ring2="Shiva Ring +1",
		back=gear.ws_jse_back, waist="Eschan Stone", legs="Amalric Slops +1", feet="Amalric Nails +1"}
	  
	sets.precast.WS['Shattersoul'] = {ammo=gear.avatar_ammo, 
		head="Merlinic Hood", neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Ishvara Earring",
		body="Amalric Doublet +1", hands="Amalric Gages +1", ring1="Epaminondas's Ring", ring2="Shiva Ring +1",
		back=gear.ws_jse_back, waist="Eschan Stone", legs="Amalric Slops +1", feet="Amalric Nails +1"}
		
	--Uses the base set if an appropriate WSMod version isn't found. MP + Gear
    sets.precast.WS['Myrkr'] = {main="Hvergelmir", sub="Khonsu", ammo=gear.avatar_ammo, 
        head="Beckoner's Horn +1",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Gifted Earring",
		body="Con. Doublet +3",hands="Lamassu Mitts +1 +1", ring1="Mephitas's Ring +1", ring2="Mephitas's Ring",
		back=gear.ws_jse_back, waist="Luminary Sash", legs="Beck. Spats +1", feet="Beck. Pigaches +1"}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff, sub="Clerisy Strap +1",
		head=gear.merlinic_fc_head,neck="Orunmila's Torque",ear1="Malignance Earring", ear2="Enchntr. Earring +1",
		body="Zendik Robe", hands="Volte Gloves", ring1="Kishar Ring", ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs="Volte Brais",feet="Regal Pumps +1"}
	
    sets.midcast.Cure = {main="Daybreak", sub="Sors Shield",
		head="Vanya Hood", neck="Incanter's Torque", ear1="Mendicant's Earring", ear2="Gifted Earring",
        body="Annoint. Kalasiris",hands=gear.telchine_hands_Cure,ring1="Mephitas's Ring +1",ring2="Sirona's Ring",
        back=gear.Cure_jse_back,waist="Shinjustsu-no-obi +1",legs="Gyve Trousers", feet="Vanya Clogs"}
		
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		--neck="Debilis Medallion",
		-- ring1="Haoma's Ring", ring2="Haoma's Ring", 
		hands="Hieros Mittens",
		back=gear.Cure_jse_back,waist="Witful Belt"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",})--sub="Clemency Grip"

	sets.midcast.Impact = {main="Maxentius", sub="Ammurapi Shield", ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring", ear2="Malignance Earring",
		body="Crepuscular Cloak",hands="Regal Cuffs",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Amalric Slops +1",feet="Amalric Nails +1"}
	
	sets.midcast['Elemental Magic'] = {main="Oranyan",sub="Khonsu", 
        head="Inyanga Tiara +2",neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Inyanga Jubbah +2",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.Cure_jse_back,waist="Luminary Sash",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Oranyan",sub="Khonsu",ammo="Pemphredo Tathlum",
        head="Inyanga Tiara +2",neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Inyanga Jubbah +2",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.Cure_jse_back,waist="Luminary Sash",legs="Amalric Slops +1",feet="Amalric Nails +1"}

    sets.midcast['Divine Magic'] = {main="Oranyan",sub="Khonsu", ammo="Pemphredo Tathlum",
        head="Inyanga Tiara +2",neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Inyanga Jubbah +2",hands="Amalric Gages +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.Cure_jse_back,waist="Luminary Sash",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",
        head="Inyanga Tiara +2",neck="Incanter's Torque",ear1="Malignance Earring",ear2="Enchntr. Earring +1",
        body="Inyanga Jubbah +2",hands="Amalric Gages +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.Cure_jse_back,waist="Luminary Sash",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
	sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",
        head="Pixie Hairpin +1",neck="Incanter's Torque", ear1="Digni. Earring", ear2="Enchntr. Earring +1",
        body="Inyanga Jubbah +2",hands="Amalric Gages +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.Cure_jse_back,waist="Fucho-no-obi",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
    sets.midcast.Aspir = sets.midcast.Drain
		
    sets.midcast.Stun = {main="Oranyan",sub="Khonsu",
		head="Inyanga Tiara +2",neck="Orunmila's Torque",ear1="Malignance Earring",ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2",hands="Amalric Gages +1",ring1="Stikini Ring +1",ring2="Prolix Ring",
		back=gear.FC_jse_back,waist="Witful Belt",legs=gear.chironic_macc_legs,feet="Amalric Nails +1"}
		
    sets.midcast.Stun.Resistant = {main="Oranyan",sub="Khonsu",ammo="Sapience Orb",
		head="Inyanga Tiara +2",neck="Orunmila's Torque",ear1="Malignance Earring",ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2",hands="Amalric Gages +1",ring1="Stikini Ring +1",ring2="Prolix Ring",
		back=gear.Cure_jse_back,waist="Witful Belt",legs=gear.chironic_macc_legs,feet="Amalric Nails +1"}
		
	sets.midcast['Enfeebling Magic'] = {main="Daybreak", sub="Ammurapi Shield",
        head="Inyanga Tiara +2",neck="Incanter's Torque",ear1="Digni. Earring",ear2="Enchntr. Earring +1",
        body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2", ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.Cure_jse_back, waist="Luminary Sash",legs=gear.chironic_macc_legs, feet="Inyan. Crackows +2"}
	
	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak", sub="Ammurapi Shield",
        head="Inyanga Tiara +2",neck="Incanter's Torque",ear1="Digni. Earring",ear2="Enchntr. Earring +1",
        body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2", ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.Cure_jse_back, waist="Luminary Sash",legs=gear.chironic_macc_legs, feet="Inyan. Crackows +2"}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast['Enhancing Magic'] = {main=empty,sub="Ammurapi Shield",ammo="Sapience Orb",
		head=gear.telchine_head_Duration, neck="Incanter's Torque", ear1="Andoaa Earring",ear2="Gifted Earring",
		body=gear.telchine_body_Duration,hands=gear.telchine_hands_Duration,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.FC_jse_back,waist="Olympus Sash",legs=gear.telchine_legs_Duration,feet=gear.telchine_feet_Duration}
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod", head="Amalric Coif +1", hands="Regal Cuffs"})--waist="Emphatikos Rope",
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash",neck="Nodens Gorget",legs="Shedir Seraweels"})--,ear2="Earthcry Earring",
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    -- Avatar pact sets.  All pacts are Ability type.
    -- Skill
    sets.midcast.Pet.BloodPactWard = {main=gear.skill_staff,sub="Vox Grip",ammo=gear.avatar_ammo,
		head="Beckoner's Horn +1", neck="Incanter's Torque", ear1="Andoaa Earring", ear2="Gifted Earring",
		--hands="Baayami Cuffs",
        body="Beck. Doublet +1", hands="Lamassu Mitts +1", ring1="Evoker's Ring", ring2="Stikini Ring +1",
        -- legs="Baayami Slops",feet="Baayami Sabots"
		back=gear.jse_back, waist="Lucidity Sash", legs="Beck. Spats +1", feet="Rubeus Boots"}
	
	-- Pet Macc/Skill
    sets.midcast.Pet.DebuffBloodPactWard = {main=gear.macc_BP_Staff, sub="Vox Grip", ammo=gear.avatar_ammo,
        head="Convoker's Horn +3", neck="Adad Amulet", ear1="Enmerkar Earring", ear2="Lugalbanda Earring",
        body="Con. Doublet +3", hands="Apogee Mitts +1",ring1="Evoker's Ring", ring2="Stikini Ring +1",
        back=gear.magic_jse_back, waist="Regal Belt", legs="Convo. Spats +3", feet="Convo. Pigaches +3"}
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
	-- Physical 
    sets.midcast.Pet.PhysicalBloodPactRage = {main=gear.phys_BP_Staff,sub="Elan Strap +1",ammo=gear.avatar_ammo,
		head=gear.helios_head_BP, neck="Shulmanu Collar", ear1="Gelos Earring", ear2="Lugalbanda Earring",
		body="Con. Doublet +3", hands=gear.merlinic_physpact_hands, ring1="Varar Ring +1",ring2="Varar Ring +1",
        back=gear.phys_jse_back, waist="Incarnation Sash", legs="Apogee Slacks +1", feet=gear.phys_BP_feet}
		
    sets.midcast.Pet.PhysicalBloodPactRage.Acc = {main=gear.phys_BP_Staff,sub="Elan Strap +1",ammo=gear.avatar_ammo,
        head="Apogee Crown +1", neck="Shulmanu Collar", ear1="Gelos Earring", ear2="Lugalbanda Earring",
		body="Con. Doublet +3", hands=gear.merlinic_physpact_hands, ring1="Varar Ring +1", ring2="Varar Ring +1",
        back=gear.phys_jse_back, waist="Incarnation Sash", legs="Apogee Slacks +1", feet="Convo. Pigaches +3"}
 
	-- Magical 
    sets.midcast.Pet.MagicalBloodPactRage = {main=gear.magic_BP_Staff,sub="Elan Strap +1",ammo=gear.avatar_ammo,
		head="Apogee Crown +1", neck="Adad Amulet", ear1="Gelos Earring", ear2="Lugalbanda Earring",
        body="Con. Doublet +3", hands=gear.merlinic_magpact_hands, ring1="Varar Ring +1",ring2="Varar Ring +1",
		back=gear.magic_jse_back, waist="Regal Belt", legs="Enticer's Pants", feet=gear.magic_BP_feet}

    sets.midcast.Pet.MagicalBloodPactRage.Acc = {feet="Convo. Pigaches +3"}

	sets.midcast.Pet['Flaming Crush'] = {main=gear.phys_BP_Staff,sub="Elan Strap +1",ammo=gear.avatar_ammo,
		head="Apogee Crown +1", neck="Adad Amulet", ear1="Gelos Earring", ear2="Lugalbanda Earring",
        body="Con. Doublet +3", hands=gear.merlinic_magpact_hands, ring1="Varar Ring +1",ring2="Varar Ring +1",
		back=gear.magic_jse_back, waist="Regal Belt", legs="Enticer's Pants", feet=gear.magic_BP_feet}
	
	sets.midcast.Pet['Flaming Crush'].Acc = {feet="Convo. Pigaches +3"}
   
	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Mountain Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})

	 -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {legs="Glyphic Spats +3"}
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {legs="Glyphic Spats +3"})

    sets.midcast.Pet['Elemental Magic'].Resistant = {}
	
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {main="Chatoyant Staff",sub="Vox Grip",ammo=gear.avatar_ammo,
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands="Asteria Mitts +1",ring1="Inyanga Ring",ring2="Defending Ring",
		-- feet="Baayami Sabots"
        back=gear.FC_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}
    
    -- Idle sets
    sets.idle = {main="Gridarvor",sub="Vox Grip",ammo=gear.avatar_ammo,
        head="Convoker's Horn +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands="Asteria Mitts +1",ring1="Inyanga Ring",ring2="Defending Ring",
		-- feet="Baayami Sabots"
        back=gear.FC_jse_back,waist="Carrier's Sash",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}
    
    sets.idle.PDT = {main="Gridarvor",sub="Vox Grip",ammo=gear.avatar_ammo,
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Udug Jacket",hands="Inyanga Dastanas +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.FC_jse_back,waist="Regal Belt",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}

    -- perp costs:
    -- spirits: 7
    -- carby: 11 (5 with mitts)
    -- fenrir: 13
    -- others: 15
    -- avatar's favor: -4/tick
    
    -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
    -- Aim for -14 perp, and refresh in other slots.
    
    -- -perp gear:
    -- Gridarvor: -5
    -- Glyphic Horn +3: -4
    -- Caller's Doublet +2/Glyphic Doublet: -4
    -- Evoker's Ring: -1
    -- Convo. Pigaches +3 +1: -4
    -- total: -18
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    
    sets.idle.Avatar = {main="Nirvana", sub="Vox Grip",ammo=gear.avatar_ammo,
        head="Convoker's Horn +3",neck="Caller's Pendant",ear1="Etiolation Earring",ear2="Evans Earring",
        body="Apo. Dalmatica +1",hands="Asteria Mitts +1",ring1="Evoker's Ring",ring2="Defending Ring",
		back=gear.jse_back,waist="Lucidity Sash",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}
		
	sets.idle.PDT.Avatar = {main="Nirvana", sub="Khonsu",ammo=gear.avatar_ammo,
        head="Convoker's Horn +3",neck="Loricate Torque +1",ar1="Handler's Earring +1",ear2="Handler's Earring",
        body="Apo. Dalmatica +1",hands="Asteria Mitts +1",ring1="Inyanga Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Regal Belt",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}

    sets.idle.Spirit = {main="Nirvana",sub="Vox Grip",ammo=gear.avatar_ammo,
        head="Convoker's Horn +3",neck="Caller's Pendant",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Apo. Dalmatica +1",hands="Asteria Mitts +1",ring1="Evoker's Ring",ring2="Sheltered Ring",
		back=gear.jse_back,waist="Lucidity Sash",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}
		
    sets.idle.PDT.Spirit = {main="Nirvana", sub="Vox Grip",ammo=gear.avatar_ammo,
		head="Convoker's Horn +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Evans Earring",
        body="Apo. Dalmatica +1",hands="Asteria Mitts +1",ring1="Inyanga Ring",ring2="Defending Ring",
		back=gear.FC_jse_back,waist="Lucidity Sash",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}
		
	--sets.idle.TPEat.Avatar = set_combine(sets.idle.Avatar, {})--neck="Chrys. Torque"
		
	--Favor always up and head is best in slot idle so no specific items here at the moment.
    sets.idle.Avatar.Favor = {head="Beckoner's Horn +1"}
    sets.idle.Avatar.Engaged = {head="Beckoner's Horn +1"}
	
	sets.idle.Avatar.Engaged.Carbuncle = {hands="Asteria Mitts +1"}
	sets.idle.Avatar.Engaged['Cait Sith'] = {hands="Lamassu Mitts +1"}
        
    sets.perp = {}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {}
    sets.perp.Weather = {}
	
	sets.perp.Carbuncle = {hands="Asteria Mitts +1"}
    sets.perp.Diabolos = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

	-- Not really used anymore, was for the days of specific staves for specific avatars.
    sets.perp.staff_and_grip = {}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.avatar_ammo,
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Handler's Earring +1",ear2="Handler's Earring",
        -- 
		body="Udug Jacket",hands="Inyanga Dastanas +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.FC_jse_back, waist="Regal Belt", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
    sets.defense.MDT = {ammo=gear.avatar_ammo,
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Handler's Earring +1",ear2="Handler's Earring",
        body="Udug Jacket",hands="Inyanga Dastanas +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.FC_jse_back, waist="Regal Belt", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
    sets.defense.MEVA = {ammo=gear.avatar_ammo,
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Handler's Earring +1",ear2="Handler's Earring",
        body="Udug Jacket", hands="Inyanga Dastanas +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=gear.FC_jse_back, waist="Regal Belt", legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		
	sets.Kiting = {lring="Shneddick Ring"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--[[sets.HPDown = {head="Apogee Crown +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Seidr Cotehardie",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back=gear.FC_jse_back,legs="Apogee Slacks +1",feet="Apogee Pumps +1"]]
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Sacrifice Torque"}

	-- Weapons sets
	sets.weapons.Gridarvor = 	{main="Gridarvor", 	sub="Khonsu", ammo=gear.avatar_ammo}
	sets.weapons.Nirvana = 		{main="Nirvana", 	sub="Khonsu", ammo=gear.avatar_ammo}
	sets.weapons.Hvergelmir = 	{main="Hvergelmir", sub="Khonsu", ammo=gear.avatar_ammo}
	
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = {main="Nirvana",sub="Khonsu", ammo=gear.avatar_ammo,
        head="Convoker's Horn +3", neck="Shulmanu Collar", ear1="Digni. Earring", ear2="Telos Earring",
        body="Con. Doublet +3", hands="Convo. Bracers +3",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        --waist="Olseni Belt",
		back=gear.phys_jse_back, waist="Windbuffet belt +1", legs="Convo. Spats +3",feet="Convo. Pigaches +3"}
	sets.engaged.Acc = {main="Nirvana",sub="Khonsu",ammo=gear.avatar_ammo,
        head="Convoker's Horn +3", neck="Shulmanu Collar", ear1="Digni. Earring", ear2="Telos Earring",
        body="Con. Doublet +3", hands="Convo. Bracers +3",ring1="Varar Ring +1",ring2="Varar Ring +1",
        --waist="Olseni Belt",
		back=gear.phys_jse_back, waist="Windbuffet belt +1", legs="Convo. Spats +3",feet="Convo. Pigaches +3"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
		set_macro_page(1, 7)
    end
    
    -- Default macro set/book
    set_macro_page(1, 7)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 007')
end

-- Also, you'll need the Shortcuts addon to handle the auto-targetting of the custom pact commands.

--[[
    Custom commands:
    
    gs c petweather
        Automatically casts the storm appropriate for the current avatar, if possible.
    
    gs c siphon
        Automatically run the process to: dismiss the current avatar; cast appropriate
        weather; summon the appropriate spirit; Elemental Siphon; release the spirit;
        and re-summon the avatar.
        
        Will not cast weather you do not have access to.
        Will not re-summon the avatar if one was not out in the first place.
        Will not release the spirit if it was out before the command was issued.
        
    gs c pact [PactType]
        Attempts to use the indicated pact type for the current avatar.
        PactType can be one of:
            cure
            curaga
            buffOffense
            buffDefense
            buffSpecial
			buffSpecial2
            debuff1
            debuff2
            sleep
            nuke2
            nuke4
            bp70
            bp75 (merits and lvl 75-80 pacts)
			bp99 (newly released offensive pacts)
			physical (most commonly used physical pact by avatar)
			magical (most commonly used magical pact by avatar)
            astralflow

--]]

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

    state.Buff["Avatar's Favor"] = buffactive["Avatar's Favor"] or false
    state.Buff["Astral Conduit"] = buffactive["Astral Conduit"] or false
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false

    avatars = S{"Carbuncle", "Fenrir", "Diabolos", "Ifrit", "Titan", "Leviathan", "Garuda", "Shiva", "Ramuh", "Odin", "Alexander", "Cait Sith", "Siren"}
    spirits = S{"LightSpirit", "DarkSpirit", "FireSpirit", "EarthSpirit", "WaterSpirit", "AirSpirit", "IceSpirit", "ThunderSpirit"}
	spirit_of = {['Light']="Light Spirit", ['Dark']="Dark Spirit", ['Fire']="Fire Spirit", ['Earth']="Earth Spirit",
        ['Water']="Water Spirit", ['Wind']="Air Spirit", ['Ice']="Ice Spirit", ['Lightning']="Thunder Spirit"}

    magicalRagePacts = S{
		'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen','Clarsach Call','Impact',
		'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
		'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
		'Thunderspark','Burning Strike','Meteorite','Nether Blast','Flaming Crush',
		'Meteor Strike','Conflag Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm',
		'Holy Mist','Lunar Bay','Night Terror','Level ? Holy','Tornado II','Sonic Buffet'}

    pacts = {}
    pacts.cure = {['Carbuncle']='Healing Ruby'}
    pacts.curaga = {['Carbuncle']='Healing Ruby II', ['Garuda']='Whispering Wind', ['Leviathan']='Spring Water'}
    pacts.buffoffense = {['Carbuncle']='Glittering Ruby', ['Ifrit']='Crimson Howl', ['Garuda']='Hastega II', ['Ramuh']='Rolling Thunder',
		['Fenrir']='Ecliptic Growl', ['Siren']='Katabatic Blades'}
    pacts.buffdefense = {['Carbuncle']='Shining Ruby', ['Shiva']='Frost Armor', ['Garuda']='Aerial Armor', ['Titan']='Earthen Ward',
		['Ramuh']='Lightning Armor', ['Fenrir']='Ecliptic Howl', ['Diabolos']='Noctoshield', ['Cait Sith']='Reraise II', ['Siren']="Wind's Blessing"}
    pacts.buffspecial = {['Ifrit']='Inferno Howl', ['Garuda']='Fleet Wind', ['Titan']='Earthen Armor', ['Diabolos']='Dream Shroud',
		['Carbuncle']='Soothing Ruby', ['Fenrir']='Heavenward Howl', ['Cait Sith']='Raise II', ['Siren']='Chinook'}
	pacts.buffspecial2 = {['Carbuncle']='Pacifying Ruby',['Leviathan']='Soothing Current',['Shiva']='Crystal Blessing'}
    pacts.debuff1 = {['Shiva']='Diamond Storm', ['Ramuh']='Shock Squall', ['Leviathan']='Tidal Roar', ['Fenrir']='Lunar Cry',
		['Diabolos']='Pavor Nocturnus', ['Cait Sith']='Eerie Eye', ['Siren']='Lunatic Voice'}
    pacts.debuff2 = {['Shiva']='Sleepga', ['Leviathan']='Slowga', ['Fenrir']='Lunar Roar', ['Diabolos']='Somnolence', ['Ramuh']='Thunderspark',
		['Siren']='Bitter Elegy'}
    pacts.sleep = {['Shiva']='Sleepga', ['Diabolos']='Nightmare', ['Cait Sith']='Mewing Lullaby'}
    pacts.nuke2 = {['Ifrit']='Fire II', ['Shiva']='Blizzard II', ['Garuda']='Aero II', ['Titan']='Stone II',
		['Ramuh']='Thunder II', ['Leviathan']='Water II', ['Siren']='Tornado II'}
    pacts.nuke4 = {['Ifrit']='Fire IV', ['Shiva']='Blizzard IV', ['Garuda']='Aero IV', ['Titan']='Stone IV',
		['Ramuh']='Thunder IV', ['Leviathan']='Water IV', ['Siren']='Torando II'}
    pacts.bp70 = {['Ifrit']='Flaming Crush', ['Shiva']='Rush', ['Garuda']='Predator Claws', ['Titan']='Mountain Buster',
		['Ramuh']='Chaotic Strike', ['Leviathan']='Spinning Dive', ['Carbuncle']='Meteorite', ['Fenrir']='Eclipse Bite',
		['Diabolos']='Nether Blast',['Cait Sith']='Regal Scratch'}
    pacts.bp75 = {['Ifrit']='Meteor Strike', ['Shiva']='Heavenly Strike', ['Garuda']='Wind Blade', ['Titan']='Geocrush',
		['Ramuh']='Thunderstorm', ['Leviathan']='Grand Fall', ['Carbuncle']='Holy Mist', ['Fenrir']='Lunar Bay',
		['Diabolos']='Night Terror', ['Cait Sith']='Level ? Holy'}
	pacts.bp99 = {['Ifrit']='Conflag Strike',['Titan']='Crag Throw',['Ramuh']='Volt Strike', ['Siren']='Hysteric Assault'}
    pacts.astralflow = {['Ifrit']='Inferno', ['Shiva']='Diamond Dust', ['Garuda']='Aerial Blast', ['Titan']='Earthen Fury',
		['Ramuh']='Judgment Bolt', ['Leviathan']='Tidal Wave', ['Carbuncle']='Searing Light', ['Fenrir']='Howling Moon',
		['Diabolos']='Ruinous Omen', ['Cait Sith']="Altana's Favor"}
	
	--Most commonly used offensive pacts by avatar split into two categories.
	pacts.physical = {['Carbuncle']='Poison Nails',['Fenrir']='Eclipse Bite',['Ifrit']='Flaming Crush',['Titan']='Mountain Buster',
		['Leviathan']='Spinning Dive',['Garuda']='Predator Claws',['Shiva']='Rush',['Ramuh']='Volt Strike',['Diabolos']='Blindside',
		['Cait Sith']='Regal Gash',['Siren']='Hysteric Assault'}
	pacts.magical = {['Carbuncle']='Holy Mist',['Fenrir']='Lunar Bay',['Ifrit']='Meteor Strike',['Titan']='Geocrush',
		['Leviathan']='Grand Fall',['Garuda']='Wind Blade',['Shiva']='Heavenly Strike',['Ramuh']='Thunderstorm',['Diabolos']='Nether Blast',
		['Cait Sith']='Level ? Holy',['Siren']='Sonic Buffet'}

	ConduitLock = true
	ConduitLocked = nil
	state.PactSpamMode = M(false, 'Pact Spam Mode')
	state.AutoFavor = M(true, 'Auto Favor')
	state.AutoConvert = M(true, 'Auto Convert')
	
	autows = 'Spirit Taker'
	autofood = 'Akamochi'
	
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoNukeMode","PactSpamMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode"},{"AutoBuffMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","ElementalMode","CastingMode","TreasureMode",})
end
