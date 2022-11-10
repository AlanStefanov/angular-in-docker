**Nginx for Angular compiled**
--------
**_Set Dockerfile:_**

In line 3 "COPY", choose the corresponding directory for dist. Ex: ./dist/my-site

---------

**_Configure deploy.sh:_**

Configure project name: EX docker build -t my_site .

Choose the port that we will expose and configure it after the -dp, example 8080:80.
