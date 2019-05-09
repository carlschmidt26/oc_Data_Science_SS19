This repository was createt using the web interface of github.com.
The follwing commands have been executed locally in order to get the Repo to its current state (`SHA: 7d70181023d246313af6fcf91c274eeab5872b35`):
```
git init
git remote add origin git@github.com:carlschmidt26/oc_Data_Science_SS19.git
### changed the .gitignore file to ignore *.csv and*.pdf files ###
git add *
git commit -m "initial commit"
git push -u origin master
### created a new R project in the local directory of the Repo ###
git add Meteolytix.Rproj
git commit -m "Created new R project"
git push
```
Note that this README.md file has been created afterwards in the local directory (the local branch is called `master`) and has been pushed subsequently (after calling `git add README.md` and `git commit -m "added README.md"`)  to the remote branch, which is called `origin` by `git push origin master`.<br>
Equivalently one could simply use `git push` because the first `git push` was called using the `-u` option setting the upstream`(remote)  branch of `origin` to `master`.
