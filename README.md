# Phoxygen Website

This is the official Phoxygen website, to be published at http://www.phoxygen.com/.

Template based on [Stylish
Portfolio](http://startbootstrap.com/template-overviews/stylish-portfolio/).

## Developer Workflow

Jekyll is required to generate this website.
It can be either installed manually or run from a Docker container.

### Manual Install

Prerequisite: Ruby 2.1.0 or later

```bash
gem install bundler
bundle install
bundle exec jekyll serve
```

Note: `jekyll serve` should be equivalent to the last line but might raise
a dependency issue (e.g. with kramdown).

### With Docker

Pull the official [Jekyll container](https://github.com/jekyll/docker#running)
— it even has a specific tag for github-pages:

```bash
docker pull jekyll/jekyll:pages
```

On Native Docker:

```bash
docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll \
  -it -p 127.0.0.1:4000:4000 \
  jekyll/jekyll:pages bundle exec jekyll serve
```

On Docker-Machine:

```bash
docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll \
  -it -p $(docker-machine ip `docker-machine active`):4000:4000 \
  jekyll/jekyll:pages bundle exec jekyll serve
```

If you feel lucky, you can omit the trailing command (`bundle exec jekyll serve`)
and `jekyll serve` will be run by default.

