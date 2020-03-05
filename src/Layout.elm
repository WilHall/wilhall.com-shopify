module Layout exposing (view)

import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Generated.Routes as Routes exposing (Route, routes)
import Utils.Spa as Spa


view : Spa.LayoutContext msg -> Element msg
view { page, route } =
    column [ height fill, width fill, Background.tiled "images/background.png", Font.size 16, Font.family [ Font.typeface "Bitter", Font.serif ] ]
        [ viewHeader route
        , page
        , viewFooter route
        ]


viewHeader : Route -> Element msg
viewHeader currentRoute =
    row
        [ spacing 37
        , paddingEach { top = 32, left = 16, right = 16, bottom = 32 }
        , centerX
        , width (shrink |> maximum 480)
        ]
        [ viewLink currentRoute ( "home", routes.top )
        , navLink "blog" "https://thoughtbot.com/blog/authors/wil-hall"
        , navLink "recipes (wip)" "https://recipes.wilhall.com/"
        ]


viewLink : Route -> ( String, Route ) -> Element msg
viewLink currentRoute ( label, route ) =
    if currentRoute == route then
        el
            [ Font.underline
            , Font.color (rgb255 130 138 202)
            , alpha 0.5
            ]
            (text label)

    else
        navLink label (Routes.toPath route)


navLink : String -> String -> Element msg
navLink label url =
    link
        [ Font.underline
        , Font.color (rgb255 130 138 202)
        , mouseOver [ alpha 0.5 ]
        ]
        { label = text label
        , url = url
        }


viewFooter : Route -> Element msg
viewFooter _ =
    column
        [ width fill
        , paddingEach { top = 32, left = 16, right = 16, bottom = 32 }
        , Font.color <| rgb255 68 69 68
        ]
        [ row [ centerX, centerY ]
            [ text "made with ", el [ Font.color <| rgb255 130 138 202 ] (text "♥︎"), text " in ", navLink "elm" "https://elm-lang.org/" ]
        , row
            [ spacing 37
            , centerX
            , centerY
            , width (fill |> maximum 480)
            ]
            [ hotlineWebring ]
        ]


hotlineWebring : Element msg
hotlineWebring =
    row [ centerX, centerY ] [ webringArrow "⇜" "https://hotlinewebring.club/wilhall/previous", el [ paddingEach { top = 10, left = 0, right = 0, bottom = 0 } ] webringHomeLink, webringArrow "⇝" "https://hotlinewebring.club/wilhall/next" ]


webringHomeLink : Element msg
webringHomeLink =
    link
        [ Font.size 20
        , Font.color (rgb255 130 138 202)
        , mouseOver [ alpha 0.5 ]
        ]
        { label = text "hotline webring"
        , url = "https://hotlinewebring.club/"
        }


webringArrow : String -> String -> Element msg
webringArrow label url =
    link
        [ Font.size 50
        , Font.bold
        , Font.color (rgb255 130 138 202)
        , mouseOver [ alpha 0.5 ]
        ]
        { label = text label
        , url = url
        }
