======
git-ps
======

manage commits as a patch stack
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:Version: git-ps 0.1
:Date: 2023-12-19
:Manual section: 1


SYNOPSIS
--------

|   **git ps init** [<name>]
|   **git ps list**
|   **git ps isolate** <commit> [<commit>...]
|   **git ps rebase**


DESCRIPTION
-----------

Patch stacks are implemented as branches which have an upstream configured
separately from the usual git configuration (to prevent `git-push(1)` from
merging unfinished patches).  The `git-ps(1)` command will set any needed
configuration options temporarily to perform operations in a controlled
environment.


COMMANDS
--------

**init** [<name>]
  Creates a new patch stack on top of the current branch.

**list**
  Lists the patches on the current stack, along with information about
  merged/unmerged upstream commits.

**rebase**
  Rebases the current patch stack on top of any new commits in its upstream.

**pull**
  Runs ``git pull`` on the upstream branch and then ``git ps rebase`` on the
  current patch stack.

**isolate** <commit> [<commit>...]
  Switches to a detached patch stack with only the given commit(s) applied on
  top of the base branch.

AUTHOR
------
Devin J. Pohly
