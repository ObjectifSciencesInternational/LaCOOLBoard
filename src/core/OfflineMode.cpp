#include "OfflineMode.h"
#include "CoolLog.h"

OfflineMood::OfflineMood(){
    offlineM=true;//a changer à "false" pour tester en vrai
    HWstate=false;
}

void OfflineMood::ActuateMode(){
    HWstate=digitalRead(OFFLINESWITCH);
    DEBUG_VAR("pin 4 state :",HWstate);
    if(HWstate){
        offlineM=true;
    }
    else{
        offlineM=false;
    }   
}

bool OfflineMood::isOffline(){
    ActuateMode();
    return (offlineM);
}