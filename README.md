# ISICS Ruby

A [Ruby](https://www.ruby-lang.org) interface to [ISICSoo](https://doi.org/10.1016/j.cpc.2011.10.004) to calculate ionization cross sections from ECPSSR and PWBA theory

## Requirements

- [SWIG](http://www.swig.org)
- [ISICSoo](https://doi.org/10.1016/j.cpc.2011.10.004) source code

## Installation

Download an [ISICSoo](https://doi.org/10.1016/j.cpc.2011.10.004) source archive (e.g. aekn_v1_1.tar.gz) from [Computer Physics Communications Program Library](http://cpc.cs.qub.ac.uk/summaries/AEKN_v1_1.html) after accepting [CPC licence](https://www.elsevier.com/about/policies/open-access-licenses/elsevier-user-license/cpc-license) term.

Build as follows:

``` sh
bundle install
bundle exec rake compile -- --isics-src=[the path to aekn_v1_1.tar.gz]
bundle exec rake install
```

## Usage

``` ruby
reqire 'isics'
include Isics

# new instance of ISICSoo
calculation = ISICSoo.new

# load configuration file test.cfg
calculation.read_config('ext/isics/example/test.cfg')

# be quiet
calculation.verbosity = 0

# run ECPSSR
calculation.run_ecpssr

# get the xsection of L1+L2+L3
xs = (1..3).map { |i| calculation.shell_ecpssr(i) }.sum

# get the array of energies
en = calclation.energies

# print the results
puts "energy: #{en[0]} MeV"
puts "ecpssr: #{xs} barn"
```

## References

- [ISICSoo: A class for the calculation of ionization cross sections from ECPSSR and PWBA theory](https://doi.org/10.1016/j.cpc.2011.10.004), Computer Physics Communications, Volume 183, Issue 9, 2012, pp. 398-404
- [CPC licence](https://www.elsevier.com/about/policies/open-access-licenses/elsevier-user-license/cpc-license)
