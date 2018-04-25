
###################################################### Use Custom Theme

import os
html_theme = 'oods'
html_theme_path = [os.path.join(os.path.dirname(os.path.realpath(__file__)), '..', '..', 'themes')]



###################################################### Pygments Style
# https://stackoverflow.com/questions/48615629/how-to-include-pygments-styles-in-a-sphinx-project

from pygments.style import Style
from pygments.token import Keyword, Name, Comment, String, Error, \
     Number, Operator, Generic, Whitespace

class OODSStyle(Style):
    background_color = "#fbfbfb"
    default_style = ""
    styles = {
        String: "#d9534f"
    }


def pygments_monkeypatch_style(mod_name, cls):
    import sys
    import pygments.styles
    cls_name = cls.__name__
    mod = type(__import__("os"))(mod_name)
    setattr(mod, cls_name, cls)
    setattr(pygments.styles, mod_name, mod)
    sys.modules["pygments.styles." + mod_name] = mod
    from pygments.styles import STYLE_MAP
    STYLE_MAP[mod_name] = mod_name + "::" + cls_name


pygments_monkeypatch_style("oods", OODSStyle)
pygments_style = "oods"


###################################################### Extensions
# Remove sphinxcontrib.opendataservices - don't think it's actually used.

extensions = ['sphinxcontrib.jsonschema']

