#!/bin/zsh

# PATH
alias cProf='instruments -t "/Applications/Xcode.app/Contents/Applications/Instruments.app/Contents/Resources/templates/Time Profiler.tracetemplate" -D res.log '
export PATH="/usr/local/share/python:/Developer/NVIDIA/CUDA-5.5/bin:/usr/local/sbin:~/.cabal/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin"
export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"
eval "$(rbenv init -)"
eval "$(hub alias -s)"
function newcpp () { cp ~/sample.cpp ./"$@".cpp }
