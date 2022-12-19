#!/bin/sh

print_usage() {
   echo "How to start the jupyter server:"
   echo
   echo "Syntax: run_jupyter.sh [-h|n|p]"
   echo "options:"
   echo "-h      Print this Help"
   echo "-n      Image name (DEFAULT: tf-latest-gpu-jupyter-cv2:latest)"
   echo "-p      Host Port to be mapped to 8888 of the container (DEFAULT: 8888)"
   echo
}


image_name="tf-latest-gpu-jupyter-cv2:latest"

host_port=8888


while getopts ":hn:p:" option; do
   case $option in
      h)
         print_usage
         exit;;
      n)
         image_name=$OPTARG;;
      p)
         host_port=$OPTARG;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done


docker run --rm -it \
    -e PYTHONUNBUFFERED=1 \
    -p $host_port:8888 \
    $image_name
