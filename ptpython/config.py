from __future__ import unicode_literals

from prompt_toolkit.filters import ViInsertMode
from prompt_toolkit.key_binding.input_processor import KeyPress
from prompt_toolkit.keys import Keys
from ptpython.layout import CompletionVisualisation
from pygments.token import Token

__all__ = (
    'configure',
)


def configure(repl):
    """
    Configuration method. This is called during the start-up of ptpython.
    :param repl: `PythonRepl` instance.
    """
    repl.show_signature = True
    repl.show_docstring = False
    repl.show_meta_enter_message = True
    repl.show_line_numbers = True
    repl.show_status_bar = True
    repl.show_sidebar_help = True
    repl.highlight_matching_parenthesis = True
    repl.wrap_lines = True
    repl.enable_mouse_support = True
    repl.complete_while_typing = True
    repl.vi_mode = True
    repl.paste_mode = False
    repl.insert_blank_line_after_output = False
    repl.enable_history_search = True
    repl.enable_auto_suggest = False
    repl.enable_open_in_editor = True
    repl.enable_system_bindings = True
    repl.confirm_exit = True
    repl.enable_input_validation = True
    repl.true_color = True

    repl.completion_visualisation = CompletionVisualisation.POP_UP
    repl.completion_menu_scroll_offset = 0

    repl.prompt_style = 'classic'  # 'classic' or 'ipython'
    repl.use_code_colorscheme('monokai')

    @repl.add_key_binding(Keys.ControlB)
    def _(event):
        ' Pressing Control-B will insert "pdb.set_trace()" '
        event.cli.current_buffer.insert_text('\nimport pdb; pdb.set_trace()\n')

    corrections = {
        'impotr': 'import',
        'pritn': 'print',
    }
    @repl.add_key_binding(' ')
    def _(event):
        ' When a space is pressed. Check & correct word before cursor. '
        b = event.cli.current_buffer
        w = b.document.get_word_before_cursor()
        if w is not None:
            if w in corrections:
                b.delete_before_cursor(count=len(w))
                b.insert_text(corrections[w])
        b.insert_text(' ')
