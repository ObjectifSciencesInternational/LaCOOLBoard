#include "OfflineMode.h"
#include "CoolLog.h"

OfflineMood::OfflineMood(){
    offlineM=true;//a changer à "false" pour tester en vrai
    ResetPossible=false;
    HWstate=false;
}

void OfflineMood::ActuateMode(){
    HWstate=digitalRead(9);
    //INFO_LOG(HWstate);
    
    if(HWstate!=offlineM){
            INFO_LOG("##LOLI## ATTENTE DE 1S");
        delay(1000);
    if(ResetPossible){
        INFO_LOG("##LOLI## SWITCH OFFLINE MODIFIE : REDEMARRAGE");
        ESP.deepSleep(10ULL,WAKE_RF_DEFAULT);
    }
    else{
        offlineM=true;
    }
    }
}

bool OfflineMood::isOffline(){
    ActuateMode();
    return (offlineM);
}