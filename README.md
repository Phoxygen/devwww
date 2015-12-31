# Phoxygen Website

This is the Phoxygen official website.

We started from the jekyll implementation of the [Stylish
Portfolio](http://startbootstrap.com/template-overviews/stylish-portfolio/)
template by [Start Bootstrap](http://startbootstrap.com/).

See the site in action at https://www.phoxygen.com

## Dev workflow

### Local install

Prerequisite:

- install ruby >= 2.1
- install bundler

```bash
gem install bundler
```

A GemFile to use with bundler is provided.

```bash
bundle install
```

```bash
jekyll serve
```

### I don't want to corrupt my system with ruby and gems

Wise of you. We got you covered here: you can use docker.

#### The easy-way: docker-compose

In the root of the repo,

```bash
docker-compose up
```

will start the server on port 4000. This is strictly equivalent to using `jekyll
serve` (so it listens to your local change etc).

Edit `docker-compose.yml` to change settings if the defaults do not suit you.

#### I don't want to use docker-compose

It is strictly equivalent to these docker command (so why not using it?).

```bash
# run this once
docker pull grahamc/jekyll:latest
# run this every time you want to start the server
docker run -i -p 4000:4000 -v <absolute-path-to-project>:/src \
grahamc/jekyll:latest serve -H 0.0.0.0
```

**Protip:** 

The entrypoint of the Dockerfile is `jekyll`. So you can alias `docker run -i -p
4000:4000 -v <absolute-path-to-project>:/src grahamc/jekyll:latest` to
`my-jekyll-alias` and use it just as you would use a local jekyll install:

```bash
my-jekyll-alias serve -H 0.0.0.0
```
