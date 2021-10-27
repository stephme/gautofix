# gautofix
A github command to fixup (a commit) and then make an interactive rebase all at once.

**Usage :** gautofix [commit_to_fixup] [parent_branch]

**Tips :**
* The fixup changes must have been staged before using the command
* `origin/` will be prepend to the given `parent_branch` so no need to add it
