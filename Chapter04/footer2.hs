{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
import Text.Hamlet (HtmlUrl, hamlet)
import Text.Blaze.Renderer.String (renderHtml)
import Data.Text (Text)

data MyRoute = Home

render :: MyRoute -> [(Text, Text)] -> Text
render Home _ = "/home"

footer :: HtmlUrl MyRoute
footer = [hamlet|
<footer>
    Return to #
    <a href=@{Home}>Homepage
    .
|]

data Person = Person
     { firstName :: String,
       lastName  :: String
     }

main :: IO ()
main = putStrLn $ renderHtml $ [hamlet|
<body>
    <p>This is my page.
    ^{footer}
    \
    <p checked>
    <input type=checkbox checked>
    <p #paragraphid .class1 .class2>
    \
    <input #inp1 type=checkbox :isChecked:checked>
    <input #inp2 type=checkbox :not isChecked:checked>
    \
    <p :isRed:style="color:red">
    \
    $if isAdmin
        <p>Welcome to the admin section.
    $elseif isLoggedIn
        <p>You are not the administrator.
    $else
        <p>I don't know who you are. Please log in so I can decide if you get access.
    \
    $maybe name <- maybeName
        <p>Your name is #{name}
    $nothing
        <p>I don't know your name.
    \
    $maybe Person firstName lastName <- maybePerson
        <p>Your name is #{firstName} #{lastName}
    \
    $if null people
        <p>No people.
    $else
        <ul>
            $forall person <- people
                <li>#{person}
    \
|] render
  where isChecked   = True
        isRed       = True
        isAdmin     = True
        isLoggedIn  = False
        maybeName   = Just ("Chuck" :: String)
        maybePerson = Just $ Person "Chevy" "Chase"
        people      = ["Abe Lincoln", "George Washington"] :: [String]
