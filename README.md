# Phoxygen Website

This is the Phoxygen official website.

We started from the jekyll implementation of the [Stylish
Portfolio](http://startbootstrap.com/template-overviews/stylish-portfolio/)
template by [Start Bootstrap](http://startbootstrap.com/).

See the site in action at https://www.phoxygen.com

## Dev Workflow

You can manually install stuffs, or you can use the Docker recipe.

### Manual Install

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

### With Docker

You don’t need to install ruby and gems. You can use docker for the same effect.

**/!\ Make sure your Docker client points to a local Docker daemon!!** These
steps are not suitable for a remote docker instance.

The easiest way to do so is to check what’s inside the DOCKER_HOST env variable.

#### The Easy Way: docker-compose

In the root of the repo,

```bash
docker-compose up
```

will build a docker image if not already done and start the server on port 4000.
This is strictly equivalent to using `jekyll serve` (so it listens to your local
change etc).

Edit `docker-compose.yml` to change settings if the defaults do not suit you.

#### I Don't Want To Use docker-compose

It is strictly equivalent to these docker command (so why not using it?).

```bash
# run this once
docker build -t <my-tag>
# run this every time you want to start the server
docker run -i -p 4000:4000 -v <absolute-path-to-project>:/home/user/src \
<my-tag> serve -H 0.0.0.0
```

**Protip:** 

The entrypoint of the Dockerfile is `jekyll`. So you can alias `docker run -i -p
4000:4000 -v <absolute-path-to-project>:/src grahamc/jekyll:latest` to
`my-jekyll-alias` and use it just as you would use a local jekyll install:

```bash
my-jekyll-alias serve -H 0.0.0.0
```
