# RVM Binary

Automation of building binary rubies for RVM.

## Initialization

Install vagrant from http://www.vagrantup.com/downloads.html

## Invocation

- `./run list` - List available images
- `./run <image>` - Run single image build
- `./run [all]` - Run build on all images, one by one
- `./run binaries` - List all build rubies

It is possible to define which ruby should be build:

`RUBY_VERSIONS="ruby-1.9.3-p327" vagrant up arch_20120702_64bit`

## Output

Output of the build will be available in `binaries/` folder.

## Ruby versions

Only MRI 1.9.3-p125+ is supported:

- rubinius provides binaries here: http://binaries.rubini.us/
- jruby provides binaries here: http://jruby.org.s3.amazonaws.com/
- ree is based on 1.8.7 so it is not supported

That said - feel free to build any binary ruby for yourself, just be careful publishing it,
make sure to include information in what path it should be installed (relevant for MRI 1.8.7 / REE).

## Optimization

### RVM installation

To speed up rvm installation for every machine do a local checkout of rvm source:

    git clone --depth 0 https://github.com/wayneeseguin/rvm.git rvm-src

Or from local project:

    git clone ~/projects/rvm/rvm rvm-src

Make sure to update it before running builds.
