@Lines = React.createClass
  getInitialState: ->
    lines: @props.data

  getDefaultProps: ->
    lines: []

  addLine: (line) ->
    lines = @state.lines.slice()
    lines.push line
    @setState lines: lines

  deleteLine: (line) ->
    lines = @state.lines.slice()
    index = lines.indexOf line
    lines.splice index, 1
    @replaceState lines: lines

  render: ->
    React.DOM.div
      className: 'lines'
      React.DOM.h2
        className: 'title'
        'Сообщения'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Автор'
            React.DOM.th null, 'Сообщение'
            React.DOM.th null, 'Действия'
        React.DOM.tbody null,
          for line in @state.lines
            React.createElement Line, key: line.id, line: line, handleDeleteLine: @deleteLine
      React.DOM.hr null
      React.DOM.div
        className: 'lines'
        React.DOM.h2
          className: 'title'
          'Новое сообщение'
        React.createElement LineForm, handleNewLine: @addLine
