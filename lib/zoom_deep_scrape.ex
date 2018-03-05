defmodule ZoomDeepScrape do
  import Wallaby.Query
  import Wallaby.DSL
  import Wallaby.Browser

  @moduledoc """
  Trying to scrape the zoom archive with wallaby
  """

  def list_links_for_page(n) do
    {:ok, session} = Wallaby.start_session

    session
    |> visit("https://zoom.us/signin")
  end
end
