
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

## Modify drafts in gmail

Need to compose and pick a draft. Jumping to the drafts folder and editing a message there will not change anything :(

For the most part, ? will open up a help window with the available commands and the top bar also indicates common actions, but nevertheless here are some useful commands:

## Changing folders

- `c`, `?` to open the list of folders, 
- `tab` to switch between mailboxes

## Sync mailbox

`$`

## Forwarding a message with attachments

1. Type `v` to get to the attachments screen. \
1. Type `t` repeatedly to tag all the attachments, including the initial small text/plain attachment (that's the original message body). 
1. When they're all tagged, type `;f` (forward all tagged attachments). 
1. After you fill in the `To:` prompt, you'll be able to edit the message body, and when you leave the editor, you'll have the attachment list there to edit as you see fit.

# Scripts

Generally a better idea to copy the scripts rather than creating symlinks. If your github account is compromised, this could be a very juicy attack vector :)

- `git-wtf.rb`: prints a status of the current branch in relation to all it's remotes
- `git-authors.pl`: collates all commit data and lists authors in decreasing order
- `compiz-free-memory.sh`: Free compiz memory
- `free-memory.sh`: Flush all memory caches
- `network-restart.sh`: Restart ubuntu network interface (useful for when VPN is acting up)
- `set-font.sh`: ?
- `stop-services.sh`: Stop all extra services

