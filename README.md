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
    ![image1](image1)
    **Şekil 1. Ollama Mistral modelinin arayüzü**

2. Sunucuyu başlatın ve terminalden modelin yüklendiğine dair logları kontrol edin.
    ![image2](image2)
    **Şekil 2. Mistral modelinin başlatılması ve terminal logları**

3. Proje dosya yapısı ve temel kodlar.
    ![image3](image3)
    **Şekil 3. Chef GPT projesinin dosya dizini**

---

## Mobil Uygulama Akışı

### Açılış Ekranı

![image4](image4)
**Şekil 4. Chef GPT Mobil Uygulaması Açılış Ekranı (Splash Screen)**
> Uygulama başlatıldığında kullanıcıyı karşılayan sade açılış ekranı. Ortada bir aşçı simgesiyle uygulamanın yüklenme süreci görselleştirilir.

### Ana Ekran ve Kullanıcı Etkileşimi

Boş ekran ve girdi alanı:
![image5](image5)
**Şekil 5. Chef GPT Ana Ekranı (Boş Durum)**
> Kullanıcı, “Malzemeleri yaz...” alanına tarif için gerekli malzemeleri girer.

![image6](image6)
**Şekil 6. Chef GPT Ana Ekranı - Emulator Görünümü**
> Uygulama emulator üzerinde çalışırken ana ekranın görünümü.

### Tarif Yanıtı

Kullanıcı bir malzeme girişi yaptığında (örneğin “pirinç, süt”), modelden gelen otomatik tarif ve adımlar ekranda görünür:
![image7](image7)
**Şekil 7. Otomatik Tarif Yanıtı (pirinç, süt için)**
> Kullanıcıdan alınan malzemelere karşılık Ollama Mistral modeli ile otomatik oluşturulan yemek tarifi ve pişirme adımlarının mobil uygulama ekranında gösterimi.

Başka bir örnek:
![image8](image8)
**Şekil 8. Otomatik Tarif Yanıtı (elma için)**
> Kullanıcı “elma” girdisiyle, modelden gelen “Elma Salatası” tarifinin ve adım adım hazırlama yönergelerinin ekranda gösterimi.

---

## Koddan Görüntüler

Ana dosyada uygulama yapısı:
![image9](image9)
**Şekil 9. main.dart dosyasından uygulama yapısı**

Sunucu bağlantısı için IP adresi ayar dosyası:
![image10](image10)
**Şekil 10. config.dart dosyası (Server IP ayarı)**

---

## Uygulama Çalışma Ortamı (Tüm Süreç)

![image11](image11)
**Şekil 11. Kod, Sunucu ve Mobil Uygulamanın Birlikte Çalıştığı Ortam**
> Visual Studio Code ekranı, Ollama sunucusunun terminal logları ve mobil uygulamanın çalıştığı emülatör aynı anda gösterilmektedir. Uygulamanın farklı ortam ve cihazlarda stabil şekilde çalıştığını gösterir.

---

## Sonuç

Chef GPT projesi, farklı bilgisayarlarda ve mobil cihazlarda kolayca çalışabilen, kullanıcıya otomatik yemek tarifleri sunan bir yapay zekâ uygulamasıdır.  
Proje, LLM modellerinin lokal ortamda Python ile entegrasyonu, prompt mühendisliği ve taşınabilir yazılım geliştirme konularında önemli deneyimler kazandırmıştır.

---

