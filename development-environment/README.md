# Development Environment

## Serverless Development Environment for Python, Javascript/React and Node Developers \(on OSX\):

Install Prerequesits Package Manger Homebrew and CLI Tools:

```text
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install Runtime for Javascript and Python:

```text
brew install node python3
```

Install Python and Javascript packages / Dependencies:

```text
pip install virtualenv
npm install -g serverless create-react-app
```

Source: [http://sourabhbajaj.com/mac-setup/Python/virtualenv.html](http://sourabhbajaj.com/mac-setup/Python/virtualenv.html)

Additional tools to improve the developer experience:

```text
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install iterm2
brew cask install postman
brew install git
git config --global credential.helper osxkeychain
brew install git-secrets
```

## Setup a template for git to prevent checking in credentials

[Source](https://seesparkbox.com/foundry/git_secrets)

1. Make a directory for the template: 

   ```text
   mkdir ~/.git-template
   ```

2. Install the hooks in the template directory: 

   ```text
   git secrets --install ~/.git-template
   ```

3. Tell git to use it:

   ```text
   git config --global init.templateDir '~/.git-template'
   ```

4. Install AWS patterns globally to be prevented to be checked in to git:

   ```text
   git secrets --register-aws --global
   ```

5. Check the list of secrets `git secrets` will scan for:

   ```text
   git secrets --list
   ```

It should return something like:

```text
ecrets.providers git secrets --aws-provider
secrets.patterns [A-Z0-9]{20}
secrets.patterns ("|')?(AWS|aws|Aws)?_?(SECRET|secret|Secret)?_?(ACCESS|access|Access)?_?(KEY|key|Key)("|')?\s*(:|=>|=)\s*("|')?[A-Za-z0-9/\+=]{40}("|')?
secrets.patterns ("|')?(AWS|aws|Aws)?_?(ACCOUNT|account|Account)_?(ID|id|Id)?("|')?\s*(:|=>|=)\s*("|')?[0-9]{4}\-?[0-9]{4}\-?[0-9]{4}("|')?
secrets.allowed AKIAIOSFODNN7EXAMPLE
secrets.allowed wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

Now every time you run `git init` or `git clone`, your hooks will be copied into the `.git` directory of your freshly created repo. If you don’t want to set the template globally, you can use it as needed with `git init --template ’~/.git-template’`.

That covers new repo creation, and cloning, but we haven’t addressed the problem of _existing repos that weren’t created with the template_. Here we have a couple options:

`git init` is a non-destructive operation, so feel free to run it in existing repos. It’s safe, and will retroactively apply the template you specify. 

OR

If you want to go “all in” and ensure that every repo has the proper hooks, here’s a [script](https://gist.github.com/iAmNathanJ/0ae03dcb08ba222d36346b138e83bfdf) that will recursively walk a directory, such as `~/Projects` and run `git secrets --install` in all repos.

## Setup visual studio code

List all my installed extensions:

```text
code --list-extensions
```

```text
HookyQR.beautify
PeterJausovec.vscode-docker
dbaeumer.vscode-eslint
dzannotti.vscode-babel-coloring
formulahendry.auto-close-tag
jebbs.plantuml
magicstack.MagicPython
ms-python.python
msjsdiag.debugger-for-chrome
taichi.react-beautify
tht13.python
tushortz.python-extended-snippets
vscodevim.vim
yzhang.markdown-all-in-one
```

## Create project and initialise repositories

```text
mkdir apis-api
cd apis-api
git init
git remote add origin https://github.com/denseidel/apis-api.git
npm init
git add .
git commit -am "add package.json and ignore local python files"
git push --set-upstream origin master
```

Code: [https://github.com/denseidel/apis-api/commit/ecc27aaf1f7a714938d99f1b5d656a67376c934b](https://github.com/denseidel/apis-api/commit/85014bb55af8921c3c770fbfe9b56d5722b6c005)

## Documentation

Use Gitbooks:

Install gitbook CLI:

```text
npm install -g gitbook-cli
```

Initialize:

```text
gitbook init
```

Generate output to custom folder

```text
gitbook build . docs
```

## Git Knowledge

* [Git Styleguide](https://udacity.github.io/frontend-nanodegree-styleguide/%20/%20https://udacity.github.io/git-styleguide/)
* [Create new branches](https://github.com/Kunena/Kunena-Forum/wiki/Create-a-new-branch-with-git-and-manage-branches)
* Use branches and if needed [squash all commits related to a single issue into one commit](https://github.com/todotxt/todo.txt-android/wiki/Squash-All-Commits-Related-to-a-Single-Issue-into-a-Single-Commit)
* Merge multiple commits:
  * [https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History)
  * [https://robots.thoughtbot.com/autosquashing-git-commits](https://robots.thoughtbot.com/autosquashing-git-commits)
  * [https://www.ralfebert.de/git/rebase/](https://www.ralfebert.de/git/rebase/)
* Modify the last two commits:

```text
git rebase -i HEAD~2
```

Or if they are the last two:

[https://stackoverflow.com/a/24690646/1929968](https://stackoverflow.com/a/24690646/1929968)

```text
git reset --soft "HEAD^"
git commit --amend
git push -f
```

Use git stash to switch change between branches - [https://www.youtube.com/watch?v=KLEDKgMmbBI](https://www.youtube.com/watch?v=KLEDKgMmbBI)

```text
# stash current state
git stash save "Worked on get identities/{identityId}"
# apply current stage (e.g. in other branch) but keep stash
git stash add
# apply current state and delete stash
git stash pop
```

## Development Pipeline:

* Use CircleCI as a SaaS as Pipeline:

1. Go to [https://circleci.com/dashboard](https://circleci.com/dashboard)
2. Add the git repo to it:![](../.gitbook/assets/add-git-repo-to-circleci.png)![](../.gitbook/assets/add-git-repo-to-circleci-2.png)
3. Setup a project as described \(e.g. add the folder `.circleci`with the `config.yml` file\)  

   ![](../.gitbook/assets/setup-circleci-project.png)

Link to config.yml file 

* for containers
* for serverless

