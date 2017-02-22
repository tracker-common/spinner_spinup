module Spinner exposing (spinner, Size(..))

import Html exposing (..)
import Html.Attributes exposing (..)


type Size
    = Big
    | Normal
    | Small
    | Tiny


spinner : Size -> Html msg
spinner size =
    let
        classes =
            [ ( "preloader-wrapper", True )
            , ( "spinner", True )
            , ( "active", True )
            , ( "big", size == Big )
            , ( "small", size == Small )
            , ( "tiny", size == Tiny )
            ]
    in
        div
            [ classList classes
            , attribute "data-aid" "spinner"
            ]
            [ div [ class "spinner-layer spinner-blue-only" ]
                [ div [ class "circle-clipper left" ]
                    [ div [ class "circle" ] []
                    ]
                , div [ class "gap-patch" ] [ div [ class "circle" ] [] ]
                , div [ class "circle-clipper right" ] [ div [ class "circle" ] [] ]
                ]
            ]



-- img [ src "images/spinner.gif" ] []
