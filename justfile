image := "anypot/just"
tag := "1.37.0-r0"

alias b := build
alias p := push
alias r := run
alias t := tags
alias rm :=remove
alias v := version

default:
  @just --list

build tag=tag:
  sudo docker build --build-arg version={{tag}} -t {{image}}:{{tag}} .

push tag=tag:
  sudo docker push {{image}}:{{tag}}

run cmd="default" tag=tag:
  sudo docker run --rm -v $(pwd):/tmp {{image}}:{{tag}} {{cmd}}

tags:
  sudo docker image ls {{image}}

remove tag=tag:
  sudo docker image rm {{image}}:{{tag}}

version tag=tag:
  sudo docker run --rm -v $(pwd):/tmp {{image}}:{{tag}} "--version"
