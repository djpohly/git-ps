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
|   **git ps rm** [-f] <name>
|   **git ps list**
|   **git ps log**
|   **git ps show** <id-or-range> [<id-or-range>...]
|   **git ps integrate** <id-or-range> [<id-or-range>...]
|   **git ps rebase** [-i]
|   **git ps pull**
|   **git ps isolate** <id-or-range> [<id-or-range>...]


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

**rm** [-f] <name>
  Deletes a patch stack.

**list**
  Lists all patch stacks in the current repository.

**log**
  Lists the patches on the current stack, along with information about
  merged/unmerged upstream commits.

**show** <id-or-range> [<id-or-range>...]
  Displays the changes made by the specified patch.

**integrate** <id-or-range> [<id-or-range>...]
  Merges the specified patch(es) into the upstream branch.

**rebase** [-i]
  Rebases the current patch stack on top of any new commits in its upstream.
  Pass ``-i`` to rebase interactively.

**pull**
  Runs ``git pull`` on the upstream branch and then ``git ps rebase`` on the
  current patch stack.

**isolate** <id-or-range> [<id-or-range>...]
  Switches to a detached patch stack with only the given commit(s) applied on
  top of the base branch.

AUTHOR
------
Devin J. Pohly
