require 'test_helper'

class StashBotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stash_bot = stash_bots(:one)
  end

  test "should get index" do
    get stash_bots_url
    assert_response :success
  end

  test "should get new" do
    get new_stash_bot_url
    assert_response :success
  end

  test "should create stash_bot" do
    assert_difference('StashBot.count') do
      post stash_bots_url, params: { stash_bot: { name: @stash_bot.name, prefs: @stash_bot.prefs, secret_code: @stash_bot.secret_code } }
    end

    assert_redirected_to stash_bot_url(StashBot.last)
  end

  test "should show stash_bot" do
    get stash_bot_url(@stash_bot)
    assert_response :success
  end

  test "should get edit" do
    get edit_stash_bot_url(@stash_bot)
    assert_response :success
  end

  test "should update stash_bot" do
    patch stash_bot_url(@stash_bot), params: { stash_bot: { name: @stash_bot.name, prefs: @stash_bot.prefs, secret_code: @stash_bot.secret_code } }
    assert_redirected_to stash_bot_url(@stash_bot)
  end

  test "should destroy stash_bot" do
    assert_difference('StashBot.count', -1) do
      delete stash_bot_url(@stash_bot)
    end

    assert_redirected_to stash_bots_url
  end
end
