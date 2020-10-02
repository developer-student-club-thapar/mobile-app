# Welcome to the contributions of DSC-TIET Official Mobile App

We follow a systematic Git Workflow -

- Create a fork of this repo.
- Clone your fork of your repo on your pc.
- [Add Upstream to your clone](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/configuring-a-remote-for-a-fork)
- **Every change** that you do, it has to be on a branch. Commits on master would directly be closed.
- Make sure that before you create a new branch for new changes,[syncing with upstream](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork) is neccesary.

## Setup and running of project
- Fork the repo and clone it.
- Get all the required packages by running the following command.
```bash
flutter pub get
```
- Setup a [firebase project](https://firebase.google.com/docs/flutter/setup) with com.dsctiet.mobileapp and your own google-services.json in android/app folder .
- Run the app.
```bash
flutter run
```