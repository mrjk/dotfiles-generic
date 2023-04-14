# Manage this home config

## Update from upstream repo

Add project origin:
```
git remote add upstream https://github.com/were10/dotfiles-generic.git
```

Fetch last updates:
```
git fetch -a upstream
git merge --no-ff -m "update: homefiles from upstream project" upstream/main 
```

Note: You can do the same with `yadm` !
