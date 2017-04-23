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

| Environment     | Usage                                                                           |
| --------------- | ---------------                          -------------------------------------- |
| ENABLE_HTTPS    | Set to yes to enable docker https features. Set to no to speed up the first run |

 * The following volume is exposed by this image

| Volume         | Usage                                               |
| -------------- | --------------------------------------------------- |
| /etc/nginx/ssl | The default path where all TLS/SSL crypto files will be put |

## Installation

* Manual

```
git clone
docker build -t turgon37/nginx .
```

* or Automatic

```
docker pull turgon37/nginx
```


## Usage

Use it as a base for your nginx image

```
FROM turgon37/nginx
```
