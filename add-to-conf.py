
###################################################### Use Custom Theme
#
#  There is an existing html_theme bit - search for it and replace it with this.
#

import os
html_theme = 'sphinxtheme'
html_theme_path = [os.path.join(os.path.dirname(os.path.realpath(__file__)), '..', '..', 'oods')]



###################################################### Pygments Style
#
# There is an existing pygments_style bit - search for it and replace it with this.
#

import oods.pygments
oods.pygments.pygments_monkeypatch_style("oods", oods.pygments.OODSStyle)
pygments_style = "oods"


###################################################### Extensions
# Remove sphinxcontrib.opendataservices - don't think it's actually used.
#
# There is an existing extensions bit - search for it and replace it with this.
#

extensions = ['sphinxcontrib.jsonschema']

