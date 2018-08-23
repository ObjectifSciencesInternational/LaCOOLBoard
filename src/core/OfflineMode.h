#define OFFLINESWITCH 9

class OfflineMood {
    public:
        OfflineMood();
        bool isOffline();
    private:
        bool offlineM;
        bool ResetPossible;
        bool HWstate;
        void ActuateMode();
        void ModeChange();
};