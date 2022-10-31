Advent of Code 2021
-------------------

## How to smalltalk
### Download gnu smalltalk

#### The story
I would have used brew except the bottle was not available
https://formulae.brew.sh/formula/gnu-smalltalk#default

I thus submitted a new issue to `brew` where it becamse apparent that the ARM bottle did not exist for `gnu-smalltalk`.
https://github.com/Homebrew/homebrew-core/issues/113868

At this point, I realised that I would have to turn to `Docker` to get this working. And it did.

#### The outcome
You can build the container for this project as follows:

```sh
docker build -t advent_smalltalk_2021 .
# or
make docker-build
```

This will grab the latest ubuntu container; install `gnu-smalltalk` via `apt`, and open up a bash shell, where the various smalltalk programs can then be executed.

### Run one of the files like so
```sh
docker run advent_smalltalk_2021 gst <SMALLTALK_FILE>
# e.g. -
docker run advent_smalltalk_2021 gst src/7/7.st
```