@Line = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    edit: true
    data =
      speaker: React.findDOMNode(@refs.speaker).value
      message: React.findDOMNode(@refs.message).value
    $.ajax
      method: 'PUT'
      url: "/lines/#{ @props.line.id }"
      dataType: 'JSON'
      data:
        line: data
      success: (data) =>
        @setState edit: false
        @props.handleEditLine @props.line, data

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/lines/#{ @props.line.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteLine @props.line

  lineRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.line.speaker
      React.DOM.td null, @props.line.message
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-warning'
          onClick: @handleToggle
          'Изменить'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Удалить'

  lineForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.line.speaker
          ref: 'speaker'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.line.message
          ref: 'message'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Обновить'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Отменить'

  render: ->
    if @state.edit
      @lineForm()
    else
      @lineRow()