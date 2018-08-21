#include <OneWire.h>
#include <Arduino.h>
#include <ThermoSensor.h>

void ThermoSensor::config(){

}

OneWire ds(PIN_ONEWIRE);
  
uint8_t getTemperature(float *temperature, uint8_t reset_search) {
  uint8_t data[9], addr[8];

    enum DS18B20_RCODES {
    READ_OK,
    NO_SENSOR_FOUND,  
    INVALID_ADDRESS,  
    INVALID_SENSOR 
  }

  if (reset_search) {
    ds.reset_search();
  }
 
  /* Recherche le prochain capteur 1-Wire disponible */
  if (!ds.search(addr)) {
    return NO_SENSOR_FOUND;
  }
  
  /* Vérifie que l'adresse a été correctement reçue */
  if (OneWire::crc8(addr, 7) != addr[7]) {
    return INVALID_ADDRESS;
  }
 
    /* Vérifie qu'il s'agit bien d'un DS18B20 */
  if (addr[0] != 0x28) {
    return INVALID_SENSOR;
  }
 
    /* Reset le bus 1-Wire et sélectionne le capteur */
  ds.reset();
  ds.select(addr);
  
    /* Lance une prise de mesure de température et attend la fin de la mesure */
  ds.write(0x44, 1);
  delay(800);
  
    /* Reset le bus 1-Wire, sélectionne le capteur et envoie une demande de lecture du scratchpad */
  ds.reset();
  ds.select(addr);
  ds.write(0xBE);
 
  /* Lecture du scratchpad */
  for (uint8_t i = 0; i < 8; i++) {
    data[i] = ds.read();
  }
   
    /* Calcul de la température en degré Celsius */
  *temperature = (int16_t) ((data[1] << 8) | data[0]) * 0.0625; 
  
  return READ_OK;
}



void ThermoSensor::begin() {
   
  if (getTemperature(&temperature, true) != READ_OK) {
    DEBUG_INFO("Erreur de lecture du capteur");
    return;
  }

  DEBUG_VAR("Temperature : ", temperature);

  /* Serial.print(("Temperature : "));
  Serial.print(temperature, 2);
  Serial.write(176);
  Serial.write('C');
  Serial.println();*/


