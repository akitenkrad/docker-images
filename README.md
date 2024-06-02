# Quick reference
- docker environments for ubuntu with python on amd64/arm64/gpu/cpu

# Supported tags
- akitenkrad/python.cpu:latest
- akitenkrad/python.cpu.amd64:latest
- akitenkrad/python.cpu.arm64:latest
- akitenkrad/python.gpu:latest

# Python Environment
- miniconda (python 3.12)

# Docker Compose

```yaml
services:
  python:
    container_name: 'python.cpu'
    image: akitenkrad/python.cpu:latest
    user: root
    tty: true
    volumes:
      - ./:/workplace
    environment:
      TZ: Asia/Tokyo
    working_dir: /workplace
```
