---
{
  "type": "blog",
  "author": "Tomke Reibisch",
  "title": "Polymorphism and abstraction",
  "description": "Wow",
  "image": "/images/article-covers/hello.jpg",
  "published": "2017-01-29",
}
---


# Wat?!

## Lambdacast!
So I am currently listening to episode 9 of [the lambdacast](https://soundcloud.com/lambda-cast/9-polymorphism-and-abstraction), in which the three hosts talk about polymorphism and abstraction. I like this show, because the hosts have a broad range of experience levels, so most listeners are served something interesting. But in this episode one of the hosts said it himself, if you listen to this one first, you will think the three guys are completely bonkers and just leave. But it's actually quite fascinating, at least for me it was. Let me show you.

## Quick intro
We will be talking about types a lot, so I will use an [Elm](www.elm-lang.org) like notation, because I believe it to be the most simple one to understand without background knowledge.
Also, we are assuming to be in a pure functional language providing immutability. This will be very important later on. 

So in functional programming polymorphism tells you something about the shape of a function. Generally speaking, a polymorphic function has some kind of generic part in it's type signature. Meaning this signature is not polymorphic:

`Int -> Int`

This function takes an `Int` and returns an `Int`. We know nothing else.
This signature is polymorphic:

`a -> a`

This function takes an `a`, meaning some type we know nothing about, and returns an `a`, meaning something of the same type. We know nothing more. But do we?

## Do we though?
The episode I was talking about was full of moments of me thinking "Well of course, that is not new" contrasted by moments of thinking "Yeah right, that is nonsense". So bear with me.

The example above actually holds the first interesting thought, a foundational thought which will be important for this. Imagine stumbling over a function in the wild, which takes an `Int` and produces an `Int`. We know that much about that function, but not much more.  Now what do we know about the function with the more generic signature? We know that it takes something of one type and returns something of another type. Looks like the more generic type provides us with less information then the more precise type featuring concrete types, which seems intuitive to me. At least before we knew we were dealing with `Ints`. Although...

Inside the `Int` function virtually anything could happen to that poor parameter. The function could increment it, decrement it, dump it and just return 42. There are endless possibilities with Integers. Go ask a mathematician. But with the generic type `a`, we don't know what it is, so we don't know what might happen to it. Right? Not quite. Because the function doesn't know anything else about that type either! Imagine you get the task of writing a function with the signature `a -> a`. Try to come up with something that function could do with it's parameter. And remember, we are in a pure functional language providing the sweet nectar of immutability. We can't really modify the incoming value, we don't know what to do with it. We can't replace it with some constant value, we don't have any constructor for it. We can't throw exceptions or return `null` or `undefined` because... well, we are decent people and that would just be rude. So what are we to do? We return the incoming value. That's right, a function with this signature (`a -> a`) has to be the identity function. It can not be anything else.

## Woah dude.
Right? I was as reluctant to acknowledge that fact as the host of the aforementioned podcast was. You might say "But that a could be a `String`, so we could return the upper case version of it!". No, read the last paragraph again. I rewinded the podcast too at this point. Now take a peek out the window, let that feeling sink in. Then, let's look at some more signature in that spirit.

## Gimme more!
Take a look at this:

`List a -> List a`

vs

`List Int -> List Int`

Pretty similar you might think. What can we know about the generic version? Well, we get a list of stuff and we return a list of stuff. Due to aforementioned reasons we can't modify the containing elements and we can't add new ones. So all we can to is change the order or the length (by repeating or omitting elements we have). So basically we can change characteristics of the list, so of the known container type, but not of the elements we know nothing about. A list of `Ints` is up for grabs though. We can modify, change and desecrate those poor elements. Again, the generic type tells us more about the implementation.

Also, this adds a new concept. We now have a combined type in the signature, namely `List a`. So our generic type `a` is combined with a container-like type `List`. This is called a higher kinded type. Like with higher order functions, meaning unspecified functions we pass other functions, higher kinded types are types that act on other types. Examples are `List`, `Maybe` or `Either`. And you guessed it, we can make those generic too! I hear in ML languages you use `f` for that (meaning _functor_, not _function_. Sorry).

`f a -> f a`

Now, we again took away some concreteness. We now have some type `f` we don't know and a type `a` we don't know. What can we tell about this one? You might have guessed it, this is also an identity function, just a higher kinded one. 

Now, what could this do?

`(a -> b) -> f a -> f b`

You might know this function. This signature can only yield one implementation. We take a function from `a` to `b` and we take a container `f` with `a` inside. We return the same kind of container with `b` inside. This is fmap. `f` could be `List` or `Maybe` or `HttpRequest`. We don't know, we don't care, we know this is fmap. Neat.

## What do we take away from this?

I don't know where you are in your journey to functional programming, but for me this knowledge is a vital building block, which clicks in place with lots of stuff I learned recently. This fits perfectly with those elusive tidbits you might know about functors, monoids, monads and what have you. I will probably re-listen that episode if I find the time. And I will probably pick this topic up in the future. Stay tuned.

### Further reading:
This topic was also discussed by [John DeGoes](http://degoes.net/articles/insufficiently-polymorphic), though has a deeper and more vehement look at it. Also probably much more founded ;)