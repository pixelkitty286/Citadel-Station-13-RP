//Simulated
#define VHARR_SET_ATMOS	initial_gas_mix = ATMOSPHERE_ID_VHARR
#define VHARR_TURF_CREATE(x)	x/vharr/initial_gas_mix=ATMOSPHERE_ID_VHARR;x/vharr/outdoors=TRUE
#define VHARR_TURF_CREATE_UN(x)	x/vharr/initial_gas_mix=ATMOSPHERE_ID_VHARR;x/vharr/outdoors=FALSE

VHARR_TURF_CREATE(/turf/simulated/open)
/turf/simulated/open/vharr
	edge_blending_priority = 0.5 //Turfs which also have e_b_p and higher than this will plop decorative edges onto this turf
/turf/simulated/open/vharr/New()
	..()
	if(outdoors)
		SSplanets.addTurf(src)

VHARR_TURF_CREATE(/turf/simulated/floor)

/turf/simulated/floor/vharr_indoors
	VHARR_SET_ATMOS

VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/snow)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/snow/snow2)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/gravsnow)

VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/snow/plating)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/snow/plating/drift)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/rocks)
VHARR_TURF_CREATE(/turf/simulated/floor/plating/snow/plating)
VHARR_TURF_CREATE(/turf/simulated/floor/tiled/vharr)
VHARR_TURF_CREATE(/turf/simulated/floor/tiled/old_tile/gray)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/safeice)

//rock
VHARR_TURF_CREATE_UN(/turf/simulated/mineral/icerock)
VHARR_TURF_CREATE_UN(/turf/simulated/mineral/icerock/floor)
VHARR_TURF_CREATE_UN(/turf/simulated/mineral/icerock/ignore_cavegen)
VHARR_TURF_CREATE_UN(/turf/simulated/mineral/icerock/floor/ignore_cavegen)


/turf/simulated/floor/outdoors/snow/vharr
	baseturfs = /turf/simulated/floor/outdoors/safeice/vharr
	var/object_spawn_chance = 3

/turf/simulated/floor/outdoors/snow/vharr/Initialize(mapload)		/// Handles spawning random objs and such in the snow
	if(object_spawn_chance && prob(object_spawn_chance) && !check_density())
		new /obj/random/snow_debris(src)	///mapping.dm is where this obj's at
	. = ..()

/turf/simulated/floor/tiled/old_tile/gray/vharr
	VHARR_SET_ATMOS

// Overriding these for the sake of submaps that use them on other planets.
// This means that mining on tether base and space is oxygen-generating, but solars and mining should use the virgo3b subtype
/turf/simulated/mineral
	initial_gas_mix = GAS_STRING_TURF_DEFAULT
	temperature	= T20C
/turf/simulated/floor/outdoors
	initial_gas_mix = GAS_STRING_TURF_DEFAULT
	temperature	= T20C
/turf/simulated/floor/water
	initial_gas_mix = GAS_STRING_TURF_DEFAULT
	temperature	= T20C

/turf/simulated/floor/indoorrocks //Not outdoor rocks to prevent weather fuckery
	name = "rocks"
	desc = "Hard as a rock."
	icon = 'icons/turf/outdoors.dmi'
	icon_state = "rock"
	edge_blending_priority = 1

VHARR_TURF_CREATE(/turf/simulated/mineral)
VHARR_TURF_CREATE(/turf/simulated/mineral/floor)
	//This proc is responsible for ore generation on surface turfs
/turf/simulated/mineral/vharr/make_ore(var/rare_ore)
	if(mineral || ignore_mapgen)
		return
	var/mineral_name
	if(rare_ore)
		mineral_name = pickweight(list(
			"uranium" = 10,
			"platinum" = 10,
			"hematite" = 20,
			"carbon" = 20,
			"diamond" = 1,
			"gold" = 8,
			"silver" = 8,
			"phoron" = 18))
	else
		mineral_name = pickweight(list(
			"uranium" = 5,
			"platinum" = 5,
			"hematite" = 35,
			"carbon" = 35,
			"gold" = 3,
			"silver" = 3,
			"phoron" = 25))
	if(mineral_name && (mineral_name in GLOB.ore_data))
		mineral = GLOB.ore_data[mineral_name]
		UpdateMineral()
	update_icon()

/turf/simulated/mineral/vharr/rich/make_ore(var/rare_ore)
	if(mineral || ignore_mapgen)
		return
	var/mineral_name
	if(rare_ore)
		mineral_name = pickweight(list(
			"uranium" = 10,
			"platinum" = 10,
			"hematite" = 10,
			"carbon" = 10,
			"diamond" = 4,
			"gold" = 15,
			"silver" = 15))
	else
		mineral_name = pickweight(list(
			"uranium" = 7,
			"platinum" = 7,
			"hematite" = 28,
			"carbon" = 28,
			"diamond" = 2,
			"gold" = 7,
			"silver" = 7))
	if(mineral_name && (mineral_name in GLOB.ore_data))
		mineral = GLOB.ore_data[mineral_name]
		UpdateMineral()
	update_icon()

//Unsimulated
/turf/unsimulated/mineral/vharr
	blocks_air = TRUE



/turf/unsimulated/wall
	blocks_air = 1

/turf/unsimulated/wall/planetary
	blocks_air = 0

// Some turfs to make floors look better in centcom tram station.
//might remove this :)

/turf/unsimulated/floor/techfloor_grid
	name = "floor"
	icon = 'icons/turf/flooring/techfloor.dmi'
	icon_state = "techfloor_grid"

/turf/unsimulated/floor/maglev
	name = "maglev track"
	desc = "Magnetic levitation tram tracks. Caution! Electrified!"
	icon = 'icons/turf/flooring/maglevs.dmi'
	icon_state = "maglevup"

/turf/unsimulated/wall/transit
	icon = 'icons/turf/transit_vr.dmi'

/turf/unsimulated/floor/transit
	icon = 'icons/turf/transit_vr.dmi'

/obj/effect/floor_decal/transit/orange
	icon = 'icons/turf/transit_vr.dmi'
	icon_state = "transit_techfloororange_edges"

/obj/effect/transit/light
	icon = 'icons/turf/transit_128.dmi'
	icon_state = "tube1-2"
/*
// Bluespace jump turf!
/turf/space/bluespace
	name = "bluespace"
	icon = 'icons/turf/space_vr.dmi'
	icon_state = "bluespace"
/turf/space/bluespace/Initialize()
	..()
	icon = 'icons/turf/space_vr.dmi'
	icon_state = "bluespace"
*/

// Desert jump turf!
/turf/space/sandyscroll
	name = "sand transit"
	icon = 'icons/turf/transit_vr.dmi'
	icon_state = "desert_ns"
/turf/space/sandyscroll/New()
	..()
	icon_state = "desert_ns"

//Sky stuff!
// A simple turf to fake the appearance of flying.
/turf/simulated/sky/vharr
	color = "#E0FFFF"

/turf/simulated/sky/vharr/Initialize()
	SSplanets.addTurf(src)
	set_light(2, 2, "#E0FFFF")

/turf/simulated/sky/vharr/north
	dir = NORTH
/turf/simulated/sky/vharr/south
	dir = SOUTH
/turf/simulated/sky/vharr/east
	dir = EAST
/turf/simulated/sky/vharr/west
	dir = WEST

/turf/simulated/sky/vharr/moving
	icon_state = "sky_fast"
/turf/simulated/sky/vharr/moving/north
	dir = NORTH
/turf/simulated/sky/vharr/moving/south
	dir = SOUTH
/turf/simulated/sky/vharr/moving/east
	dir = EAST
/turf/simulated/sky/vharr/moving/west
	dir = WEST

/*
/turf/simulated/sky/snowscroll
	name = "snow transit"
	icon = 'icons/turf/transit_yw.dmi'
	icon_state = "snow_ns"


/turf/simulated/sky/snowscroll/Initialize()
	SSplanets.addTurf(src)
	set_light(2, 2, "#E0FFFF")
*/
