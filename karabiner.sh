#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set general.dont_remap_apple_keyboard 1
/bin/echo -n .
$cli set remap.commandL2optionL 1
/bin/echo -n .
$cli set remap.optionL2commandL 1
/bin/echo -n .
$cli set remap.pc_application2fn 1
/bin/echo -n .
$cli set repeat.initial_wait 250
/bin/echo -n .
$cli set repeat.wait 33
/bin/echo -n .
/bin/echo
