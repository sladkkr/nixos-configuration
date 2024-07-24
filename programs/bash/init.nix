''
	echo WAIT FOR TERMINAL INITIALIZATION
	sleep 1
	clear

	function print_blank {
		if [[ $# -lt 1 ]]; then
			echo You need to provide width in characters!
			exit 1
		fi

		printf " %.0s" $(seq 1 $1)
	}
	
	function print_separator {
		local HALF_WIDTH=$(( ($(tput cols) - ''${#PWD}) / 2 ))
		local RESULT="$(print_blank $HALF_WIDTH)$PWD$(print_blank $HALF_WIDTH)"

		if [[ ''${#RESULT} -lt $(tput cols) ]]; then
			echo "$RESULT "
		else
			echo "$RESULT"
		fi
	}

	function color_code_per_hostname {
		case $HOSTNAME in
			"amber")
				echo 33
				;;
			"cobalt")
				echo 34
				;;
			*)
				echo 31
				;;
		esac
	}
	
	PS1='\[\033[0;$(color_code_per_hostname);7m\]$(print_separator)\[\033[0;$(color_code_per_hostname)m\]~~>\[\033[0m\] '
	PS0='\[\033[m\]'
''
