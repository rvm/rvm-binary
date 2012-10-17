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

## Output

Output of the build will be available in `binaries/` folder.
