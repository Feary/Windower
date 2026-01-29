----gearsets your character will use among multiple jobs.
sets.BehemothSuit = {body="Behemoth Suit +1",hands=empty,legs=empty,feet=empty}
sets.Sheltered = {ring2="Sheltered Ring"}
sets.Capacity = {back={name="Mecisto. Mantle", augments={'Cap. Point+40%','HP+18','Rng.Atk.+4','DEF+13',}}}

sets.buff.RolledEleven = {} --ring2="Roller's Ring"
sets.buff.Doom = {waist="Gishdubar Sash",} -- ring1="Eshmun's Ring", ring2="Eshmun's Ring"
sets.TreasureHunter = {body="Volte Jupon", hands="Volte Bracers", feet="Volte Boots"}

sets.precast.Item['Hallowed Water'] = {}
sets.precast.Item['Holy Water'] = {}

-- JSE Weapons 
gear.Barfawc_PathC = {name="Barfawc", augments={'Path: C',}}
gear.Rostam_PathA = {name="Rostam", augments={'Path: A',}}
gear.Rostam_PathC = {name="Rostam", augments={'Path: C',}}

--Augmented items that you'll use among multiple jobs.

--------------------------------------
	-- Alluvion Skirmish Gear
	

--------------------------------------

-- Taeon
	-- Head 1/1
	-- Body 1/1
	-- Hands 1/1
	-- Legs 1/1
	-- Feet 1/1
-- 

-- Head 
gear.taeon_head_Snapshot = {name="Taeon Chapeau", augments={'Accuracy+19 Attack+19','"Snapshot"+5','"Snapshot"+5',}}
-- Dusk dim
--gear.taeon_head_Phalanx = {name="Taeon Chapeau", augments={'Accuracy+19 Attack+19','"Snapshot"+5','"Snapshot"+5',}}
gear.taeon_head_pettp = { name="Taeon Chapeau", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}}

-- Body 
gear.taeon_body_Fastcast = {name="Taeon Tabard", augments={'Accuracy+15 Attack+15','"Fast Cast"+4','Phalanx +3',}}
gear.taeon_body_Phalanx = {name="Taeon Tabard", augments={'Accuracy+15 Attack+15','"Fast Cast"+4','Phalanx +3',}}
gear.taeon_body_pettp ={ name="Taeon Tabard", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}}

-- Hands
gear.taeon_hands_Phalanx = {name="Taeon Gloves", augments={'Accuracy+16 Attack+16','"Triple Atk."+2','Phalanx +3',}}
gear.taeon_hands_pettp ={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}}

-- Legs
gear.taeon_legs_Phalanx = {name="Taeon Tights", augments={'Accuracy+25','"Dual Wield"+5','Phalanx +3',}}
gear.taeon_hands_pettp = { name="Taeon Tights", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}}

-- Feet
gear.taeon_feet_Phalanx = {name="Taeon Boots", augments={'Accuracy+18 Attack+18','"Triple Atk."+1','Phalanx +3',}}
gear.taeon_hands_pettp = { name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}}

-- Telchine
	-- Head 2/2
	-- Body 3/3
	-- Hands 3/3
	-- Legs 2/2
	-- Feet 2/3
--

-- Head
	gear.telchine_head_Duration = { name="Telchine Cap", augments={'"Elemental Siphon"+10','Enh. Mag. eff. dur. +10',}}
	gear.telchine_head_Siphon = { name="Telchine Cap", augments={'"Elemental Siphon"+10','Enh. Mag. eff. dur. +10',}}
	gear.telchine_head_Pet = {name="Telchine Cap", augments={'Mag. Evasion+18','Pet: "Regen"+3','Pet: Damage taken -3%',}}
	-- HP CurePotency
	gear.telchine_head_curerecieved = {}

-- Body 
	-- Leaforb
	--gear.telchine_body_CureRecieved = {}
	gear.telchine_body_Duration = { name="Telchine Chas.", augments={'"Elemental Siphon"+30','Enh. Mag. eff. dur. +10',}}
	gear.telchine_body_Siphon = {name="Telchine Chas.",augments={'"Elemental Siphon"+30','Enh. Mag. eff. dur. +10',}}
	gear.telchine_body_Pet = { name="Telchine Chas.", augments={'Mag. Evasion+21','Pet: "Regen"+3','Pet: Damage taken -3%',}}

--Hands 
	gear.telchine_hands_Cure = { name="Telchine Gloves", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}}
	gear.telchine_hands_Duration = { name="Telchine Gloves", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}}
	
	-- Leaforb
	--gear.telchine_hands_Siphon = { name="Telchine Gloves", augments={'"Elemental Siphon"+10',}}
	gear.telchine_hands_Pet = { name="Telchine Gloves", augments={'Mag. Evasion+15','Pet: "Regen"+3','Pet: Damage taken -4%',}}

-- Legs 
	gear.telchine_legs_Duration = { name="Telchine Braconi", augments={'"Elemental Siphon"+5','Enh. Mag. eff. dur. +10',}}
	-- Leaforb
	gear.telchine_legs_Siphon = { name="Telchine Braconi", augments={'"Elemental Siphon"+5','Enh. Mag. eff. dur. +10',}}
	gear.telchine_legs_Pet = { name="Telchine Braconi", augments={'Mag. Evasion+24','Pet: "Regen"+3','Pet: Damage taken -3%',}}
	-- HP CurePotency Recieved
	gear.telchine_legs_curerecieved = {}

-- Feet
	gear.telchine_feet_Song = { name="Telchine Pigaches", augments={'Mag. Acc.+20','Song spellcasting time -7%',}}
	gear.telchine_feet_Duration = { name="Telchine Pigaches", augments={'Haste+2','Enh. Mag. eff. dur. +10',}}
	-- Duskdim need feet
	gear.telchine_feet_Regen = { name="Telchine Pigaches",  augments={'"Regen" potency+3',}}


-- Acro
	-- Head 1/1
	-- Body 1/1
	-- Hands 2/2
	-- Legs 1/2
	-- Feet 1/1
--

-- Head 
	gear.acro_head_CallBeast = {name="Acro Helm", augments={'"Call Beast" ability delay -5',}}

-- Body 
	gear.acro_body_breathe = {name="Acro Surcoat", augments={'Pet: Mag. Acc.+25','Pet: Breath+8',}}

-- Hands 
-- Breathe+/macc +1~25 Snoworb
	gear.acro_hands_breathe = {name="Acro Gauntlets", augments={'Pet: Mag. Acc.+22','Pet: Breath+8',}}
	gear.acro_hands_stp = {name="Acro Gauntlets", augments={'Accuracy+20 Attack+20','"Store TP"+6','STR+6 DEX+6',}}

-- Legs 
	gear.acro_legs_breathe = { name="Acro Breeches", augments={'Pet: Mag. Acc.+23','Pet: Breath+8',}}
	-- Call Beast Delay Leaforb needs legs
	gear.acro_legs_CallBeast ={name="Acro Breeches", augments={'"Call Beast" ability delay -5',}}

-- Feet 
-- Breathe+/macc Snoworb
	gear.acro_feet_breathe = {name="Acro Leggings", augments={'Pet: Mag. Acc.+21','Pet: Breath+8',}}

-- Helios
	-- Head 1/1
	-- Body 0/1 
	-- Hands 2/2
	-- Legs 0/0
	-- Feet 1/1
--

-- Head 
	-- name="Helios Band", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
	gear.helios_head_BP = {name="Helios Band", augments={'Pet: Attack+24 Pet: Rng.Atk.+24','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+6',}}

-- Body 
	-- Occult Acumen need jacket
	gear.helios_body_occult = {name="Helios Jacket", augments={}}

-- Hands
	gear.helios_hands_Occult = {name="Helios Gloves", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Occult Acumen"+10',}}
	--  add MP
	gear.helios_hands_FC = {name="Helios Gloves", augments={'"Fast Cast"+5',}}

-- Legs 

-- Feet
	-- MAB 20 MACC 20 Snowdim 
	gear.helios_feet_occult = {name="Helios Boots", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','"Occult Acumen"+10',}}

-- Yorium 
-- Head 
-- Body 
-- Hands 1/1 
-- Legs 
-- Feet

-- Head 
-- Body 
-- Yorium Gauntlets
	-- Enmity+10  Leafslit 
	gear.yorium_hands_enmity = {name="Yorium Gauntlets", augments={'Accuracy+21','Enmity+9','Damage taken-3%',}}
	-- Occult acuman - drk - int macc Occult
	gear.yorium_hands_Occult = {}
-- Yorium Legs 
	gear.yorium_legs_Occult = {}
	
-- Yorium Feet

-- Alluvion Skirmish Weapons

	-- Kumbhakarna  dusk orb tp 200   leaf crit double attack  snow atk/ratk

--------------------------------------
	-- Escha
--------------------------------------

--------------------------------------
--- Eschite 
--------------------------------------

	--gear.eschite_enmity_feet = {name="Eschite Greaves"}

	-- Psycloth Boots
	gear.psycloth_boots_MP = {name="Psycloth Boots", augments={'MP+50','INT+7','"Conserve MP"+6',}}

--------------------------------------
	-- Reisinjima
	-- Weapons/Chironic/Herculean/Valorous/Odyssean/Merlinic
--------------------------------------


--------------------------------------
--- Weapons 
--------------------------------------

	gear.gada_enhancing_club = {name="Gada",augments={'Enh. Mag. eff. dur. +6','Mag. Acc.+1',}}
	gear.gada_healing_club = {name="Gada",augments={'"Cure" potency +6%','Mag. Acc.+10','"Mag.Atk.Bns."+16','DMG:+8',}}
	--gear.gada_indi_club = {}
	
	-- gear.grioavolr_nuke_staff = {name="Grioavolr",augments={'Magic burst dmg.+8%','MP+61','Mag. Acc.+16','"Mag.Atk.Bns."+30','Magic Damage +7',}}
	-- gear.grioavolr_refresh_staff = {name="Grioavolr"}
	--{name="Grioavolr",augments={'"Fast Cast"+7','MP+20','Mag. Acc.+17','"Mag.Atk.Bns."+10','Magic Damage +5',}}
	gear.grioavolr_fc_staff = "Oranyan"
	--gear.grioavolr_pet_staff = {name="Grioavolr",augments={'Blood Pact Dmg.+8','Pet: STR+10','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+30',}}

--------------------------------------
--- Chironic 
--------------------------------------

-- Head
	--gear.chironic_refresh_head = {}
	
-- Body

-- Hands 
	--gear.chironic_enfeeble_hands = {name="Chironic Gloves",augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','MND+10','Mag. Acc.+15',}}
	--gear.chironic_refresh_hands = {name="Chironic Gloves",augments={'Phys. dmg. taken -1%','STR+10','"Refresh"+1','Accuracy+12 Attack+12','Mag. Acc.+12 "Mag.Atk.Bns."+12',}}

-- Legs
	gear.chironic_macc_legs = {name="Chironic Hose", augments={'Mag. Acc.+24','"Cure" potency +11%','"Mag.Atk.Bns."+4',}}
	gear.chironic_cure_legs = {name="Chironic Hose", augments={'Mag. Acc.+24','"Cure" potency +11%','"Mag.Atk.Bns."+4',}}

-- Feet	
	gear.chironic_refresh_feet = {name="Chironic Slippers",augments={'Pet: Mag. Acc.+18 Pet: "Mag.Atk.Bns."+18','Pet: Mag. Acc.+3','"Refresh"+1','Accuracy+13 Attack+13','Mag. Acc.+8 "Mag.Atk.Bns."+8',}}

--------------------------------------
--- Herculean 
--------------------------------------

-- Head
	gear.herculean_fc_head = {name="Herculean Helm", augments={'CHR+2','Damage taken-3%','"Fast Cast"+7','Mag. Acc.+14 "Mag.Atk.Bns."+14',}}
	--Herc Helm AGI/Mab/wsd
	gear.herculean_nuke_head = {name="Herculean Helm", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','INT+10','Mag. Acc.+3','"Mag.Atk.Bns."+9',}}

-- Body
	--gear.herculean_waltz_body = {name="Herculean Vest",augments={'Attack+26','"Waltz" potency +11%','AGI+4','Accuracy+5',}}
	--gear.herculean_wsd_body = {name="Herculean Vest",augments={'Accuracy+11','Weapon skill damage +5%','DEX+7',}}
	gear.herculean_phalanx = {name="Herculean Vest", augments={'"Drain" and "Aspir" potency +3','MND+2','Phalanx +2','Mag. Acc.+18 "Mag.Atk.Bns."+18',}}
-- Hands 
	gear.herculean_refresh_hands = {name="Herculean Gloves", augments={'STR+1','Pet: "Dbl. Atk."+3','"Refresh"+1','Mag. Acc.+15 "Mag.Atk.Bns."+15',}}
	--gear.herculean_waltz_hands = {name="Herculean Gloves",augments={'Rng.Acc.+16','"Waltz" potency +11%','AGI+1',}}

-- Legs
	--gear.herculean_fc_legs = {}
	--gear.herculean_dt_legs = {name="Herculean Trousers",augments={'Attack+15','Damage taken-4%','STR+3','Accuracy+12',}}
	--gear.herculean_wsd_legs = {name="Herculean Trousers",augments={'Weapon skill damage +5%','DEX+8','Accuracy+13','Attack+14',}}
	--Herc Trousers AGI/Macc/MAB 
	gear.herculean_nuke_legs = {name="Herculean Trousers", augments={'"Snapshot"+4','Mag. Acc.+21','Accuracy+5 Attack+5','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}

-- Feet
	--gear.herculean_fc_feet = {}
	gear.herculean_ta_feet = {name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+3','DEX+7',}}
	--gear.herculean_waltz_feet = {name="Herculean Boots",augments={'Attack+10','"Waltz" potency +10%','AGI+4','Accuracy+9',}}
	gear.herculean_nuke_feet = {name="Herculean Boots", augments={'Accuracy+28','"Triple Atk."+3','DEX+7',}}
	--gear.herculean_refresh_feet = {name="Herculean Boots",augments={'CHR+8','Rng.Acc.+7','"Refresh"+1','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}

--------------------------------------
--- Merlinic 
--------------------------------------

-- Head 
	gear.merlinic_refresh_head = {name="Merlinic Hood", augments={'Crit.hit rate+3','Pet: Haste+2','"Refresh"+1','Accuracy+1 Attack+1','Mag. Acc.+20 "Mag.Atk.Bns."+20',}}
	-- Summoner?
	-- FC +4 or more
	gear.merlinic_fc_head = "Merlinic Hood"
	-- Drain/Aspir +10
	-- gear.merlinic_aspir_head = {}
-- Body 
	gear.merlinic_phalanx_body = {name="Merlinic Jubbah", augments={'Pet: Accuracy+19 Pet: Rng. Acc.+19','Pet: Phys. dmg. taken -3%','Phalanx +4','Accuracy+20 Attack+20',}}
	-- Need Ea Houppelande +1
	gear.merlinic_MB_body = {name="Merlinic Jubbah", augments={'"Rapid Shot"+2','INT+2','Magic burst dmg.+13%','Mag. Acc.+7 "Mag.Atk.Bns."+7',}}
	-- FC
	gear.merlinic_fc_body = "Merlinic Jubbah"
	-- Drain/Aspir +10
	--gear.merlinic_aspir_body = {}
	gear.merlinic_occult_body = "Merlinic Jubbah"

-- Hands
	gear.merlinic_magpact_hands = {name="Merlinic Dastanas",augments={'Pet: Mag. Acc.+25 Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+9','Pet: DEX+4',}}
	gear.merlinic_maccpact_hands = {name="Merlinic Dastanas",augments={'Pet: Mag. Acc.+25 Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+9','Pet: DEX+4',}}
	gear.merlinic_physpact_hands = {name="Merlinic Dastanas", augments={'Pet: Attack+10 Pet: Rng.Atk.+10','Blood Pact Dmg.+5',}}
	gear.merlinic_accpact_hands = {name="Merlinic Dastanas",augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Blood Pact Dmg.+9','Pet: DEX+1','Pet: Mag. Acc.+10','Pet: "Mag.Atk.Bns."+6',}}
	--gear.merlinic_occult_hands = {}
	-- FC +7 - Volte Bracers has 6
	--gear.merlinic_fc_hands = {}
	-- Refresh +2
	--gear.merlinic_refresh_hands = {}
	-- Drain/Aspir +10
	--gear.merlinic_aspir_hands = "Merlinic Dastanas"
	-- OA +11
	gear.merlinic_occult_hands = "Merlinic Jubbah"
	
-- Legs 
	-- Refresh +2
	gear.merlinic_refresh_legs = {name="Merlinic Shalwar", augments={'"Blood Pact" ability delay -1','Accuracy+13','"Refresh"+1','Accuracy+16 Attack+16','Mag. Acc.+6 "Mag.Atk.Bns."+6',}}

-- Feet 
	-- Drain/Aspir +10
	gear.merlinic_aspir_feet = {name="Merlinic Crackows", augments={'STR+7','Accuracy+24 Attack+24','"Fast Cast"+3','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}
	-- FC +7
	gear.merlinic_fc_feet = {name="Merlinic Crackows",augments={'STR+7','Accuracy+24 Attack+24','"Fast Cast"+3','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}
	--gear.merlinic_refresh_feet = {name="Merlinic Crackows", augments={'Pet: DEX+7','Pet: Mag. Acc.+7','"Refresh"+2','Accuracy+20 Attack+20',}}
	-- OA +11
	--gear.merlinic_occult_feet = {name="Merlinic Crackows"}

--------------------------------------
--- Odyssean 
--------------------------------------

-- Head
	gear.odyssean_phalanx_head = {name="Odyssean Helm", augments={'MND+1','Accuracy+17 Attack+17','Phalanx +2',}}

-- Body	
	-- Replaced By Nyame --gear.odyssean_mab_body = {name="Odyss. Chestplate", augments={'AGI+7','"Mag.Atk.Bns."+29','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}
	gear.odyssean_phalanx_body = {name="Odyss. Chestplate", augments={'AGI+7','"Mag.Atk.Bns."+29','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}

-- Hands
	--gear.odyssean_wsd_hands = { name="Odyssean Gauntlets", augments={'Accuracy+26','Weapon skill damage +4%','STR+6','Attack+14',}}

-- Legs
	--gear.odyssean_stp_legs = {name="Odyssean Cuisses",augments={'Accuracy+28','"Store TP"+6','DEX+9',}}
	--gear.odyssean_fc_legs = {name="Odyssean Cuisses",augments={'"Fast Cast"+6','"Mag.Atk.Bns."+12',}}
	-- Replaced By Sakpata Cuisses -- 
	gear.odyssean_phalanx_legs = {name="Valorous Hose", augments={'Sklchn.dmg.+4%','"Blood Pact" ability delay -8','Phalanx +5','Mag. Acc.+11 "Mag.Atk.Bns."+11',}}

-- Feet
	gear.odyssean_fc_feet 	= "Odyssean Greaves"
	gear.odyssean_cure_feet = "Odyssean Greaves"
	
--------------------------------------
--- Valorous
--------------------------------------

-- Head
	--gear.valorous_magical_wsd_head = {name="Valorous Mask",augments={'"Mag.Atk.Bns."+17','Weapon skill damage +5%','Attack+10',}}
	gear.valorous_wsd_head = {name="Valorous Mask", augments={'Weapon skill damage +3%','Rng.Acc.+18','Accuracy+19 Attack+19',}}
	--gear.valorous_pet_head = {name="Valorous Mask",augments={'Pet: "Mag.Atk.Bns."+25','Pet: "Regen"+3','Pet: INT+14','Pet: Accuracy+2 Pet: Rng. Acc.+2',}}

-- Body
	--gear.valorous_pet_body = {name="Valorous Mail",augments={'Pet: "Mag.Atk.Bns."+26','"Dbl.Atk."+3','Pet: INT+8','Pet: Accuracy+13 Pet: Rng. Acc.+13','Pet: Attack+12 Pet: Rng.Atk.+12',}}
	--Valorous Mail STR +7~10, Acc/Atk +15+, STP +7~8
	gear.valorous_wsd_body = {name="Valorous Mail", augments={'Accuracy+25 Attack+25','Weapon skill damage +4%','Accuracy+10','Attack+12',}}

-- Hands
	
-- Legs
	--Valor. Hose STR +7~10, Acc/Atk +15+, STP +7~8
	--gear.valorous_stp_legs = {name="Valor. Hose",augments={'Pet: Attack+29 Pet: Rng.Atk.+29','Pet: "Dbl.Atk."+3 Pet: Crit.hit rate +3','Pet: STR+8','Pet: Accuracy+8 Pet: Rng. Acc.+8',}}
	--gear.valorous_physical_pet_legs = {name="Valor. Hose",augments={'Pet: Attack+29 Pet: Rng.Atk.+29','Pet: "Dbl.Atk."+3 Pet: Crit.hit rate +3','Pet: STR+8','Pet: Accuracy+8 Pet: Rng. Acc.+8',}}
	--gear.valorous_magical_pet_legs = { name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+28','Pet: "Regen"+3','Pet: INT+13','Pet: Attack+2 Pet: Rng.Atk.+2',}}
	gear.valorous_phalanx_legs = {name="Valor. Hose", augments={'Sklchn.dmg.+4%','"Blood Pact" ability delay -8','Phalanx +5','Mag. Acc.+11 "Mag.Atk.Bns."+11',}}

-- Feet
	--gear.valorous_magical_pet_feet = {name="Valorous Greaves",augments={'Pet: "Mag.Atk.Bns."+29','Pet: "Dbl.Atk."+1 Pet: Crit.hit rate +1','Pet: INT+9','Pet: Accuracy+1 Pet: Rng. Acc.+1','Pet: Attack+4 Pet: Rng.Atk.+4',}}
	gear.valorous_wsd_feet = {name="Valorous Greaves", augments={'Pet: Accuracy+15 Pet: Rng. Acc.+15','Accuracy+29','Accuracy+13 Attack+13',}}