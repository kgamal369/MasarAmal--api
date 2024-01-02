require 'application_system_test_case'

class TreatmentApproachesTest < ApplicationSystemTestCase
  setup do
    @treatment_approach = treatment_approaches(:one)
  end

  test 'visiting the index' do
    visit treatment_approaches_url
    assert_selector 'h1', text: 'Treatment approaches'
  end

  test 'should create treatment approach' do
    visit treatment_approaches_url
    click_on 'New treatment approach'

    click_on 'Create Treatment approach'

    assert_text 'Treatment approach was successfully created'
    click_on 'Back'
  end

  test 'should update Treatment approach' do
    visit treatment_approach_url(@treatment_approach)
    click_on 'Edit this treatment approach', match: :first

    click_on 'Update Treatment approach'

    assert_text 'Treatment approach was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Treatment approach' do
    visit treatment_approach_url(@treatment_approach)
    click_on 'Destroy this treatment approach', match: :first

    assert_text 'Treatment approach was successfully destroyed'
  end
end
