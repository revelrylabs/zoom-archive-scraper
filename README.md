# ZoomDeepScrape

A small scraper example in elixir using hound. Scrapes the Recording Management
pages of Zoom to save old recordings.

## Installation & Use

This code is just an example / experiment and isn't intended for production use.

### Requirements

This requires elixir, erlang, chromedriver, and chrome.

### Installation

```
git clone git@github.com:revelrylabs/zoom-archive-scraper.git
cd zoom-archive-scraper
mix deps.get
```

You will need to create `config/secrets.exs` and fill in with username and
password.

```elixir
use Mix.Config

config :zoom_deep_scrape, username: "example@example.com"
config :zoom_deep_scrape, password: "example"
```

### Usage

```
bin/console
```

At the console you can do:

```elixir
ZoomDeepScrape.login
ZoomDeepScrape.list_links_for_page(1) # or whatever
```

This will download all the recordings from page 1 into the default download
directory for

##
