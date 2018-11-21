# Elm

## Development Setup
```powershell
# Install the elm dev tools via chocolatey
choco install elm-platform
```

### Editor (VS Code)

Install the "elm" extension for VS Code for Elm language support.

## Quick start

### Elm binary

```powershell
# Simply type "elm" for help
> elm 

# Starts the Elm repl from the console
> elm repl 

# starts a local server allowing you to browse your project in the browser
> elm reactor
```

### Hello World!

````elm
-- Imports "text" function from the "Html" module.
-- To import multiple functions use comma separator.
-- To import everything from a module simply write (..).
import Html exposing (text)

-- Program entry point is always main
main =
  text "Hello World!"
```` 

## Docs
* [Elm website](https://elm-lang.org)
* [Elm packages](https://package.elm-lang.org/)   
* [Ellie - Elm Online Editor](https://ellie-app.com/new)