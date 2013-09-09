
@test "Git environment variables are set" {
	[ -n "$GIT_COMMITTER_EMAIL" -a -n "$GIT_COMMITTER_NAME" \
	  -a -n "$GIT_AUTHOR_EMAIL" -a -n "$GIT_AUTHOR_NAME" ]
}

@test "can login with github" {
	run  ssh -o StrictHostKeyChecking=no git@github.com
	[[ "$output" == *You\'ve\ successfully\ authenticated* ]]
}
