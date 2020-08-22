React = require('react')
FontAwesome = require('react-fontawesome')
PromiseFileReader = require('promise-file-reader')

import { connect } from 'react-redux'

import Alert from 'react-bootstrap/lib/Alert'
import Grid from 'react-bootstrap/lib/Grid'
import Form from 'react-bootstrap/lib/Form'
import FormGroup from 'react-bootstrap/lib/FormGroup'
import FormControl from 'react-bootstrap/lib/FormControl'
import ControlLabel from 'react-bootstrap/lib/ControlLabel'
import HelpBlock from 'react-bootstrap/lib/HelpBlock'
import Button from 'react-bootstrap/lib/Button'

import Loader from '../components/Loader'

import callApi, {callApiWithBody} from '../lib/callApi'

import FieldGroup from './FieldGroup'
import ShadowedSwitch from './ShadowedSwitch'

import ConnectedComponent from '../lib/ConnectedComponent'

import LANGUAGES from '../lib/languages'

class SubmitForm extends React.Component
    constructor: (props) ->
        super(props)
        @state =
            lang_id: Object.keys(LANGUAGES)[0]
            draft: false
        @setField = @setField.bind(this)
        @toggleDraft = @toggleDraft.bind(this)
        @submit = @submit.bind(this)

    setField: (field, value) ->
        newState = {@state...}
        if field == "file"
            newState.wasFile = true
            for key, lang of LANGUAGES
                for candidate in lang.extensions
                    if value.endsWith(candidate)
                        newState["lang_id"] = key
        else  # file input is not controlled
            newState[field] = value
        @setState(newState)

    toggleDraft: () ->
        newState = {
            draft: !@state.draft
            submit: undefined
        }
        @setState(newState)

    componentDidUpdate: (prevProps, prevState) ->
        if prevProps.problemId != @props.problemId
            @setState
                submit: undefined

    submit: (event) ->
        event.preventDefault()
        newState = {
            @state...
            submit:
                loading: true
        }
        @setState(newState)
        try
            fileName = document.getElementById("file").files[0]
            fileText = await PromiseFileReader.readAsArrayBuffer(fileName)
            fileText = Array.from(new Uint8Array(fileText))
            dataToSend =
                language: @state.lang_id
                code: fileText
                draft: @state.draft
            url = "submit/#{@props.problemId}"
            data = await callApi url, dataToSend

            if data.submit
                data =
                    submit:
                        result: true
                @props.reloadSubmitList()
            else if data.error == "duplicate"
                data = 
                    submit:
                        error: true
                        message: "Вы уже отправляли это код"
            else if data.unpaid
                data = 
                    submit:
                        error: true
                        message: "Ваш аккаунт заблокирован за неуплату"
            else if data.dormant
                data = 
                    submit:
                        error: true
                        message: "Ваш аккаунт не активирован"
            else
                throw ""
        catch
            data =
                submit:
                    error: true
                    message: "Неопознанная ошибка"
        newState = {
            @state...
            submit: data.submit
        }
        @setState(newState)

    render: () ->
        if not @props.myUser?._id
            return null

        canSubmit = (not @state.submit?.loading) and (@state.wasFile)

        <div>
            <h4>Отправить решение</h4>
            <Form inline onSubmit={@submit} id="submitForm">
                <FieldGroup
                    id="file"
                    label=""
                    type="file"
                    setField={@setField}
                    state={@state}/>
                {if !@props.material.isReview
                    <FieldGroup
                        id="lang_id"
                        label=""
                        componentClass="select"
                        setField={@setField}
                        state={@state}>
                        {Object.keys(LANGUAGES).map((key) =>
                            id = LANGUAGES[key]["informatics"]
                            if id
                                <option value={key} key={key}>{key}</option>
                            else
                                null
                        )}
                    </FieldGroup>
                }
                {" "}
                <span onClick={@toggleDraft} title="Не тестировать, отправить как черновик">
                    <ShadowedSwitch on={@state.draft}>
                        <FontAwesome name={"hourglass" + if @state.draft then "" else "-o"} />
                    </ShadowedSwitch>
                </span>
                {" "}
                {
                if @state.submit?.loading
                    <div style={display: "inline-block", position: "relative", top: "72px", marginTop: "-144px", width: "30px"}>
                        <Loader size={10} />
                    </div>
                }
                <Button type="submit" bsStyle="primary" disabled={!canSubmit}>
                    Отправить
                </Button>
            </Form>
            {
            if @state.draft
                <Alert bsStyle="info">
                    Решение будет отправлено как черновик. Оно будет сохранено на сервере и доступно в списке посылок,
                    но не будет протестировано и не будет влиять на результаты по этой задаче.
                    Например, это вам может быть полезно, если вы хотите продолжить работу над задачей
                    с другого компьютера.
                </Alert>
            }
            {
            if @state.submit?.result
                <Alert bsStyle="success">
                    Решение успешно отправлено.
                </Alert>
            }
            {
            if @state.submit?.error
                <Alert bsStyle="danger">
                    Ошибка отправки: {@state.submit.message}
                </Alert>
            }
        </div>

options =
    urls: () ->
        { "myUser" }

export default ConnectedComponent(SubmitForm, options)
