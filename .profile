export PATH=/usr/local/bin:$PATH
export PATH=~/bin:$PATH
alias ll="ls -al"
alias realpath="grealpath"
alias make="gmake"

function run() {
    number=$1
    shift
    for n in $(seq $number); do
      $@
    done
}

. ~/erlang_installations/21_3/activate
