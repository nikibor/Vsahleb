@LineForm = React.createClass
  getInitialState: ->
    speaker: ''
    message: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valid: ->
    @state.speaker && @state.message
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { line: @state }, (data) =>
      @props.handleNewLine data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Автор'
          name: 'speaker'
          value: @state.speaker
          onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Сообщение'
            name: 'message'
            value: @state.message
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-success'
          disabled: !@valid()
          'Добавить'