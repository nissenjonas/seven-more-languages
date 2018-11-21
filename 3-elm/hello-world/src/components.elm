module Components exposing (header)

import Html exposing (h1, text)

header value =
    h1 [] [text value]