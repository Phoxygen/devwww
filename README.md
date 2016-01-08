# Phoxygen Website

This is the official Phoxygen website.

We started from the Jekyll implementation of the [Stylish
Portfolio](http://startbootstrap.com/template-overviews/stylish-portfolio/)
template by [Start Bootstrap](http://startbootstrap.com/).

See the site in action at https://www.phoxygen.com/

## Dev Workflow

The website can be accessed on http://localhost:4000/

You can either install the dependencies manually or use the Docker recipe.

### Manual Install

Prerequisite:

- Ruby 2.1.0 or later
- bundler

```bash
gem install bundler
bundle install
# jekyll serve
bundle exec jekyll serve --watch
```

### With Docker

You can let docker deal with the ruby gems.

**/!\ Make sure your Docker client points to a local Docker daemon.**
These steps are not suitable for a remote docker instance.

The easiest way to do so is to check what’s inside the DOCKER_HOST environment variable.

#### The Easy Way: docker-compose

At the root of the repository:

```bash
docker-compose up
```

builds a docker image if not already done and starts the server on port 4000.
This is strictly equivalent to using `jekyll serve` (i.e. it listens to your local
changes, etc.).

Edit `docker-compose.yml` to change settings if the defaults do not suit your needs.

#### Without docker-compose

These docker commands are strictly equivalent to the `docker-compose up` above.

```bash
# run this once
docker build -t <my-tag>

# run this every time you want to start the server
docker run -i -p 4000:4000 -v <absolute-path-to-project>:/home/user/src \
<my-tag> serve -H 0.0.0.0
```

**Pro tip:**

The entry point of the Dockerfile is `jekyll`. So you can alias `docker run -i -p
4000:4000 -v <absolute-path-to-project>:/src grahamc/jekyll:latest` to
`my-jekyll-alias` and use it just as you would use a local jekyll install:

```bash
my-jekyll-alias serve -H 0.0.0.0
```
