# coffee-snippets README

This is a collection of snippets imported straight from the TextMate repo (here)[https://github.com/jashkenas/coffee-script-tmbundle.git]

# NOTICE: No longer maintained. Feel free to use/create a fork if you are interested.

---

## Features

If you have used Atom or TextMate you should be familiar with the snippets here. The standard 'fora', fore', 'if', 'elif', etc...

I suggest you just start coding and appreciate the standard snippets from every other major text editor 😉

---

## Known Issues

* There is a snippet that is supposed to automatically wrap a selection in `#{}` when you press `#` inside of an interpreted string i.e. `"Hello #{user.firstName}"`. It doesn't work and I have yet to figure out why. Any input in this regard would be appreciated.
* UPDATE! I have been toying around with keybindings and have set up a command `coffeeSnip:interpolate` that can be used to produce the desired result. For some reason the keybinding isn't showing up until the command is run first (and then you need to bind the key yourself). More to come on this.

To use this feature you need to put this in your keybindings.json
```json
{
  "command": "coffeeSnip.interpolate",
  "key": "#", # <-- This may need to be reasigned depending on your layout.
  "when": "editorTextFocus && editorLangId == coffeescript"
}
```

---

## Release Notes

Users appreciate release notes as you update your extension.

### 1.0.0

Initial release
