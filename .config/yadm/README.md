# Yadm 

## Quickstart

You simply need to run this command:
```
# When prod mode
curl -sL https://raw.githubusercontent.com/TheLocehiliosan/yadm/master/yadm | bash -s -- clone https://github.com/mrjk/dotfiles-generic.git
```

## When develop mode

```
curl -sL https://raw.githubusercontent.com/TheLocehiliosan/yadm/master/yadm | bash -s -- clone git@github.com:mrjk/dotfiles-generic.git
```


To test without comitting inside docker:
```
# When develop local mode
yadm clone /upstream/dotfiles-generic
/upstream/dotfiles-generic/.config/yadm/bootstrap
```

