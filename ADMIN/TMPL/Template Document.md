# TEMPLATE - Document Title
```DELETE ALL CODE BLOCKS (ALL VALUES BETWEEN THE 3x TICMARKS `)```

---
## What is the _____ Image:
```
Go into the detail of what the system does and how 
```

---
## How to use the _____ Image:
```
Describe the usage that the user can expect when working with this image. Explain necessary details in order for the user to know their way around the system. 
```

---
## STANDARDS:
```
Include the assumptions that were made to configure the system. Things like script locations, usernames, passwords (if necessary), and other added components should be noted here.
```

```
Some markdown quick tips:
There's a comprehensive-ish list for the markdown that is supported by Docsify [here](https://spec.commonmark.org/0.29/) - you may also want to check the [Docsify Website](https://docsify.js.org/#/markdown) for a little more insight in case they change things up on us. 

**Neat things you can do with markdown**
1. HTML injection - If Docsify hasn't implemented a particular shortcode for an action that you want to accomplish, you might find it useful to just give it the HTML Directly. You can do this by creating the attribute as you would normally in an HTML document!

Example (this would render if it weren't in the codeblock):
<iframe width="560" height="315" src="https://www.youtube.com/embed/dQw4w9WgXcQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

2. Headers - Headers are set with hashmarks followed by a space (# ). Each sub layer of header can be set by adding another hashmark (ex: ## for <h2> ### for <h3>, etc)
3. Monospace / Codeblocks - use three ticmarks (`) in row to create a codeblock. End the code block with another set of three ticmarks (`). You can do this mid paragraph if you want
4. Page lines (dividing lines) - Use three hyphens in a row without spaces to create a dividing line. NOTE: You must add an empty line after the last text before the dividing line or the markdown will parse differently (creating a header instead of a dividing line)
5. Linking/Embedding - To link or embed an image, a web page, a video, or other content, you can use the format [name](link ':include :params') ![Name](link-or-filepath). 
    EXAMPLE A: Embed an image into a page
    ![](./img/image.jpg)
    EXAMPLE B: Embed a webpage or something
    [blog](https://blog.hubspot.com/marketing/how-to-add-html-embed-codes-ht ':include :type=iframe width=100% height=300 ')
    NOTE: Some websites will not allow you to embed stuff on your site so just make sure that it actually renders out when you mess around with these
```

