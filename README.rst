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

|   **git ps new** [<name>]
|   **git ps checkout** [<name>]
|   **git ps delete** [-f]
|   **git ps list**
|   **git ps log**
|   **git ps show** <id-or-range> [<id-or-range>...]
|   **git ps todo** <description>
|   **git ps isolate** <id-or-range> [<id-or-range>...]
|   **git ps integrate**
|   **git ps pick** <id>
|   **git ps rebase** [-i] [<branch>]
|   **git ps pull**


COMMANDS
--------

**new** [<name>]
  Creates a new patch stack on top of the current branch.  If no <name> is
  given, the default is to name it after the current branch.

**checkout** [<name>]
  Switches to the named patch stack (or the default stack for the current
  branch).

**delete** [-f]
  Deletes the current patch stack.  The ``-f`` option is required if the stack
  is not fully integrated to its upstream.

**list**
  Lists all patch stacks in the current repository.

**log**
  Lists the patches on the current stack, along with information about
  merged/unmerged upstream commits.

**show** <id-or-range> [<id-or-range>...]
  Displays the changes made by the specified patch.

**todo** <description>
  Adds an empty commit to the top of the stack with the provided message.

**isolate** <id-or-range> [<id-or-range>...]
  Switches to a detached patch stack with only the given commit(s) applied on
  top of the base branch.

**integrate**
  Merges the current patch stack into the upstream branch.  To merge only a
  portion of a stack, use ``git ps isolate`` first.

**pick** <id>
  Moves the specified patch to the top of the stack (e.g. for amending).

**rebase** [-i] [<branch>]
  Rebases the current patch stack on top of any new commits in its upstream.
  Pass ``-i`` to rebase interactively.  If a branch is specified, the stack
  will be rebased onto it instead, and it will be set as the new upstream.

**pull**
  Runs ``git pull`` on the upstream branch and then ``git ps rebase`` on the
  current patch stack.


DISCUSSION
----------

Patch stacks are implemented as branches which have an upstream configured
separately from the usual git configuration (to prevent `git-push(1)` from
merging unfinished patches).  The intended workflow is as follows:

 1. Create a patch stack with ``git ps new``.  The stack will have a name like
    ``main%ps``.

 2. Add and manipulate patches as normal commits.

 3. If needed, reorder patches using ``git ps rebase -i`` or edit the top
    patch with ``git commit --amend``.

 4. Fetch and rebase onto the latest upstream using ``git ps pull`` or rebase
    the patch stack independently with ``git ps rebase``.

 5. Test a patch or set of patches using ``git ps isolate``.

 6. If the patches are ready, merge the isolated stack into the upstream branch
    with ``git ps integrate``; otherwise, return to the patch stack with
    ``git checkout`` or ``git switch``.


SEE ALSO
--------
`git-rebase(1)`


AUTHOR
------
Devin J. Pohly
