# A Simple reading list CLI tool - written in Ocaml my camel 


# Dev notes

## Schemas:  


#### Book  

{
    Title 
    Num pages/chapters
    Current page/chapter
    Review
}
#### List 
{
    String name
    List Book 
}



## CLI interface
- readu - A CLI reading list tracker.

### Add - mvp

readu add [ title ] <- title is only attribute required
#### Title and chapters
readu add [ title ] [ -c 15 ] <- title and 15 chapters

#### Title and pages
readu add [ title ] [ -p 1000 ] <- title and 1000 pages

#### Title and volumes
readu add [ title ] [ -v 3 ] <- title and 3 volumes

#### Title and 2 volumes, or 15 chapters

readu add [ title ] [ -v 2 ] [ -c 15 ]

#### Title and 2 volumes with 15 chapters per volume = 30 chapters + 2 extra chapters (e.g. Intro conclusion)
readu add [ title ] [ -v 2 ] [ -vc 15 ] [ -c 2 ]

#### Title and 2 volumes, 15 chapters per volume, 2 extra chapters, 3000 total pages  

readu add [ title ] [ -v 2 ] [ -vc 15 ] [ -c 2 ] [ -p 3000 ]
