workflow "New workflow" {
  on = "push"
  resolves = ["Build VScode "]
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@3c98a2679187369a2116d4f311568596d3725740"
  args = "tag"
}

action "Run Npm Test" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["Filters for GitHub Actions"]
  args = "install"
}

action "Build VScode " {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["Run Npm Test"]
  args = "vscode:prepublish"
}
