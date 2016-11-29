Partioprint
===========
Partioprint gem adds partial path as a HTML comment whenever a partial is rendered from the ERBs. The purpose of this gem is to ease the front-end web development effort when using lots of partials, if anything is broken in your page, you can quickly inspect it and can figure out which partial to look for, instead going through your logs to determine the target partial or by searching in your editor.

<!-- ERB:START partial '/app/views/users/_form.html.erb' -->
<form class="edit_user" ...>
...
...
</form>
<!-- ERB:END partial '/app/views/users/_form.html.erb' -->

Implemented upon idea by Arnab Chakraborty (@arnabc on Twitter)

Use it
------
```gem install partioprint```

Note: This gem might cause your webpage to render in quirks mode if you have a different partial to render DOCTYPEs.

Rave Reviews
------------

"Looks cool. We have something similar internally at 37signals. Good to see it released." - @dhh

"It looks cool, will definitely use it for one of my client projects" - @technoweenie

"Just stumbled upon Rails plugin partioprint. Incredibly valuable 20 LOC. Gonna add it to all projects" - @codecuisine

http://railsenvy.com/2009/12/18/episode-103 - Highlighted in Rails Envy Podcast

http://afreshcup.com/home/2009/11/26/double-shot-592.html - Highlighted in Mike Gunderloy's A Fresh Cup

Author
------
Anil Wadghule :: anildigital@gmail.com :: http://twitter.com/anildigital :: http://anilwadghule.com
