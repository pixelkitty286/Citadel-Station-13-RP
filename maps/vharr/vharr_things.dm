//Trailblazers!
/datum/category_item/catalogue/material/trail_blazer
	name = "Ice Colony Equipment - Trailblazer"
	desc = "This is a glowing stick embedded in the ground with a light on top, commonly used in snowy installations \
	and in tundra conditions."
	value = CATALOGUER_REWARD_EASY

/obj/machinery/trailblazer
	name = "trail blazer"
	desc = "A glowing stick- light."
	icon = 'icons/obj/mining.dmi'
	icon_state = "redtrail_light_on"
	density = TRUE
	anchored = TRUE
	catalogue_data = list(/datum/category_item/catalogue/material/trail_blazer)

/obj/machinery/trailblazer/Initialize()
	randomize_color()
	return ..()

/obj/machinery/trailblazer/proc/randomize_color()
	if(prob(30))
		icon_state = "redtrail_light_on"
		set_light(2, 2, "#FF0000")
	else
		set_light(2, 2, "#33CC33")

/obj/machinery/trailblazer/red
	name = "trail blazer"
	desc = "A glowing stick- light.This one is glowing red."
	icon = 'icons/obj/mining.dmi'
	icon_state = "redtrail_light_on"

/obj/machinery/trailblazer/red/randomize_color()
	if(prob(30))
		icon_state = "redtrail_light_on"
	set_light(2, 2, "#FF0000")

/obj/machinery/trailblazer/blue
	name = "trail blazer"
	desc = "A glowing stick- light. This one is glowing blue."
	icon = 'icons/obj/mining.dmi'
	icon_state = "bluetrail_light_on"

/obj/machinery/trailblazer/blue/randomize_color()
	if(prob(30))
		icon_state = "bluetrail_light_on"
	set_light(2, 2, "#C4FFFF")

/obj/machinery/trailblazer/yellow
	name = "trail blazer"
	desc = "A glowing stick- light. This one is glowing blue."
	icon_state = "yellowtrail_light_on"

/obj/machinery/trailblazer/yellow/randomize_color()
	if(prob(30))
		icon_state = "yellowtrail_light_on"
	set_light(2, 2, "#ffea00")
