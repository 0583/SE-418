Conventional Commits
A specification for adding human and machine readable meaning to commit messages
Quick Summary
Full Specification
Contribute

Conventional Commits 1.0.0-beta.4
Summary

The Conventional Commits specification is a lightweight convention on top of commit messages. It provides an easy set of rules for creating an explicit commit history; which makes it easier to write automated tools on top of. This convention dovetails with SemVer, by describing the features, fixes, and breaking changes made in commit messages.

The commit message should be structured as follows:

<type>[optional scope]: <description>

[optional body]

[optional footer]

The commit contains the following structural elements, to communicate intent to the consumers of your library:

fix: a commit of the type fix patches a bug in your codebase (this correlates with PATCH in semantic versioning).
feat: a commit of the type feat introduces a new feature to the codebase (this correlates with MINOR in semantic versioning).
BREAKING CHANGE: a commit that has the text BREAKING CHANGE: at the beginning of its optional body or footer section introduces a breaking API change (correlating with MAJOR in semantic versioning). A BREAKING CHANGE can be part of commits of any type.
Others: commit types other than fix: and feat: are allowed, for example @commitlint/config-conventional (based on the the Angular convention) recommends chore:, docs:, style:, refactor:, perf:, test:, and others.
We also recommend improvement for commits that improve a current implementation without adding a new feature or fixing a bug. Notice these types are not mandated by the conventional commits specification, and have no implicit effect in semantic versioning (unless they include a BREAKING CHANGE). 
A scope may be provided to a commit’s type, to provide additional contextual information and is contained within parenthesis, e.g., feat(parser): add ability to parse arrays.

Examples

Commit message with description and breaking change in body

feat: allow provided config object to extend other configs

BREAKING CHANGE: `extends` key in config file is now used for extending other config files
Commit message with optional ! to draw attention to breaking change

chore!: drop Node 6 from testing matrix

BREAKING CHANGE: dropping Node 6 which hits end of life in April
Commit message with no body

docs: correct spelling of CHANGELOG
Commit message with scope

feat(lang): add polish language
Commit message for a fix using an (optional) issue number.

fix: correct minor typos in code

see the issue for details on the typos fixed

closes issue #12
Specification

The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in RFC 2119.

Commits MUST be prefixed with a type, which consists of a noun, feat, fix, etc., followed by an OPTIONAL scope, and a REQUIRED terminal colon and space.
The type feat MUST be used when a commit adds a new feature to your application or library.
The type fix MUST be used when a commit represents a bug fix for your application.
A scope MAY be provided after a type. A scope MUST consist of a noun describing a section of the codebase surrounded by parenthesis, e.g., fix(parser):
A description MUST immediately follow the space after the type/scope prefix. The description is a short summary of the code changes, e.g., fix: array parsing issue when multiple spaces were contained in string.
A longer commit body MAY be provided after the short description, providing additional contextual information about the code changes. The body MUST begin one blank line after the description.
A footer of one or more lines MAY be provided one blank line after the body. The footer MUST contain meta-information about the commit, e.g., related pull-requests, reviewers, breaking changes, with one piece of meta-information per-line.
Breaking changes MUST be indicated at the very beginning of the body section, or at the beginning of a line in the footer section. A breaking change MUST consist of the uppercase text BREAKING CHANGE, followed by a colon and a space.
A description MUST be provided after the BREAKING CHANGE:, describing what has changed about the API, e.g., BREAKING CHANGE: environment variables now take precedence over config files.
Types other than feat and fix MAY be used in your commit messages.
The units of information that make up conventional commits MUST NOT be treated as case sensitive by implementors, with the exception of BREAKING CHANGE which MUST be uppercase.
A ! MAY be appended prior to the : in the type/scope prefix, to further draw attention to breaking changes. BREAKING CHANGE: description MUST also be included in the body or footer, along with the ! in the prefix.
Why Use Conventional Commits

Automatically generating CHANGELOGs.
Automatically determining a semantic version bump (based on the types of commits landed).
Communicating the nature of changes to teammates, the public, and other stakeholders.
Triggering build and publish processes.
Making it easier for people to contribute to your projects, by allowing them to explore a more structured commit history.
FAQ

How should I deal with commit messages in the initial development phase?

We recommend that you proceed as if you’ve already released the product. Typically somebody, even if it’s your fellow software developers, is using your software. They’ll want to know what’s fixed, what breaks etc.

Are the types in the commit title uppercase or lowercase?

Any casing may be used, but it’s best to be consistent.

What do I do if the commit conforms to more than one of the commit types?

Go back and make multiple commits whenever possible. Part of the benefit of Conventional Commits is its ability to drive us to make more organized commits and PRs.

Doesn’t this discourage rapid development and fast iteration?

It discourages moving fast in a disorganized way. It helps you be able to move fast long term across multiple projects with varied contributors.

Might Conventional Commits lead developers to limit the type of commits they make because they’ll be thinking in the types provided?

Conventional Commits encourages us to make more of certain types of commits such as fixes. Other than that, the flexibility of Conventional Commits allows your team to come up with their own types and change those types over time.

How does this relate to SemVer?

fix type commits should be translated to PATCH releases. feat type commits should be translated to MINOR releases. Commits with BREAKING CHANGE in the commits, regardless of type, should be translated to MAJOR releases.

How should I version my extensions to the Conventional Commits Specification, e.g. @jameswomack/conventional-commit-spec?

We recommend using SemVer to release your own extensions to this specification (and encourage you to make these extensions!)

What do I do if I accidentally use the wrong commit type?

When you used a type that’s of the spec but not the correct type, e.g. fix instead of feat

Prior to merging or releasing the mistake, we recommend using git rebase -i to edit the commit history. After release, the cleanup will be different according to what tools and processes you use.

When you used a type not of the spec, e.g. feet instead of feat

In a worst case scenario, it’s not the end of the world if a commit lands that does not meet the conventional commit specification. It simply means that commit will be missed by tools that are based on the spec.

Do all my contributors need to use the conventional commit specification?

No! If you use a squash based workflow on Git lead maintainers can clean up the commit messages as they’re merged—adding no workload to casual committers. A common workflow for this is to have your git system automatically squash commits from a pull request and present a form for the lead maintainer to enter the proper git commit message for the merge.

About

The Conventional Commit specification is inspired by, and based heavily on, the Angular Commit Guidelines.

The first draft of this specification has been written in collaboration with some of the folks contributing to:

conventional-changelog: a set of tools for parsing conventional commit messages from git histories.
bumped: a tool for releasing software that makes it easy to perform actions before and after releasing a new version of your software.
unleash: a tool for automating the software release and publishing lifecycle.
lerna: a tool for managing monorepos, which grew out of the Babel project.
Tooling for Conventional Commits

php-commitizen: a tool built to create commit messages following the Conventional Commit specs. Configurable and usable for PHP projects as a composer dependency or usable globally for non-PHP projects.
conform: a tool that can be used to enforce policies on git repositories, including conventional commits.
standard-version: Automatic versioning and CHANGELOG management, using GitHub’s new squash button and the recommended Conventional Commits workflow.
Projects Using Conventional Commits

yargs: everyone’s favorite pirate themed command line argument parser.
istanbuljs: a collection of open-source tools and libraries for adding test coverage to your JavaScript tests.
uPortal-home and uPortal-application-framework: Optional supplemental user interface enhancing Apereo uPortal.
massive.js: A data access library for Node and PostgreSQL.
electron: Build cross-platform desktop apps with JavaScript, HTML, and CSS.
scroll-utility: A simple to use scroll utility package for centering elements, and smooth animations
Blaze UI: Framework-free open source UI toolkit.
Monica: An open source personal relationship management system.
mhy: 🧩 A zero-config, out-of-the-box, multi-purpose toolbox and development environment.
Conventional Commits

want your project on this list? send a pull request.
License
Creative Commons - CC BY 3.0