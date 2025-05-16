# WordPress Docker Projesi

Bu proje, Docker tabanlı bir WordPress geliştirme ortamı içerir ve aşağıdaki servisleri kapsar:

- WordPress (İçerik Yönetim Sistemi)
- MariaDB (Veritabanı)
- Nginx (Web Sunucusu)
- PHP-FPM (PHP Yorumlayıcı)
- FTP Sunucusu (Dosya Transfer Protokolü)
- Portainer (Docker Yönetim Arayüzü)

## Gereksinimler

Projeyi çalıştırmak için aşağıdaki yazılımların bilgisayarınızda kurulu olması gerekmektedir:

- Docker
- Docker Compose

## Kurulum Adımları

1. Projeyi bilgisayarınıza klonlayın:
```bash
git clone https://github.com/omandiraci/AlpineWordpressProject.git
```

2. Proje dizinine gidin ve konteynerleri başlatın:
```bash
docker-compose up -d
```

## Servisler ve Portlar

Kurulum tamamlandıktan sonra aşağıdaki adresleri kullanarak servislere erişebilirsiniz:

- WordPress: http://localhost:8081
- Portainer: https://localhost:9443
- FTP Sunucusu: Port 2121

## Ortam Değişkenleri

Tüm ortam değişkenleri `docker-compose.yml` dosyasında tanımlanmıştır. Gerekli değişiklikleri bu dosya üzerinden yapabilirsiniz.

## Alpine Kullanımı

Bu proje, Alpine tabanlı Docker imajlarını kullanmaktadır. Alpine imajları, daha hafif ve güvenli bir yapı sunar. Aşağıdaki servisler Alpine tabanlıdır:

- Nginx: `nginx:alpine`
- PHP-FPM: `php:8.1-fpm-alpine`
- MariaDB: `mariadb:10.6-alpine`

## Katkıda Bulunma

1. Bu depoyu forklayın
2. Yeni bir özellik branch'i oluşturun (`git checkout -b yeni-ozellik`)
3. Değişikliklerinizi commit edin (`git commit -am 'Yeni özellik eklendi'`)
4. Branch'inizi push edin (`git push origin yeni-ozellik`)
5. Pull Request oluşturun
