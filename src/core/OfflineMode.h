#define OFFLINESWITCH 4

class OfflineMood {
    public:
        OfflineMood();
        bool isOffline();
    private:
        bool offlineM;
        bool HWstate;
        void ActuateMode();
        void ModeChange();
};