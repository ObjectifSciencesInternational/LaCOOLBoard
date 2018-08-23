# La COOL Board

[![Build Status](https://travis-ci.org/LaCoolCo/LaCOOLBoard.svg?branch=master)](https://travis-ci.org/LaCoolCo/LaCOOLBoard)

## What is La COOL Board?

**La COOL Board** is a connected environmental monitoring and control board. It can be used to build custom weather stations, self-watering plants, hydroponic control systems, pH probes, and many other things. It's also extensible and compatible with numerous external sensors and actuators.

### Key features and benefits
* 100% Arduino compatible
* Supported by an Espressif's ESP8266, including onboard WiFi
* 7 onboard sensors: IR and visible light, UV index, atmospheric pressure, humidity, temperature, soil moisture.
* Onboard RTC Clock
* USB to serial UART with onboard FTDI chip (female micro-USB port)
* NeoPixel Digital RGB programmable LED
* Solar panel and LiPo battery plug
* Fully makeable, hackable and customizable open-hardware

## How to make it?

**Have a look at our [Eagle files](https://github.com/LaCoolCo/LaCOOLBoardHardware)** - but you can also buy it from us! Don't hesitate to contact or check out [our website](https://github.com/LaCoolCo/LaCOOLBoard)

## What is this repository for?

It contains a set of Arduino libraries, wrappers and sketches that simplify the access to and usage of the sensors and other hardware features provided by La COOL Board.

## How does it operates?

The default operating mode of La COOL Board is **sleep mode,** which uses the deep-sleep low-energy consumption mode of the ESP8266 (80µA). It is on by default and should be enabled whenever your board:
- runs on battery power (e.g. in a weather station)
- runs on AC power, but logs data at a very slow rate. It's time to do you part in saving the planet! 

If you need a higher sample rate, you may want to deactivate it.

When in sleep mode, your COOL Board will run the following loop:
1. read sensors values
2. activate actuators
3. log data (either locally or over the network)
4. check for updates
5. go to sleep for `logInterval` seconds


## How can I contribute?

For minor fixes of code and documentation, please go ahead and submit a pull request.

Larger changes (rewriting parts of existing code from scratch, adding new functions to the core, adding new libraries) 
should generally be discussed by opening an issue first.

Feature branches with lots of small commits (especially titled "oops", "fix typo", "forgot to add file", etc.) should be squashed before opening a pull request. 
At the same time, please refrain from putting multiple unrelated changes into a single pull request.

## How can I reach you guys?

If you encounter a problem, have some genius, crazy idea or just want to have a chat with us, please open an issue, a pull request or send us an email at team@lacool.co - we'd absolutely love to hear from you !

## How do I get set up?

### First steps

1. Install [Platform IO core](https://platformio.org/get-started/cli)

2. Break out the sensor board and insert its pins into the main board header

3. Connect the COOL Board to your computer and ensure you that your switch is in the LOAD position 

4. On a terminal, enter

        git clone https://github.com/LaCoolCo/LaCOOLBoard.git`
        cd LaCoolBoard`
        patch/patch.sh`

5. Go to [www.lecool.menu], create an account and choose `Join us`

6. Contact La COOL Co via mail (team@lacool.co) to ask for your certificate and private keys. We'll provide you with two files : `privateKey.bin` and `certificate.bin`

    * Save `privateKey.bin` in `examples/WeatherStation/data/privateKey.bin`
    * Save `cerificate.bin` in `examples/weatherStation/data/certificate.bin`

7. In your terminal, type 

        pio run -e prod -t uploadfs`

8. Hit the RESET switch, then type 

        pio run -e prod -t upload`

9. Put the side switch back in RUN position & press the RESET button

10. After a few seconds, you COOL Board LED should glow purple to signal that the onboard Wifi access point has started. You'll now need to:

  1. connect your computer (or phone/tablet) to the Wifi network named **CoolBoard-XXXXXXXXXXXX** 
  2. open http://192.168.4.1 in your browser. 
  3. click **configure Wifi**
  4. Select the Wifi network you want your board to connect to and enter its password

### Configuration files

The COOL Board embedded software makes heavy use of the SPIFFS for storing its configuration and data files. Here is a description of the configuration files and keys.

#### `coolBoardConfig.json` 

* `logInterval`: time interval in seconds between two log events.
* `ireneActive`: set this to `true` if you are using the IRN3000 module
* `jetpackActive`: set this to `true` if you are using the JetPack module
* `externalSensorsActive`: set to `true` if you are using a supported external sensor
* `sleepActive`: set to `true` if you want your COOL Board to enable [sleep mode](#sleep-mode)
* `userActive`: set this to `true` if you want your COOL Board to collect `userData` (`userName`, `macAddress`, `timeStamp`)
* `manual`: set this to `true` to enable MQTT remote-control of onboard actuators, bypassing rule-based configuration. **Be extremely careful with this mode:** when it is active, the COOL Board will not restart automatically to apply any new configuration sent on the `update` MQTT topic. Plus, restarting a COOL Board in manual mode will disable all the actuators. Thus, never forget to reset this to false to go back to normal mode!

#### `coolBoardLedConfig.json`

* `ledActive`: Put this flag to 1(true) if you want to turn on the onboard LED.

#### `coolBoardSensorsConfig.json`

* `temperature`: set this to `true` if you want to sample temperature using the BME280 Sensor
* `humidity`: set this to `true` if you want to sample air humidity using the BME280 Sensor
* `pressure`: set this to `true` if you want to collect atmospheric pressure using the BME280 Sensor
* `visible`: set this to `true` if you want to collect the visible light index using the SI114X Sensor
* `ir`: set this to `true` if you want to measure the infrared light using the SI114X Sensor
* `uv`: set this to `true` if you want to measure ultraviolet index using the SI114X Sensor
* `vbat`: set this to `true` if you want to measure battery voltage 
* `soilMoisture`: set this to `true` if you want to activate the soil moisture sensor	
* `wallMoisture`: set this to `true` if you want to use the moisture sensor for wall/wood moisture sensing. `soilMoisture` MUST be `false` in this case	

	
#### `externalSensorsConfig.json`

* `sensorsNumber`: the number of supported external sensors you connect to the COOL Board
* `reference`: the reference of a supported external sensor (e.g. NDIR_I2C, Dallas Temperature...)
* `type`: the type of measurment you are taking (e.g. CO2, temperature, voltage...)
* `address`: the sensor's address, if it has one (e.g. NDIR_I2C CO2 sensor's address is 77)
* `kind0`...`kind4`: names of the sensors sensor connected to ADCs models ADS1015 and ADS1115 (`kind0` is sensor on A0, `kind1` is A1, and so on)

#### `irene3000Config.json`

* `waterTemp.active`: set to `true` to use the temperature sensor connected to the Irene3000
* `phProbe.active`: set to `true` to use the ph sensor connected to the Irene3000
* `adc2.active`: set to `true` to use the extra ADC input of the Irene3000
* `adc2.gain`: this is the value of the gain applied to the extra ADC input of the Irene3000
* `adc2.type`: the type of measurements you are making (e.g. CO2, temperature,voltage...)

#### `jetPackConfig.json` and `coolBoardActorConfig.json`

* `Act[i].actif`: set this to `true` in order to use the jetpack output #`i` (0 to 7)
* `Act[i].inverted`: set this to `true` if the actor is inverted (e.g. a cooler is turned on when `Temp > TempMax`)
* `Act[i].temporal`: set this to `true` if you want the actor to turn on or off based on time of day.
* `Act[i].type: [ <primaryType>, <secondaryType> ]`: this array contains the primary type and the secondary type of the actuator
    * `primaryType` : type of the sensor (e.g. if `Temperature`, actuator is associated to the "Temperature" sensor).
    * `secondaryType` is only used in temporal mode. It can be: 
      * `""` (empty): the actor will be on for `timeHigh` ms and off for `timeLow` ms
      * `"hour"`: the actor will be on when current hour is greater than or equal to `hourHigh`. and off when greater than or equal to `hourLow`.
      * `"minute"`: the actor will be on when the current minute is greater than or equal to `minuteHigh`, and off when greater than or equal to `minuteLow`
      * `"hourMinute"`: behavior of both `"minute"` and `"hour"`
* `Act[i].low[rangeLow,timeLow,hourLow,minuteLow]`: this array contains the low values of the activation range
    * `rangeLow` is the minimum sensor value at which to turn on (or off in inverted mode) the actor
    * `timeLow` is the time spent off in temporal mode
    * `hourLow` is the hour to turn off the actor when `secondaryType` is `hour` or `hourMinute`
    * `minuteLow` is the minute to turn off the actor when `secondaryType` is `minute` or `hourMinute`
* `Act[i].high[rangeHigh,timeHigh,hourHigh,minuteHigh]`: this array contains the high values of the activation range
    * `rangeHigh` is the maximum of the range at which to turn off (or on in inverted mode) the actor
    * `timeHigh` is the time spent on in temporal mode
    * `hourHigh` is the hour to turn on the actor when `secondaryType` is `hour` or `hourMinute`
    * `minuteHigh` is the minute to turn on the actor when `secondaryType` is `minute` or `hourMinute`

Note that `coolBoardActorConfig.json` contains only one actor.

#### `mqttConfig.json`

* `mqttServer`: MQTT server IP address or hostname

#### `rtcConfig.json`

* `NTP`: set to `true` if you want the RTC to synchronize with a NTP Pool. **Disable this if you don't have an Internet connection!**
* `timePool`: indicates the NTP Server with the lowest latency in CoolTime.h
* `timeSync`: the last time the board updated the RTC (UNIX Time). By default, La COOL Board tries to update once a week.

#### `wifiConfig.json`

* `timeOut`: access point timeout in seconds
