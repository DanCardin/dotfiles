# predictable ssh authentication socket location.
sock="/tmp/ssh-agent-$user-screen"
if test $ssh_auth_sock && [ $ssh_auth_sock != $sock ]
then
    rm -f /tmp/ssh-agent-$user-screen
    ln -sf $ssh_auth_sock $sock
    export ssh_auth_sock=$sock
fi
