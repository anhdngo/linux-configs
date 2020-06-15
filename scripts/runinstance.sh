# runinstance.sh [CLASS] [COMMAND]
# Runs command if window/instance does not exist
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
if [ -z "${con_id:-}" ]
    then
        i3-msg "exec --no-startup-id $@"
fi
