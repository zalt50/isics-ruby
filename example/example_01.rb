#!/usr/bin/env ruby
# frozen_string_literal: true

require 'isics'
include Isics

# new instance of ISICSoo
calculation = ISICSoo.new

# n=50 also by default
calculation.n = 50

# load non-default binding energies
energy_gw = File.expand_path('../ext/isics/energy_GW.dat', __dir__)
calculation.load_data('energy', energy_gw)

# set the projectile and target materials
calculation.projectile_z = 1
calculation.target_z = 8

# only calculate L shells
calculation.calculate_k_shell(false)
calculation.calculate_l_shell(true)
calculation.calculate_m_shell(false)

# set energy units to MeV
calculation.energy_unit = 2 # 1=keV, 0=eV, 2=MeV

# no special options for ECPSSR xsections
calculation.hsr_scaling = false
calculation.united_atom_approx = false
calculation.rel_projectile_vel = false

# be quiet
calculation.verbosity = 0

# construct the grid of energies, for which to calculate the xsections
calculation.energy = 0.1
[0.2, 0.3, 0.4, 0.60002, 1.0001].each do |e|
  calculation.add_energy(e)
end

# run both PWBA and ECPSSR
calculation.run

# get the data for total L shell xsections for all energies
xs = calculation.l_shell_data_range

# get the array of energies
en = calculation.energies

# now print out the data that interests me
puts '#energy[MeV]    PWBA[barn]        ECPSSR[barn]'
en.each_with_index do |e, i|
  xx = xs[i]
  puts format('%8g         %8e       %8e', e, xx[0], xx[2])
end
