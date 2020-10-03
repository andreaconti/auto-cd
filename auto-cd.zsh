#!/usr/bin/env zsh

# FLAGS

if (( ! ${+AUTO_CD_CHPWD} )); then
    AUTO_CD_CHPWD=true
fi

if (( ! ${+AUTO_CD_HOME} )); then
    AUTO_CD_HOME=$HOME
fi

if (( ! ${+AUTO_CD_NO_AUTO_LS} )); then
    AUTO_CD_NO_AUTO_LS=false
fi

# change directory

{
    # disable auto-ls if needed
    if [ $AUTO_CD_NO_AUTO_LS = true ]; then
        auto_ls_index=${chpwd_functions[(I)auto-ls]}
        if [[ $auto_ls_index != 0 ]]; then
            to_remove=auto-ls
            chpwd_functions=("${chpwd_functions[@]/$to_remove}")
        fi
    fi

    # source and change dir
    if [[ -f "$HOME/.last_cd" ]]; then
        OLD_PATH=$(cat "$HOME/.last_cd")
        cd "$OLD_PATH"
    else
        cd "$AUTO_CD_HOME"
    fi
} always {

    # check auto-ls
    if [[ $AUTO_CD_NO_AUTO_LS -eq true ]]; then
        if [[ $auto_ls_index != 0 ]]; then
            chpwd_functions+=(auto-ls)
        fi
    fi


}

# functions

function auto-cd-init-cd {
    CURR_PWD=$(pwd)
    echo "$CURR_PWD" > "$HOME/.last_cd"
}

# append hook function

if [[ ${AUTO_CD_CHPWD} == true && ${chpwd_functions[(I)auto-cd-init-cd]} -eq 0 ]]; then
    chpwd_functions+=(auto-cd-init-cd)
fi
