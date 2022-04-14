1. Запустить скрипт alpbuilder.sh. В результате должен скачаться образ Ubuntu 16.04, установяться необходимые пакеты.
На выходе получится образ с назаванием alpental/builder16:1.1
2. Запустить докер с указанным image (alpental/builder16:1.1). При запуске нужно примонтировать директорию с исходниками андроида
Пример команды: docker run -it -v /path/to/direcrory:/home/path/to/directory alpental/builder16:1.1
3. После первого запуска контайнера будет установлен тулчейн и окружение.
4. Далее необходимо сделать коммит контайнера (docker commit [CONTAINER_ID] [new_image_name]). CONTAINER_ID можно посмотреть используя docker ps -a
5. Для сборки андроида можно использовать скрипт android_build.sh. Для справки вызвать android_build.sh -h.
