function user_job_setup()
    -- Options: Override default values	
	state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Tank', 'DDTank', 'BreathTank', 'NoShellTank', 'Reraise', 'Normal')
    state.WeaponskillMode:options('Match','Normal','Acc')
    state.CastingMode:options('Normal','SIRD')
    state.PhysicalDefenseMode:options('PDT', 'PDT_HP', 'PDT_Reraise', 'Tank')
    state.MagicalDefenseMode:options('MDT','BDT','MDT_HP','AegisMDT','AegisNoShellMDT','OchainMDT','OchainNoShellMDT','MDT_Reraise')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm')
	state.IdleMode:options('Tank','Normal','KiteTank','PDT','MDT','Refresh','Reraise')
	state.Weapons:options('Default','Ochain','Excalibur','DDWeapons','DualWeapons','Dagger')
	    
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode', 'None', 'MP', 'Twilight'}
	
	-- Augmented Capes
	-- Phalanx
	gear.phalanx_jse_back 	= 	{name="Weard Mantle", augments={'VIT+1','DEX+1','Phalanx +5',}}
	-- change to resist HP+60, M.Eva./Eva.+20, M.Eva+10, Resist All+10%
	gear.TP_jse_back 		= 	{name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	-- STR+20, Acc/Att+20, STR+10, WSD+10%, PDT-10%
	gear.WS_jse_back 		= 	{name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	-- MND+20, Acc/Att+20, MND+10, DA+10%, PDT-10%
	gear.WS_Req_jse_back 	= 	{name="Rudianos's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Weapon skill damage +10%',}}
	-- HP+60, Acc/Att+20, DEX+10, Crit.+10%, PDT-10%
	gear.WS_CDC_jse_back 	= 	{name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
	-- HP+60, M.Eva/Eva+20, M.Eva+10, Enm.+10, PDT-10%
	gear.Enmity_jse_back	= 	{name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10',}}
	-- HP+60, M.Eva/Eva+20, M.Eva+10, FC+10%, PDT-10%
	gear.fastcast_jse_back 	= 	{name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10',}}
    -- HP+60, M.Eva/Eva+20, M.Eva+10, Cure Pot.+10%, PDT-10%
	gear.cure_jse_back      =   {name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10',}}
	
	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind ^backspace input /ja "Shield Bash" <t>')
	send_command('bind @backspace input /ja "Cover" <stpt>')
	send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
	--send_command('bind ^f10 gs c reset DefenseMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')

	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	
    select_default_macro_book()
	user_job_lockstyle()
    update_defense_mode()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
    sets.Enmity = {ammo="Sapience Orb",
		--  lear="Trux Earring", 
		head="Loess Barbuta +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Cryptic Earring",
		body="Souveran Cuirass", hands="Souv. Handschuhs", lring="Vexer Ring +1", rring="Apeile Ring +1",
		-- Eschite Greaves path A
		back=gear.Enmity_jse_back, waist="Creed Baudrier", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}
	
	sets.Enmity.SIRD = {ammo="Staunch Tathlum +1", -- Impatiens
		head="Souveran Schaller +1",neck="Moonlight Necklace",ear1="Knightly Earring",ear2="Cryptic Earring",
		body="Souveran Cuirass",hands="Regal Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
		back=gear.Enmity_jse_back,waist="Rumination Sash",legs="Founder's Hose",feet="Odyssean Greaves"}
    
	sets.Enmity.DT = {ammo="Sapience Orb",
		-- lear="Trux Earring", 
		head="Loess Barbuta +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Cryptic Earring",
		body="Souveran Cuirass", hands="Souv. Handschuhs", lring="Defending Ring", rring="Apeile Ring +1",
		-- Obyssean Cuisses Eschite Greaves path A
		back=gear.Enmity_jse_back, waist="Creed Baudrier", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}

    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +3"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +3"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +3"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{head="Cab. Coronet +3"})
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +3"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons +1"})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {head="Rev. Coronet +3", body="Cab. Surcoat +3"})
	
	sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +3"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +3"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +3"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{head="Cab. Coronet +3"})
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +3"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons +1"})
   	
    -- Add MND for Chivalry
    sets.precast.JA['Chivalry'] = {ammo="Sapience Orb",
		-- Trux Earring 
		head="Loess Barbuta +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Cryptic Earring",
		body="Souveran Cuirass", hands="Cab. Gauntlets +3", lring="Vexer Ring +1", rring="Apeile Ring +1",
		back=gear.Enmity_jse_back, waist="Creed Baudrier", legs="Souveran Diechlings", feet="Eschite Greaves"}

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {ammo="Sapience Orb",
		-- Trux Earring 
		head="Loess Barbuta +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Cryptic Earring",
		body="Souveran Cuirass", hands="Cab. Gauntlets +3", lring="Vexer Ring +1", rring="Apeile Ring +1",
		back=gear.Enmity_jse_back, waist="Creed Baudrier", legs="Souveran Diechlings", feet="Eschite Greaves"})
		
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
		
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {lear="Knightly Earring", hands="Cab. Gauntlets +3"})		
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
   
	-- ACC
    sets.precast.Step = {}
	
	-- Macc
	sets.precast.JA['Violent Flourish'] = {}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- Fast cast sets for spells    
    sets.precast.FC = {ammo="Sapience Orb",
		head="Carmine Mask +1", neck="Orunmila's Torque", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Rev. Surcoat +3", hands="Souv. Handschuhs", lring="Moonlight Ring", rring="Moonlight Ring",
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Souveran Diechlings", feet="Carmine Greaves +1"}

    sets.precast.FC.DT = {ammo="Staunch Tathlum +1",
		head="Carmine Mask +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Rev. Surcoat +3", hands="Souv. Handschuhs", lring="Moonlight Ring", rring="Moonlight Ring",
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Souveran Diechlings", feet="Carmine Greaves +1"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
  
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Ginsen", -- Aurgelmir Orb +1
		--  head="Nyame Helm", neck="Kgt. Beads +2", lear="Thud Earring" 
		head=gear.valorous_wsd_head, neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Nyame Mail Nyame Gauntlets
		body="Emicho Haubert +1", hands="Sulev. Gauntlets +2", lring="Regal Ring", rring="Epaminondas's Ring",
		-- Nyame Flanchard Nyame Sollerets
		back=gear.WS_jse_back, waist="Sailfi Belt +1", legs="Sulev. Cuisses +2", feet="Sulev. Leggings +2"}
	
    sets.precast.WS.DT = set_combine(sets.precast.WS, {})

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS,{ammo="Ginsen", -- Aurgelmir Orb +1
		-- Hjarrandi Helm
		head="Carmine Mask +1", neck="Fotia Gorget", lear="Cessance Earring", rear="Moonshade Earring",
		-- Sakpata's Plate Sakpata's Gauntlets
		body="Flamma Korazin +2", hands="Sulev. Gauntlets +2", lring="Petrov Ring", rring="Regal Ring",
		-- Sakpata's Cuisses Sakpata's Leggings
		back=gear.WS_Req_jse_back, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Sulev. Leggings +2"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS['Requiescat'], {})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {ammo="Ginsen", -- ammo="Aurgelmir Orb +1"
		head="Flam. Zucchetto +2", neck="Fotia Gorget", lear="Cessance Earring", rear="Moonshade Earring",
		body="Sacro Breastplate", hands="Flamma Manopolas +2", lring="Flamma Ring", rring="Regal Ring",
		back=gear.WS_CDC_jse_back, waist="Fotia Belt", legs="Flamma Dirs +2", feet="Flamma Gambieras +2"})	
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS['Chant du Cygne'], {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {ammo="Ginsen", -- Aurgelmir Orb +1
		--  head="Nyame Helm", neck="Kgt. Beads +2", lear="Thud Earring" 
		head=gear.valorous_wsd_head, neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
		-- Nyame Mail Nyame Gauntlets
		body="Emicho Haubert +1", hands="Sulev. Gauntlets +2", lring="Regal Ring", rring="Epaminondas's Ring",
		-- Nyame Flanchard Nyame Sollerets
		back=gear.WS_jse_back, waist="Sailfi Belt +1", legs="Sulev. Cuisses +2", feet="Sulev. Leggings +2"})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {})

	sets.precast.WS['Knights of Round'] = sets.precast.WS['Savage Blade']
	
	sets.precast.WS['Knights of Round'].Acc = set_combine(sets.precast.WS['Knights of Round'], {})
	
	-- Macc
	sets.precast.WS['Flat Blade'] = {ammo="Ginsen",
		-- Nyame Helm
		head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Enchntr. Earring +1", ear2="Digni. Earring",
        -- Nyame Mail Nyame Gauntlets
		body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        -- Nyame Flanchard Nyame Sollerets
		back=gear.WS_jse_back,waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}
	
	sets.precast.WS['Flat Blade'].Acc = sets.precast.WS['Flat Blade']
	
	-- MAB
    sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Sanguine Blade'].Acc = set_combine(sets.precast.WS['Sanguine Blade'], {})

    sets.precast.WS['Atonement'] = {ammo="Sapience Orb",
	    -- rear="Trux Earring"
		head="Loess Barbuta +1", neck="Moonlight Necklace", ear2="Moonshade Earring", ear2="Cryptic Earring",
		body="Souveran Cuirass", hands="Souv. Handschuhs", lring="Vexer Ring +1", rring="Eiwaz Ring",
		-- Eschite Greaves 
		back=gear.enmity_jse_back, waist="Fotia Belt", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}
	sets.precast.WS['Atonement'].Acc = sets.precast.WS['Atonement']
    
	sets.precast.WS['Spirits Within'] = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'].Acc = sets.precast.WS['Atonement']
	
	sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,{
	    -- Nyame Helm
		head=empty, neck="Sanctity Necklace", lear="Crematio Earring", rear="Friomisi Earring",
		-- Nyame Mail Nyame Gauntlets
		body="Cohort Cloak +1", hands="Carmine Fin. Ga. +1", lring="Epaminondas's Ring", rring="Shiva Ring +1",
		-- Nyame Flanchard Nyame Sollerets
		back=gear.WS_jse_back, waist="Orpheus's Sash", legs="Founder's Hose", feet="Founder's Greaves"})
		
	sets.precast.WS['Aeolian Edge'].DT = set_combine(sets.precast.WS,{
		-- Nyame Helm
		head=empty, neck="Sanctity Necklace", lear="Crematio Earring", rear="Friomisi Earring",
		--  Nyame Mail Nyame Gauntlets
		body="Cohort Cloak +1", hands="Carmine Fin. Ga. +1", lring="Epaminondas's Ring", rring="Shiva Ring +1",
		--  Nyame Flanchard Nyame Sollerets
		back=gear.WS_jse_back, waist="Orpheus's Sash", legs="Founder's Hose", feet="Founder's Greaves"})
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Cessance Earring"}
	sets.AccMaxTP = {ear1="Telos Earring",ear2="Cessance Earring"}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {}		
		
	sets.midcast.FastRecast.DT = {}
	
	-- Healing Magic
    sets.midcast.Cure = {ammo="Egoist's Tathlum",
		-- lear="Tuisto Earring", 
		head="Souv. Schaller +1", neck="Sacro Gorget", lear="Odnowa Earring +1", rear="Cryptic Earring",
		body="Souveran Cuirass", hands="Macabre Gaunt. +1", lring="Vexer Ring +1", rring="Eiwaz Ring",
		-- feet="Chev. Sabatons +3",
		back=gear.fastcast_jse_back, waist="Creed Baudrier", legs="Souveran Diechlings", feet=gear.odyssean_cure_feet}

	sets.midcast.Cure.SIRD = {ammo="Staunch Tathlum +1",
		-- lear="Tuisto Earring",
		head="Souv. Schaller +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Nourish. Earring +1",
		body="Souveran Cuirass", hands="Macabre Gaunt. +1", lring="Gelatinous Ring +1", rring="Eiwaz Ring",
		-- waist="Audumbla Sash" 
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Founder's Hose", feet=gear.odyssean_cure_feet}

    sets.midcast.Cure.DT = sets.midcast.Cure.SIRD
	
	sets.Self_Healing = {ammo="Egoist's Tathlum",
		-- lear="Tuisto Earring", 
		head="Souv. Schaller +1", neck="Sacro Gorget", lear="Odnowa Earring +1", rear="Cryptic Earring",
		body="Souveran Cuirass", hands="Macabre Gaunt. +1", lring="Vexer Ring +1", rring="Eiwaz Ring",
		-- feet="Chev. Sabatons +3",
		back=gear.fastcast_jse_back, waist="Creed Baudrier", legs="Souveran Diechlings", feet=gear.odyssean_cure_feet}

	sets.Self_Healing.SIRD  = {ammo="Staunch Tathlum +1",
		-- lear="Tuisto Earring",
		head="Souv. Schaller +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Nourish. Earring +1",
		body="Souveran Cuirass", hands="Macabre Gaunt. +1", lring="Gelatinous Ring +1", rring="Eiwaz Ring",
		-- waist="Audumbla Sash" 
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Founder's Hose", feet=gear.odyssean_cure_feet}

	sets.Self_Healing.DT = {ammo="Staunch Tathlum +1",
		-- lear="Tuisto Earring",
		head="Souv. Schaller +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Nourish. Earring +1",
		body="Souveran Cuirass", hands="Macabre Gaunt. +1", lring="Gelatinous Ring +1", rring="Eiwaz Ring",
		-- waist="Audumbla Sash" 
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Founder's Hose", feet=gear.odyssean_cure_feet}
	
	-- Cap 30%
	sets.Cure_Received = {head="Souv. Schaller +1", hands="Souv. Handschuhs", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}
	
	-- Enhancing Magic 
	sets.Self_Refresh = {}--waist="Gishdubar Sash", feet="Shab. Sabatons +1"

    sets.midcast['Enhancing Magic'] = {ammo="Sapience Orb",
		-- rear="Mimir Earring",
		head="Souv. Schaller +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Knightly Earring",
		-- Shab. Cuirass +1 
		body="Rev. Surcoat +3", hands="Regal Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- Audumbla Sash
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Founder's Hose", feet=gear.odyssean_fc_feet}
	
    sets.midcast['Enhancing Magic'].SIRD = {ammo="Sapience Orb",
		-- rear="Mimir Earring",
		head="Souv. Schaller +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Knightly Earring",
		-- Shab. Cuirass +1 
		body="Rev. Surcoat +3", hands="Regal Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- Audumbla Sash
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Founder's Hose", feet=gear.odyssean_fc_feet}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	
	sets.midcast.Crusade = {ammo="Sapience Orb",
		-- rear="Mimir Earring",
		head="Souv. Schaller +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Knightly Earring",
		-- Shab. Cuirass +1 
		body="Rev. Surcoat +3", hands="Regal Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- Audumbla Sash
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Founder's Hose", feet=gear.odyssean_fc_feet}
	
	sets.midcast.Crusade.SIRD = {ammo="Sapience Orb",
		-- rear="Mimir Earring",
		head="Souv. Schaller +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Knightly Earring",
		-- Shab. Cuirass +1 
		body="Rev. Surcoat +3", hands="Regal Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- Audumbla Sash
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Founder's Hose", feet=gear.odyssean_fc_feet}
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {ammo="Sapience Orb",
		-- Odyssean Helm Phalanx +5 
		head=gear.odyssean_phalanx_head, neck="Unmoving Collar +1", lear="Odnowa Earring +1", rear="Knightly Earring",
		--body=gear.odyssean_phalanx_body, 
		body="Rev. Surcoat +3", hands="Souv. Handschuhs", lring="Moonlight Ring", rring="Moonlight Ring",
		-- Sakpata Cuisses
		back=gear.phalanx_jse_back, waist="Rumination Sash", legs=gear.valorous_phalanx_legs, feet=gear.odyssean_fc_feet})
		
	sets.midcast.Phalanx.SIRD = set_combine(sets.midcast['Enhancing Magic'], {ammo="Staunch Tathlum +1",
		-- rear="Mimir Earring",
		head="Souv. Schaller +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Knightly Earring",
		--body=gear.odyssean_phalanx_body, 
		body="Rev. Surcoat +3", hands="Souv. Handschuhs", lring="Moonlight Ring", rring="Moonlight Ring",
		-- Audumbla Sash Sakpata Cuisses
		back=gear.phalanx_jse_back, waist="Rumination Sash", legs="Founder's Hose", feet=gear.odyssean_fc_feet})
	
	sets.midcast.Reprisal = set_combine(sets.midcast['Enhancing Magic'], {ammo="Sapience Orb",
		head="Souv. Schaller +1", neck="Unmoving Collar +1", lear="Odnowa Earring +1", rear="Cryptic Earring",
		-- Shab. Cuirass +1 
		body="Souveran Cuirass", hands="Souv. Handschuhs", lring="Vexer Ring +1", rring="Eiwaz Ring",
		-- Chev. Sabatons +3
		back=gear.fastcast_jse_back, waist="Creed Baudrier", legs="Souveran Diechlings", feet=gear.odyssean_fc_feet})
		
	sets.midcast.Reprisal.SIRD = set_combine(sets.midcast['Enhancing Magic'], {ammo="Sapience Orb",
		-- rear="Mimir Earring",
		head="Souv. Schaller +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Knightly Earring",
		-- Shab. Cuirass +1 
		body="Rev. Surcoat +3", hands="Regal Gauntlets", lring="Gelatinous Ring +1", rring="Defending Ring",
		-- Audumbla Sash
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Founder's Hose", feet=gear.odyssean_fc_feet})
	
	-- Divine Magic
	sets.midcast['Divine Magic'] = {}	
	
	sets.midcast.Holy = {ammo="Sapience Orb",
		--head="Nyame Helm", 
		head=empty, neck="Sanctity Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- body="Nyame Mail", hands="Nyame Gauntlets",
		body="Cohort Cloak +1", hands="Carmine Fin. Ga. +1", lring="Metamor. Ring +1",
		-- legs="Nyame Flanchard", feet="Nyame Sollerets",
		back=gear.fastcast_jse_back, waist="Orpheus's Sash", legs="Founder's Hose", feet="Founder's Greaves"}
	
	sets.midcast.Banish = {ammo="Sapience Orb",
		--head="Nyame Helm", 
		head=empty, neck="Sanctity Necklace", lear="Friomisi Earring", rear="Crematio Earring",
		-- body="Nyame Mail", hands="Nyame Gauntlets",
		body="Cohort Cloak +1", hands="Carmine Fin. Ga. +1", lring="Metamor. Ring +1",
		-- legs="Nyame Flanchard", feet="Nyame Sollerets",
		back=gear.fastcast_jse_back, waist="Orpheus's Sash", legs="Founder's Hose", feet="Founder's Greaves"}
    
	sets.midcast.Enlight = {ammo="Sapience Orb",
		-- lear="Saxnot Earring", rear="Divine Earring",
		head="Jumalik Helm", neck="Incanter's Torque",
		-- hands="Eschite Gauntlets",
		body="Rev. Surcoat +3", lring="Stikini Ring +1", rring="Stikini Ring +1",
		-- back="Altruistic Cape", waist="Asklepian Belt",
		}
	
	sets.midcast.Flash = set_combine(sets.Enmity, {ammo="Sapience Orb",
		-- lear="Trux Earring", 
		head="Loess Barbuta +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Cryptic Earring",
		body="Rev. Surcoat +3", hands="Souv. Handschuhs", lring="Vexer Ring +1", rring="Eiwaz Ring",
		-- Chev. Sabatons +3
		back=gear.fastcast_jse_back, waist="Creed Baudrier", legs="Souveran Diechlings", feet=gear.odyssean_fc_feet})
	
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity, {ammo="Staunch Tathlum +1",
		-- lear="Trux Earring", 
		head="Souv. Schaller +1", neck="Moonlight Necklace", lear="Odnowa Earring +1", rear="Cryptic Earring",
		body="Rev. Surcoat +3", hands="Souv. Handschuhs", lring="Vexer Ring +1", rring="Eiwaz Ring",
		-- waist="Audumbla Sash"
		back=gear.fastcast_jse_back, waist="Rumination Sash", legs="Founder's Hose", feet=gear.odyssean_fc_feet})
  
	-- Dark Magic 
	sets.midcast.Stun = set_combine(sets.midcast.Flash.SIRD, {})
	
	-- Blue Magic 
	sets.midcast['Blue Magic'] = set_combine(sets.midcast.Flash.SIRD, {})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.resting = {}

    -- Idle sets
    sets.idle = {ammo="Staunch Tathlum +1",
		-- Chev. Armet +3  ear1="Creed Earring", 
		head="Souv. Schaller +1", neck="Unmoving Collar +1", ear1="Odnowa Earring +1", ear2="Cryptic Earring",
		-- Sakpata's Plate Sakpata's Gauntlets 
		body="Cab. Surcoat +3", hands="Souv. Handschuhs", ring1="Moonlight Ring", ring2="Moonlight Ring",
		-- Chev. Cuisses +3 Sakpata's Leggings
		back=gear.Enmity_jse_back, waist="Sailfi Belt +1", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}
		
    sets.idle.PDT = {ammo="Staunch Tathlum +1",
		-- Combatant's Torque Tuisto Earring Chev. Earring +2
		head="Souv. Schaller +1", neck="Warder's Charm +1", ear1="Ethereal Earring",ear2="Thureous Earring",
		-- Sakpata's Plate Chev. Gauntlets +3 rring="Fortified Ring"
		body="Souveran Cuirass", hands="Chev. Gauntlets +1", lring="Shadow Ring", rring="Defending Ring",
		-- Asklepian Belt Chev. Cuisses +3
		back="Shadow Mantle", waist="Carrier's Sash", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}

    sets.idle.MDT = {ammo="Staunch Tathlum +1",
		-- Sakpata's Helm lear="Ebani Earring",
		head="Volte Cap", neck="Moonlight Necklace", ear1="Ethereal Earring", ear2="Sanare Earring",
		-- Sakpata's Plate Sakpata's Gauntlets
		body="Sacro Breastplate",hands="Volte Bracers", ring1="Vengeful Ring", ring2="Purity Ring",
		-- Asklepian Belt Sakpata's Cuisses Sakpata's Leggings
		back=gear.fastcast_jse_back, waist="Flume Belt", legs="Volte Brayettes", feet="Volte Sollerets"}
		
	sets.idle.Refresh = {ammo="Homiliary",
		--neck="Coatl Gorget +1",
		head="Jumalik Helm",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Jumalik Mail",hands="Souv. Handschuhs",ring1="Moonlight Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Souveran Diechlings",feet="Souveran Schuhs +1"}

	sets.idle.Tank = {ammo="Staunch Tathlum +1",
		-- Chev. Armet +3  ear1="Creed Earring", 
		head="Souv. Schaller +1", neck="Unmoving Collar +1", ear1="Odnowa Earring +1", ear2="Cryptic Earring",
		-- Sakpata's Plate Sakpata's Gauntlets 
		body="Cab. Surcoat +3", hands="Souv. Handschuhs", ring1="Moonlight Ring", ring2="Moonlight Ring",
		-- Chev. Cuisses +3 Sakpata's Leggings
		back=gear.Enmity_jse_back, waist="Sailfi Belt +1", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}
		
	sets.idle.KiteTank = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Thureous Earring",
		body="Cab. Surcoat +3",hands="Souv. Handschuhs",ring1="Shadow Ring",ring2="Defending Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Souveran Diechlings", feet="Hippo. Socks +1"}
		
    sets.idle.Reraise = {ammo="Staunch Tathlum +1",
		head="Crepuscular Helm",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Etiolation Earring",
		body="Twilight Mail",hands="Souv. Handschuhs",ring1="Moonlight Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Souveran Schuhs +1"}
		
    sets.idle.Weak = {ammo="Staunch Tathlum +1",
		head="Souveran Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Thureous Earring",
		body="Souveran Cuirass", hands="Souv. Handschuhs",ring1="Moonlight Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Souveran Diechlings",feet="Souveran Schuhs"}
		
	sets.Kiting = {lring="Shneddick Ring"}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_regen = {lring="Supershear Ring", rring="Apeile Ring +1"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	-- Weapon Set
	sets.weapons.Default = {main="Burtgang",sub="Aegis"}
	sets.weapons.Aegis = {main="Burtgang",sub="Aegis"}
	sets.weapons.Ochain = {main="Burtgang",sub="Ochain"}
	sets.weapons.DDWeapons = {main="Naegling",sub="Aegis"}
	sets.weapons.Almace = {main="Almace",sub="Aegis"}
	sets.weapons.Excalibur = {main="Excalibur",sub="Aegis"}
	sets.weapons.Dagger = {main="Malevolence",sub="Ochain"}
    sets.weapons.DualWeapons = {main="Burtgang",sub="Naegling"}
	sets.weapons.DualNaegling = {main="Naegling",sub="Kaja Sword"}
	
	sets.Knockback = {}
    sets.MP = {head="Chev. Armet +1", ear2="Ethereal Earring", waist="Flume Belt"} -- neck="Coatl Gorget +1",
    sets.MP_Knockback = {}
    sets.Twilight = {head="Crepuscular Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {sub="Ochain"}
    sets.MagicalShield = {sub="Aegis"}
	
    sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Chev. Armet +1", neck="Loricate Torque +1", ear1="Odnowa Earring +1", ear2="Thureous Earring",
		body="Tartarus Platemail",hands="Souv. Handschuhs",ring1="Moonlight Ring",ring2="Defending Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Souveran Diechlings",feet="Souveran Schuhs +1"}
		
    sets.defense.PDT_HP = {ammo="Staunch Tathlum +1",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1", ear2="Odnowa Earring",
		body="Rev. Surcoat +3",  hands="Souv. Handschuhs",ring1="Moonlight Ring", ring2="Moonlight Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souveran Diechlings",feet="Souveran Schuhs +1"}
		
    sets.defense.MDT_HP = {ammo="Staunch Tathlum +1",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1", ear2="Odnowa Earring",
		body="Rev. Surcoat +3", hands="Souv. Handschuhs",ring1="Moonlight Ring", ring2="Moonlight Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souveran Diechlings", feet="Souveran Schuhs +1"}
		
    sets.defense.MEVA_HP = {ammo="Staunch Tathlum +1",
        head="Souv. Schaller +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1", ear2="Etiolation Earring",
		body="Rev. Surcoat +3", hands="Souv. Handschuhs",ring1="Moonlight Ring",  ring2="Moonlight Ring",
        back="Moonbeam Cape",waist="Creed Baudrier",legs="Souveran Diechlings",feet="Souveran Schuhs +1"}
		
    sets.defense.PDT_Reraise = {ammo="Staunch Tathlum +1",
        head="Crepuscular Helm",neck="Loricate Torque +1", ear1="Odnowa Earring +1", ear2="Thureous Earring",
        body="Twilight Mail",hands="Macabre Gaunt. +1", ring1="Moonlight Ring", ring2="Defending Ring",
		-- legs="Arke Cosciales",
		back="Moonbeam Cape",waist="Flume Belt",legs="Souveran Diechlings",feet="Souveran Schuhs +1"}
		
    sets.defense.MDT_Reraise = {ammo="Staunch Tathlum +1",
        head="Crepuscular Helm",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Sanare Earring",
        body="Twilight Mail", hands="Souv. Handschuhs", ring1="Moonlight Ring", ring2="Defending Ring",
		back="Reiki Cloak",waist="Flume Belt", legs="Souveran Diechlings", feet="Cab. Leggings +3"}

	sets.defense.BDT = {ammo="Staunch Tathlum +1",
		head="Souveran Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", ear2="Odnowa Earring",
		body="Souveran Cuirass", hands="Souv. Handschuhs", lring="Moonlight Ring", rring="Defending Ring",
		back="Moonbeam Cape", waist="Nierenschutz", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}			
	
	sets.defense.Tank = {ammo="Staunch Tathlum +1",
		-- ear1="Creed Earring", 
		head="Souv. Schaller +1",neck="Loricate Torque +1", lear="Odnowa Earring +1", ear2="Thureous Earring",
		body="Tartarus Platemail",hands="Souv. Handschuhs", ring1="Shadow Ring", ring2="Defending Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Chev. Cuisses +1",feet="Souveran Schuhs +1"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		-- Sakpata's Helm lear="Ebani Earring",
		head="Volte Cap", neck="Moonlight Necklace", ear1="Ethereal Earring", ear2="Sanare Earring",
		-- Sakpata's Plate Sakpata's Gauntlets
		body="Sacro Breastplate", hands="Volte Bracers", ring1="Vengeful Ring", ring2="Purity Ring",
		-- Asklepian Belt Sakpata's Cuisses Sakpata's Leggings
		back=gear.fastcast_jse_back, waist="Flume Belt", legs="Volte Brayettes", feet="Volte Sollerets"}
		
	sets.defense.Death = {ammo="Staunch Tathlum +1",
		-- Founder's Corona 
        head="Souv. Schaller +1",neck="Warder's Charm +1",lear="Odnowa Earring +1", ear2="Sanare Earring",
		body="Tartarus Platemail",hands="Leyline Gloves",ring1="Shadow Ring",ring2="Defending Ring",
		-- waist="Asklepian Belt", legs=gear.odyssean_fc_legs,
        back=gear.fastcast_jse_back,waist="Creed Baudrier",legs="Souveran Diechlings",feet="Souveran Schuhs +1"}
		
	sets.defense.Charm = {ammo="Staunch Tathlum +1",
		-- Founder's Corona   
        head="Souv. Schaller +1", neck="Unmoving Collar +1",lear="Odnowa Earring +1", ear2="Sanare Earring",
		body="Tartarus Platemail", hands="Leyline Gloves", ring1="Supershear Ring", ring2="Purity Ring",
		-- waist="Asklepian Belt"
		back=gear.fastcast_jse_back, waist="Creed Baudrier", legs="Souveran Diechlings",feet="Odyssean Greaves"}
		
	-- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.OchainMDT = {sub="Ochain", ammo="Staunch Tathlum +1",
		-- Spellbr. Earring  
		head="Souv. Schaller +1", neck="Warder's Charm +1", lear="Odnowa Earring +1", rear="Sanare Earring",
		body="Tartarus Platemail", hands="Souv. Handschuhs", lring="Shadow Ring", rring="Defending Ring",				
		back="Reiki Cloak", waist="Creed Baudrier", legs="Mes'yohi Slacks", feet="Sulev. Leggings +2"}

    sets.defense.OchainNoShellMDT = {sub="Ochain", ammo="Staunch Tathlum +1",
		-- Founder's Corona  Sanare Earring Spellbound. Earring 
		head="Souv. Schaller +1", neck="Warder's Charm +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Tartarus Platemail", hands="Souv. Handschuhs", lring="Shadow Ring", rring="Defending Ring",
		-- Flax Sash 
		back="Moonbeam Cape", waist="Creed Baudrier", legs="Souveran Diechlings", feet="Cab. Leggings +3"}

    sets.defense.AegisMDT = {sub="Aegis", ammo="Staunch Tathlum +1",
		-- Founder's Corona Spellbr. Earring  Sanare Earring
		head="Souv. Schaller +1", neck="Warder's Charm +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		body="Tartarus Platemail", hands="Souv. Handschuhs", lring="Shadow Ring", rring="Defending Ring",				
		back="Reiki Cloak", waist="Creed Baudrier", legs="Mes'yohi Slacks", feet="Sulev. Leggings +2"}

    sets.defense.AegisNoShellMDT = {sub="Aegis", ammo="Staunch Tathlum +1",
		-- Founder's Corona  Sanare Earring Spellbound. Earring 
		head="Souv. Schaller +1", neck="Warder's Charm +1", lear="Odnowa Earring +1", rear="Etiolation Earring",
		-- Lunette Ring +1
		body="Tartarus Platemail", hands="Souv. Handschuhs", lring="Shadow Ring", rring="Defending Ring",
		--  Flax Sash 
		back="Moonbeam Cape", waist="Creed Baudrier", legs="Souveran Diechlings", feet="Cab. Leggings +3"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	sets.engaged = {ammo="Ginsen",
		head="Carmine Mask +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Digni. Earring",
		body="Souveran Cuirass +1", hands="Souv. Handschuhs", lring="Moonlight Ring", rring="Moonlight Ring",
		back=gear.TP_jse_back, waist="Windbuffet Belt +1", legs="Souveran Diechlings", feet="Carmine Greaves +1"}

    sets.engaged.Acc = { ammo="Ginsen",
		head="Carmine Mask +1", neck="Sanctity Necklace", lear="Telos Earring", rear="Digni. Earring",
		body="Souveran Cuirass +1", hands="Souv. Handschuhs", lring="Regal Ring", rring="Moonlight Ring",
		back=gear.TP_jse_back, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

    sets.engaged.DW = {ammo="Ginsen",
		head="Carmine Mask +1", neck="Sanctity Necklace",  lear="Telos Earring", rear="Digni. Earring",
		body="Souveran Cuirass +1", hands="Souv. Handschuhs", lring="Regal Ring", rring="Moonlight Ring",
		back=gear.TP_jse_back, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

    sets.engaged.DW.Acc = {ammo="Ginsen",
		head="Carmine Mask +1", neck="Sanctity Necklace",  lear="Telos Earring", rear="Digni. Earring",
		body="Souveran Cuirass +1", hands="Souv. Handschuhs", lring="Regal Ring", rring="Moonlight Ring",
		back=gear.TP_jse_back, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}

	sets.engaged.Tank = {ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Souveran Cuirass +1", hands="Souv. Handschuhs", lring="Moonlight Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}

	sets.engaged.BreathTank = {ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Souveran Cuirass +1", hands="Souv. Handschuhs", lring="Moonlight Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}

	sets.engaged.Acc.BreathTank = {ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Souveran Cuirass +1", hands="Souv. Handschuhs", lring="Moonlight Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}

	sets.engaged.DDTank = {ammo="Hasty Pinion +1",
		head="Souv. Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Souveran Cuirass +1", hands="Souv. Handschuhs", lring="Moonlight Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}
	
	sets.engaged.Acc.DDTank = {ammo="Hasty Pinion +1",
		head="Souv. Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Souveran Cuirass +1", hands="Souv. Handschuhs", lring="Moonlight Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}

	sets.engaged.NoShellTank = {ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Souveran Cuirass +1", hands="Souv. Handschuhs", lring="Moonlight Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}

    sets.engaged.Acc.Tank = {ammo="Ginsen",
		head="Souv. Schaller +1", neck="Loricate Torque +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
		body="Souveran Cuirass +1", hands="Souv. Handschuhs", lring="Moonlight Ring", rring="Defending Ring",
		back=gear.TP_jse_back, waist="Nierenschutz", legs="Souveran Diechlings", feet="Souveran Schuhs +1"}

    sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc.Tank, sets.Reraise)

    sets.engaged.DW.Tank = set_combine(sets.engaged.DW, {neck="Loricate Torque +1",ring2="Defending Ring",ring1="Moonlight Ring"})
    sets.engaged.DW.Acc.Tank = set_combine(sets.engaged.DW.Acc, {neck="Loricate Torque +1",ring2="Defending Ring",ring1="Moonlight Ring"})
    sets.engaged.DW.Reraise = set_combine(sets.engaged.DW, sets.Reraise)
    sets.engaged.DW.Acc.Reraise = set_combine(sets.engaged.DW.Acc, sets.Reraise)
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
    sets.buff.Cover = {body="Cab. Surcoat +3"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(1, 16)
    elseif player.sub_job == 'RUN' then
        set_macro_page(6, 16)
    elseif player.sub_job == 'RDM' then
        set_macro_page(5, 16)
    elseif player.sub_job == 'BLU' then
        set_macro_page(4, 16)
    elseif player.sub_job == 'DNC' then
        set_macro_page(2, 16)
    else
        set_macro_page(3, 16) --War/Etc
    end
end

function select_default_macro_book()
	set_macro_page(4, 16)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 016')
end

buff_spell_lists = {
	Auto = {	
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	When='Always'},
		{Name='Reprisal',	Buff='Reprisal',		SpellID=97,		When='Always'},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	When='Always'},
	},
	
	Default = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Reprisal',	Buff='Reprisal',		SpellID=97,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Cocoon',		Buff='Defense Boost', 	SpellID=547,	Reapply=false},
	},
}

function job_setup()

	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff.Sentinel = buffactive.Sentinel or false
    state.Buff.Cover = buffactive.Cover or false
	state.Stance = M{['description']='Stance','Hasso','Seigan','None'}

	state.CurrentStep = M{['description']='Current Step', 'Box Step', 'Quickstep'}
	
	state.AutoEmblem = M(true, 'Auto Emblem')
	state.AutoCover = M(false, 'Auto Cover')
	state.AutoMajesty = M(true, 'Auto Majesty')
	
	autows = 'Savage Blade'
	autofood = 'Miso Ramen'
	
	update_melee_groups()
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoTankMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoNukeMode","AutoStunMode","AutoDefenseMode"},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","Stance","IdleMode","Passive","RuneElement","PhysicalDefenseMode","MagicalDefenseMode","ResistDefenseMode","CastingMode","TreasureMode",})
end

autows_list = {
		['Default']='Atonement',
		['Ochain']='Atonement',
		['DDWeapons']='Savage Blade',
		['Almace']='Chant du Blade',
		['Excalibur']='Knights of Round',
		['Dagger']='Aeolian Edge',
		['DualWeapons']='Savage Blade',
		['DualNaegling']='Savage Blade',
		}