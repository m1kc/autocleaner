# autocleaner

A program that deletes your files with configurable storage period.
It uses `find` internally, and therefore it's very fast (and that's
important when you're dealing with millions of files).

:wrench: Quality: **beta** 
 
:cityscape: Used in production since **Nov 2021**

## Requirements

* Ruby 2.0...2.7
* `find` in PATH

## Install

```sh
cd /opt
sudo git clone https://github.com/m1kc/autocleaner.git
cd autocleaner
sudo make install
sudo nano /etc/autocleaner/config.rb  # edit config as you see fit
sudo make activate  # this will enable and start systemd timer
```

## Usage

Edit `/etc/autocleaner/config.rb` and define which folders you want to
be auto-cleaned and how long to store files inside them.

**Added in v1.1.0:** you can also set :glob parameter to limit the scope
to files matching the given pattern, like `*.log`, `temp-*`,
or `*` (all files, default). Note that unlike in bash, `*` matches
dotfiles as well.

```ruby
module Config
FOLDERS = [
	# Define your folders here.
	{ :folder => "/tmp", :days => 900 },
	{ :folder => "/var/log/myservice", :days => 30 },
	{ :folder => "/var/log/myotherservice", :days => 60, :glob => "*.txt" },
]
end
```

Days are counted from file's _modification time_ (mtime).

**Note:** you **can** define overlapping folders. In such cases, **smallest**
storage period wins. In other words, if a file is to be kept by one policy
and to be deleted by another, it will be deleted.

## Known caveats

* On Ruby 2.0.0p648, the following warning appears: `/etc/autocleaner/config.rb:1:in '<top (required)>': Use RbConfig instead of obsolete and deprecated Config`. This is harmless and should be ignored.

## Planned features

(for requests, create an issue or drop me a note at m1kc@yandex.ru)

* `--dry-run` flag
* `--validate-config` flag
* Deletion of empty folders
