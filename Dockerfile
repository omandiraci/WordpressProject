# 1. Küçük ve hafif bir Nginx tabanlı imaj kullanıyoruz
FROM nginx:alpine

# 2. Gerekli araçları kur (curl, tar)
RUN apk add --no-cache curl tar

# 3. WordPress’in en son sürümünü indir
RUN curl -o /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz

# 4. İndirilen WordPress arşivini aç
RUN tar -xzf /tmp/wordpress.tar.gz -C /tmp

# 5. WordPress dosyalarını Nginx klasörüne kopyala
RUN mkdir -p /var/www/html && cp -r /tmp/wordpress/* /var/www/html/

# 6. Dosya izinlerini düzelt
RUN chown -R nginx:nginx /var/www/html

# 7. Gerekli portları aç
EXPOSE 8081

# 8. Container başlatıldığında Nginx çalışsın
CMD ["nginx", "-g", "daemon off;"]
