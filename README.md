Partioprint
===========
Partioprint plugin adds partial name as a HTML comment whenever a partial is rendered from the ERBs. The purpose of this plugin is to ease the front-end web development effort when using lots of partials, if anything is broken in your page, you can quickly inspect it and can figure out which partial to look for, instead going through your logs to determine the target partial or by searching in your editor.

Partioprint adds two comments tag before and after the partial output. Below is the example

<code>
<!-- ERB:START /shared/header -->
<div class="head">...</div>
<!-- ERB:END /shared/header -->
</code>


Implemented upon idea by Arnab Chakraborty (@arnabc on Twitter)

Use it
------
Drop this plugin into your project's vendor/plugins folder
Restart the server. View the source. (If you have rendered partials in your views, it will print names of them in generated html code).


For Firebug users click on the down-arrow icon in HTML tab and enable 'Show Comments' to see the comments.


Note: This plugin might cause your webpage to render in quirks mode if you have a different partial to render DOCTYPEs.

Author
------
Anil Wadghule :: anildigital@gmail.com :: @anildigital :: http://anilwadghule.com