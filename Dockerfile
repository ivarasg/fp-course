FROM haskell:7.10

WORKDIR /fp-course

RUN cabal update

# Add just the .cabal file to capture dependencies
COPY ./course.cabal /fp-course/course.cabal

# Docker will cache this command as a layer, freeing us up to
# modify source code without re-installing dependencies
# (unless the .cabal file changes!)
RUN cabal install --only-dependencies -j4

# Add and Install Application Code
COPY . /fp-course
RUN cabal install
RUN chmod go-w /fp-course/.ghci
CMD ["ghci"]
