import React, { useState, useEffect } from "react"
import { api } from "../../api"
import LaunchContent from "./LaunchContent"
import { Container } from "react-bootstrap"

const NextLaunch = () => {
  const [launch, setLaunch] = useState()

  useEffect(() => {
    async function fetchLaunch() {
      const response = await api.get("/launches/next")
      const { data } = response

      setLaunch(data)
    }

    fetchLaunch().then()
  }, [])

  return (
    <Container>
      <h5 className={"text-center mt-3"}> Próximo Lançamento</h5>
      <LaunchContent
        launch={launch}
      />
    </Container>
  )
}

export default NextLaunch
