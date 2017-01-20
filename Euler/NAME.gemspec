# coding: UTF-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include(lib)

Gem::Specification.new do |spec|
    spec.name           = "NAME"
    spec.version        = "0.0.0"
    spec.authors        = ["Roman Alexander Davis"]
    spec.email          = ["FluffyRibbit@gmail.com", "RomanAlexanderDavis@yahoo.com"]
    spec.summary        = %q{This is just a project skeleton.}
    spec.description    = %q{This is also one of the very last exercises in the whole book.}
    spec.homepage       = "https://github.com/RomanADavis"
    spec.license        = "MIT" #TODO: Learn about these different licenses

    spec.files          = ["lib/NAME.rb"]
    spec.executables    = ["bin/NAME"]
    spec.test_files     = ["tests/test_NAME.rb"]
    spec.require_paths  = ["lib"]
  end
