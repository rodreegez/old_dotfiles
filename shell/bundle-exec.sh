#!/bin/bash

BUNDLED_COMMANDS="${BUNDLED_COMMANDS:-
cap
guard
capify
cucumber
foreman
heroku
rackup
rails
rspec
serve
shotgun
spec
spork
thin
unicorn
unicorn_rails
rails_best_practices
rake
resque-web
sidekiq
}"

## Functions

bundler-installed()
{
    which bundle > /dev/null 2>&1
}

within-bundled-project()
{
    local dir="$(pwd)"
    while [ "$(dirname $dir)" != "/" ]; do
        [ -f "$dir/Gemfile" ] && return
        dir="$(dirname $dir)"
    done
    false
}

run-with-bundler()
{
    if bundler-installed && within-bundled-project; then
        echo bin/$@
        bin/$@
    else
        $@
    fi
}

## Main program

for CMD in $BUNDLED_COMMANDS; do
    alias $CMD="run-with-bundler $CMD"
done
