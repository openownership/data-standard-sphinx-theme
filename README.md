# openownership/data-standard-sphinx-theme

This repository holds the custom theme for https://github.com/openownership/data-standard

It also holds various files and tools to build this theme.

## To use as a developer / writer

You will need Vagrant and VirtualBox (or equivalent).

1. Check out this git repository into a folder anywhere.  eg data-standard-sphinx-theme
2. Check out the https://github.com/openownership/data-standard git repository into a folder called "data-standard" inside the other folder. eg data-standard-sphinx-theme/data-standard 
3. (you may want to check out a particular branch of the data-standard repository now.)
4. Copy the bits from add-to-conf.py into the real conf.py ( TODO we need to do better with this step! )
5. In the folder for this repository (eg data-standard-sphinx-theme) run "vagrant up"
6. Run "vagrant ssh" to connect to this box (Windows user may want to install the putty plugin and run "vagrant putty" instead). 
7. Inside the box, run "build-all"
8. Browse "http://localhost:8080"

Edit any files you want, then repeat the last 2 steps!


