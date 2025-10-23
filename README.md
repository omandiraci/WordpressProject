# WordPress Docker Projesi

Bu proje, Docker kullanarak WordPress, Nginx, PHP-FPM, MariaDB ve phpMyAdmin içeren tam bir WordPress geliştirme ortamı sağlar.

## 🚀 Özellikler

- **WordPress**: En son WordPress sürümü
- **Nginx**: Yüksek performanslı web sunucusu
- **PHP 8.1-FPM**: PHP-FPM ile optimize edilmiş PHP
- **MariaDB 10.6**: Güvenilir veritabanı
- **phpMyAdmin**: Veritabanı yönetimi
- **Portainer**: Docker yönetimi
- **SSL Desteği**: HTTPS yapılandırması hazır

## 📋 Gereksinimler

- Docker
- Docker Compose
- En az 2GB RAM
- En az 5GB disk alanı

## 🛠️ Kurulum

### 1. Projeyi Klonlayın

```bash
git clone <repository-url>
cd DockerwordpressPublicProject
```

### 2. Environment Dosyasını Oluşturun

```bash
cp wordpress.env.example wordpress.env
```

### 3. Environment Dosyasını Düzenleyin

`wordpress.env` dosyasını açın ve aşağıdaki değerleri değiştirin:

- **Güçlü şifreler** oluşturun
- **WordPress Security Keys** oluşturmak için: https://api.wordpress.org/secret-key/1.1/salt/
- **ÖNEMLİ**: Security keys'teki `$` karakterlerini `$$` ile değiştirin (Docker Compose uyumluluğu için)

### 4. Container'ları Başlatın

```bash
docker-compose -f docker-compose-aws-env.yml up -d
```

### 5. WordPress Kurulumunu Tamamlayın

1. Tarayıcınızda `http://localhost:8081` adresine gidin
2. WordPress kurulum sihirbazını takip edin
3. Veritabanı bilgileri:
   - **Veritabanı Adı**: `wordpress_db`
   - **Kullanıcı Adı**: `wordpress_user`
   - **Şifre**: `wordpress.env` dosyasındaki şifre
   - **Veritabanı Sunucusu**: `db`
   - **Tablo Öneki**: `wp_`

## 🌐 Erişim Bilgileri

| Servis | URL | Açıklama |
|--------|-----|----------|
| WordPress | http://localhost:8081 | Ana WordPress sitesi |
| phpMyAdmin | http://localhost:8082 | Veritabanı yönetimi |
| Portainer | http://localhost:9443 | Docker yönetimi |

## 📁 Proje Yapısı

```
├── docker-compose-aws-env.yml    # Ana Docker Compose dosyası
├── Dockerfile                    # Nginx imajı için Dockerfile
├── php.Dockerfile               # PHP-FPM imajı için Dockerfile
├── nginx.conf                   # Nginx yapılandırması
├── wordpress.env.example        # Örnek environment dosyası
├── wordpress/                   # WordPress dosyaları
├── mysql-data/                  # Veritabanı verileri (gitignore)
├── nginx-logs/                  # Nginx logları (gitignore)
└── ssl/                         # SSL sertifikaları (gitignore)
```

## 🔧 Yönetim Komutları

### Container'ları Başlatma
```bash
docker-compose -f docker-compose-aws-env.yml up -d
```

### Container'ları Durdurma
```bash
docker-compose -f docker-compose-aws-env.yml down
```

### Logları Görüntüleme
```bash
docker-compose -f docker-compose-aws-env.yml logs
```

### Belirli Bir Servisin Logları
```bash
docker-compose -f docker-compose-aws-env.yml logs nginx
```

### Container'ları Yeniden Başlatma
```bash
docker-compose -f docker-compose-aws-env.yml restart
```

## 🔒 Güvenlik

- **Güçlü şifreler** kullanın
- **WordPress Security Keys** oluşturun
- **SSL sertifikaları** ekleyin (production için)
- **Firewall** yapılandırması yapın
- **Düzenli güncellemeler** yapın

## 🚀 Production Deployment

Production ortamı için:

1. **SSL sertifikaları** ekleyin
2. **Güçlü şifreler** kullanın
3. **Firewall** yapılandırması yapın
4. **Backup stratejisi** oluşturun
5. **Monitoring** ekleyin

## 🐛 Sorun Giderme

### WordPress Kurulum Sayfası Gelmiyor
```bash
# wp-config.php dosyasını silin
rm wordpress/wp-config.php

# Veritabanını temizleyin
docker-compose -f docker-compose-aws-env.yml exec db mysql -u wordpress_user -p -e "DROP DATABASE IF EXISTS wordpress_db; CREATE DATABASE wordpress_db;"
```

### Container'lar Başlamıyor
```bash
# Logları kontrol edin
docker-compose -f docker-compose-aws-env.yml logs

# Port çakışması kontrol edin
netstat -tulpn | grep :8081
```

## 📝 Lisans

Bu proje MIT lisansı altında lisanslanmıştır.

## 🤝 Katkıda Bulunma

1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Commit yapın (`git commit -m 'Add amazing feature'`)
4. Push yapın (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## 📞 Destek

Sorunlarınız için GitHub Issues kullanın.