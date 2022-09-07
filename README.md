<img alt="Docker Cloud Build Status" src="https://img.shields.io/docker/cloud/build/akitenkrad/python.cpu?style=for-the-badge"> <img alt="GitHub" src="https://img.shields.io/github/license/akitenkrad/docker-python?style=for-the-badge">

# Quick reference
- docker environments for python

# Supported tags
- python.cpu:latest
- python.gpu:latest

# Python Environment
- pipenv

# How to use

## for cpu environment

edit docker-compose.yml

```yaml
version: '3'
services:
  python:
    container_name: 'python.cpu'
    image: akitenkrad/python.cpu:latest
    platform: linux/amd64 # for Apple Mac M1
    user: root
    tty: true
    volumes:
      - ./:/workplace:cached
    environment:
      TZ: Asia/Tokyo
    working_dir: /workplace
```

## for gpu environment

edit docker-compose.yml

```yaml
version: '2.3'
services:
  python:
    container_name: 'python.gpu'
    image: akitenkrad/python.gpu:latest
    platform: linux/amd64 # for Apple Mac M1
    user: root
    tty: true
    volumes:
      - ./:/workplace:cached
    runtime: nvidia 
    environment:
      TZ: Asia/Tokyo
      NVIDIA_VISIBLE_DEVICES: all
      NVIDIA_DRIVER_CAPABILITIES: all
    working_dir: /workplace
```

