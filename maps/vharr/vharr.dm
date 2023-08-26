//this is bad redo this

#if !defined(USING_MAP_DATUM)

	#include "vharr_defines.dm"
	#include "vharr_turfs.dm"
	#include "vharr_jobs.dm"
	#include "job/outfits.dm"
	#include "job/outfits_yw.dm"
	#include "vharr_things.dm"
	#include "tether_phoronlock.dm"
	#include "vharr_areas.dm"
	#include "vharr_shuttle_defs.dm"
	#include "vharr_shuttles.dm"
	#include "vharr_telecomms.dm"
	#include "elevator_areas.dm"
	#include "service_elevator_things.dm"
	#include "residential/_residential.dm"
	#include "residential/residential_keys.dm"

	#if !AWAY_MISSION_TEST //Don't include these for just testing away missions
		#include "vharr-01-centcomm.dmm" //centcom
		#include "vharr-02-mining.dmm" //mining
		#include "vharr-03-transit.dmm" //transit level
		#include "vharr-04-maintenance.dmm" //lowerlevel
		#include "vharr-05-main.dmm" //main level

		#include "residential/residential.dmm" //residential level
	#endif

	#include "submaps/_vharr_submaps.dm"

	#define USING_MAP_DATUM /datum/map/vharr

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Vharr

#endif
