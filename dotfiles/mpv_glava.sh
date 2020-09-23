( glava --desktop --entry=screen1.glsl &>/dev/null ) &
( glava --desktop --entry=screen2.glsl &>/dev/null ) &
( mpv "$@" ) &
wait -n
pkill -P $$
echo done
