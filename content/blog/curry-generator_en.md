---
{
  "type": "blog",
  "author": "Tomke Reibisch",
  "title": "Curry Generator 1",
  "description": "A short tale of my first elm toy project",
  "image": "/images/article-covers/hello.jpg",
  "published": "2017-01-25",
}
---

Title: Curry Generator 1
Category: Programming
Lang: en
Date: 2017-01-25
Tags: elm, random, curry, functional programming

__Warning:__ Skip this one, if you want articles with substance and are not interested in meta ramblings.

# Curry is great

## The book
Shortly after my colleague and good friend [Gregor](www.gregor.codes) introduced me to functional programming, I was looking for a good book to further give me an introductory peek into this topic. I chose the [Curry Buch](http://currybuch.de/) by Stefanie Schirmer, Hannes Mehnert und Jens Ohlig, I am not sure how I found out about it (Sorry for the german link, the book is supposed to be translated on the future though!). I was very happy with my choice, it is a great book and a fun read. Some of the content seem to be a little to academic to be useful for a beginner, but learning something new without having an immediate use for it is not a bad thing in my mind! And after briefly getting to know two of the authors at last years [Bobkonf](http://bobkonf.de/2016/en/) I now know that their knowledge about curry matches what they know about programming.

## The generator
But that's not what this is about. As an introduction the book the authors use a curry generator, which generates random curry recipes from a list of ingredients. Though I was not able to try all combinations yet, I am sure they are all tasty. Because this program seems simple as well as extensible I chose it as my first playground to get to know [Elm](http://elm-lang.org/). The first version was only supposed to generate a recipe, the next one you were able to save a generated recipe. You had a lot of need for randomness, yet another reason this is a nice project to get to know functional programming. Though it might be tough to appreciate the resulting headache.

## Randomness in purely functional languages
In the beginning I was not aware what a problem randomness is in a language which tries to remove side effect as far as possible from your view (which is one of the core features I love about Elm). If my program consists of mainly pure functions I want them to be predictable. By definition I don't want them to produce random results. This was the first mind bender I experienced, which made it abundantly clear to me that functional programming would be quite different from the way I was used to think about programming.

## Current status
By the way, you can find the [Curry Generator](playground/curry) here. What are seeing here is written in Elm 0.16. Due to quite extensive changes in the way randomness is produced in current versions I never bothered to upgrade it. But I will do that soon, so stick around for updates.