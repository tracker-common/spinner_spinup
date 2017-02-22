module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Spinner exposing (..)


-- component import example
-- APP


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = Model 0 GifSpinner, view = view, update = update }



-- MODEL


type alias Model =
    { number : Int, spinnerType : SpinnerType }



-- UPDATE


type SpinnerType
    = GifSpinner
    | CssSpinner


type Msg
    = ChangeNum String
    | ChangeSpinner SpinnerType


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeSpinner spinnerType ->
            { model | spinnerType = spinnerType }

        ChangeNum numString ->
            case String.toInt numString of
                Ok int ->
                    { model | number = int }

                _ ->
                    { model | number = 0 }



-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib


view : Model -> Html Msg
view model =
    let
        spinnerGif : Html Msg
        spinnerGif =
            img [ src "static/img/spinner.gif" ] []

        spinnerCss : Html Msg
        spinnerCss =
            spinner Tiny

        nSpinners : Int -> Html Msg -> List (Html Msg)
        nSpinners n spinner =
            List.map (\_ -> spinner) (List.range 1 n)

        menu =
            div []
                [ div []
                    [ button [ onClick <| ChangeSpinner GifSpinner ] [ text "Gif" ]
                    , button [ onClick <| ChangeSpinner CssSpinner ] [ text "Css" ]
                    ]
                , input
                    [ onInput ChangeNum
                    , placeholder "How many spinners?"
                    ]
                    []
                ]
    in
        div
            []
        <|
            List.concat
                [ [ menu ]
                , nSpinners
                    model.number
                    (case model.spinnerType of
                        GifSpinner ->
                            spinnerGif

                        CssSpinner ->
                            spinnerCss
                    )
                ]



-- CSS STYLES


styles : { img : List ( String, String ) }
styles =
    { img =
        [ ( "width", "33%" )
        , ( "border", "4px solid #337AB7" )
        ]
    }
