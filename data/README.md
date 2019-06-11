# Symlinks to the data directories

This directory will simply have symlinks to the data so the rest of the 
scripts can use them if they need to access the data at the EuXFEL.

If you want to use them outside Maxwell, you can just replace the symlinks
with whatever makes sense in your system. 

To prevent `git` from complaining 
that you have a changed file do the following. Assuming you changed the 
`raw` symlink just do `git update-index --skip-worktree raw`.

