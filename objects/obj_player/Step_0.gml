//Get player input.
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

key_punch = keyboard_check_pressed(ord("F"));

//Calculate movement.
move = key_right - key_left;

h_spd = move * walkspd;
v_spd = v_spd + grav;

var onFloor = place_meeting(x, y+1, obj_flat_collision);

if(onFloor && key_jump)
{
	v_spd = -8;
}

//Horizontal collision.
if(place_meeting(x+h_spd,y,obj_flat_collision)){
	while(!place_meeting(x+sign(h_spd), y, obj_flat_collision)) {
		x += sign(h_spd);
	}
	h_spd = 0;
}
x += h_spd;

//Vertical collision.
if(place_meeting(x,y+v_spd,obj_flat_collision)){
/*	while(!place_meeting(x, y+sign(v_spd), obj_flat_collision)) {
		y += sign(v_spd);
	}
*/	v_spd = 0;
}

y += v_spd;

//Animation i
//If there's not a collision 1 pixel immediately below us.
if (!onFloor) {
	currentDraw = DRAW_JUMP;
}else if (onFloor && move == 0){
	currentDraw = DRAW_IDLE;	
}else if (onFloor && move != 0){
	currentDraw = DRAW_WALK;	
}

if (key_punch && punch_time == 0) { //initiate punch
	punch_time = punch_anim_speed;
	currentDraw = DRAW_PUNCH;
	punching = true;
	punchY = (lastDirection == -1 ? choose(2, 3) : choose(0, 1)) * 60;
	newPunchX = x+10*lastDirection;
	if(onFloor && !place_meeting(newPunchX,y,obj_flat_collision)) {
		x = newPunchX;
	}
	instance_create_layer(x+19, y-21,"hit_collision_layer",obj_punch_collision);
	
} else if (punch_time > 0 && punching) { // continue punch animation
	currentDraw = DRAW_PUNCH;
	punch_time--;
} else if (punch_time <= 0 && punching) {
	punching = false;	
	//x -= lastDirection * 10;
	while(place_meeting(x,y,obj_flat_collision)) {
		x-=lastDirection;
	}
}

if(y > room_height) {
	room_goto(game_over_screen);	
}