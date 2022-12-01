# TensorFlow GPU Jupyter with OpenCV2 and other requirements

A small collections of scripts to build and run a development environment based on the official [TensorFlow Docker Container](https://www.tensorflow.org/install/docker)

</br>

## Description

### build_image.sh
Building an image

#### Usage:
    
    sh build_image.sh

#### Options:
- -h Print Help
- -n Set image name (DEFAULT: tf-latest-gpu-jupyter-cv2:latest)

</br>

### run_shell.sh
Run a container and jump right into the shell

#### Usage:
    
    sh run_shell.sh

#### Options:
- h Print Help
- n Image name (DEFAULT: tf-latest-gpu-jupyter-cv2:latest)
- v Video Source (DEFAULT: /dev/video0)
- w Workspace Path (e.g. /home/user/workspace/AI, needs to be absolute path)

</br>

### run_jupyter.sh
Run a container and jump right into the shell

#### Usage:
    
    sh run_jupyter.sh

#### Options:
- h Print Help
- n Image name (DEFAULT: tf-latest-gpu-jupyter-cv2:latest)
- p Host Port to be mapped to 8888 of the container (DEFAULT: 8888)

</br>

## Notes
- The final image takes about 9GB of disk space.

- The scripts are losely based on the follwing sources:
    - https://sinistercode.com/public/donnie/blog/tensorflow-gpu-jupiter
    - https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
    - https://docs.docker.com/language/python/build-images/