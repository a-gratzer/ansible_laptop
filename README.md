Developer - Machine - Setup
======

Ansible Playbook for Pop-OS (Debian distro) configuration

Makefile
-----

- Call ```make init``` to create a ```.env``` file within project-folder.<br>
- Set sudo-password in .env file.
- Check ```Makefile``` and run ```make``` commands :)
- Also check out the **tags** on **tasks**.
  - Use tags in ```Makefile``` e.g.: ```--tags alacritty```

Tags
---
TODO: List tags

Playbooks
---
- laptop.yml

Roles/Tasks
---
1. commons
   1. apt basics
   2. apt packages
   3. folders
   4. hosts
2. communication
   1. snap
      1. slack
      2. discord
3. deployment
   1. snap
      1. heroku
   2. download
      1. cntb (Contabo cli)
4. development
   1. apt
      1. neovim
   1. snap
      1. codium
      2. postman
      3. insomnia
5. terminal
   1. alacritty
   2. byobu (tmux alternative)