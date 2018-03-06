defmodule ZoomDeepScrape do
  use Hound.Helpers

  @moduledoc """
  Trying to scrape the zoom archive with wallaby
  """

  def login do
    Application.ensure_all_started(:hound)
    Hound.start_session

    navigate_to "https://zoom.us/signin"
    take_screenshot "login-prefill.png"
    fill_field(find_element(:id, "email"), Application.fetch_env!(:zoom_deep_scrape, :username))
    fill_field(find_element(:id, "password"), Application.fetch_env!(:zoom_deep_scrape, :password))
    take_screenshot "login-postfill.png"
    click(find_element(:link_text, "Sign In"))
    :timer.sleep(1000)
    take_screenshot "post-sign-in.png"
  end

  def list_links_for_page(n) do
    Enum.each(0..14, fn(i) ->
      navigate_to "https://zoom.us/recording/management?p=#{n}"
      take_screenshot "list-page.png"
      link = Enum.at(find_all_elements(:css, ".rec-filesize a"), i)
      click(link)
      take_screenshot "clicked-link.png"
      Enum.each(find_all_elements(:link_text, "Download"), fn(el) -> click(el) end)
      :timer.sleep(2000)
    end)

    :timer.sleep(60 * 1000)
  end
end
