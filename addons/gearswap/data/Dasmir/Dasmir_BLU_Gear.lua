function user_setup()
	-- Options: Override default values
	state.OffenseMode:options('Fodder','Normal','Acc')
	state.HybridMode:options('Normal','DT')
    state.WeaponskillMode:options('Match','Normal','Acc','Fodder')
    state.CastingMode:options('Normal','Resistant','Fodder')
    state.IdleMode:options('Normal','Sphere','DT','DTHippo')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Naegling','MeleeClub','MagicWeapons','DualNaegling','DualMagicWeapons','DualMeleeClubs','DualMaccWeapons','HybridWeapons')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'MP','SuppaBrutal', 'DWEarrings','DWMax'}

	-- Ambuscade Cape
	-- {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.da_jse_back = 	gear.stp_jse_back
	gear.stp_jse_back =	 {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	-- {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	gear.dw_jse_back =	gear.stp_jse_back
	-- {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	gear.crit_jse_back = gear.wsd_jse_back
	gear.wsd_jse_back = 	{name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%','Damage taken-5%',}}
	gear.mab_jse_back = 	{name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
	gear.FC_jse_back = 		{name="Rosmerta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}}
	-- {name="Rosmerta's Cape",augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Cure" potency +10%',}}
	gear.cure_jse_back = 	gear.FC_jse_back

--[[Additional binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key]]	
	
	send_command('bind ^` input /ja "Chain Affinity" <me>')
	send_command('bind @` input /ja "Efflux" <me>')
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
    send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons Almace;gs c update')
	send_command('bind !q gs c weapons HybridWeapons;gs c update')
	
	-- aset spellset Zahak
	send_command('alias bluddnin aset spellset zahak;input /macro set 1')
	send_command('alias bluddwar aset spellset zahak;input /macro set 2')
	send_command('alias bluddrdm aset spellset zahak;input /macro set 3')
	send_command('alias bludddnc aset spellset zahak;input /macro set 4')
	send_command('alias bluaoe aset spellset aoe;input /macro set 7')
	send_command('alias blucleaving aset spellset cleaving;input /macro set 7')
	send_command('alias bludynamis aset spellset Dynamis;input /macro set 6')
	send_command('alias light input /ja "Chain Affinity" <me>;wait 1;input /ws "Savage Blade" <t>;wait 4;input /ja "Efflux" <me>;wait 2;input /ma "Thrashing Assault" <t>')
	send_command('alias dark input /ja "Chain Affinity" <me>;wait 1;input /ws "Requiescat" <t>;wait 4;input /ja "Efflux" <me>;wait 2;input /ma "Quad. Continuum" <t>')
	send_command('alias vw1 aset spellset vw1')
	send_command('alias vw2 aset spellset vw2')
	
	-- Omen 
	-- 30k CDC > Req > BA > Tenebral
	send_command('alias 30k gs c cycle MagicBurstMode;wait 1;input /ws "Chant Du Cygne" <t>;wait 5;input /ws "Requiescat" <t>;wait 2;input /ja "Burst Affinity" <me>;wait 2;input /ma "Tenebral Crush" <t>')
	send_command('alias 15k input /ja "Burst Affinity" <me>;wait 2;input /ma "Spectral Floe" <t>')

	update_combat_form()
	select_default_macro_book()
	user_job_lockstyle()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	--
	sets.buff['Burst Affinity'] = {legs="Assim. Shalwar +3", feet="Hashi. Basmak +1"}
	sets.buff['Chain Affinity'] = {head="Hashishin Kavuk +1", feet="Assim. Charuqs +3"}
	sets.buff.Convergence = {head="Luh. Keffiyeh +3"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +3"}
	sets.buff.Enchainment = {body="Luhlaza Jubbah +3"}
	sets.buff.Efflux = {back=gear.da_jse_back,legs="Hashishin Tayt +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {}

	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}--legs="Dashing Subligar"

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
	
	-- Acc
	sets.precast.Step = {}

	-- Macc
	sets.precast.Flourish = {}

	-- Fast cast sets for spells
	sets.precast.FC = {
		-- ammo="Impatiens", 
		-- neck="Orunmila's Torque",
		head="Amalric Coif +1", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
		body="Luhlaza Jubbah +3", hands="Leyline Gloves", lring="Kishar Ring", rring="Prolix Ring",
		back=gear.FC_jse_back, waist="Witful Belt", legs="Aya. Cosciales +2", feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})--body="Passion Jacket"

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +1"})

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Oshasha's Treatise",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Epaminondas's Ring",
		-- Nyame Sollerets
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luhlaza Shalwar +3", feet="Jhakri Pigaches +2"}
	sets.precast.WS.Acc = {ammo="Oshasha's Treatise",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Epaminondas's Ring",
		-- Nyame Sollerets
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luhlaza Shalwar +3", feet="Jhakri Pigaches +2"}	
	sets.precast.WS.Fodder = {ammo="Oshasha's Treatise",
		-- Nyame Helm 
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Nyame Gauntlets 
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Epaminondas's Ring",
		-- Nyame Sollerets
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luhlaza Shalwar +3", feet="Jhakri Pigaches +2"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ammo="Oshasha's Treatise",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Oshasha's Treatise",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})	
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {ammo="Oshasha's Treatise",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Oshasha's Treatise",
		-- Adhemar Bonnet +1 Path B Mirage Stole +2 
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Mache Earring +1", rear="Mache Earring +1",
		-- Abnoba  hands="Adhemar Wrist. +1", lring="Begrudging Ring"
		body="Ayanmo Corazza +2",  hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Epona's Ring",
		--  Herculean Boots crit damage
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Samnuha Tights", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Oshasha's Treatise",
		-- Adhemar Bonnet +1 Path B Mirage Stole +2 
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Mache Earring +1", rear="Mache Earring +1",
		-- Abnoba lring="Begrudging Ring"
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Epona's Ring",
		--  Herculean Boots crit damage
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Samnuha Tights", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {ammo="Oshasha's Treatise",
		-- Adhemar Bonnet +1 Path B Mirage Stole +2
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Mache Earring +1", rear="Mache Earring +1",
		-- Abnoba lring="Begrudging Ring"
		body="Ayanmo Corazza +2", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Epona's Ring",
		--  Herculean Boots crit damage
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Samnuha Tights", feet="Jhakri Pigaches +2"})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Oshasha's Treatise",
		-- Hashishin Kavuk +3 Mirage Stole +2 Aurgelmir Orb +1
		head="Aya. Zucchetto +2", neck="Rep. Plate Medal", lear="Ishvara Earring", rear="Moonshade Earring",
		-- Nyame Mail Nyame Gauntlets 
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Sroda Ring", rring="Epaminondas's Ring",
		-- Nyame Flanchard Nyame Sollerets
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Luhlaza Shalwar +3", feet="Aya. Gambieras +2"})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Oshasha's Treatise",
		-- hercu str +10 WSD +4 Mirage Stole +2 lear="Ishvara Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Epaminondas's Ring",
		--Nyame Sollerets
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luhlaza Shalwar +3", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {ammo="Oshasha's Treatise",
		-- hercu str +10 WSD +4 Mirage Stole +2 lear="Ishvara Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Epaminondas's Ring",
		--Nyame Sollerets
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luhlaza Shalwar +3", feet="Jhakri Pigaches +2"})

	sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Vorpal Blade'].Acc = set_combine(sets.precast.WS.Acc, {back=gear.crit_jse_back})
	sets.precast.WS['Vorpal Blade'].Fodder = set_combine(sets.precast.WS['Vorpal Blade'], {})

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {ammo="Oshasha's Treatise",
		-- hercu str +10 WSD +4 Mirage Stole +2 lear="Ishvara Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Ayanmo Corazza +2", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Epaminondas's Ring",
		--Nyame Sollerets
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luhlaza Shalwar +3", feet="Jhakri Pigaches +2"})

	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Oshasha's Treatise",
		-- hercu str +10 WSD +4 Mirage Stole +2 lear="Ishvara Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Epaminondas's Ring",
		--Nyame Sollerets
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luhlaza Shalwar +3", feet="Jhakri Pigaches +2"})

	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {ammo="Oshasha's Treatise",
		-- hercu str +10 WSD +4 Mirage Stole +2 lear="Ishvara Earring",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Epaminondas's Ring",
		--Nyame Sollerets
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luhlaza Shalwar +3", feet="Jhakri Pigaches +2"})

	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tahtlum",
		-- Baetyl Pendant
		head="Pixie Hairpin +1", neck="Sanctity Necklace",lear="Regal Earring", rear="Malignance Earring",
		-- Amalric Doublet +1  
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Archon Ring", rring="Shiva Ring +1",
		back=gear.wsd_jse_back, waist="Orpheus's Sash", legs="Luhlaza Shalwar +3", feet="Amalric Nails +1"}

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {ammo="Oshasha's Treatise",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Oshasha's Treatise",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luhlaza Shalwar +3", feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {ammo="Oshasha's Treatise",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Jhakri Robe +2", hands="Jhakri Cuffs +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.wsd_jse_back, waist="Fotia Belt", legs="Luhlaza Shalwar +3", feet="Jhakri Pigaches +2"})
		
	sets.precast.WS['Flash Nova'] = {ammo="Oshasha's Treatise",
		head="Jhakri Coronal +2", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		body="Ayanmo Corazza +2", hands="Jhakri Cuffs +2", lring="Petrov Ring", rring="Epaminondas's Ring",
		back=gear.wsd_jse_back, waist="Orpheus's Sash", legs="Luhlaza Shalwar +3", feet="Jhakri Pigaches +2"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {lear="Bladeborn Earring", rear="Steelflash Earring"}
	sets.AccMaxTP = {lear="Bladeborn Earring", rear="Steelflash Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = set_combine(sets.precast.FC,{})

	sets.midcast['Blue Magic'] = {hands="Hashi. Bazu. +1"}

	-- Physical Spells --
	sets.midcast['Blue Magic'].Physical = {ammo="Hasty Pinion +1", --ammo="Aurgelmir Orb +1",
		-- Caro Necklace Tati Earring +1 Tati Earring +1
		head="Luh. Keffiyeh +3", neck="Sanctity Necklace", lear="Mache Earring +1", rear="Mache Earring +1",
		--  Shukuyu Ring
		body="Luhlaza Jubbah +3", hands="Luh. Bazubands +3", lring="Petrov Ring", rring="Rufescent Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Jhakri Slops +2",feet="Luhlaza Charuqs +3"}

	sets.midcast['Blue Magic'].Physical.Resistant = {--ammo="Aurgelmir Orb +1",
		-- Caro Necklace Tati Earring +1 Tati Earring +1
		head="Luh. Keffiyeh +3", neck="Sanctity Necklace", lear="Mache Earring +1", rear="Mache Earring +1",
		-- Shukuyu Ring Ifrit Ring +1
		body="Luhlaza Jubbah +3", hands="Luh. Bazubands +3", lring="Petrov Ring", rring="Rufescent Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Jhakri Slops +2", feet="Luhlaza Charuqs +3"}

	sets.midcast['Blue Magic'].Physical.Fodder = {---ammo="Aurgelmir Orb +1",
		-- Caro Necklace Tati Earring +1 Tati Earring +1
		head="Luh. Keffiyeh +3", neck="Sanctity Necklace", lear="Mache Earring +1", rear="Mache Earring +1",
		-- Shukuyu Ring Ifrit Ring +1
		body="Luhlaza Jubbah +3", hands="Luh. Bazubands +3", lring="Petrov Ring", rring="Rufescent Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Jhakri Slops +2", feet="Luhlaza Charuqs +3"}

	sets.midcast['Blue Magic'].PhysicalAcc = {--ammo="Aurgelmir Orb +1",
		-- Caro Necklace Tati Earring +1 Tati Earring +1
		head="Luh. Keffiyeh +3", neck="Sanctity Necklace", lear="Mache Earring +1", rear="Mache Earring +1",
		-- Shukuyu Ring Ifrit Ring +1
		body="Luhlaza Jubbah +3", hands="Luh. Bazubands +3", lring="Petrov Ring", rring="Rufescent Ring",
		back=gear.wsd_jse_back, waist="Sailfi Belt +1", legs="Jhakri Slops +2", feet="Luhlaza Charuqs +3"}


	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	-- Magical Spells --
	sets.midcast['Blue Magic'].Magical = {ammo="Ghastly Tathlum +1",
		-- Bunzi's Rod 
		-- head=empty 
		head="Jhakri Coronal +2", neck="Sibyl Scarf", lear="Regal Earring", rear="Friomisi Earring",
		-- Cohort Cloak +1 hands="Hashi. Bazu. +2"
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Mephitas's Ring +1",
		-- Hashi. Basmak +2
		back=gear.mab_jse_back, waist="Orpheus's Sash", legs="Luhlaza Shalwar +3", feet="Amalric Nails +1"}

	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,{
		-- Baetyl Pendant 
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1",  rring="Mephitas's Ring +1",
		back=gear.mab_jse_back, waist="Orpheus's Sash", legs="Amalric Slops +1", feet="Amalric Nails +1"})

	sets.midcast['Blue Magic'].Magical.Fodder = {ammo="Pemphredo Tathlum",
		-- Baetyl Pendant 
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Friomisi Earring",
		body="Shamash Robe", hands="Amalric Gages +1", lring="Metamor. Ring +1", rring="Mephitas's Ring +1",
		back=gear.mab_jse_back, waist="Orpheus's Sash", legs="Amalric Slops +1", feet="Amalric Nails +1"}

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ammo="Pemphredo Tathlum",
		-- Baetyl Pendant 
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Gwati Earring",
		body="Shamash Robe", hands="Amalric Gages +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.mab_jse_back, waist="Orpheus's Sash", legs="Amalric Slops +1", feet="Amalric Nails +1"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {ammo="Pemphredo Tathlum",
		-- Mavi Stole +2 Hashi. Earring +2 rear="Digni. Earring",
		head="Malignance Chapeau", neck="Sanctity Necklace", lear="Regal Earring", rear="Gwati Earring",
		-- Hashi. Mintan +2 Hashi. Bazu. +2   \
		body="Malignance Tabard", hands="Malignance Gloves", lring="Metamor. Ring +1", rring="Stikini Ring +1",
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs="Malignance Tights", feet="Malignance Boots"}
	sets.midcast['Blue Magic'].MagicAccuracy.DT = {--ammo="Staunch Tathlum +1",
		-- Mavi Stole +2 Hashi. Earring +2 rear="Digni. Earring",
		head="Malignance Chapeau", neck="Erra Pendant", lear="Regal Earring", rear="Gwati Earring",
		-- Hashi. Mintan +2 Hashi. Bazu. +2 
		body="Malignance Tabard", hands="Malignance Gloves", lring="Metamor. Ring +1", rring="Stikini Ring +1",
		-- Hashi. Tayt +2 
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs="Malignance Tights", feet="Malignance Boots"}

	sets.midcast['Blue Magic']['Dream Flower'] = sets.midcast['Blue Magic'].MagicAccuracy.DT
	
	sets.midcast['Blue Magic']['Reaving Wind'] = {--ammo="Sapience Orb",
		-- Sakpata Sword
		-- head="Carmine Mask +1", Mavi Stole +2 rear="Digni. Earring",
		neck="Erra Pendant", lear="Loquac. Earring", 
		-- Hash. Bazu. +2
		body="Luhlaza Jubbah +3", hands="Regal Cuffs", lring="Metamor. Ring +1", rring="Kishar Ring",
		-- Hashi. Basmak +2
		back="Aurist's Cape +1", waist="Acuity Belt +1", legs="Aya. Cosciales +2", feet="Malignance Boots"}
	sets.midcast['Blue Magic']['Feather Tickle'] = sets.midcast['Blue Magic']['Reaving Wind']	
	
	-- Breath Spells --
	sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +3", neck="Erra Pendant",lear="Regal Earring", rear="Gwati Earring",
		body="Assim. Jubbah +3", hands="Luh. Bazubands +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Cornflower Cape", waist="Orpheus's Sash", legs="Hashishin Tayt +1", feet="Luhlaza Charuqs +3"}

	-- Physical Added Effect Spells most notably "Stun" spells --
	sets.midcast['Blue Magic'].Stun = {ammo="Mavi Tathlum",
		head="Jhakri Coronal +2", neck="Erra Pendant", lear="Regal Earring", rear="Enchntr. Earring +1",
		body="Shamash Robe", hands="Jhakri Cuffs +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.mab_jse_back, waist="Orpheus's Sash", legs="Jhakri Slops +2", feet="Malignance Boots"}

	sets.midcast['Blue Magic'].Stun.Resistant = {
		head="Jhakri Coronal +2", neck="Erra Pendant", lear="Regal Earring", rear="Enchntr. Earring +1",
		body="Shamash Robe", hands="Jhakri Cuffs +2", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.mab_jse_back, waist="Orpheus's Sash", legs="Jhakri Slops +2", feet="Malignance Boots"}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --
	sets.midcast['Blue Magic']['White Wind'] = {ammo="Mavi Tathlum",
		--  head="Carmine Mask +1"
		neck="Phalaina Locket", neck="Unmoving Collar +1", lear="Loquac. Earring", rear="Gifted Earring",
		-- body="Pinga Tunic +1", lring="Kunaji Ring", 
		body="Luhlaza Jubbah +3", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Asklepian Ring", 
		-- back="Moonbeam Cape", legs="Pinga Pants +1", 
		 waist=gear.ElementalObi, legs="Gyve Trousers", feet="Carmine Greaves +1"}
	
	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {
		--head="Carmine Mask", 
		neck="Phalaina Locket", lear="Loquac. Earring", rear="Gifted Earring",
		--  lring="Kunaji Ring", 
		body="Vrikodara Jupon", hands=gear.telchine_hands_Cure, lring="Sirona's Ring", rring="Stikini Ring +1",
		back=gear.ElementalCape, waist=gear.ElementalObi, legs="Gyve Trousers", feet="Medium's Sabots"}
		
	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {back=gear.cure_jse_back, waist="Luminary Sash"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {ammo="Mavi Tathlum",
		-- main="Iris",sub="Iris"
		-- neck="Incanter's Torque",
		head="Luh. Keffiyeh +3", lear="Loquac. Earring", rear="Gifted Earring",
		body="Assim. Jubbah +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back="Cornflower Cape", waist="Witful Belt", legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +3"}

	sets.midcast['Blue Magic'].Buff = {ammo="Mavi Tathlum",
		-- neck="Incanter's Torque"
		head="Luh. Keffiyeh +3", lear="Loquac. Earring", rear="Gifted Earring",
		body="Assim. Jubbah +3", hands="Hashi. Bazu. +1", ring1="Kishar Ring", ring2="Defending Ring",
		back=gear.FC_jse_back, waist="Witful Belt", legs="Lengo Pants", feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1", waist="Gishdubar Sash"})--back="Grapevine Cape",

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1"})--waist="Emphatikos Rope",legs="Shedir Seraweels"

	sets.midcast['Enfeebling Magic'] = {
		head="Jhakri Coronal +2", neck="Sanctity Necklace", lear="Regal Earring", rear="Gwati Earring",
		body="Shamash Robe", hands="Amalric Gages +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.mab_jse_back, waist="Luminary Sash", legs="Jhakri Slops +2", feet="Amalric Nails +1"}
		
	sets.midcast['Dark Magic'] = {
		head="Pixie Hairpin +1", neck="Sanctity Necklace", lear="Regal Earring", rear="Gwati Earring",
		body="Shamash Robe", hands="Amalric Gages +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.mab_jse_back, waist="Luminary Sash", legs="Jhakri Slops +2", feet="Amalric Nails +1"}

	sets.midcast['Enhancing Magic'] = {ammo="Sapience Orb",
		-- neck="Incanter's Torque",
		head=gear.telchine_head_Duration, neck="Colossus's Torque", ear1="Andoaa Earring",ear2="Gifted Earring",
		body=gear.telchine_body_Duration, hands=gear.telchine_hands_Duration, ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape", waist="Olympus Sash", legs=gear.telchine_legs_Duration, feet=gear.telchine_feet_Duration}
	
	sets.midcast.Phalanx = {ammo="Sapience Orb",
		-- neck="Incanter's Torque", 
		head=gear.taeon_head_Phalanx, neck="Colossus's Torque", ear1="Andoaa Earring",ear2="Gifted Earring",
		body=gear.herculean_phalanx_body, hands=gear.taeon_hands_Phalanx, ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Perimede Cape", waist="Olympus Sash", legs=gear.taeon_legs_Phalanx, feet=gear.taeon_feet_Phalanx}
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1", hands="Regal Cuffs"})--,waist="Emphatikos Rope",legs="Shedir Seraweels"

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})--ear2="Earthcry Earring",legs="Shedir Seraweels"

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})--legs="Shedir Seraweels"
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = {
		head="Jhakri Coronal +2", neck="Erra Pendant",lear="Regal Earring", rear="Gwati Earring",
		body="Jhakri Robe +2", hands="Amalric Gages +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.mab_jse_back, waist=gear.ElementalObi, legs="Jhakri Slops +2", feet="Amalric Nails +1"}
		
	sets.midcast['Elemental Magic'] = {
		head="Jhakri Coronal +2", neck="Erra Pendant",lear="Regal Earring", rear="Gwati Earring",
		body="Jhakri Robe +2", hands="Amalric Gages +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.mab_jse_back, waist=gear.ElementalObi, legs="Jhakri Slops +2", feet="Amalric Nails +1"}

	sets.midcast['Elemental Magic'].Resistant = {
		head="Jhakri Coronal +2", neck="Erra Pendant",lear="Regal Earring", rear="Gwati Earring",
		body="Jhakri Robe +2", hands="Amalric Gages +1", lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.mab_jse_back, waist=gear.ElementalObi, legs="Jhakri Slops +2", feet="Amalric Nails +1"}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder

	sets.element.Dark = {head="Pixie Hairpin +1", ring2="Archon Ring"}

	sets.midcast.Cure = {main="Nibiru Cudgel", sub="Nibiru Cudgel", 
		--head="Carmine Mask", neck="Incanter's Torque", rear="Mendi. Earring", 
		 neck="Phalaina Locket", lear="Regal Earring", rear="Gwati Earring", 
		-- Pinga Tunic +1
		body="Luhlaza Jubbah +3", hands=gear.telchine_hands_Cure, lring="Stikini Ring +1", rring="Stikini Ring +1",
		back=gear.cure_jse_back, waist=gear.ElementalObi, legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +3"}

	-- Resting sets
	sets.resting = {main="Naegling", sub="Genmei Shield",
		-- Herculean Head 
		head="Malignance Chapeau", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		-- Herculean Vest  Herculean Hands
		body="Shamash Robe", hands="Malignance Gloves", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- Herculean Boots 
		back=gear.FC_jse_back, waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}

	-- Idle sets - Refresh
	sets.idle =  {main="Bolelabunga", sub="Genmei Shield",  ammo="Pemphredo tathlum",
		head="Malignance Chapeau",  neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Shamash Robe", hands="Malignance Gloves", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- Plat. Mog Belt
		back=gear.FC_jse_back, waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}

	sets.idle.DT =  {main="Bolelabunga", sub="Genmei Shield", ammo="Pemphredo tathlum",
		head="Malignance Chapeau", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Shamash Robe", hands="Malignance Gloves", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- Plat. Mog Belt
		back=gear.FC_jse_back, waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}

	-- Defense sets
	sets.defense.DT =  {main="Naegling", sub="Genmei Shield", ammo="Pemphredo tathlum",
		head="Malignance Chapeau", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Shamash Robe", hands="Malignance Gloves", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- Plat. Mog Belt
		back=gear.FC_jse_back, waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}

    sets.defense.MEVA =  { 	main="Naegling", sub="Genmei Shield", ammo="Pemphredo tathlum", 
		head="Malignance Chapeau",  neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Malignance Tabard", hands="Malignance Gloves", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- Plat. Mog Belt
		back=gear.FC_jse_back, waist="Flume Belt", legs="Malignance Tights", feet="Malignance Boots"}

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {lring="Shneddick Ring"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt",ear1="Ethereal Earring", ear2="Suppanomimi"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Brutal Earring", ear2="Suppanomimi"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",legs="Carmine Cuisses +1"}-- body="Adhemar Jacket",waist="Reiki Yotai",
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {ammo="Per. Lucky Egg", head="Wh. Rarab Cap +1", waist="Chaac Belt", legs="Volte Hose"})
	
	-- Weapons sets
	sets.weapons.Default = {main="Naegling",sub="Genmei Shield"}
	sets.weapons.Naegling =  {main="Naegling",sub="Genmei Shield"}
	sets.weapons.MeleeClub =  {main="Maxentius",sub="Genmei Shield"}
	sets.weapons.MagicWeapons = {main="Maxentius", sub="Genmei Shield"}
		
	-- Dual
	sets.weapons.DualMeleeClubs = {main="Maxentius", sub="Kaja Rod"}
	sets.weapons.DualMagicWeapons = {main="Maxentius",sub="Kaja Rod"}
	sets.weapons.DualNaegling = {main="Naegling",sub="Kaja Sword"}
	sets.weapons.DualMaccWeapons = {main="Maxentius", sub="Kaja Rod"}
	
	-- Engaged sets
	sets.engaged =  {main="Naegling", sub="Genmei Shield", ammo="Ginsen",
		head="Malignance Chapeau", neck="Sanctity Necklace", lear="Mache Earring +1", rear="Mache Earring +1",
		-- body="Adhemar Jacket", 
		body="Ayanmo Corazza +2", hands="Malignance Gloves", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.da_jse_back, waist="Kentarch Belt +1", legs="Samnuha Tights", feet="Malignance Boots"}

	sets.engaged.Acc = { ammo="Ginsen",
		head="Malignance Chapeau", neck="Sanctity Necklace", lear="Mache Earring +1", rear="Mache Earring +1",
		-- body="Adhemar Jacket", 
		body="Ayanmo Corazza +2", hands="Malignance Gloves", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.da_jse_back, waist="Kentarch Belt +1", legs="Samnuha Tights", feet="Malignance Boots"}
		
	sets.engaged.Fodder = { ammo="Ginsen",
		head="Malignance Chapeau", neck="Sanctity Necklace", lear="Mache Earring +1", rear="Mache Earring +1",
		-- body="Adhemar Jacket", 
		body="Ayanmo Corazza +2", hands="Malignance Gloves", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.da_jse_back, waist="Kentarch Belt +1", legs="Samnuha Tights", feet="Carmine Greaves +1"}

	-- Hybrid
	sets.engaged.DT = {
		head="Malignance Chapeau", neck="Sanctity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
		body="Malignance Tabard", hands="Malignance Gloves", lring="Petrov Ring", rring="Epona's Ring",
		back=gear.da_jse_back, waist="Kentarch Belt +1", legs="Malignance Tights", feet="Malignance Boots"}

	sets.engaged.Fodder.DTLite = sets.engaged.DT
	sets.engaged.Fodder.PDT = sets.engaged.DT
	sets.engaged.Fodder.MDT = sets.engaged.DT
	sets.engaged.Fodder.MEVA = sets.engaged.DT
		
	sets.engaged.Acc.DTLite = sets.engaged.DT
	sets.engaged.Acc.PDT = sets.engaged.DT
	sets.engaged.Acc.MDT = sets.engaged.DT
	sets.engaged.Acc.MEVA = sets.engaged.DT

	sets.Self_Healing = {lring="Gelatinous Ring +1"}
	sets.Cure_Received = {lring="Gelatinous Ring +1", waist="Gishdubar Sash"}
	sets.Self_Refresh = {}
	sets.MagicBurst = {neck="Mizu. Kubikazari", hands="Amalric Gages +1", legs="Assim. Shalwar +3", ring1="Mujin Band"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	set_macro_page(10, 8)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 008')
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end


buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	When='Always'},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	When='Idle'},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	When='Idle'},
		{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	When='Engaged'},
		{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	When='Combat'},
	},
	
	Default = {
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	Reapply=false},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	Reapply=false},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Barrier Tusk',		Buff='Phalanx',			SpellID=685,	Reapply=false},
		{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Occultation',		Buff='Blink',			SpellID=679,	Reapply=false},
		{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	Reapply=false},
		{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	Reapply=false},
	},
	
	aoe = {
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	Reapply=false},
		--{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	Reapply=false},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Barrier Tusk',		Buff='Phalanx',			SpellID=685,	Reapply=false},
		{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Occultation',		Buff='Blink',			SpellID=679,	Reapply=false},
		{Name='Carcharian Verve',	Buff='Aquaveil',		SpellID=745,	Reapply=false},
		--{Name='Memento Mori',		Buff='Magic Atk. Boost',SpellID=538,	Reapply=false},
	},
	
	cleaving = {
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	Reapply=false},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	Reapply=false},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Barrier Tusk',		Buff='Phalanx',			SpellID=685,	Reapply=false},
		{Name='Stoneskin',			Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Occultation',		Buff='Blink',			SpellID=679,	Reapply=false},
		{Name='Carcharian Verve',	Buff='Aquaveil',		SpellID=745,	Reapply=false},
		{Name='Memento Mori',		Buff='Magic Atk. Boost',SpellID=538,	Reapply=false},
	},
	
	zahak = {
		{Name='Erratic Flutter',	Buff='Haste',			SpellID=710,	When='Always'},
		{Name='Battery Charge',		Buff='Refresh',			SpellID=662,	When='Idle'},
		{Name='Refresh',			Buff='Refresh',			SpellID=109,	When='Idle'},
		{Name='Phalanx',			Buff='Phalanx',			SpellID=106,	Reapply='Idle'},
		{Name='Barrier Tusk',		Buff='Phalanx',			SpellID=685,	Reapply='Idle'},		
		{Name='Nat. Meditation',	Buff='Attack Boost',	SpellID=700,	When='Engaged'},
		{Name='Mighty Guard',		Buff='Mighty Guard',	SpellID=750,	When='Idle'},
	},
}

function job_setup()
	
	state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
	state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
	state.Buff['Azure Lore'] = buffactive['Azure Lore'] or false
	state.Buff.Convergence = buffactive.Convergence or false
	state.Buff.Diffusion = buffactive.Diffusion or false
	state.Buff.Efflux = buffactive.Efflux or false
	state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false
	state.Buff['Unbridled Wisdom'] = buffactive['Unbridled Wisdom'] or false

	state.LearningMode = M(false, 'Learning Mode')
	state.AutoUnbridled = M(false, 'Auto Unbridled Mode')
	
	autows = 'Savage Blade'
	autofood = 'Soy Ramen'

	blue_magic_maps = {}
    
    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods, if only for pDif.
    
    -- Physical Spells --
    
    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
        'Bilgestorm'
    }

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }

    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
        'Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave',
        'Uppercut','Vertical Cleave',
    }
        
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Claw Cyclone','Disseverment',
        'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
        'Sickle Slash','Smite of Rage','Thrashing Assault','Vanity Dive',
    }
        
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam',
        'Power Attack','Quad. Continuum',
    }
        
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
        'Helldive','Jet Stream',
    }

    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite',
    }

    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }

    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }

    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }

    -- Magical Spells --

    -- Magical spells with the typical Int mod
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Death Ray',
        'Diffusion Ray','Droning Whirlwind','Embalming Earth','Firespit','Foul Waters',
        'Ice Break','Leafstorm','Maelstrom','Rail Cannon','Regurgitation','Rending Deluge',
        'Retinal Glare','Subduction','Tearing Gust','Tem. Upheaval','Water Bomb','Molting Plumage',
		'Nectarous Deluge','Searing Tempest','Blinding Fulgor','Spectral Floe','Scouring Spate',
		'Anvil Lightning','Silent Storm','Entomb','Tenebral Crush','Palling Salvo'
    }

    -- Magical spells with a primary Mnd mod 
    blue_magic_maps.MagicalMnd = S{
        'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast'
    }

    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
        'Eyes On Me','Mysterious Light'
    }

    -- Magical spells with a Vit stat mod
    blue_magic_maps.MagicalVit = S{
        'Thermal Pulse'
    }

    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
        'Charged Whisker','Gates of Hades'
    }

    -- Magical spells with an Agi stat mod
    blue_magic_maps.MagicalAgi = S{
        'Crashing Thunder'
    }

    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
        'Bad Breath', 'Blank Gaze','Blistering Roar','Blitzstrahl','Blood Drain','Blood Saber','Cesspool','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Cruel Joke','Demoralizing Roar','Digest',
        'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Frost Breath','Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Radiant Breath','Reaving Wind',
        'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Temporal Shift','Thunderbolt','Venom Shell','Voracious Trunk',
		'Yawn', 'Atra. Libations'
    }
        
    -- Breath-based spells that we don't care about the added effect of.
    blue_magic_maps.Breath = S{
        'Flying Hip Press','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath'
    }

    -- Physical stun spells and physical added effect spells.
    blue_magic_maps.Stun = S{
        'Barbed Crescent','Battle Dance','Benthic Typhoon','Bilgestorm',
		'Feather Storm','Frypan','Head Butt','Hydro Shot','Pinecone Bomb','Queasyshroom',
		'Saurian Slide','Seedspray','Spiral Spin','Sprout Smack','Sub-zero Smash',
		'Sudden Lunge','Sweeping Gouge','Tail Slap','Terror Touch','Wild Oats','Whirl of Rage',
    }
        
    -- Healing spells
    blue_magic_maps.Healing = S{
        'Exuviation','Healing Breeze','Magic Fruit','Plenilune Embrace',
		'Pollen','Restoral','White Wind','Wild Carrot'
    }
    
    -- Buffs that depend on blue magic skill that don't cap very low.
    blue_magic_maps.SkillBasedBuff = S{
        'Diamondhide','Magic Barrier','Occultation','Plasma Charge','Reactor Cool',
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Barrier Tusk','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Fantod','Feather Barrier','Harden Shell','Memento Mori','Metallic Body',
		'Mighty Guard','Nat. Meditation','Orcish Counterstance','Pyric Bulwark',
		'Refueling','Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promy.',
        'Zephyr Mantle'
    }
    
    aoe_blue_magic_healing = S{
        'Healing Breeze','White Wind'
    }
    
    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Blistering Roar','Bloodrake','Carcharian Verve','Cesspool',
        'Crashing Thunder','Cruel Joke','Droning Whirlwind','Gates of Hades','Harden Shell','Mighty Guard','Polar Roar',
        'Pyric Bulwark','Tearing Gust','Thunderbolt','Tourbillion','Uproot'
    }

	init_job_states({"Capacity","AutoFoodMode","AutoTrustMode","AutoWSMode","AutoNukeMode","AutoShadowMode","AutoStunMode","AutoDefenseMode",},{"AutoBuffMode","AutoSambaMode","AutoRuneMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","LearningMode","CastingMode","TreasureMode"})
end

autows_list = {
		-- state.Weapons:options('None','Naegling','MeleeClub','MagicWeapons','DualNaegling','DualMagicWeapons','DualMeleeClubs','DualMaccWeapons','HybridWeapons')
		['Tizona']='Expiacion',
		['Almace']='Chant Du Cygne',
		['Naegling']='Savage Blade',
		['MeleeClub']='Realmrazer',
		['MagicWeapons']='Realmrazer',
		['DualNaegling']='Savage Blade',
		['DualMagicWeapons']='Black Halo',
		['DualMeleeClubs']='Realmrazer',
		['DualMaccWeapons']='Realmrazer',		
		['HybridWeapons']='Sanguine Blade'}