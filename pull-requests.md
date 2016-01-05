# Pull requests

This is a pull requests style guide for working on GOV.UK.

## Why we do pull requests on GOV.UK

- It's good practice to have a second opinion
- It's part of our accreditation - the extra pair of (unconnected - even if you
  pair you need a third person to merge) eyes provides a lightweight change
  management process, and shares responsiblity for the code going live
- It's good to spread knowledge and socialise changes amongst others
- It's good to notify people (via email, GitHub notifications etc.) who might
  otherwise not be involved (we can even 'mention' specific people with `@name`
  syntax)

## Cautionary notes

- Don't use PRs for architectural review - this should be done before the pull
  request is raised
- Don't rely on someone else to spot and merge your PR - it's your job to find a
  reviewer and get the code merged
- A PR doesn't have to be all of the work - it's okay to have follow-up PRs for a
  feature if a set of changes are complete enough to go live

## Guidance for each step

If you are not sure how to do any of this, please feel free to ask for help.

### Opening a request

- Before opening the PR, make sure you're up to date with `master` so that your
  changes are easier to merge
- The title and description should help the reviewer. Make the title succinct
  and descriptive, and then add detail in the description.
- The description should summarise your changes and include useful links, eg to
  a Pivotal ticket, ZenDesk ticket or related PR. If the changes involve
  frontend code, we love screenshots!
- When raising a PR, the title and description are emailed to those following
  the repo. Any subsequent changes are not emailed, so it's worth spending a
  bit of time getting it right at the point of raising the PR.
- It is worth explaining/highlighting any potentially contentious changes, and
  any testing that you have already done.

Note: The canonical description of changes should always be in the individual
commits - Pull Requests are an artefact of GitHub, and we would lose that data
if we switched away. Please refer to the [commit message
styleguide](/git.md#commit-messages).

### Reviewing a request

#### Guidelines for review

- It is important to take time to review a pull request properly; the review
  stage is as important as writing the code in the first place
- If you're not sure how the individual wants their request reviewed, ask them
  before starting - they may prefer some of the feedback to be done in person
  or while pairing (especially if they're less experienced).
- If the code is good, or solves something in a clever way, *say
  so*. Call out individual bits of quality - it signposts good practice for
  others, and rewards the person submitting the request.
- State what, if anything, is a blocker explicitly

#### Communicate with others who may consider reviewing the PR

- If you're going to discuss some issues offline, please comment as such in the
  PR so that no-one merges it in the meantime - "A few issues here, going to
  discuss offline" would be enough. When conversation has taken place elsewhere,
  summarise the conversation as a comment on the PR for the benefit of others.
- If you look at a PR but don't feel comfortable merging it please say what
  you've looked at or not so other reviewers know the request hasn't been
  properly reviewed.
- If you're committed to reviewing the request through to merging or closing,
  assign the PR to yourself


#### Helpful things to consider while reviewing

- Try running the code - even if the tests pass it might have bugs
- Consider security when reviewing code, particularly where there is user input.
  The [basic security guidance](basic-security.md) might help.
- Remember that a PR does not have to entirely solve the problem. If it adds
  value on its own it is better to merge now rather than wait for the rest of
  the changes required.
- Always comment on individual lines in the full-file diff view, not on a commit
  page because GitHub loses them if you rebase
- Ensure that any relevant documentation (`README` files, things in the `doc`
  folder) is up to date with the changes


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
  should never be considered a blocker

## 'Done'

'Done' doesn't just come when the code is merged. Features should not be
considered delivered until they're in production, and it's the responsibility of
the programmer who wrote the code to ensure their work is deployed in a timely
fashion.

### Reviewing external pull requests

We sometimes receive pull requests from members of the public, and while we should be polite to our colleagues of course, it’s even more important that we follow a few guidelines when dealing with people we don’t know, some of whom will be doing this work in their own time.

#### Tone

- Be positive – thank them for contributing. Make this the first thing you say. Thank them even if you are going to immediately reject it
- When reviewing, make sure you make positive comments as well as suggestions for improvement – a list of just things to fix could be dispiriting
- Make requests for improvement rather than telling them what to do (“We think it might be better the other way round, what do you think?” rather than “Swap the order of the logic”)
- Avoid using terms that could be seen as referring to personal traits. (“dumb”, “stupid”) Assume everyone is attractive, intelligent, and well-meaning. Assume good faith
- Be explicit. Remember people don’t always understand your intentions online

#### Handling the PR

- Communicate clearly about whether we’re interested in the feature or not. If it doesn’t fit with our rationale for the codebase or we don’t want to merge it for another reason, thank them and close
- If it fits but isn’t mergable due to quality or style issues, then clearly state that we are interested in the feature, but there are barriers to the contribution being merged in its current form
- It’s worth saying what improvements we’d like to see, but not putting the onus on the contributor to make them all. For example, we might add tests ourselves or work with them to add tests
- It’s okay to close PRs due to lack of activity; but in this case, invite people to reopen if they pick things up again

#### Practical

- For [vCloud Tools](http://gds-operations.github.io/vcloud-tools/) PRs, make sure someone has acknowledged the PR within two working days, even if this is just a “Thank you, we will review this soon”
- DO NOT comment on PRs, even to acknowledge them, at the weekend - we do not want to set an expectation that this project is supported outside working hours
- Try and comment on the changed files rather than by commit as the notifications are easier to follow
- If the contributor has not written a line in the CHANGELOG, then once their PR is merged, write a line to describe it.
- Whether they have written the CHANGELOG entry or you do, please add a “Thank you @githubusername”. We don’t usually add CHANGELOG notes for documentation, but if that comes from an external source, add a documentation credit at the end to thank them.

## Further reading

- [Anna Shipman](https://github.com/annashipman) has written a useful blog post about [how to raise a good pull request](http://www.annashipman.co.uk/jfdi/good-pull-requests.html)
- A great example of [a good pull request](https://github.com/alphagov/frontend/pull/784) raised by [Alice Bartlett](https://github.com/alicebartlett)
