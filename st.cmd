#!/usr/local/epics/apps/Staubli2/bin/linux-x86_64/Staubli2

## You may have to change Staubli2 to something else
## everywhere it appears in this file

< /usr/local/epics/apps/Staubli2/iocBoot/iocStaubli2/envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/Staubli2.dbd"
Staubli2_registerRecordDeviceDriver pdbbase

### Caminho ate o arquivo com o protocolo e IP do Staubli/CS8 ####
epicsEnvSet ("STREAM_PROTOCOL_PATH", ".:../protocols")
drvAsynIPPortConfigure ("Staubli2", "10.2.49.33:60000", 0, 0, 0)

asynOctetSetOutputEos("Staubli2",0,"\r")

## Load record instances
dbLoadRecords("db/Staubli2.template","BL=MXROB:,CS8_2=Staubli2,PORT=Staubli2", "PROTO=Staubli2.proto")

#asynSetTraceIOMask("Staubli2",0,6)
#asynSetTraceMask("Staubli2",0,9)

cd ${TOP}/iocBoot/${IOC}
iocInit

# Setting default values...
#dbpf MXROB:Staubli2:SetCryoLong 1
#dbpf MXROB:Staubli2:SetSample 1

## Start any sequence programs
#seq sncxxx,"user=dotHost"
