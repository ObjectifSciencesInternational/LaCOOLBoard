class ThermoSensor{

    public:
        void begin();

    private:
        const uint8_t PIN_ONEWIRE = 7;
        float temperature;
        
};