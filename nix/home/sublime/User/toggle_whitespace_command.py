import sublime_plugin


class ToggleWhiteSpaceCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        settings = self.view.settings()
        white_space = "selection" if settings.get("draw_white_space", "selection") != "selection" else "all"
        settings.set("draw_white_space", white_space)
