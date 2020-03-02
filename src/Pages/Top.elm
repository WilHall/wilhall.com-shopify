module Pages.Top exposing (Model, Msg, page)

import Element exposing (..)
import Element.Font as Font
import Generated.Params as Params
import Spa.Page
import Utils.Spa exposing (Page)


type alias Model =
    ()


type alias Msg =
    Never


page : Page Params.Top Model Msg model msg appMsg
page =
    Spa.Page.static
        { title = always "Wil Hall"
        , view = always view
        }



-- VIEW


view : Element Msg
view =
    column
        [ centerX
        , spacing 8
        ]
        [ column [ centerX, spacing 2, paddingXY 0 15, Font.family [ Font.typeface "Sanchez", Font.serif ] ]
            [ el [ centerX, Font.size 24, Font.color <| rgb255 114 166 227 ] (text "Wil Hall")
            , el [ Font.size 18, Font.color <| rgb255 68 69 68 ] (text "Software Developer")
            ]
        , column [ spacing 8 ]
            [ profileLink (profileIcon Email) "wil@wilhall.com" "mailto:wil@wilhall.com"
            , profileLink (profileIcon LinkedIn) "linkedin.com/in/wilhall" "https://www.linkedin.com/in/wilhall"
            , profileLink (profileIcon GitHub) "github.com/WilHall" "https://github.com/WilHall"
            , profileLink (profileIcon Twitter) "@alphapneumatic" "https://twitter.com/alphapneumatic"
            , profileLink (profileIcon Mastodon) "@wilhall@mastodon.technology" "https://mastodon.technology/@wilhall"
            , profileLink (profileIcon Ralph) "thoughtbot boston" "https://thoughtbot.com/boston"
            ]
        ]


profileLink : Element msg -> String -> String -> Element msg
profileLink icon label url =
    link
        [ Font.underline
        , Font.color (rgb255 130 138 202)
        , mouseOver [ alpha 0.5 ]
        , Font.size 16
        ]
        { label = row [] [ icon, el [ paddingXY 7 0 ] (text label) ], url = url }


type ProfileIcon
    = Email
    | LinkedIn
    | GitHub
    | Twitter
    | Mastodon
    | Ralph


profileIcon : ProfileIcon -> Element msg
profileIcon icon =
    Element.image [ width <| px 22, height <| px 22 ] <|
        case icon of
            Email ->
                { description = "Email icon", src = "images/email.png" }

            LinkedIn ->
                { description = "LinkedIn logo", src = "images/linkedin.png" }

            GitHub ->
                { description = "GitHub logo", src = "images/github.png" }

            Twitter ->
                { description = "Twitter logo", src = "images/twitter.png" }

            Mastodon ->
                { description = "Mastodon logo", src = "images/mastodon.png" }

            Ralph ->
                { description = "thoughtbot logo", src = "images/ralph.png" }
