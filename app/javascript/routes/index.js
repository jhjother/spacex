import React from "react"

import UpcomingLaunch from "../components/Launches/UpcomingLaunch";
import NextLaunch from "../components/Launches/NextLaunch";
import LatestLaunch from "../components/Launches/LatestLaunch";
import PastLaunches from "../components/Launches/PastLaunches";

import {
  Route,
  Routes,
  BrowserRouter,
} from "react-router-dom";

const Index = ({children}) => {
  return (
    <BrowserRouter>
      {children}
      <Routes>
        <Route path="/next_launch" element={<NextLaunch/>}/>
        <Route path="/latest_launch" element={<LatestLaunch/>}/>
        <Route path="/upcoming_launch" element={<UpcomingLaunch/>}/>
        <Route path="/past_launches" element={<PastLaunches/>}/>
      </Routes>
    </BrowserRouter>
  );
}

export default Index
