import vscode from 'vscode'


activeDocuments = new Map()

export activate = ->
  vscode.commands.registerTextEditorCommand 'coffeeSnip.interpolate',
    (editor) ->
      returnDefault = ->
        editor.insertSnippet new vscode.SnippetString('#'),
          editor.selection.active
      new Promise -> try
        if not editor
          console.log 'No Editor?'
          return
        doc = editor.document
        cursorOffset = doc.offsetAt editor.selection.active
        templateStart = 0
        templateEnd = 0
        if doc.languageId isnt 'coffeescript'
          returnDefault()
          console.log 'Not Coffeescript'
          return

        text = doc.getText()
        matcher = /"[^"]*"/g
        # match = matcher.exec(text)
        while (match = matcher.exec(text)) isnt null
          nonmatcher = /#{[^}]*}/g
          while (nonmatch = nonmatcher.exec(match[0])) isnt null
            nonStart = nonmatch.index
            nonEnd = nonmatcher.lastIndex
            if nonStart < cursorOffset < nonEnd
              returnDefault()
              return
          templateStart = match.index
          templateEnd = matcher.lastIndex
          if templateStart < cursorOffset < templateEnd
            vscode.commands.executeCommand 'editor.action.insertSnippet',
              name: '#'
            return
          else if templateStart > cursorOffset
            return returnDefault()
        returnDefault()

      catch err
        vscode.window.showErrorMessage err?.stack
