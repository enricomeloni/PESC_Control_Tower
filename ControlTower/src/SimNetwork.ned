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

import controltower.Airport;
import controltower.WorkloadGenerator;

network SimNetwork
{
    @display("bgb=234,163");
    submodules:
        wg: WorkloadGenerator {
            @display("p=36,69");
        }
        a: Airport{
            @display("p=178,69");
        }
    connections:
        wg.out --> a.planeIn;
        a.planeOut --> wg.in;
}
