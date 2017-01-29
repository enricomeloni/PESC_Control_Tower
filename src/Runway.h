//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

#ifndef __CONTROLTOWER_RUNAWAY_H_
#define __CONTROLTOWER_RUNAWAY_H_

#include <omnetpp.h>
#include <string>

#include "Plane_m.h"

using namespace omnetpp;

/**
 * TODO - Generated class
 */
class Runway : public cSimpleModule
{
  protected:
    virtual void initialize();
    virtual void handleMessage(cMessage *msg);

    class ThroughputTimeout : public cMessage{};

    void handleThroughputTimeout(ThroughputTimeout* timeout);
    void handleIncomingPlane(Plane* plane);
    void handleOutgoingPlane(Plane* plane);

    enum RunwayStatus{ runway_free, plane_landing, plane_takeoff };

    RunwayStatus runwayStatus;

    unsigned long landedThroughputCounter;
    simsignal_t landedThroughputSignal;

    unsigned long tookoffThroughputCounter;
    simsignal_t tookoffThroughputSignal;

    simtime_t lastLandingTime;
    simsignal_t landingInterLeavingSignal;
    
    simtime_t lastTakeoffTime;
    simsignal_t takeoffInterLeavingSignal;

    ThroughputTimeout* thTimeout;
};

#endif
