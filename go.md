# Go styleguide

The purpose of this styleguide is to provide some conventions for working on Go code within GDS. There are already good resources on writing Go code, which are worth reading first:

* [Effective Go](https://golang.org/doc/effective_go.html)
* [Code Review Comments](https://code.google.com/p/go-wiki/wiki/CodeReviewComments) (documenting points that have been raised in Google code reviews).

## Code formatting

Use [`gofmt`](http://golang.org/cmd/gofmt/). This means all Go code reads in the same way which is [important when looking at unfamiliar code](http://blog.golang.org/go-fmt-your-code).

You may also want to use [`golint`](https://github.com/golang/lint) which assesses code style.

## Code checking

[`govet`](https://godoc.org/golang.org/x/tools/cmd/vet), which checks correctness, should be used as part of your build process.

If you are writing concurrent code, use the [race detector](https://blog.golang.org/race-detector) to detect race conditions.

## External dependencies

There is no centrally-mandated dependency manager for Go, which means a few techniques have sprung up. These include:

* tools like [godep](https://github.com/tools/godep) and [gom](https://github.com/mattn/gom), which ensure local copies of a dependency are checked out to a specific version
* "vendoring" (i.e. copying source code in some manner to a location you control)
* [gopkg.in](http://labix.org/gopkg.in), which provides a method of using versioned import paths.

We are currently evaluating `godep` and `gom` as tools for managing dependencies. While godep is probably more widely used,
gom offers some conveniences for modifying `$GOPATH`, which is useful for isolating jenkins builds. If you are using a different
CI process, godep may be sufficient for your needs.

## Web frameworks

While it's difficult to provide any guidance that will be generally applicable, there are couple of useful things to consider when structuring your Go program.

The first is that Go's standard library is modern and powerful. If you just need simple HTTP routing and handling, the [`net/http` package will probably meet your needs](https://golang.org/doc/articles/wiki/).

The second is that if `net/http` falls short, it's worth choosing something that integrates well with it. The [`gorilla`](http://www.gorillatoolkit.org/) toolkit provides some excellent additions to `net/http`.

## Channels

### Signalling

Channels that are being used purely for signalling should use an
empty struct rather than boolean or int types.

Using an empty struct declares that we're not interested in the value
sent or received; only in its closed property.

See http://talks.golang.org/2012/10things.slide#11

```go
func worker(quit <-chan struct{}, result chan<- int) {
  for {
    select {
    case result <- rand.Intn(10000000):
    case <-quit:
      return
    }
  }
}

func main() {
  quit, result := make(chan struct{}), make(chan int)
  for i := 0; i < 100; i++ {
    go worker(quit, result)
  }
  // Wait for a worker to return a good result
  for {
    if <-result > 9999998 {
      break
    }
  }
  close(quit) // terminate all the workers
  fmt.Println("All done!")
}
```
