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

package controltower;

simple Runway
{
    parameters:
        volatile double landingTime @unit(s);
        volatile double takeoffTime @unit(s);
    
        double throughputCheckInterval @unit(s);
      
		@signal[landedThroughputSignal](type = unsigned long);
		@statistic[landedThroughput](source=landedThroughputSignal; record=vector);

        @signal[tookoffThroughputSignal](type = unsigned long);
        @statistic[tookoffThroughput](source=tookoffThroughputSignal; record=vector);
   	    
        @signal[landingInterLeavingSignal](type = double);
        @statistic[landingInterLeaving](source=landingInterLeavingSignal; record=vector);

        @signal[takeoffInterLeavingSignal](type = double);
        @statistic[takeoffInterLeaving](source=takeoffInterLeavingSignal; record=vector);

    gates:
        input landingPlaneIn;
        output landingPlaneOut;
        
        input takeoffPlaneIn;
        output takeoffPlaneOut;
        
        output statusOut;
}