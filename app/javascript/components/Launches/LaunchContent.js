import React from "react"
import { Figure, Row, Col } from 'react-bootstrap'
import { format } from "date-fns"
import { BadgeStatus } from "../BadgeStatus"

const LaunchContent = ({ launch }) => {
  return (
    <>
      <Row>
        <Col>
          {launch &&
          <Figure>
            <Figure.Image
              width={171}
              height={180}
              src={launch.links.patch.small}
            />
            <Figure.Caption className={"text-left"}>
              <p>
                <b>Código: </b>{launch.id}
              </p>
              <p>
                <b>Nome: </b>{launch.name}
              </p>
              <p>
                <b>Data: </b>{launch.date_utc ? format(new Date(launch.date_utc), 'dd/MM/yyyy hh:mm') : ''}
              </p>
              <p>
                <b>Foguete: </b>{launch.rocket}
              </p>
              <p>
                <b>Plataforma de lançamento: </b>{launch.launchpad}
              </p>
            </Figure.Caption>
          </Figure>
          }
        </Col>
        <Col className={"mt-5"}>
          {
            launch &&
            <>
              <a
                target="_blank"
                className={"d-block"}
                href={launch.links.reddit.campaign}>
                {launch.links.reddit.campaign}
              </a>
              <a
                target="_blank"
                className={"d-block"}
                href={launch.links.reddit.recovery}>{launch.links.reddit.recovery}
              </a>
            </>
          }
          { launch && <BadgeStatus value={launch.success} /> }
        </Col>
      </Row>
      <hr/>
    </>
  )
}

export default LaunchContent
