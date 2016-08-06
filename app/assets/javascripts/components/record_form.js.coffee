# app/assets/javascripts/components/record_form.js.coffee

@RecordForm = React.createClass
  getInitialState: ->
    title: ''
    username: ''
    password: ''
  handleSubmit: (e) ->
      e.preventDefault()
      $.post 'records', { record: @state }, (data) =>
        @props.handleNewRecord data
        @setState @getInitialState()
      , 'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Title'
          name: 'title'
          value: @state.title
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Username'
          name: 'username'
          value: @state.username
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Password'
          name: 'password'
          value: @state.password
          onChange: @handleChange
      React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          onClick: @handleSubmit
          'Create record'
  handleChange: (e) ->
      name = e.target.name
      @setState "#{ name }": e.target.value
  valid: ->
      @state.title && @state.username && @state.password




