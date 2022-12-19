#!/bin/sh

print_usage() {
   echo "How to build the image:"
   echo
   echo "Syntax: build_image [-h|n]"
   echo "options:"
   echo "-h      Print this Help"
   echo "-n      Image name (DEFAULT: tf-latest-gpu-jupyter-cv2:latest)"
   echo
}


image_name="tf-latest-gpu-jupyter-cv2-edge_tpu:latest"


while getopts ":hn:v:w:" option; do
   case $option in
      h)
         print_usage
         exit;;
      n)
         image_name=$OPTARG;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done


docker build -t $image_name .
