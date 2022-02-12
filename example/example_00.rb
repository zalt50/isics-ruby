#!/usr/bin/env ruby
# frozen_string_literal: true

require 'isics'
include Isics

# new instance of ISICSoo
calculation = ISICSoo.new

# load configuration file test.cfg
config = File.expand_path('../ext/isics/example/test.cfg', __dir__)
calculation.read_config(config)

# be quiet
calculation.verbosity = 0

# run ECPSSR
calculation.run_ecpssr

# get the xsection of L1+L2+L3
xs = (1..3).map { |i| calculation.shell_ecpssr(i) }.sum

# get the array of energies
en = calculation.energies

# print the results
puts "energy: #{en[0]} MeV"
puts "ecpssr: #{xs} barn"
