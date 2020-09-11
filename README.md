### wishmay-postgres

This image overrides the defacto/standard postgres image available at docker hub with custom settings for 
only wishmay project. 

To quickly run this image, issue following command

`docker run -v /postgres:/var/lib/postgresql/data -p 5432:5432 -td rihenperry/wishmay-postgres
`

To build the image, run the following command

`
docker build --no-cache -t wishmay-postgres \
--build-arg POSTGRES_USER=<username>\
--build-arg POSTGRES_PASSWORD=<pwd>\
--build-arg WISHMAY_USER=<user>\
--build-arg WISHMAY_USER_PWD=<mypwd>\
--build-arg WISHMAY_DB=<dbname>\
.
`

After successful build, start the container with the following command. Create a external storage
directory and map it to the volume inside docker.

`
docker run --name wishmay-postgres -e POSTGRES_PASSWORD=<pwd>-v /postgres:/var/lib/postgresql/data -p 5432:5432 -td wishmay-postgres:latest
`
