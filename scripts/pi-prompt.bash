get_node_version () {
  node --version | head -c -1
}

get_go_version () {
  gvm-prompt
}

get_python_version() {
  python --version | head -c -1
}

get_temperature() {
  vcgencmd measure_temp | head -c -1
}

get_voltage() {
  vcgencmd measure_volts | head -c -1
}

PS1='${debian_chroot:+($debian_chroot)}\u@\h | node $(get_node_version) | $(get_voltage) $(get_temperature) | \w\$ '

