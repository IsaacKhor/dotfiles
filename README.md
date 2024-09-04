The main install script is [here](bin/install-dotfiles.sh).

To set up the ssh agent, use: `ln -sfFn $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock`

Create my user:

```
sudo useradd ikhor
sudo usermod -aG sudo ikhor
```

Nopassword sudoers: `isaackhor ALL=NOPASSWD: ALL`
