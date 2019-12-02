class FuelCounterUpper
  def initialize input
    @input = input
  end

  def count_fuel
    @input.map{|i| calc_mass(i)}.inject(:+)
  end

  def count_fuel_with_fuel
    @input.map{|i| calc_mass_r(i) - i }.inject(:+)
  end
  
  def calc_mass mass
    mass/3-2
  end

  def calc_mass_r mass
    if mass <= 0
      0
    else
      mass + calc_mass_r(calc_mass(mass))
    end
  end
end
