# switchto.sh [CLASS] [COMMAND]
# Switches to a window if it exists, otherwise run command
class="$1"
shift
con_id="$(i3-msg -t get_tree | jq '
  first(recurse((.nodes + .floating_nodes)[]) |
  select(any(
	.window_properties.class,
	.window_properties.instance,
	.window_properties.window_role,
	.app_id;
	values and match("'"${class}"'")
  )).id)'
)"
if [ -n "${con_id:-}" ]
then i3-msg "[con_id=${con_id%% }]" focus
else i3-msg exec -- "$@"
fi
