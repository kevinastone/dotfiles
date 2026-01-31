import sublime_plugin


class ToggleRulerCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        settings = self.view.settings()
        if settings.get("rulers", []):
            rulers = []
        else:
            rulers = [80]
        settings.set("rulers", rulers)
