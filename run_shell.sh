#!/bin/sh

print_usage() {
   echo "How to start the container:"
   echo
   echo "Syntax: run_shell [-h|i|v|w]"
   echo "options:"
   echo "-h      Print this Help"
   echo "-n      Image name (DEFAULT: tf-latest-gpu-jupyter-cv2:latest)"
   echo "-v      Video Source (DEFAULT: /dev/video0)"
   echo "-w      Workspace Path (e.g. /home/user/workspace/AI, needs to be absolute path)"
   echo
}


image_name="tf-latest-gpu-jupyter-cv2:latest"
video_source="/dev/video0"
workspace_path="./"


while getopts ":hn:v:w:" option; do
   case $option in
      h)
         print_usage
         exit;;
      n)
         image_name=$OPTARG;;
      v)
         video_source=$OPTARG;;
      w)
         workspace_path=$OPTARG;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done


# todo: run in user mode
#    --user $(id -u) \
docker run --rm -it \
    --gpus=all \
    --device=$video_source:/dev/video0 \
    -e DISPLAY=$DISPLAY \
    -e PYTHONUNBUFFERED=1 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $workspace_path:/home/user/workspace \
    --net=host \
    $image_name \
    /bin/bash
