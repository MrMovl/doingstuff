---
{
  "type": "blog",
  "author": "Tomke Reibisch",
  "title": "The distributed game",
  "description": "Know what would be interesting? A distributed game.",
  "image": "/images/article-covers/hello.jpg",
  "published": "2017-12-28",
}
---


Title: The distributed game
Category: Programming
Lang: en
Date: 2017-12-28
Tags: programming, games

# Distributed P2P Game

As you might have read, I am playing around with the idea for a [game I would like to make](http://doingstuff.de/duel-dice.html). And recently I had some time to play around with the dat project and this made me think about what I'll be trying to elaborate on now. Keep on reading if you like the idea of distributed systems on top of, or besides the oligarchic web we have today.

## The inspiration

Some time ago [rotonde](http://wiki.xxiivv.com/#rotonde) made the rounds on twitter and it sounded very interesting. But sadly I seldom used my private laptop with Linux so I was doomed to just read about it on my damn company windows machine. This holiday season I finally had the time to dive into rotonde, the [beaker browser](https://beakerbrowser.com/) and the [dat project](https://datproject.org/) itself; and let me tell you, it is awesome stuff! But on with what I was originally gonna ramble about.

## The P2P part

Even in the early stages of thinking about this game the idea of peer-to-peer matches appealed to me. If a match takes place between two players, why should they communicate over a server, why can't there be rules baked into direct communication between the two clients? At first the reason for this was just to eliminate useless traffic to and from a server, but if you take this further you could possibly leave the server out all together. Just talking about a single game played between two players, a server would only be there to enforce that both players adhere to the rules. But as I mentioned, those could as well be enforced by the clients.

## The distributed part

What else do you want from an online game that would have to live on after two players fought and logged off? If we accept that a single match can be fought between two clients without a server, what else is needed? I will just list the problems I can think of right now with a few comments. I am not sure if they can all be solved within a distributed system nor do I claim that this list is complete.

### Matchmaking
Before a match can start players need to find each other. This seems to be quite doable, at least in a simple format. Players could manually reach out to others and ask for a match. Some more elaborate matchmaking mechanisms might need a seperate, more centralized service, but I'm ok with that, as it is not absolutely necessary to play and because that doesn't influence the game ecosystem as a whole.

### Scores
After a match you want the world to know that you did good. Also, if the game contains some kind of loot or prices after a match, this needs two things:
+ allocation: an algorithm needs to decide what the winner gets
+ persistence: something needs to keep track of what the winner got

The first thing seems easy, it could just be a random card of the pool of possible cards. The second thing needs a decentralized form of consensus. All the players need to trust the game, that the card collection someone has is rightfully theirs. Everyone needs to be sure, that only the winner got something and that they only got what they deserved. The only thing I know to achieve this is actually a blockchain, though I am hesitant to throw around buzzwords ;) 

According to the [dat project paper](https://github.com/datproject/docs/blob/master/papers/dat-paper.md) there is also something called a *register* for this purpose, but I don't know if that is even something different. Feel free to contact me, if you can explain this concept to me.

### Collection
I talked about this already, but it deserves an extra h3. The fun of a collectible game is amassing a collection and building different decks to find combos and play styles that suit you. For this we need a body of cards that are available to collect and use. But if these are static and cannot be changed the game will eventually get dull. Most games deal with this by bringing out new additions for the game. Conveniently this is what keeps the business going and the players spending money. But it really is what people want as well. Of course this is easy with a centralized instance that can decide what new cards to and which old ones are better retired. The latter is very important for balancing because players will find that one mighty combo to beat everyone, even though no game designer initially thought of it.

First I thought I would of course be the game master designing new cards and retiring old ones which are used too much. Then I thought that would be too much work and anger to float towards me, because I could never make every player happy. So I would need to take the players opinions into account. But then what is even my part in this? Why can't this all be automatic? How awesome would it be to have a self regulating pool of cards?

New cards could be introduce in a regular interval, say once a month. Maybe only 2 new cards are needed per iteration. Also some cards could be retired, but that should be optional. Maybe up to 2 cards per cycle? Every player account gets one vote and new additions can be suggested by the players. Sound awesome! But...

### Accounts
Did I just say every account gets one vote? Of course, for a centralized game every player is registered with an e-mail address so it is easy to check for voter fraud. At least somewhat doable. But with something like a blockchain any player could create an innumerable instance of addresses and therefore votes. It would have to be linked to some kind of currency then, but that would defeat the purpose of a vote. Maybe voting could be restricted to active accounts, though detection algorithms for this seem pretty difficult. But possible!

## Doable, but difficult

I still like the idea, but I am not sure if all this is even possible. Let's see where it goes.