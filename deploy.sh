docker build -t web-client .
docker run -it -dp 4200:80 --name web-client web-client                  
