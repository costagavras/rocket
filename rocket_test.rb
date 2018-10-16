require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test
  # Write your tests here!
  def setup

    @rocket = Rocket.new

  end
  
  def test_name_is_random

    random_name = @rocket.name
    assigned_name = @rocket.name=("Jackie")

    refute_equal(random_name, assigned_name)

  end

  def test_change_name_updates_the_name

    @rocket.name=("Jackie")
    actual = @rocket.name
    expected = "Jackie"

    assert_equal(expected, actual)
  end

  def test_change_name_updates_from_old_name

    old_name = @rocket.name
    @rocket.name=("Jackie")
    new_name = "Jackie"

    refute_equal(new_name, old_name)
  end

  def test_colour_is_random

    random_colour = @rocket.colour
    assigned_colour = @rocket.colour=("pink")

    refute_equal(random_colour,assigned_colour)
  end

  def test_change_colour

    old_colour = @rocket.colour
    @rocket.colour=("pink")
    new_colour = @rocket.colour

    refute_equal(old_colour,new_colour)
  end

  def test_flying

    old_rocket_flying_status = @flying #default value, reading attribute
    new_rocket = Rocket.new(flying:true)
    new_rocket_flying_status = new_rocket.flying? #new value through method

    refute_equal(old_rocket_flying_status,new_rocket_flying_status)
  end

  def test_lift_off_not_flying

    rocket_lift_off_status = @rocket.lift_off #default flying = false
    expected_lift_off_status = true

    assert_equal(expected_lift_off_status, rocket_lift_off_status)

  end

  def test_lift_off_flying

    new_rocket = Rocket.new(flying:true)
    rocket_lift_off_status = new_rocket.lift_off #set flying = true
    expected_lift_off_status = false

    assert_equal(expected_lift_off_status, rocket_lift_off_status)

  end

  def test_land_when_not_flying

    rocket_land_status = @rocket.land #default flying = false
    expected_land_status = false

    assert_equal(expected_land_status, rocket_land_status)

  end

  def test_land_when_flying

    new_rocket = Rocket.new(flying:true)
    rocket_land_status = new_rocket.land #set flying = true
    expected_land_status = true

    assert_equal(expected_land_status, rocket_land_status)

  end

  def test_status_not_flying

    #existing rocket case, not flying
    land_status = @rocket.land
    lift_off_status = @rocket.lift_off

    refute_equal(land_status, lift_off_status)

  end

  def test_status_flying

    #new rocket case, flying
    new_rocket = Rocket.new(flying:true)
    land_status = new_rocket.land
    new_rocket = Rocket.new(flying:true) #second "new" rocket to restore flying:true condition
    lift_off_status = new_rocket.lift_off

    refute_equal(land_status, lift_off_status)

  end


  def test_status

    actual = @rocket.status
    expected = "Rocket #{@rocket.name} is ready for lift off!"

    assert_equal(expected, actual)

  end

end
