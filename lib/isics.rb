require "isics/version"
require "isics/isics"

# Module for the calculation of ionization cross sections
# from ECPSSR and PWBA theory
module Isics
  if ENV["ISICS_DATA"].nil?
    ENV["ISICS_DATA"] =
      File.dirname(File.dirname(Gem.find_files("isics.rb").first)) +
      "/ext/isics"
  end
end
