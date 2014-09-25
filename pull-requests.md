# Pull requests

This is a pull requests style guide for working on GOV.UK.

## Why do we do pull requests on GOV.UK?

- It's good practice to have a second opinion
- It's part of our accreditation - the second pair of eyes provides a
  lightweight change management process, and shares responsiblity for the code
  going live
- It's good to spread knowledge and socialise changes amongst others
- It's good to notify people (via email, GitHub notifications etc.) who might
  otherwise not be involved (we can even 'mention' specific people with `@name`
  syntax)

## What shouldn't we do?

- Use PRs for architectural review - this should be done before the PR with a
  different audience
- Consider our work to be 'done' when opening a PR - code is done when it's in
  production
- Rely on someone else to spot and merge your PR - it's your job to find a
  reviewer and get the code merged
- Consider PRs to be all of the work - it's okay to have follow-up PRs for a
  feature if a set of changes are complete enough to go live

## What should we do?

Following is a rough workflow with guidance for each step.

### Opening a request

The canonical description of changes should always be in the individual
commits - Pull Requests are an artefact of GitHub, and we would lose that data
if we switched away. So a good PR description is not an adequate substitute for
the context and explanation provided by a good series of commits.

That said, the PR description is there to aid the reviewer and to help get your
code merged - here are some guidelines to help with that process:

- Before opening the PR, make sure you're up to date with `master` so that your
  changes are easier to merge (please ask for help if you're not sure how to do
  this)
- Make the title of the PR scannable - this will ensure that it's easier for
  potential reviewers to notice
- Summarise your changes in the description - this aids both the reviewer and
  any recipients of the PR via email
- Title and description changes aren't sent out on notification emails etc., so
  please ensure you've got a reasonable title and description *before* opening
  the PR
- Include information about the problem/user need/tracker ticket you're fixing
  to help summarise the issue
- Suggest a way to review the request (commit by commit, whole diff, with
  whitespace turned off etc.)
- If the changes involve frontend code, we love screenshots!
- If your changes contain some potentially contentious changes, pre-empt these
  by explaining why you went one way over another (for the benefit of the
  reviewer and any watchers)
- If the changes are difficult or hard to test, please include a summary of your
  testing methodology and confidence level in the request - this will aid
  reviewers and prevent them from doing the same work over (this particularly
  applies to Infrastructure changes, but equally to database optimisations,
  multi-app API changes etc.)
- If you're changing documentation, always use a spell checker before pushing.
  We don't always expect comments in code to be free of errors, but we hold
  documentation to the same standard as anything else we publish
- If there are several PRs that you would like to be reviewed and merged together
  (eg frontend and backend changes, or endpoint and adapter changes), cross-link
  the PRs by referencing the other PR in a comment or the PR description
- Use separate commits for formatting, refactoring, etc - change the
  functionality, commit, then refactor

### Reviewing a request

Reviewing a request is just as important as writing the code in the first
place - we need to create space and time to do this.

If you're not sure how the individual wants their request reviewed, make an
effort to contact them before starting - they may prefer some of the feedback to
be done in person or while pairing (especially if they're less experienced). If
some of the feedback is performed offline you should capture a summary of the
output in a pull request comment so others can see it, but make sure the
individual is happy with the summary first.

- If you're going to discuss some issues offline, please comment as such in the
  PR so that no-one merges it in the meantime - "A few issues here, going to
  discuss offline" would be enough
- Definition of 'done' - if the PR adds value on its own but doesn't entirely
  address the need/ticket merge and deploy it anyway. Any improvement is a good
  improvement, and it keeps the code moving
- If you look at a PR but don't feel comfortable merging it please say what
  you've looked at or not so other reviewers know the request hasn't been
  properly reviewed
- The same goes for small comments, email typo corrections - state clearly that
  you didn't review the entire thing.
- Always comment on individual lines the full-file diff view, not on a commit
  page because GitHub loses them if you rebase
- If you're committed to reviewing the request through to merging or closing,
  assign the PR to yourself
- If a conversation about a specific implementation happens off GitHub (eg in
  Slack or in person), summarise the conversation as a comment on the PR for the
  benefit of others
- If something is a blocker to merging, make that explicit by stating that it's
  a blocker in a comment
- Likewise, when commenting on things, state plainly whether the rest of the PR
  is good to merge (to aid future mergers once comment is addressed)

### Addressing comments

Any comments flagged as blocking should be addressed. This includes spelling or
grammatical errors in documentation.

- If you're changing something minor in an existing commit (eg renaming a
  variable for clarity, adding a missing test), amend the existing commit
  (please ask for help if you don't know how to do this)
- Major changes should probably be addressed in a separate commit - be sure that
  when addressing changes you follow existing commit guidelines - "Addressed
  feedback" isn't an acceptable commit message
- Explicitly comment that all relevant comments have been addressed to notify
  any watchers - you don't need to do this on a per-comment basis
- Refactoring can and should be done in follow-up separate pull request - it
  should never be considered a blockers

## 'Done'

'Done' doesn't just come when the code is merged. Features should not be
considered delivered until they're in production, and it's the responsibility of
the programmer who wrote the code to ensure their work is deployed in a timely
fashion.
