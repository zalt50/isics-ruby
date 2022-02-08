#!/usr/bin/env ruby

require 'pathname'
require 'isics'

# data_dir = Pathname.new(__FILE__).realpath.parent.parent + 'data'
# ENV['ISICS_DATA'] = data_dir.to_s

# new instance of type ISICSoo
calculation = Isics::ISICSoo.new

# load configuration file test.cfg
config =
  Pathname.new(__FILE__).realpath.parent.parent +
  'ext' + 'isics' + 'example' + 'test.cfg'
calculation.read_config(config.to_s)

# be quiet
calculation.verbosity = 2

# run ECPSSR
calculation.run_ecpssr

# get the xsection of L1+L2+L3
xs = (1..3).reduce(0.0) { |a, e| a + calculation.shell_ecpssr(e) }

# get the vector of energies
en = calculation.energies

puts "energy: #{en[0]} MeV"
puts "ecpssr: #{xs} barn"
