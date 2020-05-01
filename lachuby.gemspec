Gem::Specification.new do |spec|
  spec.name = 'lachuby'
  spec.version = '1.0.0'

  spec.authors = ['Fräntz Miccoli']
  spec.summary = 'Lachuby: late acceptance hill climbing for Ruby'
  spec.description = 'Simple implementation late acceptance hill climbing ' +
      '(LAHC) in Ruby'
  spec.homepage = 'https://frantzmiccoli.github.io/Lahcuby'

  spec.files = Dir['{lib}/solver.rb', '{lib}/problem/solution.rb', 'LICENSE.md']
  spec.require_paths = ['lib']
  spec.test_files = Dir.glob('test/**/test_*.rb')

  spec.required_ruby_version = '>= 2.3'
  spec.license = 'MIT'

end
