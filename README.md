# Docker PHP for deploy

**Usage in Dockerfile:**
```Dockerfile
FROM makvik/php-7.4-deploy:latest
CMD ["php-fpm"]
```

**Usage in GitLabCI:**
```yml
image: makvik/php-7.4-deploy:latest
```

**Full Example usage in a GitLabCI:**
 - Example .gitlab-ci.yml.example

**Composition**
1. Php 7.4
	- Soap
	- Exif
	- GD
	- Imagick
2. Composer - 1.10.10
3. Node.js|Npm - 14
4. Python - 2.7
5. Rsync - 3.1.3
6. Chromium - https://github.com/pocketjoso/penthouse
