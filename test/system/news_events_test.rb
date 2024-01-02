require 'application_system_test_case'

class NewsEventsTest < ApplicationSystemTestCase
  setup do
    @news_event = news_events(:one)
  end

  test 'visiting the index' do
    visit news_events_url
    assert_selector 'h1', text: 'News events'
  end

  test 'should create news event' do
    visit news_events_url
    click_on 'New news event'

    click_on 'Create News event'

    assert_text 'News event was successfully created'
    click_on 'Back'
  end

  test 'should update News event' do
    visit news_event_url(@news_event)
    click_on 'Edit this news event', match: :first

    click_on 'Update News event'

    assert_text 'News event was successfully updated'
    click_on 'Back'
  end

  test 'should destroy News event' do
    visit news_event_url(@news_event)
    click_on 'Destroy this news event', match: :first

    assert_text 'News event was successfully destroyed'
  end
end
