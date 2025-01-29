---
title: Using Git
---


# References
* [How to Write a Git Commit Message](https://cbea.ms/git-commit/)
* [Pro Git](https://git-scm.com/book/en/v2)


# Commit Message Formatting

Refer to [How to Write a Git Commit Message](https://cbea.ms/git-commit/) for an excellent guide on formatting git commit messages.

Key takeaway is to get familiar with advanced log filtering in order to gain understanding of what makes a good message. But refer to the best practices in the article.


# Inspecting the Commit Log

Want to see the diff (i.e., patch) of a commit?
```
git log -p HASH -1
```
Replace HASH with the commit hash of interest. Or neglect it to start at HEAD.
`-1` specifies to just display first commit from HASH.

Want to know which commits modified code with the string `ExampleFunc` (e.g., calls to a function)?
```
git log -S ExampleFunc
```
and to see the associated diffs (patches)?
```
git log -S ExampleFunc -p
```

Speaking of functions, want a more exact filter of which commits changed a function `ExampleFunc`?
```
git log -L :ExampleFunc:path/to/file
```

Want to filter the git log to changes within a file path?
```
git log -- path/to/folder/or/file
```
and just which commits touched string of code `ExampleFunc`?
```
git log -S ExampleFunc -- path/to/folder/or/file
```

Note: other commands can similarly be filtered to a file path
```
git checkout -- path/to/folder/or/file
```

Want to see which commit messages contain some string `example string`?
```
git log --grep="example string"
```
