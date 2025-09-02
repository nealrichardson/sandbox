#!/usr/bin/env zsh
set -e

echo "Comment: $comment"

# Find all lines that start with /run (perhaps with leading spaces)
# Commands will be like /run workflow_name arg=value ...
if ! command_lines=$(echo "$comment" | grep -E '^\s*/run'); then
  # If there are no command lines, exit
  exit 0
fi
echo "Command lines: $command_lines"

# We now have lines like `/run workflow_name arg=value ...`
# Extract workflow_name from the first command line
# For simplicity, we will only consider the first command line
first_command=$(echo "$command_lines" | head -n 1)
echo "First command: $first_command"
# Extract the command (the part after /run and before any spaces) using sed
# If the command is like `/run workflow-name`, we want to extract `workflow-name`
command=$(echo "$first_command" | sed -E 's@^ */run +@@; s/ .*$//')

echo "Extracted command: $command"
# echo "workflow=$command" >> $GITHUB_OUTPUT
# Now extract arguments (if any)
# For each arg=value pair, put a -f in front of them for the gh command
args=$(echo "$first_command" | awk '{for(i=3;i<=NF;i++) print $i}')
arg_flags=""
for arg in $args; do
  arg_flags="$arg_flags -f $arg"
done
echo "arg_flags: $arg_flags"
# echo "arg_flags=$arg_flags" >> $GITHUB_OUTPUT