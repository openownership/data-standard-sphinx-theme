import os


def get_html_theme_path():
    """Return the HTML theme path to set in Sphinx to use this theme"""
    cur_dir = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))
    return cur_dir
