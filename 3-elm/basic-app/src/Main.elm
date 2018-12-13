import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url

main : Program () Model Msg
main =
  Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChanged
    , onUrlRequest = LinkClicked
    }



type alias Model =
  { key : Nav.Key
  , url : Url.Url
  }

init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
  ( Model key url, Cmd.none )



type Msg
  = LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    LinkClicked urlRequest ->
      case urlRequest of
        Browser.Internal url ->
          ( model, Nav.pushUrl model.key (Url.toString url) )

        Browser.External href ->
          ( model, Nav.load href )

    UrlChanged url ->
      ( { model | url = url }
      , Cmd.none
      )



subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none


view : Model -> Browser.Document Msg
view model =
  { title = "Message broker monitoring"
  , body =
      [ 
      stylesheet, fontAwesome
      , nav 
      , ul []
          [ viewLink "/home"
          , viewLink "/log-overview"
          ]
      ]
  }


viewLink : String -> Html msg
viewLink path =
  li [] [ a [ href path ] [ text path ] ]

homePage : Html Msg
homePage =
  div [][]

nav : Html Msg
nav = 
    div [class "navbar navbar-expand-lg navbar-light bg-light"]
    [
        a [class "navbar-brand", href "#"] [text "Navbar"]
        , button [class "navbar-toggler", type_ "button"] 
          [
            span [class "navbar-toggler-icon"] []
          ]
    ]


-- Below is stolen straight from
-- https://github.com/rundis/elm-bootstrap/blob/master/src/Bootstrap/CDN.elm
-- Consider importing the package: http://elm-bootstrap.info/

stylesheet : Html msg
stylesheet =
    node "link"
        [ rel "stylesheet"
        , href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        ]
        []


{-| Font Awesome can also be conveniently included as an inline node. Font Awesome is not a dependency for `elm-bootstrap`.
-}
fontAwesome : Html msg
fontAwesome =
    node "link"
        [ rel "stylesheet"
        , href "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        ]
        []