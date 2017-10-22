@Line = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/lines/#{ @props.line.id }"
      dataType: 'JSON'
    success: () =>
      @props.handleDeleteRecord @props.line

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.line.speaker
      React.DOM.td null, @props.line.message
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Удалить'