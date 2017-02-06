# Docker Nginx



This images contains an instance of Nginx and a base template for a secure configuration.
This image use the concept of site-available and site-enable to make the configuration of  virtual hosts more flexible.

Nginx is configured according to the recommandation this [site](https://weakdh.org/sysadmin.html)

It is not intended to be used directly but to be extend for building another nginx image with contains your virtual hosts configurations.

## Docker Informations

* This image expose the following port

| Port           | Usage                |
| -------------- | -------------------- |
| 80             | HTTP web application |
| 443            | HTTP web application |

 * This image takes theses environnements variables as parameters

| Environment        | Usage           |
| -------------      | --------------- |

 * The following volume is exposed by this image

| Volume         | Usage                                               |
| -------------- | --------------------------------------------------- |
| /etc/nginx/ssl | The path where all TLS/SSL crypto files will be put |

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
