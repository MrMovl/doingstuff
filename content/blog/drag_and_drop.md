---
{
  "type": "blog",
  "author": "Tomke Reibisch",
  "title": "Drag, but don't drop",
  "description": "What a mean little firefox bug",
  "image": "/images/article-covers/hello.jpg",
  "published": "2017-04-04",
}
---

Title: Drag, but don't drop
Category: Programming 
Lang:en 
Date: 2017-04-04 
Tags: Bug, Firefox

# Drag, but don't drop

If Google brought you here, the solution to your drag and drop problem regarding firefox and the `drop` or `dragend` event, scroll to the bottom.

Sometimes you stumble upon those weird bugs you just can't believe. When you finally find it you just burst out a quick laugh and stare at the screen in disbelieve for a minute. Sometimes curse words are appropriate. Today I had one of those, and I would like to remember it, so I am sharing it.

## Native Drag and drop

With [modern browsers and even IE](http://caniuse.com/#feat=dragndrop) you can use native events to handle drag and drop stuff without the need for external libraries (i.e. [jQuery UI](https://jqueryui.com/)). This is pretty handy, if you are somewhat limited in the third party libraries you can use, even if you have to write some of the infrastructure yourself. But I liked working with it, feels good to know what's going on and being independent. But there is an interesting pitfall...

## Don't keep us waiting, this is not a mystery novel...

OK, sorry. So, basic usage works like this. Add the draggable attribute to your element.

    <div draggable="true"></div>

Now you can drag it. But nothing will happen. You need to listen to the `dragstart` event. In that callback you can now set some data to the dragged element, which can be retrieved during later.

    draggableDiv.addEventListener("dragstart", e => {
        e.dataTransfer.setData("text", "I am a witty sample string")
    })

    dropzoneDiv.addEventListener("drop", e => {
        const payload = e.dataTransfer.getData()
        console.log(payload)
    })
    
One problem with this API is, that the data you can set is somewhat limited. IE only supports simple text like things, and if you need more information you need to fumble about with JSON strings. Which can get messy. But no worries, I am using this in a typescript context, I have a class called DraggingManager.ts anyway. So why not just save the payload to some field in that class, then I need not bother with JSON. I am using data attributes from the dragged element here.

    draggableDiv.addEventListener("dragstart", e => {
        const draggedElement = $(e.target)
        this.payload = draggedElement.data()
    })

    dropzoneDiv.addEventListener("drop", e => {
        console.log(this.payload)
    })

Works like a charm. Or does it? Wait a sec, why is this working in the chromium browser you were using during development, but not with Firefox on you colleagues machine? The `dragstart` is fired, but the `drop` just isn't. Checking the browsers dev tool you can see the attached events. Dropzones have what is needed. And it does work in chromeium. What gives?

Of course, the next thing to try is googling this sucker. Of course there are stackoverflow questions, but they seem to have different problems at heart. No help there. Then you stumble across one innocent looking sentence in this fair persons [blog post](https://mereskin.github.io/dnd/) reading

    "However this is not enough to make elements draggable in Firefox. You need to locate the dragstart event and set some data on the DataTransfer object:..."

Seriously? Could it be? To the editor!

    draggableDiv.addEventListener("dragstart", e => {
        const draggedElement = $(e.target)
        e.dataTransfer.setData("text", "I am utterly useless")
        this.payload = draggedElement.data()
    })

    dropzoneDiv.addEventListener("drop", e => {
        console.log(this.payload)
    })

...

Yes. In Firefox you need to set some data to the event. You don't need to read it later. You just have to set it, or the `dragstart` is the only event triggered.

I admit, this is not the standard usage of this feature, but come on...

### TLDR
In firefox only the `dragstart` event is fired, unless you use the `event.dataTransfer.setData()` function, even if you don't need it.

If you want to read more, here is the [spec](https://developer.mozilla.org/en-US/docs/Web/API/HTML_Drag_and_Drop_API).