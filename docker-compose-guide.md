# Docker Compose Dosyası Detaylı Açıklama

## 1. Servisler (Services)
Her bir servis bir container olarak çalışır.

### 1.1. NGINX Servisi
```yaml
nginx:
  image: nginx:alpine        # DockerHub'dan Alpine tabanlı nginx imajını kullanır
  ports:
    - "8081:80"             # Host:Container port mapping
  volumes:                   # Dosya ve dizin bağlantıları
    - ./wordpress:/var/www/html                         # WordPress dosyaları
    - ./nginx.conf:/etc/nginx/conf.d/default.conf       # NGINX yapılandırması
    - ./nginx-logs:/var/log/nginx                       # Log dosyaları
    - ./nginx/security-headers.conf:/etc/nginx/security-headers.conf  # Güvenlik başlıkları
  depends_on:               # Bağımlılıklar
    - php
    - db
  networks:
    - wordpress-network     # Kullanılacak network
```

### 1.2. PHP Servisi
```yaml
php:
  build:                    # Özel Dockerfile kullanımı
    context: .
    dockerfile: php.Dockerfile
  volumes:
    - ./wordpress:/var/www/html    # WordPress dosyaları
    - ./php-errors:/var/log        # PHP hata logları
  environment:                      # Ortam değişkenleri
    - WORDPRESS_DB_HOST=db
    - WORDPRESS_DB_USER=wordpress_user
    - WORDPRESS_DB_PASSWORD=wordpress_password
    - WORDPRESS_DB_NAME=wordpress_db
```

### 1.3. MariaDB (Database) Servisi
```yaml
db:
  image: mariadb:10.6           # MariaDB imajı
  container_name: mariadb
  environment:                   # Veritabanı ayarları
    MYSQL_ROOT_PASSWORD: root_password
    MYSQL_DATABASE: wordpress_db
    MYSQL_USER: wordpress_user
    MYSQL_PASSWORD: 'wordpress_password'
  volumes:
    - ./mysql-data:/var/lib/mysql  # Veritabanı kalıcı depolama
```

### 1.4. Portainer Servisi
```yaml
portainer:
  image: portainer/portainer-ce:latest
  container_name: portainer
  restart: unless-stopped         # Container çöktüğünde otomatik yeniden başlat
  security_opt:
    - no-new-privileges:true      # Güvenlik ayarı
  volumes:
    - /etc/localtime:/etc/localtime:ro           # Sistem saati senkronizasyonu
    - /var/run/docker.sock:/var/run/docker.sock:ro  # Docker API erişimi
    - ./portainer-data:/data                        # Portainer verileri
  ports:
    - "9443:9443"    # HTTPS UI portu
    - "8000:8000"    # Edge agent portu
```

## 2. Networks (Ağlar)
```yaml
networks:
   wordpress-network:
    driver: bridge    # Container'lar arası iletişim için bridge network
```

## Kullanım Kılavuzu:

1. Servisleri başlatma:
```bash
docker-compose up -d
```

2. Servisleri durdurma:
```bash
docker-compose down
```

3. Logları görüntüleme:
```bash
docker-compose logs [servis-adı]
```

4. Servis yeniden başlatma:
```bash
docker-compose restart [servis-adı]
```

5. Yapılandırma değişikliklerini uygulama:
```bash
docker-compose up -d --build
```

## Önemli Portlar:
- WordPress: http://localhost:8081
- Portainer: https://localhost:9443

## Veri Dizinleri:
- WordPress dosyaları: ./wordpress/
- Veritabanı: ./mysql-data/
- NGINX logları: ./nginx-logs/
- PHP hata logları: ./php-errors/
- Portainer verileri: ./portainer-data/

## Güvenlik Notları:
1. Hassas bilgileri (şifreler, API anahtarları) environment dosyasında saklayın
2. Production ortamında güçlü şifreler kullanın
3. Portainer admin şifresini güvenli şekilde saklayın
4. Regular backup almayı unutmayın
