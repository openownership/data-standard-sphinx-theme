# openownership/data-standard-sphinx-theme

This repository holds the custom theme for https://github.com/openownership/data-standard

It also holds various files and tools to build this theme.

## To use to write docs

If you are writing docs only and **don't** need to change the theme then please follow the instructions at https://github.com/openownership/data-standard/blob/master/README.md

## To use as a theme developer

You will need Vagrant and VirtualBox (or equivalent).

1. Check out this git repository into a folder anywhere.  eg data-standard-sphinx-theme
2. Check out the https://github.com/openownership/data-standard git repository into a folder called "data-standard" inside the other folder. eg data-standard-sphinx-theme/data-standard 
3. Follow the instructions in the data-standard README.md. This is especially important if you are going to be translating a version of the data-standard's schema.
4. (you may want to check out a particular branch of the data-standard repository now.)
5. Follow the instructons in add-to-conf.py in the root directory to edit conf.py in data-standard/docs/conf.py .
6. In the folder for this repository (eg data-standard-sphinx-theme) run "vagrant up"
7. Run "vagrant ssh" to connect to this box (Windows user may want to install the putty plugin and run "vagrant putty" instead). 
8. Inside the box, run "build"
9. Browse "http://localhost:8080"

Edit any files you want, then repeat the last 2 steps!

## To build different languages

Simply pass a variable:

    BODSLANG=ru build

### Problems

Q: Pip install fails saying "ERROR: Could not install packages due to an EnvironmentError: [Errno 39] Directory not empty"?
A: Just run the command again. If the error persists, run 

    rm -rf /vagrant/data-standard/.ve

and try again.

## To look for broken links

When you are connected to the vagrant box (after running "vagrant ssh"), run:

    build

At the end this will check all internal links and echo a report. Hopefully you will see:

    SUCCESS Crawled 91 urls in 2.53 seconds

This will only check internal links. If you want to check external links to, run:

    build
    pylinkvalidate.py --test-outside --output=/tmp/report.txt  http://localhost/
    cat /tmp/report.txt

Any errors reported in external links must be checked by hand - sometimes a website will block our automatic checker but let a human through. 

## Translations

If you add English text to a theme (including in `title` attributes or similar), make sure to wrap it in `{% trans %}` / `{% endtrans %}` blocks.

You need to get a [Transifex API key](https://www.transifex.com/user/settings/api/), make sure you have access to the [BODS Theme project on Transifex](https://www.transifex.com/OpenDataServices/bods-theme).

After you add translatable strings to the theme templates:

1. Extract the strings (to `oods/locale/sphinx.pot`): `python setup.py extract_messages`
2. Push to Transifex: `tx push -s`
3. Fetch new translations from Transifex: `tx pull -a`
4. To build a particular language locally you can run `sphinx-build -b html -D language={lang} . _build/html/{lang}` (from the `data-standard/docs` directory)

