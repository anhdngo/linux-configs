( glava --desktop --entry=screen-1.glsl &>/dev/null ) &
( glava --desktop --entry=screen-2.glsl &>/dev/null ) &
( mpv "$@" ) &
wait -n
pkill -P $$
echo done
