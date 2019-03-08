
var flipImageDirection = sign(move) == 0 ? lastDirection : (sign(move) * 1);
lastDirection = flipImageDirection;

var punchImage = spr_punch;



switch(currentDraw) {
	case DRAW_IDLE:	
		anim_length = 5;
		anim_speed = 8;
		var idleImage = lastDirection == -1 ? spr_player_idle_left : spr_player_idle_right;
		draw_sprite_part(idleImage,
			0,
			floor(x_frame)*move_frame_width,
			0,
			move_frame_width,
			move_frame_height,
			x-move_frame_width/2,
			y-move_frame_height+8
		);
		break;
	case DRAW_JUMP:	
		anim_length = 6
		anim_speed = 6;
		var jumpImage = lastDirection == -1 ? spr_player_jump_left : spr_player_jump_right;
		draw_sprite_part(
			jumpImage,
			0,
			floor(x_frame)*move_frame_width,
			0,
			move_frame_width,
			move_frame_height,
			x-move_frame_width/2,
			y-move_frame_height+8
		);
		break;
	case DRAW_WALK:
		anim_length = 8
		anim_speed = 10;
		var walkImage = lastDirection == -1 ? spr_player_walk_left : spr_player_walk_right;
		draw_sprite_part(
		walkImage,
			0,
			floor(x_frame)*move_frame_width,
			0,
			move_frame_width,
			move_frame_height,
			x-move_frame_width/2,
			y-move_frame_height+8
		);
		break;
	case DRAW_PUNCH:
		//increments of 60 (left = 2*60 or 3*60, right = 0*60 or 1*60)
		anim_length = punch_anim_length;
		anim_speed = punch_anim_speed;
		draw_sprite_part(
			punchImage,
			0,
			floor(x_frame)*punch_frame_width,
			punchY+1,
			punch_frame_width,
			punch_frame_height,
			x-punch_frame_width/2,
			y-punch_frame_height+8
		);

	break;
}

if(x_frame <= anim_length -1) x_frame += anim_speed/60;
else x_frame = 1;
