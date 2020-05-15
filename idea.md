This repo will contain all the configuration files that I use across all my
systems.

There's a problem: I use two different machines (a laptop and a workstation).
Each of these have different os. The workspace has a dual boot Windows - Arch,
and the laptops has Arch.

I tend to use software that is kind of compatible will all the systems (e.g.
Neovim) but the configurations may differ.
So the goal of this repo is make some sort of script that given a configuration,
handles it and install it in the correct folders depending on the os.

The software I use is the following (2020-05-15):

- bash (Linux, WSL)
- aliases (Linux, WSL, Windows) it would be great to somehow merge all the
  systems into one alias file. For the moment maybe it would be good to keep two
  versions, one for Unix systems and another for Windows.
- Powershell (Windows)
- zsh (Linux) after some issues in WSL I may switch to pur bash on all my
  systems.
- Neovim (Linux, WSL, Windows) in Windows i tend to use more the GUI version.
- i3 (Linux) maybe I will try dwm in the near future, but let's not get inot
  that now.

### 2020-05-15

The first thing that I need to decide is how I can manage all this shit.
It's obvious that I will need some kind of programming to handle all and maybe
even defining some specific configuration protocol (yaml, json, whatever).

It's obvious that bash is not a good choice, as the language used should be
cross platform and easy to install/pre-installed.
So Python is a good choice. It's a scripting language and, as i.m not looking
for performance, I only need to get the job done.
So let's go with Python 3.

Things that are important to keep in my mind:

1. CROSS PLATFORM!
1. Make it simple
1. Try not to use external libs (this would require some Python env setup, bla
   bla, try to avoid it)

