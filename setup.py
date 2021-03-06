from setuptools import setup

setup(
    name='standard_theme',
    url='https://github.com/openownership/data-standard-sphinx-theme',
    description='Sphinx Theme for Open Ownership',
    packages=['oods','oods.sphinxtheme'],
    package_data={'oods': [
        'sphinxtheme/theme.conf',
        'sphinxtheme/*.html',
        'sphinxtheme/static/*.css_t',
        'sphinxtheme/static/*.js',
        'sphinxtheme/static/bootstrap-4.0.0/css/*.css',
        'sphinxtheme/static/bootstrap-4.0.0/js/*.js',
        'sphinxtheme/static/bootstrap-4.0.0/js/*.js.map'
    ]},
    include_package_data=True,
    install_requires=['Sphinx', 'sphinx-intl', 'Pygments']
)
