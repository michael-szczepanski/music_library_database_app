## GET /albums
```
Method:   GET
Path:     /albums
Params:   NONE
Response: 200 OK
          HTML file with a hyperlinked list of albums
```
#### Examples:
```html
Albums
Title: Doolittle Released: 1989
Title: Surfer Rosa Released: 1988
Title: Waterloo Released: 1974
Title: Super Trouper Released: 1980
Title: Bossanova Released: 1990
Title: Lover Released: 2019
Title: Folklore Released: 2020
Title: I Put a Spell on You Released: 1965
Title: Baltimore Released: 1978
Title: Here Comes the Sun Released: 1971
Title: Fodder on My Wings Released: 1982
Title: Ring Ring Released: 1973
```
## POST /albums
```
Method:   POST
Path:     /albums
Params:   title= album title
          release_year= release year of the album
          artist_id= artist title corresponding to artists table
Response: 200 OK
          No content
          New album added to albums table
```
#### Examples:
```
POST
  /albums
Body params:
  title=Voyage
  release_year=2022
  artist_id=2
GET /albums => Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring, Voyage
```
## GET /artists
```
Method:   GET
Path:     /artists
Params:   NONE
Response: 200 OK
          Coma separated string of artist names
```
#### Examples:
```
GET /artists => Pixies, ABBA, Taylor Swift, Nina Simone
```
## POST /artists
```
Method:   POST
Path:     /artists
Params:   name= artist name
          genre= artist genre
Response: 200 OK
          No content
          New artist added to artists table
```
#### Examples:
```
POST /artists
Body params:
  name=Wild nothing
  genre=indie
GET /artists => Pixies, ABBA, Taylor Swift, Nina Simone, Wild nothing
```
## POST /albums/:id
```
Method:   GET
Path:     /albums
Params:   Body params: title, release_year, artist
Response: 200 OK
```
```html
<html>
  <head></head>
  <body>
    <h1>title</h1>
    <p>
      Release year: release_year
      Artist: artist
    </p>
  </body>
</html>
```
#### Examples:
```html
# Request:
GET /albums/1

Response:
<html>
  <head></head>
  <body>
    <h1>Doolittle</h1>
    <p>
      Release year: 1989
      Artist: Pixies
    </p>
  </body>
</html>

# Request:
GET /albums/2
Response:
<html>
  <head></head>
  <body>
    <h1>Surfer Rosa</h1>
    <p>
      Release year: 1988
      Artist: Pixies
    </p>
  </body>
</html>
```
## GET /artists/:id
```
Method:   GET
Path:     /artists
Params:   Path params: :id
Response: 200 OK
```
```html
<html>
  <head></head>
  <body>
    <h1>name</h1>
    <p>
      Genre: artist_genre
    </p>
  </body>
</html>
```
#### Examples:
```html
# Request:
GET /artists/1

Response:
<html>
  <head></head>
  <body>
    <h1>Pixies</h1>
    <p>
      Genre: rock
    </p>
  </body>
</html>

# Request:
GET /artists/2
Response:
<html>
  <head></head>
  <body>
    <h1>ABBA</h1>
    <p>
      Genre: rock
    </p>
  </body>
</html>
```
## GET /artists
```
Method:   GET
Path:     /artists
Params:   NONE
Response: 200 OK
          HTML file with a hyperlinked list of artists
```
#### Examples:
```html
Artists
Name: Pixies Genre: Rock
Name: ABBA Genre: Pop
```
## /albums/new
```
Method:   GET
Path:     /albums/new
Params:   NONE
Response: 200 OK
          Adds a new album to the database
          POST /albums request made
          Displays a confirmation page
```
#### Examples:
```
Albums
Title: Doolittle Released: 1989

In the form:
title: Get What You Give
release_year: 2010

Albums
Title: Doolittle Released: 1989
Title: Get What You Give Released: 2010
```
## /artists/new
```
Method:   GET
Path:     /albums/new
Params:   NONE
Response: 200 OK
          Adds a new artist to the database
          POST /artist request made
          Displays a confirmation page
```
#### Examples
```
Artists
Name: Pixies genre: Rock

In the form
name: The Ghost Inside
genre: Hardcore

Artists
Name: Pixies genre: Rock
Name: The Ghost Inside genre: Hardcore
```
