# Yadm 

## Quickstart

You simply need to run this command:
```
# When prod mode
curl -sL https://raw.githubusercontent.com/TheLocehiliosan/yadm/master/yadm | bash -s -- clone https://github.com/were10/dotfiles-generic.git && bash
```

## When develop mode

```
curl -sL https://raw.githubusercontent.com/TheLocehiliosan/yadm/master/yadm | bash -s -- clone git@github.com:were10/dotfiles-generic.git
```


To test without comitting inside docker:
```
# When develop local mode
yadm clone /upstream/dotfiles-generic
/upstream/dotfiles-generic/.config/yadm/bootstrap
```

