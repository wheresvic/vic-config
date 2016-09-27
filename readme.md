
Should really be `dotfiles` but this might end up being storage for all sorts of config :)

# Vim

- soft wrapping at 80 characters is unfortunately not possible

# Mutt

https://smalldata.tech/blog/2016/09/10/gmail-with-mutt

Current email workflow:
- zero inbox goal
- *delete* all unnecessary stuff
- move todo items to respective folders
- accessibilty of email from multiple devices, phone, web, friends puter, etc.
- respond from different email addresses

`muttrc`:
- gmail support
- aliases support
- not using `offlineimap` and `notmuch` due to non-availablily of realtime sync

To modify drafts in gmail, need to compose and pick a draft. Jumping to the drafts folder and editing a message there will not change anything :(

# Scripts

Generally a better idea to copy the scripts rather than creating symlinks. If your github account is compromised, this could be a very juicy attack vector :)

