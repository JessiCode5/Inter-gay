//Look Sir, free head!
/mob/living/simple_animal/head
	name = "CommandBattle AI"
	desc = "A standard borg shell on its chest crude marking saying CommandBattle AI MK4 : Head."
	icon_state = "crab"
	icon_living = "crab"
	icon_dead = "crab_dead"
	speak_emote = list("clicks")
	emote_hear = list("clicks")
	emote_see = list("clacks")
	universal_speak = 1
	speak_chance = 1
	turns_per_move = 5
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "punches"
	var/list/insults = list(
	"Man you suck",
	"You look like the most ignorant douche around",
	"What's up?, oh wait nevermind you are a fucking asshat",
	"you are just overly ignorant",
	"Man said what?!",)
	var/list/comments = list("Nice.")
	stop_automated_movement = 1

/mob/living/simple_animal/head/Life()
	if(stat == DEAD)
		if(health > 0)
			icon_state = icon_living
			set_stat(CONSCIOUS)
			set_density(1)
		return
	else if(health < 1)
		Die()
	else if(health > maxHealth)
		health = maxHealth
	for(var/mob/A in viewers(world.view,src))
		if(A.ckey)
			say_something(A)
/mob/living/simple_animal/head/proc/say_something(mob/A)
	if(prob(85))
		return
	if(prob(30))
		var/msg = pick(insults)
		msg = "Hey, [A.name].. [msg]"
		src.say(msg)
	else
		var/msg = pick(comments)
		src.say(msg)
