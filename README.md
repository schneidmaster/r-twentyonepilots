/r/twentyonepilots CSS
===============

This repository is a version of [Naut](https://reddit.com/r/naut) customized for /r/twentyonepilots. I have also added a Grunt build system and converted the main source file to SCSS. I don't recommend using this repository as a base for your subreddit unless you are a developer.

This repository also includes specific subreddit CSS for things like flair.

## Building

1. `npm install`
2. `grunt`
3. Copy the contents of `production.min.css` into the subreddit CSS page.

## Test subreddit
[/r/twentyonepilotscss](https://reddit.com/r/twentyonepilotscss) - it's a private sub, message me for access.

## Building test CSS
Contains only one flair (.cover-rab). Run `grunt test` or `grunt watch` to recompile SCSS on save.

## Creds

- Base theme: [Axel--](https://github.com/Axel--/Naut-for-reddit)
- Header img: [NickFrey](https://github.com/NickFrey)