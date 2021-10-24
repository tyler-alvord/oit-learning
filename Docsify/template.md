# TEMPLATE - Document Title
```DELETE ALL CODE BLOCKS (ALL VALUES BETWEEN THE 3x TICMARKS `)```

---
## What is the _____ Image
```
Go into the detail of what the system does and how 
```

---
## How to use the _____ Image
```
Describe the usage that the user can expect when working with this image. Explain necessary details in order for the user to know their way around the system. 
```

---
## Standards
### OS Login 
|           |            |
|-----------|------------|
| Username: | *oit*      |
| Password: | *owl@dm!n* |  
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
6. Tables - Tables can be formatted visually in markdown. It's just kinda best I show you what I mean:
    EMAMPLE:
    | header 1 | Header 2 | header 3|
    |----------|:--------:|--------:|
    |left      | centered | right   |

    In this example, the headers, header 1, header 2, and header three will be formatted as slightly larger in the table. 
    The second row (the hyphens) will be used to determine the justification of the text in that column. Just the plain line is left-justified, the line with a colon on each side :-: is centered, and the line with the colon only on the right (-:) is right-justified. 
    It's important that the pipes that define the borders of the table line up or the formatting will not be applied (add spaces to line them up if the content is different lengths)
7. Info, warning, and highlight - INformation invents can be marked with a '?>' to make them stand out. Got a warning for a user? '!>' should make a big red message for them to see. If it's just something to stand out in a crowded page, block quotes should help '>'
8. If you don't want a header to show up in the sidebar, you can tell docsify to ignore it by adding the following comment after the header <!--{docsify-ignore}-->
```

## Additional Resources
```
Stuff that is nifty to have, but not necessarily important to embed or paraphrase in the main body of the document

[Quick Name for the Resource](https://lmgtfy.app/?q=docsify)

[Another one](https://isitsnowinginpdx.com/)

```

<!--
DOCUMENTATION STANDARDS - ADMIN REFERENCES ONLY

Page titles, headers, and other basic structure
    - Pages should have their title set as the first and only "h1" header 
        - there should be only one header with a single hashmark in front of it
    EXAMPLES:
        Good: # title
              ## content header
        Bad:  # title
              # content header

Referencing other pages or sections by name:
    - page references to web resources should be stated in quotation marks
    EXAMPLE: For more information, check out the "Setup an Instance" page in the "Openstack Information" section of this manual
    EXAMPLE: You can get a little more detail from the "Common Use Cases" Section in the "Getting Started" Section of the ATT&CK Website.

Buttons, menu options, or other openstack UI references:
    -Enclose as a code block 
    EXAMPLE: After entering your information, click the `accept` button to save your progress

Formatting Credentials 
    - Credentials should be in a table format
        - header values empty
        - all values left-justified. 
    - Left column should be used as the ID field for the information stored in the right column
        - ID fields should be bolded (use doulbe-asterisks **)
        - ID fields should end with a colon ":"
    EXAMPLE: 
        |               |                 |
        |---------------|-----------------|
        | **Username:** |   admin         |
        | **Password:** | SuperSecret123! |
    NOTE: If your username or password contains an asterisk, you will need to escape the character


-->
