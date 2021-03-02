# Brakeman github action

Brakeman is a static analysis tool which checks Ruby on Rails applications for security vulnerabilities.
[See more](https://github.com/presidentbeef/brakeman)

## Usage

```yml
- name: Brakeman
  uses: GaboFDC/brakeman-linter-action@v1.1.0
  env:
    GITHUB_TOKEN: ${{secrets.GITHUB_TOKEN}}
```

You can also pass additional args to brakeman:

```yml
- name: Brakeman
  uses: GaboFDC/brakeman-linter-action@v1.1.0
  env:
    GITHUB_TOKEN: ${{secrets.GITHUB_TOKEN}}
    BRAKEMAN_ARGS: --force-scan
```

*NOTE:* The actions expects the format to be json, if you change it, the action will fail

### Custom report

If for some reason you need complete control, you can generate the report, and pass it to the action

```yml
- name: Install gems
  run: |
    gem install brakeman -v 4.5.0
- name: brakeman report
  run: |
    brakeman -f json > tmp/brakeman.json
- name: Brakeman
  uses: GaboFDC/brakeman-linter-action@v1.1.0
  env:
    GITHUB_TOKEN: ${{secrets.GITHUB_TOKEN}}
    REPORT_PATH: tmp/brakeman.json
```

## Example Workflow

```
name: Brakeman

on: [push]

jobs:
  build:
    runs-on: ubuntu-18.04
    steps:
    - uses: actions/checkout@v1
    - name: Brakeman
      uses: GaboFDC/brakeman-linter-action@v1.1.0
      env:
        GITHUB_TOKEN: ${{secrets.GITHUB_TOKEN}}
```

## Screenshots

![example GitHub Action UI](./screenshots/action.png)
![example Pull request](./screenshots/pull_request.png)
