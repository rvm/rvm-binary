# RVM Binary

Automation of building binary rubies for RVM.

## Initialization

    rvm use 1.9.3
    bundle install

## Invocation

- `./run list` - List available images
- `./run <image>` - Run single image build
- `./run [all]` - Run build on all images, one by one
- `./run binaries` - List all build rubies

It is possible to define which ruby should be build:

`RUBY_VERSIONS="ruby-1.9.3-p327" vagrant up arch_20120702_64bit`

## Output

Output of the build will be available in `binaries/` folder.

## Optimization

### RVM installation

To speed up rvm installation for every machine do a local checkout of rvm source:

    git clone --depth 0 https://github.com/wayneeseguin/rvm.git rvm-src

Or from local project:

    git clone ~/projects/rvm/rvm rvm-src

Make sure to update it before running builds.
