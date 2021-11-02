# autocleaner

A program that deletes your files with configurable storage period.
It uses `find` internally, and therefore it's very fast.

## Requirements

* Ruby 2.7
* `find` in PATH

## Install

```sh
cd /opt
sudo git clone https://github.com/m1kc/autocleaner.git
cd autocleaner
cp config.rb.example config.rb
nano config.rb  # edit config as you see fit
sudo make install
sudo make activate  # this will enable and start systemd timer
```

## Usage

Copy `config.rb.example` to `config.rb` and define which folders you want to
be auto-cleaned and how long to store files inside them.

**Note:** you **can** define overlapping folders. In such cases, **smallest**
storage period wins. In other words, if a file is to be kept by one policy
and to be deleted by another, it will be deleted.

## Planned features

(for requests, create an issue or drop me a note at m1kc@yandex.ru)

* `--dry-run` flag
* `--validate-config` flag
