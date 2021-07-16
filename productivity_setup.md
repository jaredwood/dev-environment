---
title: Productivity Setup
---

This is a concise guide for setting up a productivity environment. Topics include
* Browser search engines
* Gmail setup
* Slack

# Browser Search Engines (Chrome)

There are some sites you search a lot. And some of these searches take a few steps to perform. Custom search engines can be defined to reduce this hassle.

In the browser settings search for "search engines." Add new search engines for any of-repeated searches. To define a search engine you define a query and a keyword.

The query is of the format `URL+%s`. So in the browser you type the search engine name followed by the query string.

## SourceGraph code search engines

SourceGraph is a great browser tool to search code repositories. However, it takes several steps to define a search (such as the git branch).

### Code search

Search within files for query string.

| Key | Value |
| --- | --- |
| Search engine | cs |
| Keyword | cs |
| URL query | `https://sourcegraph.lyft.net/search?q=repo:%5Egithub%5C.com/lyft/avsoftware%24%40deliver/planning+%s` |

### File search

Search for files matching a query string.

| Key | Value |
| --- | --- |
| Search engine | fs |
| Keyword | fs |
| URL query | `https://sourcegraph.lyft.net/search?q=repo:%5Egithub%5C.com/lyft/avsoftware%24%40deliver/planning+type:path+%s` |

## Github search engines

Search engines can be defined for github code reviews.

### Code list

Pull up the open pull requests created by a user.

| Key | Value |
| --- | --- |
| Search engine | cl |
| Keyword | cl |
| URL query | `https://github.com/pulls?q=is%3Aopen+is%3Apr+author%3Ajaredwood+archived%3Afalse+user%3Alyft` |

### Code review

Pull up the open code reviews assigned to a user.

| Key | Value |
| --- | --- |
| Search engine | cr |
| Keyword | cr |
| URL query | `https://github.com/pulls?q=is%3Aopen+is%3Apr+archived%3Afalse+user%3Alyft+assignee%3Ajaredwood` |

# Gmail

In a large organizations there are many emails. With proper filters and inbox settings you can tame the beast and actually improve your piece of mind.

In order to properly utilize filters you should
1. Subscribe to github notifications.
2. Define filters in gmail.
3. Customize your gmail inbox to utilize the filters.

## Filters

Filters are you friends. They enable you to sort the incoming email to help you focus on the most important.

Refer to the [list of search operators](https://support.google.com/mail/answer/7190?hl=en).

The following is an example set of filters.

### Review Request Filters

#### design reviews
query: from:comments-noreply@docs.google.com
apply: label design-review, skip inbox

#### code pull requests
query: from:notifications@github.com
apply: label pr, skip inbox

#### code reviews requested
query: (from:notifications@github.com {cc:review_requested cc:assign})
apply: label review

#### code reviews authored
query: (from:notifications@github.com {cc:author})
apply: label author

#### code reviews mentioned
query: (from:notifications@github.com {cc:mention})
apply: label mention

#### avsoftware repo
query: to:lyft/avsoftware
apply: label avsw

#### avjadoo repo
query: to:lyft/avjadoo
apply: label jadoo

### goals lib
query: "src/planning/lib/goal_state"
apply: label pr_goals

### Action & Announcements Filters

#### action required
query: subject:(action required)
apply: label action-required, skip inbox

#### action requested
query: subject:(action -required)
apply: label action-requested, skip inbox

#### SEV
query: subject:sev
apply: label sev, skip inbox

#### announcement
query: {subject:({announce announcement announcing "inform"} -{newsletter 3p "release"}) (from:"James Kuffner" -to:{jwood jared.wood}) (from:"Luc Vincent" -to:{jwood jared.wood})}
apply: label announcement, skip inbox

#### newsletter
query: subject:{newsletter 3p "release"}
apply: label newsletter, skip inbox

### Meetings Filters

#### interviews
query: subject:"interview"
apply: label interview, skip inbox

#### google meetings
query: "Invitation from Google Calendar"
apply: label meeting, skip inbox

### Tasks

#### jira
query from:jira
apply: label jira, skip inbox

#### tickets
query: (from:jira to:jwood)
apply: label tickets

## Custom Multiple Inboxes Setup

Now, to harness the filters defined above, switch the inbox layout to "Multiple Inboxes" and customize the set of inboxes as

Section: actions
query: (label:{action-required action-requested} is:unread)

Section: interviews
query: (label:interview)

Section: reviews
query: (label:{design-review (pr {review author})} is:unread)

Section: announcements
query: (label:{announcement sev} is:unread)

Section: updates
query: ({label:newsletter label:meeting label:(jira ticket)} is:unread)

And set the option for the inbox to be below the sections defined above.

# Slack

TODO