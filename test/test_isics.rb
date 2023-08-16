require "test_helper"
require "pathname"

class TestIsics < Minitest::Test
  def setup
    @calculation = Isics::ISICSoo.new
    # load configuration file test.cfg
    config =
      Pathname.new(__FILE__).realpath.parent.parent +
      "ext" + "isics" + "example" + "test.cfg"
    @calculation.read_config(config.to_s)

    # be quiet
    @calculation.verbosity = 0

    # run ECPSSR
    @calculation.run_ecpssr
  end

  def test_that_it_has_a_version_number
    refute_nil ::Isics::VERSION
  end

  def test_energy
    en = @calculation.energies
    assert_equal(10.0, en[0])
  end

  def test_xsection_l1_l2_l3
    xs = (1..3).reduce(0.0) { |a, e| a + @calculation.shell_ecpssr(e) }
    assert_equal(1272.4512489256117, xs)
  end
end
