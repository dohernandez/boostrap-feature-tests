# Contributing

* If you are a new contributor see: [Steps to Contribute](#steps-to-contribute).

* Relevant coding style guidelines are the [Go Code Review
  Comments](https://code.google.com/p/go-wiki/wiki/CodeReviewComments)
  and the _Formatting and style_ section of Peter Bourgon's [Go: Best
  Practices for Production
  Environments](https://peter.bourgon.org/go-in-production/#formatting-and-style).


## Steps to Contribute

For quickly compiling and testing your change(s) do:
```
make test         # Make sure all the tests pass before you commit and push :)
```

For linting the code do: 

```
make lint        # Make sure your change(s) follow our coding standards.
```

## Pull Request

* Branch from the master branch and, if needed, rebase to the current master branch before submitting your pull request. If it doesn't merge cleanly with master you may be asked to rebase your changes.

* Commits should be as small as possible, while ensuring that each commit is correct independently (i.e., each commit should compile and pass tests).

* Add tests relevant to the fixed bug or new feature.

## Dependency management

The project uses [Go modules](https://golang.org/cmd/go/#hdr-Modules__module_versions__and_more) to manage dependencies on external packages. This requires a working Go environment with version 1.12 or greater installed (version of the project 1.17).

All dependencies are vendored in the `vendor/` directory.

To add or update a new dependency, use the `go get` command:

```bash
# Pick the latest tagged release.
go get example.com/some/module/pkg

# Pick a specific version.
go get example.com/some/module/pkg@vX.Y.Z
```

Tidy up the `go.mod` and `go.sum` files and copy the new/updated dependency to the `vendor/` directory:


```bash
# The GO111MODULE variable can be omitted when the code isn't located in GOPATH.
GO111MODULE=on go mod tidy

GO111MODULE=on go mod vendor
```

You have to commit the changes to `go.mod` and `go.sum` before submitting the pull request.


Happy coding!!!