#!/bin/sh

# setup.sh
# Maintainer:	kyoh86
# License:		MIT License(http://www.opensource.org/licenses/MIT)

if [ -n "${VIM_TERMINAL}" ]; then
  vim() {
    has_option=0
    for x; do
      case $x in
        -- )
          :
          ;;
        -* )
          has_option=1
          ;;
      esac
    done
    if [ $has_option = 1 ] ; then
      command vim "$@"
    else
      ${EDITOR} "$@"
    fi
  }
  if [ "${VIM_EDITERM_DEFDROP}" = "1" ]; then
    eval "function ${VIM_EDITERM_DEFDROP_PREFIX}drop()"' { ${VIM_EDITERM_DROP} "$@"; }'
    eval "function ${VIM_EDITERM_DEFDROP_PREFIX}edit()"' { VIM_EDITERM_OPENER=e ${VIM_EDITERM_DROP} "$@"; }'
    eval "function ${VIM_EDITERM_DEFDROP_PREFIX}new()"' { VIM_EDITERM_OPENER=n ${VIM_EDITERM_DROP} "$@"; }'
    eval "function ${VIM_EDITERM_DEFDROP_PREFIX}vnew()"' { VIM_EDITERM_OPENER=v ${VIM_EDITERM_DROP} "$@"; }'
    eval "function ${VIM_EDITERM_DEFDROP_PREFIX}tabnew()"' { VIM_EDITERM_OPENER=t ${VIM_EDITERM_DROP} "$@"; }'
  fi
fi
