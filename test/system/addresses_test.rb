require "application_system_test_case"

class AddressesTest < ApplicationSystemTestCase
  setup do
    @address = addresses(:one)
  end

  test "visiting the index" do
    visit addresses_url
    assert_selector "h1", text: "Addresses"
  end

  test "creating a Address" do
    visit addresses_url
    click_on "New Address"

    fill_in "Country", with: @address.country
    fill_in "Email", with: @address.email
    fill_in "Landmark", with: @address.landmark
    fill_in "Line1", with: @address.line1
    fill_in "Line2", with: @address.line2
    fill_in "Phone", with: @address.phone
    fill_in "Pincode", with: @address.pincode
    fill_in "State", with: @address.state
    click_on "Create Address"

    assert_text "Address was successfully created"
    click_on "Back"
  end

  test "updating a Address" do
    visit addresses_url
    click_on "Edit", match: :first

    fill_in "Country", with: @address.country
    fill_in "Email", with: @address.email
    fill_in "Landmark", with: @address.landmark
    fill_in "Line1", with: @address.line1
    fill_in "Line2", with: @address.line2
    fill_in "Phone", with: @address.phone
    fill_in "Pincode", with: @address.pincode
    fill_in "State", with: @address.state
    click_on "Update Address"

    assert_text "Address was successfully updated"
    click_on "Back"
  end

  test "destroying a Address" do
    visit addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Address was successfully destroyed"
  end
end
