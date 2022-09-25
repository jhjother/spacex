import React, { useState, useEffect } from "react"
import { Container } from "react-bootstrap"
import { api } from "../../api"
import LaunchContent from "./LaunchContent"

const PastLaunch = () => {
  const [launches, setLaunch] = useState([])

  useEffect(() => {
    async function fetchLaunch() {
      const response = await api.get("/launches/past")
      const { data } = response

      setLaunch(data)
    }

    fetchLaunch().then()
  }, [])

  return (
    <Container>
      <h5 className={"text-center mt-3"}>Lançamentos passados</h5>
      {
        launches.map((launch) => {
          return (
            <LaunchContent launch={launch}/>
          )
        })
      }
    </Container>
  )
}

export default PastLaunch
