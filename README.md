# bridges-docker

1. Install docker
2. Verify install with `docker run hello-world`
3. Pull the debian image with `docker pull debian`
    * Verify the image is good with `docker run -it debian`
        * The `-it` just tells the container to allocate a pseudo-tty and to be interactive
        * You could run any image with the same command, just substituting the `debian`
        * Adding a --name parameter allows you to name the resulting container, for easier access later
        * To leave the container just run `exit`
4. `cd` to the directory with your Dockerfile or put it in your current working directory
5. Build the bridges image with `docker build -t bridges_debian .`
    * The `-t` flag just gives the resulting image the name `bridges_debian`, not required, but makes running it easier
    * The last argument is a directory that contains your Dockerfile, meaning you don't actually have to run `docker build` in the same directory
6. Assuming no errors, spin up a container of the `docker run -it --name bridges bridges_debian`
    * To ensure the image is functional, run:
      1. `cd example_project`
      2. `make`
      3. `./main`
    * Hopefully you should be able to compile and run the bridges program, which does not have any credentials plugged in, so you should end up with an error message about that
7. To copy files out of the container run `docker cp CONTAINER:SOURCE_DIR/FILE TARGET DIR`
   * Example: if you want to copy the example Makefile out you would run:  
   `docker cp bridges:bridges/example_project/Makefile .`   
   which would copy the Makefile into your current directory. 
   * This works the same way for directories.
8. To reuse a container, you must start it with `docker start CONTAINER_NAME`, or in our case `docker start bridges`.
9. To run the container, run `docker exec -it bridges bash`.
