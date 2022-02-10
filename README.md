# ISICS Ruby

A [Ruby](https://www.ruby-lang.org) interface to
[ISICSoo](https://doi.org/10.1016/j.cpc.2011.10.004) to calculate
ionization cross sections from ECPSSR and PWBA theory

## Requirements

- [SWIG](http://www.swig.org)
- [ISICSoo](https://doi.org/10.1016/j.cpc.2011.10.004) source code

## Installation

Download an [ISICSoo](https://doi.org/10.1016/j.cpc.2011.10.004) source
archive (e.g. aekn_v1_1.tar.gz) from [Computer Physics Communications
Program Library](http://cpc.cs.qub.ac.uk/summaries/AEKN_v1_1.html) after
accepting [Standard CPC
licence](http://cpc.cs.qub.ac.uk/licence/licence.html) term.

Build as follows:

``` sh
bundle install
bundle exec rake compile -- --isics-src=[the path to aekn_v1_1.tar.gz]
bundle exec rake install
```

## Usage

``` ruby
reqire 'isics'
calculation = Isics::ISICSoo.new

# load config
calculation.read_config(file_name)

# be quiet
calculation.verbosity = 0

# run ECPSSR
calculation.run_ecpssr

# get results
cs = (1..3).reduce(0.0) { |a, e| a + calculation.shell_ecpssr(e) }
```

## References

- [ISICSoo: A class for the calculation of ionization cross sections
  from ECPSSR and PWBA
  theory](https://doi.org/10.1016/j.cpc.2011.10.004), Computer Physics
  Communications, Volume 183, Issue 9, 2012, pp. 398-404
- [Standard CPC licence](http://cpc.cs.qub.ac.uk/licence/licence.html)
