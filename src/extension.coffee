import vscode from 'vscode'

activeDocuments = new Map()
interpSnip = new vscode.SnippetString('#{${0:$TM_SELECTED_TEXT}}')
snip = new vscode.SnippetString('#')

export activate = -> vscode.commands.registerTextEditorCommand 'coffeeSnip.interpolate', (editor) ->
  new Promise (resolve) -> try
    if not editor
      console.log 'No Editor?'
      return
    doc = editor.document
    cursorOffset = doc.offsetAt editor.selection.active
    templateStart = 0
    templateEnd = 0
    if doc.languageId isnt 'coffeescript'
      editor.insertSnippet(snip, editor.selection.active)
      console.log 'Not Coffeescript'
      return

    text = doc.getText()
    matcher = /"[^"]*"/g
    # match = matcher.exec(text)
    while (match = matcher.exec(text)) isnt null
      console.log match
      templateStart = match.index
      templateEnd = matcher.lastIndex
      if templateStart < cursorOffset < templateEnd
        editor.insertSnippet(interpSnip, editor.selection.active)
        return resolve()
    editor.insertSnippet(snip, editor.selection.active)

  catch err
    vscode.window.showErrorMessage err?.stack
