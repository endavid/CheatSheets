# How-To Git

## Common commands

### Add new branch

```bash
git push origin feature/MyFeature
```

## Undo a commit, making it a topic branch

```bash
git branch topic/wip
git reset --hard HEAD~3     # last 3 commits
git checkout topic/wip
```

### Checkout new remote branch

```bash
git checkout feature/A
# or
git checkout -b feature/A origin/feature/A
```

### Delete local branch

```bash
git branch -D feature/A
```

### Delete remote branch

```bash
git push origin --delete branch
```

### Undo last commit

```bash
git reset --soft HEAD^
```

### Resolve conflict merging binary files

```bash
git checkout --theirs file
# or
git checkout --ours files
```

### Remove untracked files

```bash
git clean -f -d
```

### Remove ignored and untracked files

Similar to `hg purge --all`

```bash
git clean -f -d -x
```

### Remove all deleted files

```bash
git add -u
```

### Get rid of erased branches

```bash
git remote prune origin
```

### Merge latest from original fork

```bash
git fetch upstream   # check first where upstream is pointing at with git remote -v
git merge upstream/develop
```

## Config

### Change default editor

Super important in Windows that the path doesn't contain brackets, and use forward slashes for the path

```bash
git config --global core.editor "C:/Progra~2/Notepad++/Notepad++.exe"
```

### SourceTree keeps changing line endings when discarding hunks?

Check your config,

```bash
git config --get core.autocrlf
```

If it's set to true, change it to false (check all your configs):

```bash
git config --edit --global
git config --edit --system
git config --edit --local
```

## Advanced

### Squash LOCAL commits

Before being made public/pushed! Eg. last 4 commits

```bash
git rebase -i HEAD~4
```

Read: http://gitready.com/advanced/2009/02/10/squashing-commits-with-rebase.html

### Remove merged branches

I recommend using a script that prompts for removal of branches, specially for remote branches, so you don't accidentally delete some branch you didn't want to delete.

I use this bash script: https://gist.github.com/endavid/e7f612fbcd54daef578c4a3c8dda8531

It firsts prunes your local git, to get rid of remote labels that no longer exist on origin.
It prompts once for the local branches (it will batch-remove them all)
It prompts per each remote branch, just to be safer.

