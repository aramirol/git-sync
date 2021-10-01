# Git Sync

![GitHub](https://img.shields.io/github/license/aramirol/git-sync)
![GitHub last commit (branch)](https://img.shields.io/github/last-commit/aramirol/git-sync/main?logo=github)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/aramirol/git-sync?logo=github)

Git Sync is a tool that allows you to synchronize `GitHub` repositories with `GitLab`.

## Requirements

Add the following secrets to your GitHub repo:

| Name  | Value  |
|:----------|:----------|
| **GITLAB_URL**  | `https://gitlab.com/<<username>>/<<project>>`  |
| **GITLAB_USERNAME**    | `gitlab username`    |
| **GITLAB_TOKEN**   | `gitlab token`    |

## Configure

Use `GitHub Actions` to configure a new `workflow` that sync your GitHub repository to GitLab.

```yml
name: git-sync

on: 
  - push
  - delete

jobs:
  sync:
    runs-on: ubuntu-latest
    name: Git Sync
    steps:
    - uses: actions/checkout@v2
      with:
        fetch-depth: 0
    - uses: aramirol/git-sync@v0.1
      with:
        gitlab-url: ${{ secrets.GITLAB_URL }}
        gitlab-username: ${{ secrets.GITLAB_USERNAME }}
        gitlab-token: ${{ secrets.GITLAB_TOKEN }}

```

## License

MIT License

See [LICENSE](https://github.com/aramirol/git-sync/blob/main/LICENSE) to see the full text.
