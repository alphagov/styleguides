# Go styleguide

## Whitespace

Use [`gofmt`](http://golang.org/cmd/gofmt/). This [avoids religious wars about where curly braces](http://blog.golang.org/go-fmt-your-code) should go.

## External dependencies

**TODO** Please fill out (ideally with definitive guidance) discussion of how to manage dependencies, looking at options such as:

* vendoring
* [gopkg.in](http://labix.org/gopkg.in)
* git subtree
* etc

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
