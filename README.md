# Docker Nginx

[![](https://images.microbadger.com/badges/image/turgon37/nginx.svg)](https://microbadger.com/images/turgon37/nginx "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/turgon37/nginx.svg)](https://microbadger.com/images/turgon37/nginx "Get your own version badge on microbadger.com")

This images contains an instance of Nginx and a base template for a secure configuration.
This image use the concept of site-available and site-enable to make the configuration of  virtual hosts more flexible.

Please notice that if it's the first time the container is run, the DH parameters file will be generated and this can take a long time.

Nginx is configured according to the recommandations on this [site](https://weakdh.org/sysadmin.html)

It is not intended to be used directly but to be extend for building another nginx image with contains your virtual hosts configurations.

## Docker Informations

* This image expose the following port

| Port           | Usage                |
| -------------- | -------------------- |
| 80             | HTTP web application |
| 443            | HTTP web application |

 * This image takes theses environnements variables as parameters

| Environment | Usage                                                                          |
| ----------- | ---------------                          ------------------------------------- |
| ENABLE_HTTPS| Set to yes to enable docker https features. Set to no to speed up the first run|
| NGINX_USER  | The user that nginx worker will use                                            |
| NGINX_GROUP | The group that nginx worker will use                                           |

 * The following volume is exposed by this image

| Volume         | Usage                                               |
| -------------- | --------------------------------------------------- |
| /etc/nginx/ssl | The default path where all TLS/SSL crypto files will be put |

## Installation

* Manual build from sources

```
git clone
docker build -t turgon37/nginx .
```

* or Automatic pull from hub

```
docker pull turgon37/nginx
```


## Usage

Use it as a base for your own nginx images.

This image contains two folder, /etc/nginx/sites-available and /etc/nginx/sites-enabled. In the first you can put a file per virtual host, each of them will contains the nginx directives. Then, you must create a symbolik link into the sites-enabled for each virtual host you want to enable.
Take care that the path the symlink must be either relative or absolute from the docker root directory. I recommands you to use a relative one by using a command like this from the sites-available folder :
```ln -s ../sites-available/php```

As an example you can create a project folder which contain the two folder sites-available and sites-enabled. Then, you just have to create a dockerfile which encapsulate this image.


```
FROM turgon37/nginx

# copy local files
COPY sites-available/ /etc/nginx/sites-available
COPY sites-enabled/ /etc/nginx/sites-enabled
```

Or another way can be to use a host mount point

```
docker run
   -v $(pwd)/sites-enabled:/etc/nginx/sites-enabled:ro 
   -v $(pwd)/sites-available:/etc/nginx/sites-available:ro 
   -p 80:80
   turgon37/nginx