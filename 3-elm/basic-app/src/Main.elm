import Browser
import Html exposing (Html, h3, button, div, text)
import Html.Events exposing (onClick)


main =
  Browser.sandbox { init = init, update = update, view = view }


type alias Model = Int

init : Model
init =
  0


type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1


view : Model -> Html Msg
view model =
  div []
    [ header model
    , button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]

header : Model -> Html Msg
header model = 
    div []
    [
        h3 [] [text "Header placeholder"]
    ]