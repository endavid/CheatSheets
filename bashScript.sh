#!/bin/bash

# The first line is to tell bash what to use to exe this script,
# if the file is executable (chmod 755)


# run handle_error function when errors occur.
# https://stackoverflow.com/a/19622569
trap 'handle_error' ERR

# Exit immediately if a command exits with a non-zero status.
set -e

function my_function() {
    local my_first_arg="$1"
    local my_second_arg="$2"
    echo "$2: " "$1"
}

echo "$0 is this script file"
echo "$1 is the first argument"
echo "$2 is the second argument"
echo "$@ are all the arguments"
echo "$# is the total number of arguments"

my_function "invokes your function" "🎉🎉"
my_function "you can split lines with back slashes"\
    "🤓🤓"

# Some interesting functions

function post_message_to_slack() {
    # Parameters:
    # $1 is the text message
    # $2 is the icon

    local slack_token='xoxb-***'
    local slack_user_name='My Pipeline Bot'
    local slack_channel="#my-pipeline-channel"
    local text="$1"
    local icon_emoji="$2"

    curl --request POST \
         --data-urlencode "token=$slack_token" \
         --data-urlencode "channel=$slack_channel" \
         --data-urlencode "icon_emoji=$icon_emoji" \
         --data-urlencode "username=$slack_user_name" \
         --data-urlencode "text=$text" \
         --data-urlencode "mrkdwn=true" \
         'https://slack.com/api/chat.postMessage' \
         -w "\n"
}

function post_info_to_slack() {
    # Parameters:
    # $1 is the text message
    post_message_to_slack "$1" ":man-getting-massage:"
}

function post_error_to_slack() {
    # Parameters:
    # $1 is the error message
    post_message_to_slack "$1" ":skull:"
}

function die() {
    echo "$1" >&2
    #post_error_to_slack "$1"
    exit 2
}

function handle_error() {
    # the last command: https://stackoverflow.com/a/15748957/1765629
    local lc="$BASH_COMMAND" rc=$?
    # stack trace: https://stackoverflow.com/a/34381499
    while caller $((n++)); do :; done;
    echo "😱😱😱😱😱 Command [$lc] exited with code [$rc]"
}

# Main code should come after the functions are defined
# ------------------------------------------------------

# check files exist
for F in "$1" "$2"; do
    test -r $F || die "File $F not found"
done

test -r "Some-inexistent-file-to-trigger-error-trap"
