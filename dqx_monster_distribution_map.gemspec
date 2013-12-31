# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dqx_monster_distribution_map/version'

Gem::Specification.new do |spec|
  spec.name          = "dqx_monster_distribution_map"
  spec.version       = DqxMonsterDistributionMap::VERSION
  spec.authors       = ["Takahiro HAMAGUCHI"]
  spec.email         = ["tk.hamaguchi@gmail.com"]
  spec.description   = %q{DQ10に出現するモンスターを出現ポイント別にまとめて表示するライブラリです。}
  spec.summary       = %q{DQ10に出現するモンスターを出現ポイント別にまとめて表示するライブラリです}
  spec.homepage      = "https://github.com/tk-hamaguchi/dqx_monster_distribution_map"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"

  spec.add_dependency "hpricot", "~> 0.8"

end
