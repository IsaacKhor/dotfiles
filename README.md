The structure of this repo is based on a bare git repo with $HOME as the
working directory, as described [here](https://www.atlassian.com/git/tutorials/dotfiles)
and in some random HN comments.

The main install script is [here](bin/install-dotfiles.sh). To setup a completely
new machine, use the script [here](bin/setup-machine.sh) or run

```
curl -sS https://raw.githubusercontent.com/IsaacKhor/dotfiles/refs/heads/master/bin/setup-machine.sh | sudo bash
```

To set up the ssh agent, use: `ln -sfFn $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock`
