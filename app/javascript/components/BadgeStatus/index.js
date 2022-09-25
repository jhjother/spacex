import { Badge } from 'react-bootstrap';
import React from "react";

const BadgeStatus = ({ value }) => {
  let info;

  switch (value) {
    case null:
      info = ["warning", "Pendente"]
      break
    case true:
      info = ["success", "Sucesso"]
      break
    case false:
      info = ["danger", "Fracasso"]
      break
  }

  let [bg, status] = info

  return (
    <Badge bg={bg}>
      {status}
    </Badge>
  )
}

export { BadgeStatus }
