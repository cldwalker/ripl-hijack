# -*- encoding: utf-8 -*-
require 'rubygems' unless Object.const_defined?(:Gem)
require File.dirname(__FILE__) + "/lib/ripl/hijack"
 
Gem::Specification.new do |s|
  s.name        = "ripl-hijack"
  s.version     = Ripl::Hijack::VERSION
  s.authors     = ["Gabriel Horner"]
  s.email       = "gabriel.horner@gmail.com"
  s.homepage    = "http://github.com/cldwalker/ripl-hijack"
  s.summary = "A ripl plugin that hijacks a process"
  s.description =  "This ripl plugin gives you a ripl console to any ruby process using hijack."
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = 'tagaholic'
  s.add_dependency 'ripl', '>= 0.2.8'
  s.add_dependency 'hijack', '>= 0.1.9'
  s.files = Dir.glob(%w[{lib,test}/**/*.rb bin/* [A-Z]*.{txt,rdoc} ext/**/*.{rb,c} **/deps.rip]) + %w{Rakefile .gemspec}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE.txt"]
  s.license = 'MIT'
end
