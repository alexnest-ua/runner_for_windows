# Опис runner_for_windows

runner.sh - ПОВНІСТЮ АВТООНОВЛЮВАНИЙ (оновлює цілі та себе) bash-скрипт для Windows-машин, що керує [mhddos_proxy](https://github.com/porthole-ascend-cinnamon/mhddos_proxy_releases)  
Також скрипт імітує роботу людини (вимикає увесь ДДоС на 1-2 (рандомно) хвилин), щоб дати машині трохи відпочити
  
[**Варіант для Mac**](https://github.com/alexnest-ua/auto_mhddos_mac)  
[**Варіант для Linux**](https://github.com/alexnest-ua/auto_mhddos_alexnest/tree/main)  
[**Варіант для Docker**](https://github.com/alexnest-ua/auto_mhddos_alexnest/tree/docker)   
[**Варіант для Android**](https://telegra.ph/mhddos-proxy-for-Android-with-Termux-03-31)   
  
  
можете запускати цей скрипт на увесь день та йти по своїм справам - він сам буде брати актуальні цілі (але перед тим ОБОВ'ЯЗКОВО встановіть VPN, який ніколи не відключиться сам: https://auto-ddos.notion.site/Cyberghost-f72074a09b224851b2058d559c0b2691 )  

**якщо запускаєте цей скрипт - інші атаки через Python не запускайте, бо при рестарті він вбиває усі процеси з Python (щоб старі атаки не накопичувалися)**
  
[**Налаштування**](#%D0%BD%D0%B0%D0%BB%D0%B0%D1%88%D1%82%D1%83%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F-%D0%B2%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%BD%D1%8F)  
[**Запуск атаки**](#%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA-%D0%B0%D1%82%D0%B0%D0%BA%D0%B8)  

  
Канал, де координуються цілі: https://t.me/itarmyofukraine2022 (звідти і беруться сюди цілі, тому якщо у вас на Windows запущено цей скрипт - то можете відповчивати, він все зробить за вас)  
чат де ви можете задати свої питання: https://t.me/+H6PnjkydZX0xNDky 
також можете писати мені в особисті у телеграм, я завжди усім відповідаю: @brainqdead
  
Туторіал по створенню автоматичних та автономних Linux-серверів: https://auto-ddos.notion.site/dd91326ed30140208383ffedd0f13e5c  

## Налаштування (встановлення)
  
* щоб скачати на Windows-машину:  
йдемо сюди: https://telegra.ph/Vstanovlennya-mhddos-proxy-napryamu-na-vash-komp-03-27  
та пророблюємо 1 та 2 пункт (якщо раніше не зробили)  

після останнього пункту (встановлення Git) відкриваємо Git Bash:  
![image](https://user-images.githubusercontent.com/74729549/163037827-88e246e2-2187-4768-a7a1-4afec1d78e83.png)  
відкриється наступне вікно:  
![image](https://user-images.githubusercontent.com/74729549/163038391-896d66ef-ceeb-42b4-aa92-53b68abb59f1.png)


## Запуск атаки:  
**ПРИ РЕСТАРТІ КОМП'ЮТЕРА / АВТО-СКРИПТА СПЕРШУ ОБОВ'ЯЗКОВО ПОТРІБНО ВІДКРИТИ САМЕ Git Bash і ввести наступну команду, яка саме все завантажить:**
```shell
curl -LO https://raw.githubusercontent.com/alexnest-ua/runner_for_windows/main/runner.sh && bash runner.sh
```
* Буде запущено атаку з параметрами за замовчуванням в залежності від кількості ядер вашого ПК

Тепер воно буде автоматично оновлювати список проксі, цілі атаки та перевіряти наявність оновлення (та встановлювати його якщо воно є)  

**Далі можна просто ЗГОРНУТИ вікно і воно буде працювати нескінченно в фоні**  
***щоб зупинити процес - натисніть Ctrl+C (або якщо не спрацює просто закрийте вікно з атакою)***  
