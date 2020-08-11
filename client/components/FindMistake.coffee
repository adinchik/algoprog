React = require('react')
moment = require('moment')

import { ListGroup, ListGroupItem } from 'react-bootstrap'
import {Link} from 'react-router-dom'

import ConnectedComponent from '../lib/ConnectedComponent'
import withMyUser from '../lib/withMyUser'

FindMistake = (props) ->
    <ListGroup>
        {props.findMistakes.map (m) ->
            href = "/findMistake/" + m._id
            <ListGroupItem key={m._id} onClick={window?.goto?(href)} href={href}>
                {m.fullProblem.name} 
                ({m.fullProblem.level}, {m.language}) 
                <small>#{m.hash}</small>
            </ListGroupItem>
        }
    </ListGroup>

options = {
    urls: (props) ->
        return
            findMistakes: "findMistake/#{props.myUser._id}"
    timeout: 20000
}

export default withMyUser(ConnectedComponent(FindMistake, pageOptions))
