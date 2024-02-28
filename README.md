# Very Good 28Apps Core

## Getting Started 🚀

## Mason
To create a new project, use the [Mason CLI][mason_link]

### 🎯 Activate from https://pub.dev
```sh
$ dart pub global activate mason_cli
```

### 📦 Initialize mason
Initialize in your home dir or the root of the directory where you store 
your flutter projects.
```sh   
$ mason init
```

### 📦 Add a new brick to the mason.yaml
```yaml
mason add widget
  --git-url https://gitlab.28apps-software.de/28apps_templates/mobile/flutter/very-good-28apps-core
  --git-path brick
  --git-ref master
```
### 📦 Get all bricks for the current project
```sh
$ mason get
```
### 🗂 List all installed local bricks
```sh
$ mason list
```
### 🚧 Generate code from a brick
```sh
$ mason make very_good_28apps_core
```
The brick will then ask you a few questions and will use the answers to 
create a new project.


If you want to create your own bricks, follow the [Mason Documentation][mason_create_link]

---

## Preparing the new project

### Choose your flutter version
```sh
$ fvm use <flutter version you want>
```

Go to Settings -> Languages & Frameworks -> Flutter and set the flutter 
sdk path to the fvm flutter path (`<ProjectPath>/.fvm/flutter_sdk`).

### Tell the gitlab runner what flutter version you are using

Change the flutter version in gitlab-ci.yml to the version you are using.

### RTFM
Read the README file in the newly created project.

[mason_link]: https://docs.brickhub.dev/
[mason_create_link]: https://docs.brickhub.dev/category/creating-bricks