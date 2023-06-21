
#define VHARR_SET_ATMOS	initial_gas_mix = ATMOSPHERE_ID_VHARR
#define VHARR_TURF_CREATE(x)	x/vharr/initial_gas_mix=ATMOSPHERE_ID_VHARR;x/vharr/outdoors=TRUE
#define VHARR_TURF_CREATE_UN(x)	x/vharr/initial_gas_mix=ATMOSPHERE_ID_VHARR;x/vharr/outdoors=FALSE

/turf/simulated/open/vharr/Initialize(mapload)
	. = ..()
	if(outdoors)
		SSplanets.addTurf(src)


VHARR_TURF_CREATE(/turf/simulated/open)
VHARR_TURF_CREATE(/turf/simulated/floor)
VHARR_TURF_CREATE(/turf/simulated/floor/reinforced)
VHARR_TURF_CREATE(/turf/simulated/floor/tiled/steel_dirty)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/dirt)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/rocks)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/snow)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/snow/snow2)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/snow/plating)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/snow/plating/drift)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/ice)
VHARR_TURF_CREATE(/turf/simulated/mineral)
VHARR_TURF_CREATE(/turf/simulated/mineral/floor)
VHARR_TURF_CREATE(/turf/simulated/floor/sky/depths)
VHARR_TURF_CREATE(/turf/simulated/floor/sky/depths/west)
VHARR_TURF_CREATE(/turf/simulated/floor/plating)
VHARR_TURF_CREATE(/turf/simulated/floor/plasteel)
VHARR_TURF_CREATE(/turf/simulated/floor/tiled/steel_grid)
VHARR_TURF_CREATE(/turf/simulated/floor/tiled/techfloor/grid)
VHARR_TURF_CREATE(/turf/simulated/floor/tiled/techfloor)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/gravsnow)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/snow/noblend)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/snow/noblend/indoors)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/safeice)
VHARR_TURF_CREATE(/turf/simulated/floor/outdoors/beach/sand/desert)

//These commands generate turfs that are default indoors
VHARR_TURF_CREATE_UN(/turf/simulated/floor/tiled)
VHARR_TURF_CREATE_UN(/turf/simulated/floor/trap/wood)
VHARR_TURF_CREATE_UN(/turf/simulated/floor/trap/plating)
VHARR_TURF_CREATE_UN(/turf/simulated/floor/trap/steel)
VHARR_TURF_CREATE_UN(/turf/simulated/floor/tiled/monotile)
VHARR_TURF_CREATE_UN(/turf/simulated/floor/tiled/steel)
VHARR_TURF_CREATE_UN(/turf/simulated/floor/water/deep/indoors)
VHARR_TURF_CREATE_UN(/turf/simulated/floor/water/indoors)
VHARR_TURF_CREATE_UN(/turf/simulated/floor/bluegrid)
VHARR_TURF_CREATE_UN(/turf/simulated/floor/carpet)
VHARR_TURF_CREATE_UN(/turf/simulated/floor/carpet/bcarpet)
VHARR_TURF_CREATE_UN(/turf/simulated/floor/carpet/arcadecarpet)
VHARR_TURF_CREATE_UN(/turf/simulated/wall)
VHARR_TURF_CREATE_UN(/turf/simulated/floor/wood)
VHARR_TURF_CREATE_UN(/turf/simulated/shuttle/floor/voidcraft)
VHARR_TURF_CREATE_UN(/turf/simulated/mineral/icerock)
VHARR_TURF_CREATE_UN(/turf/simulated/mineral/icerock/floor)
VHARR_TURF_CREATE_UN(/turf/unsimulated/mineral/icerock)
VHARR_TURF_CREATE_UN(/turf/unsimulated/mineral)
VHARR_TURF_CREATE_UN(/turf/simulated/mineral/ignore_cavegen)
VHARR_TURF_CREATE_UN(/turf/simulated/mineral/floor/ignore_cavegen)
VHARR_TURF_CREATE_UN(/turf/simulated/mineral/floor/icerock)
VHARR_TURF_CREATE_UN(/turf/simulated/mineral/icerock/ignore_cavegen)
VHARR_TURF_CREATE_UN(/turf/simulated/mineral/icerock/floor/ignore_cavegen)
VHARR_TURF_CREATE_UN(/turf/simulated/floor/plating/snow/plating)


/turf/simulated/open/vharr
	edge_blending_priority = 0.5 //Turfs which also have e_b_p and higher than this will plop decorative edges onto this turf

/turf/simulated/mineral/icerock/ignore_cavegen/vharr
	baseturfs = /turf/simulated/mineral/icerock/floor/ignore_cavegen/vharr

/turf/simulated/floor/outdoors/snow/vharr
	baseturfs = /turf/simulated/floor/outdoors/safeice/vharr
	var/object_spawn_chance = 3

/turf/simulated/floor/outdoors/snow/vharr/Initialize(mapload)		/// Handles spawning random objs and such in the snow
	if(object_spawn_chance && prob(object_spawn_chance) && !check_density())
		new /obj/random/snow_debris(src)	///mapping.dm is where this obj's at
	. = ..()

/// Indoor Variants (Cause we need em). It bugs me that outdoor varients are the default but what can you do -Bloop
/turf/simulated/floor/outdoors/safeice/indoors
	outdoors = FALSE /* So that we don't get weather effects for the ice used indoors. Convuluted, I know, but this
	means I don't need another, almost identical turf to be created. */

/turf/simulated/open/vharr/indoors
	outdoors = FALSE

/turf/simulated/floor/outdoors/safeice/vharr/indoors
	outdoors = FALSE

/turf/simulated/mineral/floor/icerock/vharr/indoors
	outdoors = FALSE

/turf/simulated/mineral/floor/icerock/vharr/indoors/ignore_cavegen	// I hate having to make such a long typepath for this, very annyoing -Bloop
	ignore_cavegen = TRUE

/turf/simulated/floor/vharr/indoors
	outdoors = FALSE


/turf/simulated/floor/outdoors/dirt/vharr/indoors
	outdoors = FALSE

/turf/simulated/floor/outdoors/rocks/vharr/indoors
	outdoors = FALSE

/turf/simulated/floor/outdoors/snow/vharr/indoors
	outdoors = FALSE

/turf/simulated/floor/outdoors/gravsnow/vharr/indoors
	outdoors = FALSE

/turf/simulated/mineral/floor/vharr/indoors
	outdoors = FALSE

/turf/simulated/floor/plating/indoors
	outdoors = FALSE

/turf/simulated/floor/tiled/techfloor/grid/vharr/indoors
	outdoors = FALSE

/turf/simulated/floor/tiled/steel_dirty/vharr/indoors
	outdoors = FALSE

/turf/simulated/floor/tiled/techfloor/vharr/indoors
	outdoors = FALSE

/turf/simulated/floor/concrete/vharr/outdoors
	outdoors = TRUE

/turf/simulated/floor/concrete/rng/vharr/outdoors
	outdoors = TRUE

/turf/simulated/floor/concrete/tile/vharr/outdoors
	outdoors = TRUE


/// Needs to be remmapped to use /turf/unsimulated/mineral/icerock/vharr .
/turf/unsimulated/icerock/vharr
	icon = 'icons/turf/walls.dmi'
	icon_state = "icerock-dark"
	blocks_air = TRUE
