<p align="center">
  <a href="https://github.com/ayr-ton/git-deploy-action">
    <img alt="GitHub Action build status" src="https://github.com/ayr-ton/git-deploy-action/workflows/test/badge.svg">
  </a>
</p>

# Git Repository Sync Action

This action pushes all commits in the branch that this action is run on into any remote git repository.

Check out a [sample workflow](.github/workflows/test.yml).

## Usage

Be sure to run the [`actions/checkout`](https://github.com/actions/checkout) action in a step before
this action so that the git repository is initialized.

```yaml
- uses: actions/checkout@v3
  with:
    fetch-depth: 0
    ref: main
- uses: ayr-ton/git-deploy-action@v1.1
  with:
    # The SSH private key for SSH connection to the target repository.
    # We strongly recommend saving this value as a GitHub Secret and using deploy
    # keys within the target repository
    ssh_private_key: ${{ secrets.SSH_PRIVATE_KEY }}
    # The SSH-based URL to the target repository
    target_repo_url: git@github.com:ayr-ton/git-deploy-action-test.git
    # The branch to push to the target repository, mandatory
    target_branch: main
```

## Notes

Inspired by the following actions which may be more suitable for your workflow, e.g. syncing any
source repository and branch to any destination, or copying all branches.

* [wei/git-sync](https://github.com/wei/git-sync)
* [pixta-dev/repository-mirroring-action](https://github.com/pixta-dev/repository-mirroring-action)

## TODO

* Support for the `pull_request` [event](https://help.github.com/en/actions/reference/events-that-trigger-workflows#pull-request-event-pull_request)

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE.md)
