# app/assets/javascripts/components/record.js.coffee

@Record = React.createClass
  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleDelete: (e) ->
    e.preventDefault()
    # yeah... jQuery doesn't have a $.delete shortcut method
    $.ajax
      method: 'DELETE'
      url: "/records/#{ @props.record.id }"
      dataType: 'JSON'
      success: (data) =>
        @setState edit: false
        @props.handleEditRecord @props.record, data
  handleEdit: (e) ->
    e.preventDefault()
    data =
      title: ReactDOM.findDOMNode(@refs.title).value
      username: ReactDOM.findDOMNode(@refs.username).value
      password: ReactDOM.findDOMNode(@refs.password).value
    # jQuery doesn't have a $.put shortcut method either
    $.ajax
      method: 'PUT'
      url: "/records/#{ @props.record.id }"
      dataType: 'JSON'
      data:
        record: data
      success: (data) =>
        @setState edit: false
        @props.handleEditRecord @props.record, data
  recordRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.record.title
      React.DOM.td null, @props.record.username
      React.DOM.td null, @props.record.password
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
  recordForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.record.title
          ref: 'title'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.record.username
          ref: 'username'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.record.password
          ref: 'password'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'
  render: ->
      if @state.edit
        @recordForm()
      else
        @recordRow()
