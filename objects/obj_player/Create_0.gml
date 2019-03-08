h_spd = 0;
v_spd = 0;
grav = 0.3;
walkspd = 4;


//Sprite drawing variables.
anim_length = -1;
anim_speed = -1;

DRAW_IDLE = 0;
DRAW_WALK = 1;
DRAW_JUMP = 2;
DRAW_PUNCH = 3;

currentDraw = DRAW_IDLE;
x_frame = 0;
lastDirection = 1;

move_frame_width = 60;
move_frame_height = 60;

punch_frame_width = 69;
punch_frame_height = 60;
punch_time = 0;
punch_time_speed = 30;
punching = false;
punchY = 0;

punch_anim_speed = 10;
punch_anim_length = 5; //5 frames

