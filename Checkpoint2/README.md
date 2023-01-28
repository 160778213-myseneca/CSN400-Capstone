# Checkpoint2 Submission

- **COURSE INFORMATION: CSN400NBB**
- **STUDENT’S NAME: Taamer Faruk**
- **STUDENT'S NUMBER: 160778213**
- **GITHUB USER ID: 160778213-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

---

### Table of Contents
1. [Part A - Adding Files - Local Repo Workflow](#part-a)
2. [Part B - Inspecting Local Repo with `git status` and `git log`](#part-b)
3. [Part C - Creating & Merging Branches](#part-c)
4. [Part D - Git Branching Strategy Review Questions](#part-d)


### Part A - Adding Files - Local Repo Workflow

```
Taamer@DESKTOP-M0FHV2P MINGW64 /d/School/CSN400/GitHub-CSN400/CSN400-Capstone/Checkpoint2 (main)
$ git log -n 5
commit cc5e6d4c426760a2ca2ec04f72370ad49c1dfd77 (HEAD -> main, origin/main, origin/HEAD)
Author: 160778213-myseneca <tfaruk1@myseneca.ca>
Date:   Wed Jan 25 02:00:15 2023 -0500

    adds text files for CP2 submission

commit 94747ddb4b15125a3a427708b15150a1ddf63bb1
Author: 160778213-myseneca <tfaruk1@myseneca.ca>
Date:   Wed Jan 25 01:57:24 2023 -0500

    adds Checkpoint2/README.md

commit 6feaaeba3a181b15158bb22cd3cc52f0e6a4e659
Author: 160778213-myseneca <tfaruk1@myseneca.ca>
Date:   Wed Jan 25 01:50:55 2023 -0500

    adds CP2/README.md
```
---
### Part B - Inspecting Local Repo with `git status` and `git log`

#### Difference between `git status` and `git log`?

---

The primary difference between `git status` and `git log` is that `git status` allows us to obtain information such as whether the branch on which `git status` was run is updated, the staging location of any files (staged, unstaged, or untracked), whether there were any pull or push, etc. Therefore, the command `git status` displays the status and details of the directory we are now in. However, `git log` will give the committed history of the branch we are now in. It will show what we put for the `git commit` comment when we run the `git log` command and the exact date and time each of those happened. 

***An example of `git status` would be:***

```
git status
```

***An example of `git log` would be:***

```
git log -n 5
```

---

### Part C - Creating & Merging Branches

---

#### ***main branch*** 
![Main Branch](https://github.com/160778213-myseneca/CSN400-Capstone/blob/main/Checkpoint2/Screenshots/mainBranch.png)

---

#### ***feat-emojis branch***
![feat-emojis branch](https://github.com/160778213-myseneca/CSN400-Capstone/blob/main/Checkpoint2/Screenshots/feat-emojisBranch.png) 

---

#### ***Branches***
![Branches](https://github.com/160778213-myseneca/CSN400-Capstone/blob/main/Checkpoint2/Screenshots/2branches.png) 

---

```
Taamer@DESKTOP-M0FHV2P MINGW64 /d/School/CSN400/GitHub-CSN400/CSN400-Capstone/Checkpoint2 (main)
$ git log -n 5
commit f13b68ab5b2cb8cdb1c484611baa2d62dcc47529 (HEAD -> main, origin/main, origin/feat-emojis, origin/HEAD, feat-emojis)
Author: 160778213-myseneca <tfaruk1@myseneca.ca>
Date:   Wed Jan 25 02:26:49 2023 -0500

    adds emojis to feat-emojis branch

commit 143edad7b166a733453e11a4e80e980cb75656bf
Author: 160778213-myseneca <tfaruk1@myseneca.ca>
Date:   Wed Jan 25 02:20:44 2023 -0500

    adds footnotes folder

commit cc5e6d4c426760a2ca2ec04f72370ad49c1dfd77
Author: 160778213-myseneca <tfaruk1@myseneca.ca>
Date:   Wed Jan 25 02:00:15 2023 -0500

    adds text files for CP2 submission

commit 94747ddb4b15125a3a427708b15150a1ddf63bb1
Author: 160778213-myseneca <tfaruk1@myseneca.ca>
Date:   Wed Jan 25 01:57:24 2023 -0500

    adds Checkpoint2/README.md

commit 6feaaeba3a181b15158bb22cd3cc52f0e6a4e659
Author: 160778213-myseneca <tfaruk1@myseneca.ca>
Date:   Wed Jan 25 01:50:55 2023 -0500

    adds Checkpoint2/README.md
```
---

### Part D - Git Branching Strategy Review Questions

***1. What are the differences between `develop` branch and `main` branch?***

`Main`: the branch that GitHub shows when someone visits your repository. Additionally, whenever anyone clones the repository, Git first checks out the default branch locally. Main is our default branch that we use for Git and in GitHub website.

`Develop`: the active development branch. Creating feature and bugfix branches away from develop, working on the problem, and then merging back into develop are all parts of the developer's job. The most recent development state planned for the following release is always the HEAD of origin/develop.



---

***2. What are the three supporting branches? Briefly describe the function of each of these supporting branches.***

    The three supporting branches are, `Feature/Bugfix branches`, `Hotfix branches`, and `Release branches`. When creating a new feature or improvement, `Feature branches` are employed. Technical differences separate `Bug branches` and `Feature branches`. When a bug exists that needs to be resolved and combined into the coming deployment, bug branches will be made. For a `Hotfix branch` you need to always branch from the tagged `master` branch. This is because while the `hotfix` is being worked on, development can continue on the `develop` branch. After, you have to merge back into `master` and `develop`. The way you name is `'hotfix-issue-(an ID)'`. `Release branches` are temporary branches that are only used to set up releases. When using `Release branches` you have to branch from `develop`, then merge back into `master` and `develop` just like the `Hotfix branch`.

---

***3. What are the best practices in working with `release` branches?***


    Create the branch locally, then push it to GitHub if it's not already there . A release branch has to always be accessible to the general public. In other words, development shouldn't ever take place in a single developer's local branch. Then it must merge changes into master and tag the release once all last-minute adjustments to the release branch have been made.
