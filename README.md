# vic-config

Should really be `dotfiles` but this might end up being storage for all sorts of config :)

## Vim

See [https://levelup.gitconnected.com/vim-for-react-and-typescript-oh-my-40b700c32cc](https://levelup.gitconnected.com/vim-for-react-and-typescript-oh-my-40b700c32cc) for vim-plug setup. Long story short:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

followed by starting vim and then `:PlugInstall`.

Note that soft wrapping at 80 characters is unfortunately not possible.

## Mutt

[https://smalldata.tech/blog/2016/09/10/gmail-with-mutt](https://smalldata.tech/blog/2016/09/10/gmail-with-mutt)

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

Note that in order to modify a draft in gmail, you need to compose and pick a draft. Jumping to the drafts folder and editing a message there will not change anything :(

For the most part, ? will open up a help window with the available commands and the top bar also indicates common actions, but nevertheless here are some useful commands:

### Changing folders

- `c`, `?` to open the list of folders,
- `tab` to switch between mailboxes

### Sync mailbox

`$`

### Forwarding a message with attachments

1. Type `v` to get to the attachments screen. \
1. Type `t` repeatedly to tag all the attachments, including the initial small text/plain attachment (that's the original message body).
1. When they're all tagged, type `;f` (forward all tagged attachments).
1. After you fill in the `To:` prompt, you'll be able to edit the message body, and when you leave the editor, you'll have the attachment list there to edit as you see fit.

Another simple option might be to use `Esc E` to resend the current message in its entirety and then change the text along with the from and to addresses!

## VSCode

Symlink settings:

```bash
cd ~/.config/Code/User
rm settings.json
ln -s ~/vic-config/vscode/settings.json settings.json
rm keybindings.json
ln -s ~/vic-config/vscode/keybindings.json keybindings.json
```

## Starship

```bash
cd ~/.config
ln -s ~/vic-config/starship.toml starship.toml
```

