---
{
  "type": "blog",
  "author": "Tomke Reibisch",
  "title": "Duel Dice",
  "description": "The game I still want to build",
  "image": "/images/article-covers/hello.jpg",
  "published": "2017-11-16",
}
---

Title: Duel Dice
Category: Duel Dice
Lang: en
Date: 2017-11-16
Tags: project, game, rules, setting

# Duel Dice

Time for another side project, this time it's a big one. Let's see what happens.

## The Idea
Some time ago I was looking for a game I wanted to play, preferably mobile. I wanted to have something that felt a little like a boardgame or a tabletop. A game where two small groups fight each other, something skirmishy. This idea then flowed around and was written in several notebooks but never fleshed out. A week ago I stumbled upon an android game based on throwing dice you can collect and upgrade. That made me remember a collectible dice game which came out a few years ago. Of course when playing with real, physical dice things get expensive, so I didn't want to get into it. But I found the idea intriguing. So last week those two ideas merged. I'm in the middle of fleshing out the details, but I already got myself a bunch of notes, mainly about the rules. And why not just document the process here.

## Setting
If I was planing on marketing this I would of course choose a generic ruleset and a base set with a somewhat generic setting. That way later expansions or waves can each fill a certain genre. Think cowboys, science fiction, fantasy, Lovecraft horror or whatever else. But I don't need to worry about this right now, I like apocalyptic settings, so I will probably start with something having cowboys, mutants and psi powers.

## Gameplay overview
Just a short overview on how the game works in my head right now. A duel is fought by two characters, each with a RPG style profession. They each have a set of slots on their body for stuff like equipment, skills, powers or mutations. Each slot has a default dice but can get a more powerful dice when filled with a special weapon or armor or power.

Each dice has a different set of sides, for offense, defense, failure and skill. For example, the default right arm dice could have 1 Failure, 1 Skillpoint, 2 Defenses and 2 Offenses. Default head dice is not for attacks, so it has 3 defenses, 2 skillpoints and a failure.

Skillpoints can be accumulated and used to a skill corresponding to the slot. The default right arm skill might be *bash*, which costs 4 skillpoints to use and deals the default damage but with a small chance to stun. The default head skill could be *concentrate*, which is used to add skillpoints to a slot of your choice later.

Combat works turn based, everything else is too stressfull. Characters can aim their attack at a certain slot of the enemy, trying to disable it.

But as you can see, this could go on for a while, but this might give you a glimpse of the kind of game I am thinking of. Next step should be to turn this into a real rulebook.

## Collectibility
I don't like pay to win, so I want all content to be available without buying boosters or something. But I also do like the idea of earning new dice and relying on chance to get the ones you want. So I was thinking about a twofold progression mechanics. 

#### Learning over time
I want something like the learning system of Eve Online, i.e. learning something over time, no matter if you logged in or not. These learning points could be used to unlock levels for the different slots, so you need some time spent learning to equip high level firearms.

#### Earning by fighting
The other aspect is getting new dice. During battle, funds or scraps can be won which can then be used to buy new weapons or maybe even to craft your own ones. Uhh, nice, crafting! Now, if we want this to turn into an MMORPG we add wear and tear on the equipment and a market ;)

## Technology
No sideproject should go without learning something new. So I want to build the frontend with Elm and the backend using Elixir / Phoenix. I have used Elm quite a bit, but I am pretty new to Phoenix and I want to have some more certainty with backend languages.

Enough for now, I gotta decide if I flesh out the rules anymore or build a Prototype. By the way, anyone interested in making artwork for this? Let me know via [twitter](https://twitter.com/reibisch) or in the [github project](https://github.com/MrMovl/duel-dice).