/**
*	\file CoolBoardSensors.h
*	\brief CoolBoardSensors Header File
*	\author Mehdi Zemzem
*	\version 1.0
*	\date 27/06/2017
*
*/

#ifndef CoolBoardSensors_H
#define CoolBoardSensors_H

#include "Arduino.h"
#include "internals/CoolSI114X.h"        // Light sensor Support
#include "internals/CoolSparkFunBME280.h"// Environmental sensor Support

/**
*
*	\class CoolBoardSensors 
*	\brief This class handles the On-Board Sensors. 
* 
*
*/
class CoolBoardSensors
{

public:

	//Constructor
	CoolBoardSensors();

	void begin();

	//data is in json
	String read();

	void allActive();

	//additional method
	void end();

	bool config();

	void printConf();

	//environment sensor methods

	//set the enviornment sensor settings , if argument is ommitted , default value will be assigned
	void setEnvSensorSettings( uint8_t commInterface=I2C_MODE, uint8_t I2CAddress=0x76,    uint8_t runMode = 3,
					   
				   uint8_t tStandby=0	, uint8_t filter=0,    uint8_t tempOverSample=1,                          					   
				   uint8_t pressOverSample= 1,    uint8_t humidOverSample= 1);

	//VBat
	float readVBat();

	//Moisture

	float readMoisture();

	//sensor objects :
	CoolSI114X lightSensor;			// light sensor	
	
	BME280 envSensor;			        // environment sensor
	
private:
	//sensors control structs :
	struct lightActive
	{
		bool visible=0;
		bool ir=0;
		bool uv=0;	

	}lightDataActive;


	struct airActive
	{
		bool temperature=0;
		bool humidity=0;
		bool pressure=0;

	}airDataActive;

	const int EnMoisture = 13;                      // Moisture Enable Pin
	const int AnMplex = 12;                         // Analog Multiplexer  LOW=Vbat , HIGH=Moisture

        bool vbatActive=0;

	bool soilMoistureActive=0;

};

#endif
