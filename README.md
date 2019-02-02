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

Once you have run "build-all" once, you can switch to the faster "build-sphinx" command. 
This only runs the sphinx stage, and does not build the theme files. 
If you have only changed content, use "build-sphinx". 
If you or someone else has changed the theme, or you are unsure about which to use, use "build-all". 

## To look for broken links

When you are connected to the vagrant box (after running "vagrant ssh"), run:

    build-all
    pylinkvalidate.py --output=/tmp/report.txt  http://localhost/
    less /tmp/report.txt

This will only check internal links. If you want to check external links to, add " --test-outside"

    pylinkvalidate.py --test-outside --output=/tmp/report.txt  http://localhost/

## Translations

If you add English text to a theme (including in `title` attributes or similar), make sure to wrap it in `{% trans %}` / `{% endtrans %}` blocks.

You need to get a [Transifex API key](https://www.transifex.com/user/settings/api/), make sure you have access to the [BODS Theme project on Transifex](https://www.transifex.com/OpenDataServices/bods-theme).

After you add translatable strings to the theme templates:

1. Extract the strings (to `oods/locale/sphinx.pot`): `python setup.py extract_messages`
2. Push to Transifex: `tx push -s`
3. Fetch new translations from Transifex: `tx pull -a`
4. To build a particular language locally you can run `sphinx-build -b html -D language={lang} . _build/html/{lang}` (from the `data-standard/docs` directory)