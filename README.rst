================
 Git extensions
================

This repository contains several commands to extend Git_ that I found useful.
The organization of the repository is as follows:

- The actual scripts are inside ``bin``.  These are meant to be in your path.

  All the scripts with the "``git-``" prefix are actually executable with the
  ``git`` command.

- The bash completion scripts are inside ``bash-completion.d``.  These are
  meant to be sourced in your ``.bashrc``.

Non-magical disclaimer
======================

The provided scripts are very simple and thus your are encouraged to read 
the source to understand the implications of the arguments you pass.

And thus:

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS
THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE
USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF
DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),
EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.


Help wanted
===========

You could find this useful, so contributions are allowed.  For instance, you
might provide fish_ completion scripts.  Or you could provide man pages,
etc.

Summary of commands
===================

``git merged``

   Allows to know if a branch is merged into another.  No arguments will print
   all local branches merged into the HEAD.

``git local-push-all``

  Stashes your changes if needed and push all your local branches to possibly
  all your remotes.  You may filter the target remote by name.


Other scripts
=============

``update-all.sh``

  Finds all git repositories from current point up to 2 levels below and for
  each of them, fetches commits from all remotes (that match a given name) and
  then tries to do a pull.

``push-all.sh``

  Finds all git repositories from curreny point up to levels below and for
  each of them executes the ``git local-push-all`` for every matching remote.


.. _Git: http://git-scm.com/
.. _fish: http://fishshell.com/
