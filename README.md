# Chef GPT Mobil Uygulaması

Chef GPT, Ollama Mistral modelini Python ile entegre ederek, kullanıcıdan aldığı malzemelerle otomatik ve detaylı yemek tarifleri üreten bir yapay zekâ uygulamasıdır. Proje, hem masaüstünde hem de Flutter ile mobil cihazlarda çalışacak şekilde geliştirilmiştir.

## Kullanılan Teknolojiler

- Python (backend ve LLM entegrasyonu)
- Ollama Mistral LLM modeli
- Flutter (mobil arayüz)
- REST API ile iletişim

---

## Kurulum ve Çalıştırma

1. Ollama Mistral modelini indirip çalıştırın.
    ![mistral_model_sayfasi.png](mistral_model_sayfasi.png)
    **Şekil 1. Ollama Mistral modelinin arayüzü**

2. Sunucuyu başlatın ve terminalden modelin yüklendiğine dair logları kontrol edin.
    ![konsol_ve_log_ekrani.png](konsol_ve_log_ekrani.png)
    **Şekil 2. Mistral modelinin başlatılması ve terminal logları**

3. Proje dosya yapısı ve temel kodlar.
    ![proje_klasor_yapisi.png](proje_klasor_yapisi.png)
    **Şekil 3. Chef GPT projesinin dosya dizini**

---

## Mobil Uygulama Akışı

### Açılış Ekranı

![yukleniyor_ekrani.png](yukleniyor_ekrani.png)
**Şekil 4. Chef GPT Mobil Uygulaması Açılış Ekranı (Splash Screen)**
> Uygulama başlatıldığında kullanıcıyı karşılayan sade açılış ekranı. Ortada bir aşçı simgesiyle uygulamanın yüklenme süreci görselleştirilir.

### Ana Ekran ve Kullanıcı Etkileşimi

Boş ekran ve girdi alanı:
![ana_ekran.png](ana_ekran.png)
**Şekil 5. Chef GPT Ana Ekranı (Boş Durum)**
> Kullanıcı, “Malzemeleri yaz...” alanına tarif için gerekli malzemeleri girer.

![ana_ekran.png](ana_ekran.png)
**Şekil 6. Chef GPT Ana Ekranı - Emulator Görünümü**
> Uygulama emulator üzerinde çalışırken ana ekranın görünümü.

### Tarif Yanıtı

Kullanıcı bir malzeme girişi yaptığında (örneğin “pirinç, süt”), modelden gelen otomatik tarif ve adımlar ekranda görünür:
![tarif_ekrani.png](tarif_ekrani.png)
**Şekil 7. Otomatik Tarif Yanıtı (pirinç, süt için)**
> Kullanıcıdan alınan malzemelere karşılık Ollama Mistral modeli ile otomatik oluşturulan yemek tarifi ve pişirme adımlarının mobil uygulama ekranında gösterimi.

Başka bir örnek:
![tarif_ekrani_elma.png](tarif_ekrani_elma.png)
**Şekil 8. Otomatik Tarif Yanıtı (elma için)**
> Kullanıcı “elma” girdisiyle, modelden gelen “Elma Salatası” tarifinin ve adım adım hazırlama yönergelerinin ekranda gösterimi.

---

## Koddan Görüntüler

Ana dosyada uygulama yapısı:
![main_dart_kod_ekrani.png](main_dart_kod_ekrani.png)
**Şekil 9. main.dart dosyasından uygulama yapısı**

Sunucu bağlantısı için IP adresi ayar dosyası:
![config_dart_kod_ekrani.png](config_dart_kod_ekrani.png)
**Şekil 10. config.dart dosyası (Server IP ayarı)**

---

## Uygulama Çalışma Ortamı (Tüm Süreç)

![ide_konsol_uygulama_ekrani.png](ide_konsol_uygulama_ekrani.png)
**Şekil 11. Kod, Sunucu ve Mobil Uygulamanın Birlikte Çalıştığı Ortam**
> Visual Studio Code ekranı, Ollama sunucusunun terminal logları ve mobil uygulamanın çalıştığı emülatör aynı anda gösterilmektedir. Uygulamanın farklı ortam ve cihazlarda stabil şekilde çalıştığını gösterir.

---

## Sonuç

Chef GPT projesi, farklı bilgisayarlarda ve mobil cihazlarda kolayca çalışabilen, kullanıcıya otomatik yemek tarifleri sunan bir yapay zekâ uygulamasıdır.  
Proje, LLM modellerinin lokal ortamda Python ile entegrasyonu, prompt mühendisliği ve taşınabilir yazılım geliştirme konularında önemli deneyimler kazandırmıştır.

---
