require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  def take_failed_screenshot
    super
    send_screenshot_to_hipchat if failed? && supports_screenshot?
  end

  private

  def send_screenshot_to_hipchat
    hipchat_client[ENV['hipchat_room'].send_file(
      'テスト監視者',
      'テストが失敗したよ',
      File.open("tmp/screenshots/failures_#{method_name}.png")
    )
  end

  def hipchat_client
    @client ||= HipChat::Client.new(ENV['hipchat_api_token'], api_version: 'v2')
  end
end
