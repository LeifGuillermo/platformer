cam = camera_get_active();
cx = camera_get_view_x(cam);
cy = camera_get_view_y(cam);
cvwr = camera_get_view_width(cam);

draw_set_halign(fa_left);
draw_text(cx + 20, cy + 20, "Score: " + string(score));

draw_set_halign(fa_middle);
draw_text(cx + cvwr/2, cy + 20, "Health (todo: get a bar): " + string(health));

var time = get_timer();
var seconds = floor(time/1000000) % 60;
var zero =  seconds < 10 ? "0" : "";
draw_set_halign(fa_right);
draw_text(
	cx + cvwr - 20,
	cy + 20,
	"Time: " + string(floor(time/60000000)) + ":" + zero + string(seconds)
);