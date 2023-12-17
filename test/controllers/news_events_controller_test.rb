require "test_helper"

class NewsEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @news_event = news_events(:one)
  end

  test "should get index" do
    get news_events_url
    assert_response :success
  end

  test "should get new" do
    get new_news_event_url
    assert_response :success
  end

  test "should create news_event" do
    assert_difference("NewsEvent.count") do
      post news_events_url, params: { news_event: {  } }
    end

    assert_redirected_to news_event_url(NewsEvent.last)
  end

  test "should show news_event" do
    get news_event_url(@news_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_news_event_url(@news_event)
    assert_response :success
  end

  test "should update news_event" do
    patch news_event_url(@news_event), params: { news_event: {  } }
    assert_redirected_to news_event_url(@news_event)
  end

  test "should destroy news_event" do
    assert_difference("NewsEvent.count", -1) do
      delete news_event_url(@news_event)
    end

    assert_redirected_to news_events_url
  end
end
