port module Pages exposing (PathKey, allPages, allImages, application, images, isValidRoute, pages)

import Color exposing (Color)
import Head
import Html exposing (Html)
import Json.Decode
import Json.Encode
import Mark
import Pages.Platform
import Pages.ContentCache exposing (Page)
import Pages.Manifest exposing (DisplayMode, Orientation)
import Pages.Manifest.Category as Category exposing (Category)
import Url.Parser as Url exposing ((</>), s)
import Pages.Document as Document
import Pages.ImagePath as ImagePath exposing (ImagePath)
import Pages.PagePath as PagePath exposing (PagePath)
import Pages.Directory as Directory exposing (Directory)


type PathKey
    = PathKey


buildImage : List String -> ImagePath PathKey
buildImage path =
    ImagePath.build PathKey ("images" :: path)



buildPage : List String -> PagePath PathKey
buildPage path =
    PagePath.build PathKey path


directoryWithIndex : List String -> Directory PathKey Directory.WithIndex
directoryWithIndex path =
    Directory.withIndex PathKey allPages path


directoryWithoutIndex : List String -> Directory PathKey Directory.WithoutIndex
directoryWithoutIndex path =
    Directory.withoutIndex PathKey allPages path


port toJsPort : Json.Encode.Value -> Cmd msg


application :
    { init : ( userModel, Cmd userMsg )
    , update : userMsg -> userModel -> ( userModel, Cmd userMsg )
    , subscriptions : userModel -> Sub userMsg
    , view : userModel -> List ( PagePath PathKey, metadata ) -> Page metadata view PathKey -> { title : String, body : Html userMsg }
    , head : metadata -> List (Head.Tag PathKey)
    , documents : List ( String, Document.DocumentHandler metadata view )
    , manifest : Pages.Manifest.Config PathKey
    , canonicalSiteUrl : String
    }
    -> Pages.Platform.Program userModel userMsg metadata view
application config =
    Pages.Platform.application
        { init = config.init
        , view = config.view
        , update = config.update
        , subscriptions = config.subscriptions
        , document = Document.fromList config.documents
        , content = content
        , toJsPort = toJsPort
        , head = config.head
        , manifest = config.manifest
        , canonicalSiteUrl = config.canonicalSiteUrl
        , pathKey = PathKey
        }



allPages : List (PagePath PathKey)
allPages =
    [ (buildPage [ "blog", "curry-generator_en" ])
    , (buildPage [ "blog", "distributed-game_en" ])
    , (buildPage [ "blog", "drag_and_drop" ])
    , (buildPage [ "blog", "duel-dice_en" ])
    , (buildPage [ "blog" ])
    , (buildPage [ "blog", "myBlog_de" ])
    , (buildPage [ "blog", "pelican-blog_en" ])
    , (buildPage [ "blog", "polymorphism-anda-abstraction_en" ])
    , (buildPage [  ])
    ]

pages =
    { blog =
        { curryGenerator_en = (buildPage [ "blog", "curry-generator_en" ])
        , distributedGame_en = (buildPage [ "blog", "distributed-game_en" ])
        , drag_and_drop = (buildPage [ "blog", "drag_and_drop" ])
        , duelDice_en = (buildPage [ "blog", "duel-dice_en" ])
        , index = (buildPage [ "blog" ])
        , myBlog_de = (buildPage [ "blog", "myBlog_de" ])
        , pelicanBlog_en = (buildPage [ "blog", "pelican-blog_en" ])
        , polymorphismAndaAbstraction_en = (buildPage [ "blog", "polymorphism-anda-abstraction_en" ])
        , directory = directoryWithIndex ["blog"]
        }
    , index = (buildPage [  ])
    , directory = directoryWithIndex []
    }

images =
    { articleCovers =
        { hello = (buildImage [ "article-covers", "hello.jpg" ])
        , mountains = (buildImage [ "article-covers", "mountains.jpg" ])
        , directory = directoryWithoutIndex ["articleCovers"]
        }
    , author =
        { tomke = (buildImage [ "author", "tomke.jpg" ])
        , directory = directoryWithoutIndex ["author"]
        }
    , elmLogo = (buildImage [ "elm-logo.svg" ])
    , github = (buildImage [ "github.svg" ])
    , iconPng = (buildImage [ "icon-png.png" ])
    , icon = (buildImage [ "icon.svg" ])
    , directory = directoryWithoutIndex []
    }

allImages : List (ImagePath PathKey)
allImages =
    [(buildImage [ "article-covers", "hello.jpg" ])
    , (buildImage [ "article-covers", "mountains.jpg" ])
    , (buildImage [ "author", "tomke.jpg" ])
    , (buildImage [ "elm-logo.svg" ])
    , (buildImage [ "github.svg" ])
    , (buildImage [ "icon-png.png" ])
    , (buildImage [ "icon.svg" ])
    ]


isValidRoute : String -> Result String ()
isValidRoute route =
    let
        validRoutes =
            List.map PagePath.toString allPages
    in
    if
        (route |> String.startsWith "http://")
            || (route |> String.startsWith "https://")
            || (route |> String.startsWith "#")
            || (validRoutes |> List.member route)
    then
        Ok ()

    else
        ("Valid routes:\n"
            ++ String.join "\n\n" validRoutes
        )
            |> Err


content : List ( List String, { extension: String, frontMatter : String, body : Maybe String } )
content =
    [ 
  ( ["blog", "curry-generator_en"]
    , { frontMatter = """{"type":"blog","author":"Tomke Reibisch","title":"Curry Generator 1","description":"A short tale of my first elm toy project","image":"/images/article-covers/hello.jpg","published":"2017-01-25"}
""" , body = Nothing
    , extension = "md"
    } )
  ,
  ( ["blog", "distributed-game_en"]
    , { frontMatter = """{"type":"blog","author":"Tomke Reibisch","title":"The distributed game","description":"Know what would be interesting? A distributed game.","image":"/images/article-covers/hello.jpg","published":"2017-12-28"}
""" , body = Nothing
    , extension = "md"
    } )
  ,
  ( ["blog", "drag_and_drop"]
    , { frontMatter = """{"type":"blog","author":"Tomke Reibisch","title":"Drag, but don't drop","description":"What a mean little firefox bug","image":"/images/article-covers/hello.jpg","published":"2017-04-04"}
""" , body = Nothing
    , extension = "md"
    } )
  ,
  ( ["blog", "duel-dice_en"]
    , { frontMatter = """{"type":"blog","author":"Tomke Reibisch","title":"Duel Dice","description":"The game I still want to build","image":"/images/article-covers/hello.jpg","published":"2017-11-16"}
""" , body = Nothing
    , extension = "md"
    } )
  ,
  ( ["blog"]
    , { frontMatter = """{"title":"elm-pages blog","type":"blog-index"}
""" , body = Nothing
    , extension = "md"
    } )
  ,
  ( ["blog", "myBlog_de"]
    , { frontMatter = """{"type":"blog","author":"Tomke Reibisch","title":"This is my blog","description":"my blog is amazing ;)","image":"/images/article-covers/hello.jpg","published":"2017-01-23"}
""" , body = Nothing
    , extension = "md"
    } )
  ,
  ( ["blog", "pelican-blog_en"]
    , { frontMatter = """{"type":"blog","author":"Tomke Reibisch","title":"Pelican Blog","description":"This post did not age well","image":"/images/article-covers/hello.jpg","published":"2017-01-25"}
""" , body = Nothing
    , extension = "md"
    } )
  ,
  ( ["blog", "polymorphism-anda-abstraction_en"]
    , { frontMatter = """{"type":"blog","author":"Tomke Reibisch","title":"Polymorphism and abstraction","description":"Wow","image":"/images/article-covers/hello.jpg","published":"2017-01-29"}
""" , body = Nothing
    , extension = "md"
    } )
  ,
  ( []
    , { frontMatter = """{"title":"Doing stuff is great","type":"page"}
""" , body = Nothing
    , extension = "md"
    } )
  
    ]
