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
You can make the container for this project as follows:

```sh
make dockerize
```

This will grab the latest ubuntu container; install `gnu-smalltalk` via `apt`, and open up a bash shell, where the various smalltalk programs can then be executed.

### Run one of the files like so
```sh
cd src/1
gst 1.st
```